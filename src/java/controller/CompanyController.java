/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

/**
 *
 * @author root
 */
import entity.Company;
import entity.Schedule;
import form.entity.ThongKe;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import model.CompanyModel;
import model.ScheduleModel;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import util.EmailUtil;
import util.SMSUtil;

/**
 *
 * @author root
 */
@Controller
@RequestMapping(value = "/company", method = RequestMethod.GET)
public class CompanyController {

    private CompanyModel comModel;

    public CompanyController() {
        this.comModel = new CompanyModel();
    }

    //lấy toàn bộ nhà xe phía admin
    @RequestMapping(value = "/getAllCompany")
    public ModelAndView getAllCompany() {
        ModelAndView model = new ModelAndView("/companyPage");
        Company company = new Company();
        model.getModelMap().put("company", company);
        ArrayList<Company> listCom = new ArrayList<>();
        listCom = comModel.getAllObject();
        model.addObject("listCompany", listCom);
        for (Company com : listCom) {
            if (!com.isStatus()) {
                model.getModelMap().put("status", "Wait Confirm");
            } else {
                model.getModelMap().put("status", "Confirmed");
            }
        }
        return model;
    }

    //==================================================
    //xử lí tìm kiếm thông tin nhà xe thông qua tên nhà xe
    @RequestMapping(value = "/handleSearchCompany")
    public ModelAndView handleSearchCompany(@ModelAttribute("company") Company com) {
        ModelAndView model = new ModelAndView("/companyPage");
        ArrayList<Company> listCompany = comModel.search(com);
        model.addObject("listCompany", listCompany);
        return model;
    }

    //==================================================
    //lấy toàn bộ nhà xe phía admin nhà xe
    @RequestMapping(value = "/getAllCompanyClient")
    public ModelAndView getAllCompanyClient() {
        ModelAndView model = new ModelAndView("/adminClientPage");
        ArrayList<Company> listCom = new ArrayList<>();
        listCom = comModel.getAllObject();
        model.addObject("listCompany", listCom);
        return model;
    }

    //==================================================
    //lấy thông tin chi tiết nhà xe thông qua id
    @RequestMapping(value = "/initCompanyDetialClient")
    public ModelAndView initCompanyDetialClient(@RequestParam("companyId") int companyId) {
        ModelAndView model = new ModelAndView("/companyClientDetial");
        Company com = comModel.getObject(companyId);
        model.addObject("companyDetail", com);
        return model;
    }

    //==================================================
    //hiển thị trang đăng nhập
    @RequestMapping(value = "/loginPageCompany")
    public ModelAndView showLogin() {
        ModelAndView model = new ModelAndView("/loginComapany");
        Company com = new Company();
        model.getModelMap().put("company", com);
        return model;
    }

    //==================================================
    //hiển thị trang chủ phía nhà xe
    @RequestMapping(value = "/adminClient")
    public ModelAndView homePage() {
        ModelAndView model = new ModelAndView("/homeAdminClient");
        return model;
    }

    //==================================================
    //xử lí đăng nhập phía nhà xe
    @RequestMapping(value = "/handelLoginCompany")
    public String handelLoginCompany(ModelMap mm, HttpSession session, @ModelAttribute(value = "company") Company com) {
        Company company = comModel.checkLoginCompany(com);
        if (!com.getAccountName().equals("") && !com.getPassword().equals("")) {
            if (company != null) {
                session.setAttribute("userName", com.getAccountName());
                session.setAttribute("id", company.getCompanyId());
                if (!company.isStatus()) {
                    session.setAttribute("report", "Để nhà xe có thể hoạt động một cách đáng tin cậy, hệ thống cần kiểm tra một số thông tin nhà xe. Rất xin lỗi vì sự bất tiện này và để quá trình được diễn ra nhanh chóng:");
                    session.setAttribute("link", "Bạn có thể cập nhật thêm thông tin về nhà xe của mình theo link sau");
                } else {
                    session.setAttribute("report", " ");
                    session.setAttribute("link", " ");
                }
                return "redirect:adminClient.htm";
            } else {
                mm.put("errorCompany", "Username or password does not exist");
            }
            return "loginComapany";
        } else {
            mm.put("errorCompany", "Username or Password is not empty");
            return "loginComapany";
        }
    }
    
    //==================================================
    //xem chi tiết nhà xe
    @RequestMapping("/initDetailCompany")
    public ModelAndView initDetailCompany(ModelMap mm, @RequestParam("companyId") int companyId) {
        ModelAndView model = new ModelAndView("/companyDetial");
        Company com = comModel.getObject(companyId);
        model.addObject("company", com);
        if (com.isStatus()) {
            mm.put("confirm", " ");
        } else {
            mm.put("confirm", "Confirm");
        }
        return model;
    }

    //==================================================
    //xác nhận nhà xe khi nhà xe mới đăng kí
    @RequestMapping(value = "/initConfirmCompany")
    public String initConfirmCompany(@ModelAttribute("company") Company com) {
        if (comModel.confirmed(com)) {
            return "redirect:getAllCompany.htm";
        } else {
            return "error";
        }
    }

    //==================================================
    //thêm nhà xe .hiển thị trang đăng kí
    @RequestMapping(value = "/initInsertCompany")
    public ModelAndView initInsertCpmpany() {
        ModelAndView model = new ModelAndView("/companyRegister");
        model.getModelMap().put("newCompany", new Company());
        return model;
    }

    //==================================================
    //xử lí thêm nhà xe( xử lí đăng kí)
    @RequestMapping(value = "/handleInsertCompany")
    public String handleInsertCompany(@ModelAttribute("newCompany") Company com) {
        boolean check = comModel.addObject(com);
        if (check) {
            try {
                EmailUtil.sendEmal(com.getEmail(), "Thong bao dang ki", "Ban da dang ki thanh cong !.");
                SMSUtil.sendSMS(com.getPhone(),"Ban da dang ki thanh cong !.");
            } catch (MessagingException ex) {
                Logger.getLogger(CompanyController.class.getName()).log(Level.SEVERE, null, ex);
            } catch (IOException ex) {
                Logger.getLogger(CompanyController.class.getName()).log(Level.SEVERE, null, ex);
            }
            return "redirect:loginPageCompany.htm";
        } else {
            return "companyRegister";
        }
    }
    
    //==================================================

    //cập nhật nhà xe khi mới đăng kí (hiển thị dòng thông báo chờ xác nhận)
    @RequestMapping(value = "/initUpdateCompamy")
    public ModelAndView initUpdateCompany(@RequestParam("companyId") int companyId) {
        ModelAndView model = new ModelAndView("/companyUpdateRegister");
        Company com = comModel.getObject(companyId);
        model.addObject("updateCompany", com);
        return model;
    }

    //==================================================
    //xử lí cập nhật thêm một số thông tin trong khi chờ xác nhận
    @RequestMapping(value = "/handleUpdateCompany")
    public String handleUpdateCompany(@ModelAttribute("updateCompany") Company com) {
        if (comModel.UpdateObject(com)) {
            return "redirect:adminClient.htm";
        } else {
            return "companyUpdateRegister";
        }

    }

    //==================================================
    //hiển thị trang cập nhật đầy đủ thông tin sau khi đã xác nhận
    @RequestMapping(value = "/initUpdateCompanyDetial")
    public ModelAndView initUpdateCompanyDetial(@RequestParam("companyId") int companyId) {
        ModelAndView model = new ModelAndView("/companyUpdate");
        Company com = comModel.getObject(companyId);
        model.addObject("updateCompany", com);
        return model;
    }
    
    //==================================================

    //xử lí cập nhật đầy đủ 
    @RequestMapping(value = "/handleUpdateCompanyDetialClient")
    public String handleUpdateCompanyDetialClient(@ModelAttribute("updateCompany") Company com) {
        if (comModel.UpdateCompanyDetail(com)) {
            return "redirect:adminClient.htm";

        } else {
            return "companyUpdateRegister";
        }
    }

    //==================================================
    //xóa nhà xe
    @RequestMapping(value = "/initDeleteCompany")
    public String initDeleteCompany(@ModelAttribute("company") Company com) {
        if (comModel.DeleteObject(com)) {
            return "redirect:getAllCompany.htm";
        } else {
            return "error";
        }
    }

    
    //==================================================
    @RequestMapping(value = "/showWelcomeDemo")
    public ModelAndView showWelcomeDemo() {
        ModelAndView model = new ModelAndView("/welcomAdmicClient");
        return model;
    }

    //==================================================
    @RequestMapping(value = "/ThongKeNhaXe")
    public ModelAndView showThongKe() {
        ModelAndView model = new ModelAndView("/thongke");
        ArrayList<ThongKe> list_thongke = comModel.thongKeVeXe();
        model.addObject("list_thongke", list_thongke);
        return model;
    }
    
    //==================================================
    @RequestMapping(value = "/ThongKeNhaXeClient")
    public ModelAndView showThongKeByCompany(@RequestParam("companyId") int companyId) {
        ModelAndView model = new ModelAndView("/thongkeClient");
//        ModelAndView model = new ModelAndView("/thongke1");
        ArrayList<ThongKe> list_thongke = comModel.thongKeVeXe(companyId);
        model.addObject("list_thongke", list_thongke);
        return model;
    }
}
