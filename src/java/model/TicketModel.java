/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import entity.Car;
import entity.Company;
import entity.Ticket;
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
public class TicketModel extends BaseModel<Ticket> {

    public TicketModel() {
        super(Ticket.class);
    }

    @Override
    public ArrayList<Ticket> getAllObject() {
        session = sf.openSession();
        ArrayList<Ticket> listTiket;
        try {
            String hql = "from Ticket t where t.flag = 1";
            tran = session.beginTransaction();
            listTiket = (ArrayList<Ticket>) session.createQuery(hql).list();
            tran.commit();
            if (listTiket.size() >= 1) {
                return listTiket;
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
    public Ticket getObject(int objKey) {
        session = sf.openSession();
        Ticket ticket = new Ticket();
        try {
            String hql = "from Ticket t where t.ticketId = :id and t.flag = 1";
            tran = session.beginTransaction();
            ticket = (Ticket) session.createQuery(hql).
                    setParameter("id", objKey).uniqueResult();
            return ticket;
        } catch (Exception e) {
            tran.rollback();
            e.printStackTrace();
            return null;
        } finally {
            session.close();
        }
    }

    @Override
    public boolean addObject(Ticket instence) {
        boolean check = false;
        Ticket tic = new Ticket();
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();
            Calendar cal = Calendar.getInstance();
            Date date = cal.getTime();
            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
            String dateCreate = sdf.format(date);
            tic.setAddress(instence.getAddress());
            tic.setCar(instence.getCar());
            tic.setCompany(instence.getCompany());
            tic.setCustomerName(instence.getCustomerName());
            tic.setDateLast(" ");
            tic.setDateOrder(dateCreate);
            tic.setDateStart(instence.getDateStart());
            tic.setEmail(instence.getEmail());
            tic.setFlag(true);
            tic.setNote(instence.getNote());
            tic.setNumberOfSeat(instence.getNumberOfSeat());
            tic.setPhone(instence.getPhone());
            int priceCar = Integer.parseInt(instence.getPrice());
            int quantity = Integer.parseInt(instence.getQuanTicket());
            int sumMony = priceCar*quantity;
            tic.setPrice(String.valueOf(sumMony));
            tic.setPriceCancel("0");
            tic.setQuanTicket(instence.getQuanTicket());
            tic.setReasonCancel(" ");
            tic.setStatus("chờ thanh toán");
            tic.setTicketType(instence.getTicketType());

            session.save(tic);
            session.getTransaction().commit();
            check = true;
        } catch (Exception e) {
//            sf.getCurrentSession().getTransaction().rollback();
            session.getTransaction().rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }
        return check;
    }

    @Override
    public boolean UpdateObject(Ticket instence) {
        session = sf.openSession();
        boolean check = false;
        try {
            tran = session.beginTransaction();
            String hql = "update Ticket t "
                    + "set t.ticketType = :ticketType,t.customerName = :customerName,t.address = :address,t.email = :email,t.phone = :phone,t.quanTicket = :quanTicket,t.numberOfSeat = :numberOfSeat,t.dateStart = :dateStart,t.price = :price,t.dateOrder = :dateOrder,t.dateLast = :dateLast,t.note = :note,t.status = :status,t.reasonCancel = :reasonCancel,t.priceCancel = :priceCancel,t.flag = :flag "
                    + "where t.ticketId = :id";
            Query query = session.createQuery(hql);
            query.setParameter("ticketType", instence.getTicketType());
            query.setParameter("customerName", instence.getCustomerName());
            query.setParameter("address", instence.getAddress());
            query.setParameter("email", instence.getEmail());
            query.setParameter("phone", instence.getPhone());
            query.setParameter("quanTicket", instence.getQuanTicket());
            query.setParameter("numberOfSeat", instence.getNumberOfSeat());
            query.setParameter("dateStart", instence.getDateStart());
            query.setParameter("price", instence.getPrice());
            query.setParameter("dateOrder", instence.getDateOrder());
            Calendar cal = Calendar.getInstance();
            Date date = cal.getTime();
            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
            String dateLast = sdf.format(date);
            query.setParameter("dateLast", dateLast);
            query.setParameter("note", instence.getNote());
            query.setParameter("status", instence.getStatus());
            query.setParameter("reasonCancel", " ");
            query.setParameter("priceCancel", 0);
            query.setParameter("flag", true);
//            query.setParameter("user", instence.getUser());
            query.setParameter("id", instence.getTicketId());
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
    public boolean DeleteObject(Ticket instence) {
        session = sf.openSession();
        try {
            String hql = "update Ticket t set t.reasonCancel=:reasonCancel,t.priceCancel=:priceCancel, t.flag = 0 where t.ticketId = :id ";
            tran = session.beginTransaction();
            Query query = session.createQuery(hql);
            Double priceCancel = Float.parseFloat(instence.getPrice())*0.03;
            query.setParameter("reasonCancel", "vợ đẻ");
            query.setParameter("priceCancel", String.valueOf(priceCancel));
            query.setParameter("id", instence.getTicketId());
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

    //lấy danh sách vé xe
    public ArrayList<Ticket> getAllTicketOrder(int companyId) {
        session = sf.openSession();
        ArrayList<Ticket> listTiket;
        try {
            String hql = "from Ticket t where t.flag = 1 and t.company = " + companyId + " order by t.ticketId desc";
            tran = session.beginTransaction();
            listTiket = (ArrayList<Ticket>) session.createQuery(hql).list();
            tran.commit();
            if (listTiket.size() >= 1) {
                return listTiket;
            }
        } catch (Exception e) {
            tran.rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }
        return null;
    }

    public ArrayList<Ticket> getAllTicketCancel(int companyId) {
        session = sf.openSession();
        ArrayList<Ticket> listTiket;
        try {
            String hql = "from Ticket t where t.company = " + companyId + " and t.flag = 0 order by t.ticketId desc";
            tran = session.beginTransaction();
            listTiket = (ArrayList<Ticket>) session.createQuery(hql).list();
            tran.commit();
            if (listTiket.size() >= 1) {
                return listTiket;
            }
        } catch (Exception e) {
            tran.rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }
        return null;
    }

    public Ticket addOTicket(Ticket instence) {
        Ticket tic = new Ticket();
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();
            Calendar cal = Calendar.getInstance();
            Date date = cal.getTime();
            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
            String dateCreate = sdf.format(date);
            tic.setAddress(instence.getAddress());
            tic.setCar(instence.getCar());
            tic.setCompany(instence.getCompany());
            tic.setCustomerName(instence.getCustomerName());
            tic.setDateLast(" ");
            tic.setDateOrder(dateCreate);
            tic.setDateStart(instence.getDateStart());
            tic.setEmail(instence.getEmail());
            tic.setFlag(true);
            tic.setNote(instence.getNote());
            tic.setNumberOfSeat(instence.getNumberOfSeat());
            tic.setPhone(instence.getPhone());
            int priceCar = Integer.parseInt(instence.getPrice());
            int quantity = Integer.parseInt(instence.getQuanTicket());
            int sumMony = priceCar*quantity;
            tic.setPrice(String.valueOf(sumMony));
            tic.setPriceCancel("0");
            tic.setQuanTicket(instence.getQuanTicket());
            tic.setReasonCancel(" ");
            tic.setStatus("chờ thanh toán");
            tic.setTicketType(instence.getTicketType());

            session.save(tic);
            session.getTransaction().commit();
            return tic;
        } catch (Exception e) {
//            sf.getCurrentSession().getTransaction().rollback();
            session.getTransaction().rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }
        return null;
    }
    public static void main(String[] args) {
        TicketModel model = new TicketModel();

//        ArrayList<Ticket> listUser = model.getAllTicketCancel();
//        for (Ticket u : listUser) {
//            System.out.println(u.toString());
//        }
        Car car = new Car(1);
        Company com = new Company(1);
        //Ticket tic = new Ticket("thuong", "nguyen duong vat", "hai phong", "hoangoc@gmail.com", "phone", 1, "15", "01/02/2017", 100, " ", " ", "xe sang", "da thanh toan", " ", 0, true, 1, 1);
        Ticket t = new Ticket(3,"2", "Minh móc", "Hai Phong", "123@abc", "123123", "1", "100", "1/1/2017", "100", " ", " ", "Test", "Test", "Test", "0", true, car, com);
        if (model.addObject(t)) {
            System.out.println("thanh cong");
        } else {
            System.out.println("that bai");
        }
    }

}
