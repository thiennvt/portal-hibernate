/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.User;
import java.io.File;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import model.UserModel;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author root
 */
@Controller
@RequestMapping(value = "/user", method = RequestMethod.GET)
public class UserController {

    private UserModel userModel;
    private String keyword;

    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }

    public UserController() {
        this.userModel = new UserModel();
    }

    //trang chào mừng
    @RequestMapping(value = "welCome")
    public ModelAndView welcome() {
        ModelAndView model = new ModelAndView("/welcome");
        return model;
    }

    //trang chủ phía admin
    @RequestMapping(value = "/homePage")
    public ModelAndView homePage() {
        ModelAndView model = new ModelAndView("/homepage");
        return model;
    }

    //hiển thị trang đăng nhập phía admin
    @RequestMapping(value = "/loginPage")
    public ModelAndView showLogin() {
        ModelAndView model = new ModelAndView("/loginpage");
        User user = new User();
        model.getModelMap().put("user", user);
        return model;
    }

    //bắt lỗi session khi đăng nhập
    public boolean checkSessionLogin(HttpSession session) {
        if (session != null) {
            return true;
        } else {
            return false;
        }
    }

    //xử lí đăng nhập
    @RequestMapping(value = "/handelLogin")
    public String handelLogin(ModelMap mm, HttpSession session, @ModelAttribute(value = "user") User user) {
        if (!user.getUserName().equals("") && !user.getPassword().equals("")) {
            User u = userModel.checkLogin(user);
            if (u != null) {
                session.setAttribute("userName", user.getUserName());
                session.setAttribute("userId", u.getUserId());
                session.setAttribute("avatar", u.getAvatar());
                if (u.getPermision().equals("customer")) {
                    session.setAttribute("delete", " ");
                    return "redirect:homePage.htm";
                } else {
                    session.setAttribute("delete", "Delete");
                    return "redirect:homePage.htm";
                }
            } else {
                mm.put("error", "Username or password does not exist");
            }
            return "loginpage";
        } else {
            mm.put("error", "Username or Password is not empty");
            return "loginpage";
        }
    }

    //;ấy tất cả user
    @RequestMapping(value = "/getAllUser")
    public ModelAndView getAllUser() {
        ModelAndView model = new ModelAndView("/userpage");
        ArrayList<User> listUser = new ArrayList<>();
        User user = new User();
        model.getModelMap().put("user", user);
        listUser = userModel.getAllObject();
        model.addObject("listUser", listUser);
        return model;
    }

    //xử lí tìm kiếm user staff 
    @RequestMapping(value = "/handleSearchUser")
    public ModelAndView searchUser(@ModelAttribute("user") User user) {
        ModelAndView model = new ModelAndView("/userpage");
        ArrayList<User> listUser = userModel.search(user);
        model.addObject("listUser", listUser);
        return model;
    }

    //lấy thông tin chi tiết của từng user
    @RequestMapping("/detailUserStaff")
    public ModelAndView detialUserStaff(@RequestParam("userId") int userId) {
        ModelAndView model = new ModelAndView("/userDetial");
        User user = userModel.getObject(userId);
        model.addObject("user", user);
        return model;
    }

    //thêm user mới
    @RequestMapping(value = "/initInsertUserStaff")
    public ModelAndView initInsertUserStaff() {
        ModelAndView model = new ModelAndView("/newStaffpage");
        User user = new User();
        model.getModelMap().put("newStaff", user);
        return model;
    }

    //xử lít thêm user mới
    @RequestMapping(value = "/handleInsertStaff")
    public String handleInsert(@ModelAttribute("newStaff") User staff,HttpServletRequest request) {
        //lấy đường dẫn và tên ảnh
        String path = request.getRealPath("/images");
        path = path.substring(0, path.indexOf("\\build"));
        path = path + "\\web\\images";
        DiskFileItemFactory factory = new DiskFileItemFactory();
        ServletFileUpload upload = new ServletFileUpload(factory);
        try {
            List<FileItem> lst = upload.parseRequest(request);
            for (FileItem file : lst) {
                if (file.isFormField() == false) {
                    //path
                    staff.setAvatar("../images/" + file.getName());
                    //upload to folder
                    file.write(new File(path + "/" + file.getName()));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        //boolean check = userModel.addObject(staff);
        boolean check = userModel.addObject(staff);
        if (check) {
            return "redirect:getAllUser.htm";
        } else {
            return "newStaffpage";
        }
    }

    //cập nhật thông tin user
    @RequestMapping(value = "/initUpdateUserStaff")
    public ModelAndView initUpdateUserStaff(@RequestParam("userId") int userId) {
        ModelAndView model = new ModelAndView("updateUserStaff");
        User user = new User();
        user = userModel.getObject(userId);
        model.addObject("staff", user);
        return model;
    }

    //xử lí cập nhật user
    @RequestMapping(value = "/handleUpdateUserStaff")
    public String handleUpdateUserStaff(@ModelAttribute("staff") User user) {
        boolean check = userModel.UpdateObject(user);
        if (check) {
            return "redirect:getAllUser.htm";
        } else {
            return "updateUserStaff";
        }
    }

    //xóa user
    @RequestMapping(value = "/initDeleteUserStaff")
    public String initDeleteUserStaff(@ModelAttribute(value = "user") User user, ModelMap mm) {
        if (userModel.DeleteObject(user)) {
            return "redirect:getAllUser.htm";
        } else {
            mm.put("error", "Không thể xóa ");
            return "error";
        }
    }

}
