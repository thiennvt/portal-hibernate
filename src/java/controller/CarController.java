/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.Car;
import entity.Schedule;
import java.util.ArrayList;
import javax.servlet.http.HttpSession;
import model.CarModel;
import model.CompanyModel;
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
@RequestMapping(value = "/car", method = RequestMethod.GET)
public class CarController {

    private CarModel carModel;

    public CarController() {
        this.carModel = new CarModel();
    }

    //lất toàn bộ xe
    @RequestMapping(value = "getAllCar")
    public ModelAndView getAllCar(@RequestParam("companyId") int companyId) {
        ModelAndView model = new ModelAndView("/carPage");
        ArrayList<Car> listCar = carModel.getAllCar(companyId);
        model.addObject("listCar", listCar);
        return model;
    }
    //hàm xử lí tìm kiếm xe khách
    public ModelAndView handleSearchCar(@ModelAttribute("car") Car car){
        ModelAndView model = new ModelAndView("/carPage");
        ArrayList<Car> listCar = carModel.search(car);
        model.addObject("listCar", listCar);
        return model;
    }
//    @RequestMapping(value = "getAllCar")
//    public ModelAndView getAllCar() {
//        ModelAndView model = new ModelAndView("/carPage");
//        ArrayList<Car> listCar = carModel.getAllObject();
//        model.addObject("listCar", listCar);
//        return model;
//    }
    //hiển thị trạng thái thành công
    @RequestMapping(value = "/showActionSucess")
    public ModelAndView showActionSucess(){
        ModelAndView model = new ModelAndView("/ActionSucsessPage");
        return model;
    }
    //thông tin chi tiết xe

    @RequestMapping(value = "/initCarDetail")
    public ModelAndView initCarDetail(@RequestParam("carId") int carId) {
        ModelAndView model = new ModelAndView("/carDetial");
        Car carDetail = carModel.getObject(carId);
        model.addObject("carDetail", carDetail);
        return model;
    }

    //hiển thị trang thêm thông tin nhà xe mới
    @RequestMapping(value = "/initInsertCar")
    public ModelAndView initInsertCar(@RequestParam("companyId") int companyId) {
        ModelAndView model = new ModelAndView("/newCar");
        Car car = new Car();
        model.getModelMap().put("newCar", car);
        ArrayList<Schedule> listSchedule = carModel.getAllSchedule(companyId);
        model.addObject("listSchedule", listSchedule);
        return model;
    }

    //xử lí lưu xe mới
    @RequestMapping(value = "/handleInsertCar")
    public String handleInsertCar(@ModelAttribute("newCar") Car car) {
        if (carModel.addObject(car)) {
            return "redirect:showActionSucess.htm";
        } else {
            return "newCar";
        }
    }

    //hiển thị cập nhât xe khách
    @RequestMapping(value = "/initUpdateCar")
    public ModelAndView initUpdateCar(@RequestParam("carId") int carId,@RequestParam("companyId") int companyId) {
        ModelAndView model = new ModelAndView("/carUpdate");
        Car car = carModel.getObject(carId);
        model.addObject("carUpdate", car);
        ArrayList<Schedule> listSchedule = carModel.getAllSchedule(companyId);
        model.addObject("listSchedule", listSchedule);
        return model;
    }

    
    //xử lí update xe khách
    @RequestMapping(value = "handleUpdateCar")
    public String handleUpdateCar(@ModelAttribute("carUpdate") Car car) {
        if (carModel.UpdateObject(car)) {
            return "redirect:showActionSucess.htm";
        } else {
            return "carUpdate";
        }
    }

    //xóa xe khách
//    @RequestMapping(value = "/initDeleteCar")
//    public String initDeleteCar(@ModelAttribute("car") Car car) {
//        if (carModel.DeleteObject(car)) {
//            return "redirect:getAllCar.htm";
//        } else {
//            return "error";
//        }
//    }
    @RequestMapping(value = "/initDeleteCar")
    public ModelAndView initDeleteCar(@ModelAttribute("car") Car car, @RequestParam("companyId") int companyId) {
        if (carModel.DeleteObject(car)) {
            ModelAndView model = new ModelAndView("/carPage");
            ArrayList<Car> listCar = carModel.getAllCar(companyId);
            model.addObject("listCar", listCar);
            return model;
        } else {
            ModelAndView modelDel = new ModelAndView("/carPage");
            return modelDel;
        }
    }
}
