/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.Car;
import entity.Company;
import entity.NgayDi;
import entity.Schedule;
import entity.Ticket;
import java.io.IOException;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import javax.mail.MessagingException;
import javax.servlet.http.HttpSession;
import model.CarModel;
import model.ScheduleModel;
import model.TicketModel;
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
@RequestMapping(value = "/schedule", method = RequestMethod.GET)
public class ScheduleController {

    private ScheduleModel scheMdel;

    public ScheduleController() {
        this.scheMdel = new ScheduleModel();
    }

    //==================================================
    //hiển thị trang chủ của web
    @RequestMapping(value = "/showHomePageClient")
    public ModelAndView showHomePageClient() {
        ModelAndView model = new ModelAndView("/homepageClient");
        Schedule sche = new Schedule();
        model.getModelMap().put("schedule", sche);
        ArrayList<Schedule> listSchedule = scheMdel.getAllObject();
        model.addObject("listSchedule", listSchedule);
        ArrayList<Company> listCompany = scheMdel.getAllCompany();
        model.addObject("listCompany", listCompany);
        return model;
    }

    //hiển thị trang chủ của web
    @RequestMapping(value = "/showHomePage")
    public ModelAndView showHomePage() {
        ModelAndView model = new ModelAndView("homepageClient");
        Schedule schedule = new Schedule();
        model.getModelMap().put("schedule", schedule);
        return model;
    }

    //get all schedule
    @RequestMapping(value = "/getAllSchedule")
    public ModelAndView getAllSchedule(@RequestParam("companyId") int companyId) {
        ModelAndView model = new ModelAndView("/schedulePage");
        ArrayList<Schedule> listSche = scheMdel.getAllSchedule(companyId);
        model.addObject("listSchedule", listSche);
        return model;
    }

    //get all schedule admin
    @RequestMapping(value = "/getAllScheduleAdmin")
    public ModelAndView getAllScheduleAdmin() {
        ModelAndView model = new ModelAndView("/schedulePageContent");
        Schedule sche = new Schedule();
        model.getModelMap().put("schedule", sche);
        ArrayList<Schedule> listSche = scheMdel.getAllObject();
        model.addObject("listSchedule", listSche);
        return model;
    }

    //hàm xử lí tìm kiếm lịch trình
    @RequestMapping(value = "/handleSearchSchedule")
    public ModelAndView handleSearchSchedule(@ModelAttribute("schedule") Schedule sche) {
        ModelAndView model = new ModelAndView("/schedulePageContent");
        ArrayList<Schedule> listSchedule = scheMdel.search(sche);
        model.addObject("listSchedule", listSchedule);
        return model;
    }
    //get company detail

    @RequestMapping(value = "/initScheduleDetail")
    public ModelAndView initScheduleDetail(@RequestParam("scheduleId") int scheduleId) {
        ModelAndView model = new ModelAndView("/scheduleDetail");
        Schedule sche = scheMdel.getObject(scheduleId);
        model.addObject("schedule", sche);
        return model;
    }

    //get company detail client
    @RequestMapping(value = "/initScheduleDetailClient")
    public ModelAndView initScheduleDetailClient(@RequestParam("scheduleId") int scheduleId) {
        ModelAndView model = new ModelAndView("/scheduleDetailClient");
        Schedule sche = scheMdel.getObject(scheduleId);
        model.addObject("schedule", sche);
        return model;
    }

    //thông báo thành công và trả về danh sách
    @RequestMapping(value = "/showActionSucessSchedule")
    public ModelAndView showActionSucess() {
        ModelAndView model = new ModelAndView("/actionSucsessSchedulePage");
        return model;
    }

    //hiển thị form thêm lịch trình
    @RequestMapping(value = "/initInsertSchedule")
    public ModelAndView initInsertSchedule() {
        ModelAndView model = new ModelAndView("/newSchedule");
        Schedule sche = new Schedule();
        model.getModelMap().put("schedule", sche);
        return model;

    }

    //xử lí thêm lịch trình
    @RequestMapping(value = "/handleInsertSchedule")
    public String handleInsertSchedule(@ModelAttribute("schedule") Schedule sche) {
        if (scheMdel.addObject(sche)) {
            return "redirect:showActionSucessSchedule.htm";
        } else {
            return "newSchedule";
        }
    }

    //update lịch trình
    @RequestMapping(value = "/initUpdateSchedule")
    public ModelAndView initUpdateSchedule(@RequestParam("scheduleId") int scheduleId) {
        ModelAndView model = new ModelAndView("/scheduleUpdate");
        Schedule sche = scheMdel.getObject(scheduleId);
        model.addObject("schedule", sche);
        return model;
    }

    //xử lí update lịch trình
    @RequestMapping(value = "/handleUpdateSchedule")
    public String handleUpdateSchedule(@ModelAttribute("schedule") Schedule sche) {
        if (scheMdel.UpdateObject(sche)) {
            return "redirect:showActionSucessSchedule.htm";
        } else {
            return "scheduleUpdate";
        }
    }

    //delete schedule
    @RequestMapping(value = "/initAdminDeleteSchedule")
    public String initDeleteSchedule(@ModelAttribute("schedule") Schedule sch) {
        if (scheMdel.DeleteObject(sch)) {
            return "redirect:getAllSchedule.htm";
        } else {
            return "showError";
        }
    }

    //delete schedule admin
    @RequestMapping(value = "/initDeleteSchedule")
    public ModelAndView initAdminDeleteSchedule(@ModelAttribute("schedule") Schedule sch, @RequestParam("companyId") int companyId) {
        if (scheMdel.DeleteObject(sch)) {
            ModelAndView model = new ModelAndView("/schedulePage");
            ArrayList<Schedule> listSche = scheMdel.getAllSchedule(companyId);
            model.addObject("listSchedule", listSche);
            return model;
        } else {
            ModelAndView modelDel = new ModelAndView("/schedulePage");
            return modelDel;
        }
    }

    //==================================================
    //sử lí tìm kiếm lịch trình xe chạy. đưa ra danh sách xe chạy theo danh sách lịch trình đã tìm được
    @RequestMapping(value = "/handleSearchScheduleClient")
    public ModelAndView handleSearchScheduleClient(@ModelAttribute("schedule") Schedule sche, HttpSession session) {
        try {
            ModelAndView model = new ModelAndView("/showScheduleOrder");
//            ArrayList<Car> listCar = scheMdel.getAllCarBySchedule(sche);
            //lấy ra danh sách xe
            ArrayList<Car> listCar = scheMdel.getAllCarBySchedule(sche);
            model.addObject("listCar", listCar);

            //lấy ra số ghế trống của từng xe
            ArrayList<String> listChotrong = scheMdel.getAllNgayDi(sche);
            model.addObject("listChotrong", listChotrong);

            session.setAttribute("diemdau", sche.getPlaceStart().toUpperCase());
            session.setAttribute("diemcuoi", sche.getPlaceCome().toUpperCase());
            session.setAttribute("dateStart", sche.getDateStart());
            return model;
        } catch (Exception e) {
            e.printStackTrace();
            ModelAndView error = new ModelAndView("/errorPage");
            return error;
        }

    }

    //============================
    //sử lí tìm kiếm lịch trình xe chạy.đưa ra danh sách nhà xe theo từng nhà xe
    @RequestMapping(value = "/SearchScheduleByIdClient")
    public ModelAndView SearchScheduleByIdClient(@ModelAttribute("schedule") Schedule sche, @RequestParam("scheduleId") int scheduleId, HttpSession session) {
        try {
            ModelAndView model = new ModelAndView("/showScheduleOrder");
            Schedule schedule = scheMdel.getObject(scheduleId);
            model.addObject("schedule", sche);

            session.setAttribute("diemdau", schedule.getPlaceStart().toUpperCase());
            session.setAttribute("diemcuoi", schedule.getPlaceCome().toUpperCase());

            Calendar calendar = Calendar.getInstance();
            Date date = calendar.getTime();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            String dateStart = sdf.format(date);
            session.setAttribute("dateStart", dateStart);

            ArrayList<Car> listCar = scheMdel.getAllCarByScheduleId(sche);
            model.addObject("listCar", listCar);

            ArrayList<String> listChotrong = scheMdel.getChoTrong(sche);
            model.addObject("listChotrong", listChotrong);
            return model;
        } catch (Exception e) {
            e.printStackTrace();
            ModelAndView error = new ModelAndView("/errorPage");
            return error;
        }
    }

    //==========================
    //hiện thị form điền thông tin lịch trình và form điền thông tin đặt vé xe
    @RequestMapping(value = "/orderTicketDetail")
    public ModelAndView orderTicketDetail(@RequestParam("scheduleId") int scheduleId, @RequestParam("carId") int carId, ModelMap mm, HttpSession session) {
        try {
            ModelAndView model = new ModelAndView("/ticketOrderClient");
            Schedule sche = scheMdel.getObject(scheduleId);

            mm.put("companyID", sche.getCompany());
            mm.put("companyName", sche.getCompany().getName());
            model.addObject("schedule", sche);

            CarModel carModel = new CarModel();
            Car car = carModel.getObject(carId);
            session.setAttribute("carId1", car.getCarId());
            mm.put("carNumber", car.getNumberCar());
            mm.put("numaberSeat", car.getNumberOfseat());
            mm.put("price", car.getPriceTicket());
            Ticket ticket = new Ticket();
            model.getModelMap().put("ticket", ticket);
            NgayDi sogheTrong = scheMdel.gheTrongNgayDi(carId, session.getAttribute("dateStart").toString());
            if (sogheTrong == null) {
                NgayDi objNgay = scheMdel.addONgayDi(car.getCarId(),session.getAttribute("dateStart").toString());
                if (objNgay != null) {
                    String numGhe = objNgay.getSoGheTrong();
                    session.setAttribute("chocon", numGhe);
                }
            } else {
                session.setAttribute("chocon", sogheTrong.getSoGheTrong());
            }

            return model;
        } catch (Exception e) {
            e.printStackTrace();
            ModelAndView modelError = new ModelAndView("/errorPage");
            return modelError;
        }
    }

    //xử lí sau khi khách hàng thêm thông tin đặt vé
    @RequestMapping(value = "/handleOrderTicket")
    public ModelAndView handleOrderTicket(@ModelAttribute("ticket") Ticket tic, HttpSession session) {
        try {
            TicketModel ticketModel = new TicketModel();
            boolean check = ticketModel.addObject(tic);
            if (check) {
                //lấy mã xe 
                String carId = session.getAttribute("carId1").toString();
                String soluongve = tic.getQuanTicket();
                String ngay = session.getAttribute("dateStart").toString();
                //lấy ngày đi theo mã xe và ngày đi
                NgayDi ngaydi = scheMdel.gheTrongNgayDi(Integer.parseInt(carId), ngay);
                //cập nhật số chỗ khi khách hàng điền thông tin đặt vé
                if (scheMdel.UpdateSoChoTrong(ngaydi, soluongve)) {
                    ModelAndView modelPayment = new ModelAndView("/paymentPage");
//            session.setAttribute("ticketId", tic.getTicketId());
                    session.setAttribute("email", tic.getEmail());
                    session.setAttribute("phone", tic.getPhone());
                    return modelPayment;
                }
                ModelAndView modelError = new ModelAndView("/errorPage");
                return modelError;
            } else {
                ModelAndView modelError = new ModelAndView("/errorPage");
                return modelError;
            }
        } catch (Exception e) {
            e.printStackTrace();
            ModelAndView modelError = new ModelAndView("/errorPage");
            return modelError;
        }
    }

    //xử lí thanh toán
    @RequestMapping(value = "/handlePaymentOrder")
    public ModelAndView handlePaymentOrder(HttpSession session) throws MessagingException, IOException {
        try {
            ModelAndView model = new ModelAndView("/paymentSucsess");

//        String ticketId = (String) session.getAttribute("ticketId");
            String email = (String) session.getAttribute("email");
            String phone = (String) session.getAttribute("phone");
//        TicketModel ticketModel = new TicketModel();
//        Ticket ticket = ticketModel.getObject(Integer.parseInt(ticketId));

//        String schedule = ticket.getCar().getSchedule().getRoute();
//        String company = ticket.getCar().getCom().getName();
//        String car = ticket.getCar().getNumberCar();
//        String timeStart = ticket.getCar().getTimeStart();
//        String numberSeat = ticket.getNumberOfSeat();
//        String message = "Dat ve thanh cong:  "+schedule+". "+company+". "+ "Bien so: "+car+"So cho ngoi: "+numberSeat+" thoi gian khoi hanh: "+timeStart;
            EmailUtil.sendEmal(email, "Thu cam on", "Quy khahch da dat ve thanh cong");
            SMSUtil.sendSMS(phone, "Quy khach da dat ve thanh cong");
            return model;
        } catch (Exception e) {
            e.printStackTrace();
            ModelAndView error = new ModelAndView("/errorPage");
            return error;
        }

    }
    //show error

    @RequestMapping(value = "/showError")
    public ModelAndView showError() {
        ModelAndView model = new ModelAndView("/errorPage");
        return model;
    }

    //hiển thị danh sách xe khi khách ấn tìm xe
    @RequestMapping(value = "/showCarFollowCompany  ")
    public ModelAndView showCarFollowCompany(@RequestParam("companyId") int companyId) {
        ModelAndView model = new ModelAndView("");
        return model;
    }
}
