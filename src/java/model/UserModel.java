/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import entity.User;
import java.util.Date;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import sun.util.calendar.BaseCalendar;

/**
 *
 * @author root
 */
public class UserModel extends BaseModel<User> {

    public UserModel() {
        super(User.class);
    }

    @Override
    public ArrayList<User> getAllObject() {
        session = sf.openSession();
        ArrayList<User> listUser;
        try {
            String hql = "from User u where u.flag = 1 order by u.userId desc";
            tran = session.beginTransaction();
            listUser = (ArrayList<User>) session.createQuery(hql).list();
            tran.commit();
            if (listUser.size() >= 1) {
                return listUser;
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
    public User getObject(int objKey) {
        session = sf.openSession();
        User user = new User();
        try {
            String hql = "from User u where u.userId = :id and u.flag = 1";
            tran = session.beginTransaction();
            user = (User) session.createQuery(hql).
                    setParameter("id", objKey).uniqueResult();
            return user;
        } catch (Exception e) {
            tran.rollback();
            e.printStackTrace();
            return null;
        } finally {
            session.close();
        }

    }

    //insert new staff
    @Override
    public boolean addObject(User instence) {
        boolean check = false;
        User u = new User();
        try {
            sf.getCurrentSession().beginTransaction();

            u.setAddress(instence.getAddress());
            u.setAvatar(instence.getAvatar());
            u.setBirthDay(instence.getBirthDay());
            u.setCmnd(instence.getCmnd());
            Calendar cal = Calendar.getInstance();
            Date date = cal.getTime();
            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
            String dateCreate = sdf.format(date);
            u.setDateCreate(dateCreate);
            u.setDateCreateLast(" ");
            u.setEmail(instence.getEmail());
            u.setFlag(true);
            u.setFullName(instence.getFullName());
            u.setGender(instence.isGender());
            u.setNote(instence.getNote());
            u.setPassword(instence.getPassword());
            u.setPermision(instence.getPermision());
            u.setPhone(instence.getPhone());
            u.setPosition(instence.getPosition());
            u.setStatus(instence.getStatus());
            u.setUserName(instence.getUserName());
            
            sf.getCurrentSession().save(u);
            sf.getCurrentSession().getTransaction().commit();
            check = true;
        } catch (Exception e) {
            sf.getCurrentSession().getTransaction().rollback();
            e.printStackTrace();
        }
        return check;
    }

    //update staff
    @Override
    public boolean UpdateObject(User instence) {
        session = sf.openSession();
        boolean check = false;
        try {
            tran = session.beginTransaction();
            String hql = "update User u "
                    + "set u.userName = :username,u.password = :pass,u.fullName = :fullname,u.gender = :gender,u.birthDay = :birthday,u.address = :address,u.email = :email,u.phone = :phone,u.cmnd = :cmnd,u.position = :position,u.permision = :permision,u.note = :note,u.status = :status,u.dateCreate = :datecreate,u.dateCreateLast = :datelast,u.flag = :flag "
                    + "where u.userId = :id";
            Query query = session.createQuery(hql);
            query.setParameter("username", instence.getUserName());
            query.setParameter("pass", instence.getPassword());
            query.setParameter("fullname", instence.getFullName());
            query.setParameter("gender", instence.isGender());
            query.setParameter("birthday", instence.getBirthDay());
            query.setParameter("address", instence.getAddress());
            query.setParameter("email", instence.getEmail());
            query.setParameter("phone", instence.getPhone());
            query.setParameter("cmnd", instence.getCmnd());
            query.setParameter("position", instence.getPosition());
            query.setParameter("permision", instence.getPermision());
            query.setParameter("note", instence.getNote());
            query.setParameter("status", instence.getStatus());
            query.setParameter("datecreate", instence.getDateCreate());
            Calendar cal = Calendar.getInstance();
            Date date = cal.getTime();
            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
            String dateLast = sdf.format(date);
            query.setParameter("datelast", dateLast);
            query.setParameter("flag", true);
            query.setParameter("id", instence.getUserId());
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

    //delete user staff
    @Override
    public boolean DeleteObject(User instence) {
        session = sf.openSession();
        try {
            String hql = "update User u set u.flag = 0 where u.userId = :id";
            tran = session.beginTransaction();
            Query query = session.createQuery(hql);
            query.setParameter("id", instence.getUserId());
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

    public User checkLogin(User user) {
        User u = new User();
        session = sf.openSession();
        try {
            String hql = "from User u where u.userName = :username and u.password = :pass and u.flag = 1";
            tran = session.beginTransaction();
            u = (User) session.createQuery(hql)
                    .setParameter("username", user.getUserName())
                    .setParameter("pass", user.getPassword())
                    .uniqueResult();
            return u;
        } catch (Exception e) {
            tran.rollback();
            e.printStackTrace();
            return null;
        } finally {
            session.close();
        }

    }

    //search user
    public ArrayList<User> search(User  user) {
        session = sf.openSession();
        ArrayList<User> listUser;
        try {
            String hql = "from User u where u.userName like :key  and u.flag = 1";
            tran = session.beginTransaction();
            Query query = session.createQuery(hql)
                    .setParameter("key", "%" + user.getUserName() + "%");
            listUser = (ArrayList<User>) query.list();
            tran.commit();
            return listUser;
        } catch (Exception e) {
            tran.rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }
        return null;
    }

    public static void main(String[] args) {
        UserModel model = new UserModel();
//        User u1 = new User("admin", "12", "Hà  nội", true, "rew", "rew", "rew", "rew", "rw", "rw", "rew", "rew", "rew", "rew", "rew", false);
////        boolean check  = model.checkLogin(u1);
//        User check = model.checkLogin(u1);
//        if (check != null) {
//            System.out.println("thanh cong");
//        } else {
//            System.out.println("that bai");
//        }

        User u = new User(1, "admin", "123", "thien", true, " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", true);
        User user = model.checkLogin(u);
        System.out.println(user);
//        ArrayList<User> listUser = model.getAllObject();
//        for (User user : listUser) {
//            System.out.println(user.toString());
//        }
//        User u = model.getObject(1);
//        System.out.println(u.toString());
    }

}
