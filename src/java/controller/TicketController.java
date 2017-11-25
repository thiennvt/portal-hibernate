/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.Car;
import entity.NgayDi;
import entity.Ticket;
import java.util.ArrayList;
import model.CarModel;
import model.ScheduleModel;
import model.TicketModel;
import org.springframework.stereotype.Controller;
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
@RequestMapping(value = "/ticket", method = RequestMethod.GET)
public class TicketController {

    private TicketModel ticModel;

    public TicketController() {
        this.ticModel = new TicketModel();
    }

    //lấy toàn bộ vé đặt
    @RequestMapping("/getAllTicket")
    public ModelAndView getAllTicket(@RequestParam("companyId") int companyId) {
        try {
            ModelAndView model = new ModelAndView("/ticketOrderPage");
            ArrayList<Ticket> listTicket = ticModel.getAllTicketOrder(companyId);
            model.addObject("listTicket", listTicket);
            return model;
        } catch (Exception e) {
            e.printStackTrace();
            ModelAndView model1 = new ModelAndView("errorPage");
            return model1;
        }

    }

    //lất toàn bộ vé hủy
    @RequestMapping(value = "/getAllTicketCancel")
    public ModelAndView getAllTicketCancel(@RequestParam("companyId") int companyId) {
        try {
            ModelAndView model = new ModelAndView("/ticketCancelPage");
            ArrayList<Ticket> listTicketCancel = ticModel.getAllTicketCancel(companyId);
            model.addObject("listCancel", listTicketCancel);
            return model;
        } catch (Exception e) {
            e.printStackTrace();
            ModelAndView model1 = new ModelAndView("errorPage");
            return model1;
        }

    }

    //thông báo thành công và trả về danh sách
    @RequestMapping(value = "/showActionSucessTicket")
    public ModelAndView showActionSucess() {
        ModelAndView model = new ModelAndView("/actionSucsessTicketPage");
        return model;
    }

    //thêm vé xe khách
    @RequestMapping(value = "/initInsertTicket")
    public ModelAndView initInsertTicket() {
        try {
            ModelAndView model = new ModelAndView("/newTicket");
            Ticket tic = new Ticket();
            model.getModelMap().put("newTicket", tic);
            return model;
        } catch (Exception e) {
            e.printStackTrace();
            ModelAndView model1 = new ModelAndView("errorPage");
            return model1;
        }

    }

    //xử lí thêm vé xe khách
    @RequestMapping(value = "/handleInsertTickerOrder")
    public String handleInsertTickerOrder(@ModelAttribute("newTicket") Ticket ticket) {
        try {
            if (ticModel.addObject(ticket)) {
                return "redirect:getAllTicket.htm";
            } else {
                return "newTicket";
            }
        } catch (Exception e) {
            e.printStackTrace();
            return "errorPageF";
        }

    }

    //hiển thị form update ticket order
    @RequestMapping(value = "/initUpdateTicketOrder")
    public ModelAndView initUpdateTicketOrder(@RequestParam("ticketId") int ticketId) {
        try {
            ModelAndView model = new ModelAndView("/ticketOrderUpdate");
            Ticket ticket = ticModel.getObject(ticketId);
            model.addObject("updateTicket", ticket);
            return model;
        } catch (Exception e) {
            e.printStackTrace();
            ModelAndView model1 = new ModelAndView("errorPage");
            return model1;
        }

    }

    @RequestMapping(value = "/handleUpdateTicketOrder")
    public String handleUpdateTicketOrder(@ModelAttribute("updateTicket") Ticket ticket) {
        try {
            if (ticModel.UpdateObject(ticket)) {
                return "redirect:showActionSucessTicket.htm";
            } else {
                return "ticketOrderUpdate";
            }
        } catch (Exception e) {
            e.printStackTrace();
            return "errorPageF";
        }

    }

    @RequestMapping(value = "/showSearchTicket")
    public ModelAndView showSearchTicket(){
        try {
            ModelAndView model = new ModelAndView("/ticketSearch");
            Ticket tic = new Ticket();
            model.getModelMap().put("ticketSearch", tic);
            return model;
        } catch (Exception e) {
            e.printStackTrace();
            ModelAndView model1 = new ModelAndView("errorPage");
            return model1;
        }
    }
    @RequestMapping(value = "/handleSearchTicketClient")
    public ModelAndView handlSearchTicketClient(@ModelAttribute("ticketSearch") Ticket ticket){
        Ticket tic = ticModel.getObject(ticket.getTicketId());
        try {
            if (tic != null) {
                    ModelAndView model = new ModelAndView("/ticketSearch");
                    model.addObject("ticket", tic);
                    return model;
            } else {
                ModelAndView model1 = new ModelAndView("errorPage");
                return model1;
            }
        } catch (Exception e) {
            e.printStackTrace();
            ModelAndView model1 = new ModelAndView("errorPage");
            return model1;
        }
    }
    //delete schedule admin
    @RequestMapping(value = "/initDeleteTicket")
    public ModelAndView initAdminDeleteSchedule(@ModelAttribute("schedule") Ticket ticket, @RequestParam("companyId") int companyId) {
        Ticket tic = ticModel.getObject(ticket.getTicketId());
        int carId = tic.getCar().getCarId();
        String ticQuantity = tic.getQuanTicket();
        String ngay = tic.getDateStart();
        try {
            if (ticModel.DeleteObject(tic)) {
                ScheduleModel scheduleModel = new ScheduleModel();
                NgayDi ngaydi = scheduleModel.gheTrongNgayDi(carId, ngay);
                if (scheduleModel.UpdateSoChoTrongKhiHuy(ngaydi, ticQuantity)) {
                    ModelAndView model = new ModelAndView("/ticketOrderPage");
                    ArrayList<Ticket> listTicket = ticModel.getAllTicketOrder(companyId);
                    model.addObject("listTicket", listTicket);
                    return model;
                }
                ModelAndView modelError = new ModelAndView("/errorPage");
                return modelError;
            } else {
                ModelAndView model1 = new ModelAndView("errorPage");
                return model1;
            }
        } catch (Exception e) {
            e.printStackTrace();
            ModelAndView model1 = new ModelAndView("errorPage");
            return model1;
        }

    }
}
