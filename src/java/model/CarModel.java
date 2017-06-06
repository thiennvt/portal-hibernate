/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import entity.Car;
import entity.Company;
import entity.Schedule;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import util.HibernateUtil;

/**
 *
 * @author root
 */
public class CarModel extends BaseModel<Car> {

    public CarModel() {
        super(Car.class);
    }

    @Override
    public ArrayList<Car> getAllObject() {
        session = sf.openSession();
        ArrayList<Car> listCar;
        try {
            String hql = "from Car c where c.flag = 1";
            tran = session.beginTransaction();
            listCar = (ArrayList<Car>) session.createQuery(hql).list();
            tran.commit();
            if (listCar.size() >= 1) {
                return listCar;
            }
        } catch (Exception e) {
            tran.rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }
        return null;
    }

    @Override
    public Car getObject(int objKey) {
        Car car = new Car();
        session = sf.openSession();
        try {
            String hql = "from Car c where c.carId=:id and c.flag = 1";
            tran = session.beginTransaction();
            car = (Car) session.createQuery(hql)
                    .setParameter("id", objKey)
                    .uniqueResult();
            tran.commit();
            return car;
        } catch (Exception e) {
            tran.rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }
        return null;
    }

    @Override
    public boolean addObject(Car instence) {
        boolean check = false;
        Car c = new Car();
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();
            c.setCarType(instence.getCarType());
            c.setColor(instence.getColor());
            c.setCom(instence.getCom());
            c.setCompany(instence.getCompany());
            Calendar cal = Calendar.getInstance();
            Date date = cal.getTime();
            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
            String dateCreate = sdf.format(date);
            c.setDateCreate(dateCreate);
            c.setDateCreateLast(" ");
            c.setFlag(true);
            c.setNote(instence.getNote());
            c.setNumberCar(instence.getNumberCar());
            c.setNumberOfseat(instence.getNumberOfseat());
            c.setPriceTicket(instence.getPriceTicket());
            c.setSchedule(instence.getSchedule());
            c.setStatus(instence.getStatus());
            c.setTimeCome(instence.getTimeCome());
            c.setTimeStart(instence.getTimeStart());

            session.save(c);
            session.getTransaction().commit();
            check = true;
        } catch (Exception e) {
            session.getTransaction().rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }
        return check;
    }

    @Override
    public boolean UpdateObject(Car instence) {
        session = sf.openSession();
        boolean check = false;
        try {
            String hql = "update Car c "
                    + "set c.carType = :carType,c.numberCar = :numberCar,c.color = :color,c.numberOfseat = :numberOfseat,c.company = :company,c.timeStart = :timeStart,c.timeCome = :timeCome,c.priceTicket = :priceTicket, c.note = :note,c.status = :status,c.dateCreate = :dateCreate,c.dateCreateLast = :dateCreateLast,c.flag = :flag,c.schedule = :schedule "
                    + "where c.carId = :id";
            tran = session.beginTransaction();
            Query query = session.createQuery(hql);
            query.setParameter("carType", instence.getCarType());
            query.setParameter("numberCar", instence.getNumberCar());
            query.setParameter("color", instence.getColor());
            query.setParameter("numberOfseat", instence.getNumberOfseat());
            query.setParameter("company", instence.getCompany());
            query.setParameter("timeStart", instence.getTimeStart());
            query.setParameter("timeCome", instence.getTimeCome());
            query.setParameter("priceTicket", instence.getPriceTicket());
            query.setParameter("note", instence.getNote());
            query.setParameter("status", instence.getStatus());
            Calendar cal = Calendar.getInstance();
            Date date = cal.getTime();
            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
            String dateLast = sdf.format(date);
            query.setParameter("dateCreate", dateLast);
            query.setParameter("dateCreateLast", " ");
            query.setParameter("flag", true);
            query.setParameter("schedule", instence.getSchedule());
//            query.setParameter("com", instence.getCom());
            query.setParameter("id", instence.getCarId());
            int rowCount = query.executeUpdate();
            tran.commit();
            check = true;
        } catch (HibernateException e) {
            tran.rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }
        return check;
    }

    @Override
    public boolean DeleteObject(Car instence) {
        session = sf.openSession();
        try {
            String hql = "update Car c set c.flag = 0 where c.carId = :id";
            tran = session.beginTransaction();
            Query query = session.createQuery(hql);
            query.setParameter("id", instence.getCarId());
            int rowCount = query.executeUpdate();
            tran.commit();
            return true;
        } catch (HibernateException e) {
            tran.rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }
        return false;
    }

    public ArrayList<Car> getAllCar(int companyId) {
        session = sf.openSession();
        ArrayList<Car> listCar;
        try {
            String hql = "from Car c where c.flag = 1 and c.com = " + companyId + " order by c.carId desc";
            tran = session.beginTransaction();
            listCar = (ArrayList<Car>) session.createQuery(hql).list();
            tran.commit();
            if (listCar.size() >= 1) {
                return listCar;
            }
        } catch (Exception e) {
            tran.rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }
        return null;
    }

//    public boolean DeleteCar(Car instence,int companyId) {
//        session = sf.openSession();
//        try {
//            String hql = "update Car c set c.flag = 0 where c.carId = :id";
//            tran = session.beginTransaction();
//            Query query = session.createQuery(hql);
//            query.setParameter("id", instence.getCarId());
//            int rowCount = query.executeUpdate();
//            tran.commit();
//            return true;
//        } catch (HibernateException e) {
//            tran.rollback();
//            e.printStackTrace();
//        } finally {
//            session.close();
//        }
//        return false;
//    }
    public ArrayList<Car> search(Car car) {
        session = sf.openSession();
        ArrayList<Car> listCar;
        try {
            String hql = "from Car c where c.carType like :key  and c.flag = 1";
            tran = session.beginTransaction();
            Query query = session.createQuery(hql)
                    .setParameter("key", "%" + car.getCarType() + "%");
            listCar = (ArrayList<Car>) query.list();
            tran.commit();
            return listCar;
        } catch (Exception e) {
            tran.rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }
        return null;
    }

    //lấy danh sách lịch trình
    public ArrayList<Schedule> getAllSchedule(int companyId) {
        session = sf.openSession();
        ArrayList<Schedule> listSchedule;
        try {
            String hql = "from Schedule s where s.flag = 1 and s.company = " + companyId + " order by s.scheduleId desc";
            tran = session.beginTransaction();
            listSchedule = (ArrayList<Schedule>) session.createQuery(hql).list();
            tran.commit();
            return listSchedule;
        } catch (Exception e) {
            tran.rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }
        return null;
    }

    public static void main(String[] args) {
        CarModel model = new CarModel();
//        Car c = model.getObject(2);
//        System.out.println(c);
//        ArrayList<Schedule> listUser = model.getAllSchedule(3);
//        for (Schedule u : listUser) {
//            System.out.println(u.toString());
//        }
////        User u = model.getObject(1);
////        System.out.println(u.toString());
//
        Schedule s = new Schedule(1);
        Company com = new Company(2);

//        Car c = new Car(5, "giường nằm", "19L-1234", "vàng", "30", "30", "toyota", "5h", "8h", "150", "xe êm", "đang áp dụng", " ", " ", true, s, com);
//        if (model.addObject(c)) {
//            System.out.println("thanh cong");
//        } else {
//            System.out.println("that bai");
//        }
    }
}
