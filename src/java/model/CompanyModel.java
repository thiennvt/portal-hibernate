/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import entity.Company;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author root
 */
public class CompanyModel extends BaseModel<Company> {

    public CompanyModel() {
        super(Company.class);
    }

    @Override
    public ArrayList<Company> getAllObject() {
        session = sf.openSession();
        tran = null;
        ArrayList<Company> listUser;
        try {
            String hql = "from Company c where c.flag = 1 order by c.companyId desc";
            tran = session.beginTransaction();
            listUser = (ArrayList<Company>) session.createQuery(hql).list();
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
    public Company getObject(int objKey) {
        Company com = new Company();
        session = sf.openSession();
        try {
            String hql = "from Company c where c.companyId = :id and c.flag = 1";
            tran = session.beginTransaction();
            com = (Company) session.createQuery(hql).
                    setParameter("id", objKey).uniqueResult();
            return com;
        } catch (Exception e) {
            tran.rollback();
            e.printStackTrace();
            return null;
        } finally {
            session.close();
        }
    }

    @Override
    public boolean addObject(Company instence) {
        boolean check = false;
        Company com = new Company();
        try {
            sf.getCurrentSession().beginTransaction();
            com.setAccountName(instence.getAccountName());
            com.setAddress(" ");
            Calendar cal = Calendar.getInstance();
            Date date = cal.getTime();
            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
            String dateCreate = sdf.format(date);
            com.setDateCreate(dateCreate);
            com.setDateCreatelast(" ");
            com.setEmail(instence.getEmail());
            com.setFlag(true);
            com.setHotline(" ");
            com.setName(instence.getName());
            com.setNote(" ");
            com.setPassword(instence.getPassword());
            com.setPhone(instence.getPhone());
            com.setStatus(false);

            sf.getCurrentSession().save(com);
            sf.getCurrentSession().getTransaction().commit();
            check = true;
        } catch (Exception e) {
            sf.getCurrentSession().getTransaction().rollback();
            e.printStackTrace();
        }
        return check;
    }

    @Override
    public boolean UpdateObject(Company instence) {
        session = sf.openSession();
        try {
            String hql = "update Company c "
                    + "set c.address = :address,c.hotline = :hotline,c.dateCreatelast = :datelast,c.note = :note,c.status = :status,c.flag = :flag "
                    + "where c.companyId = :id";
            tran = session.beginTransaction();
            Query query = session.createQuery(hql);
//            query.setParameter("name", instence.getName());
//            query.setParameter("accName", instence.getAccountName());
//            query.setParameter("pass", instence.getPassword());
            query.setParameter("address", instence.getAddress());
//            query.setParameter("email", instence.getEmail());
//            query.setParameter("phone", instence.getPhone());
            query.setParameter("hotline", instence.getHotline());
//            query.setParameter("datecreate", instence.getDateCreate());
            Calendar cal = Calendar.getInstance();
            Date date = cal.getTime();
            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
            String dateLast = sdf.format(date);
            query.setParameter("datelast", dateLast);
            query.setParameter("note", instence.getNote());
            query.setParameter("status", false);
            query.setParameter("flag", true);
            query.setParameter("id", instence.getCompanyId());
            int rowCount = query.executeUpdate();
            tran.commit();
            return true;
        } catch (Exception e) {
            tran.rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }
        return false;
    }
    public boolean UpdateCompanyDetail(Company instence) {
        session = sf.openSession();
        try {
            String hql = "update Company c "
                    + "set c.name = :name,c.accountName = :accName,c.password = :pass,c.address = :address,c.email = :email,c.phone = :phone,c.hotline = :hotline,c.dateCreate = :datecreate,c.dateCreatelast = :datelast,c.note = :note,c.status = :status,c.flag = :flag "
                    + "where c.companyId = :id";
            tran = session.beginTransaction();
            Query query = session.createQuery(hql);
            query.setParameter("name", instence.getName());
            query.setParameter("accName", instence.getAccountName());
            query.setParameter("pass", instence.getPassword());
            query.setParameter("address", instence.getAddress());
            query.setParameter("email", instence.getEmail());
            query.setParameter("phone", instence.getPhone());
            query.setParameter("hotline", instence.getHotline());
            query.setParameter("datecreate", instence.getDateCreate());
            Calendar cal = Calendar.getInstance();
            Date date = cal.getTime();
            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
            String dateLast = sdf.format(date);
            query.setParameter("datelast", dateLast);
            query.setParameter("note", instence.getNote());
            query.setParameter("status", true);
            query.setParameter("flag", true);
            query.setParameter("id", instence.getCompanyId());
            int rowCount = query.executeUpdate();
            tran.commit();
            return true;
        } catch (Exception e) {
            tran.rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }
        return false;
    }
    //delete company
    @Override
    public boolean DeleteObject(Company instence) {
        session = sf.openSession();
        Company com = new Company();
        try {
            String hql = "update Company c set c.flag = 0 where c.companyId = :id";
            tran = session.beginTransaction();
            Query query = session.createQuery(hql);
            query.setParameter("id", instence.getCompanyId());
            int result = query.executeUpdate();
            tran.commit();
            return true;
        } catch (Exception e) {
            tran.rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }
        return false;
    }
    public Company checkLoginCompany(Company com){
        Company comp = new Company();
        session = sf.openSession();
        try {
            String hql = "from Company c where c.accountName = :username and c.password = :pass and c.flag = 1 ";
            tran = session.beginTransaction();
            comp =  (Company) session.createQuery(hql)
                    .setParameter("username", com.getAccountName())
                    .setParameter("pass", com.getPassword()).uniqueResult();
            return comp;
        } catch (Exception e) {
            tran.rollback();
            e.printStackTrace();
            return null;
        } finally {
            session.close();
        }
    }
    public boolean waiteConfirm() {
        session = sf.openSession();
        ArrayList<Company> listCom = null;
        boolean check = false;
        try {
            String hql = "from Company c where c.flag = 1 and c.status = 0";
            tran = session.beginTransaction();
            listCom = (ArrayList<Company>) sf.getCurrentSession().createQuery(hql).uniqueResult();
            if (listCom.size() >= 1) {
                check = true;
            }
        } catch (Exception e) {
            tran.rollback();
            e.printStackTrace();

        } finally {
            session.close();
        }
        return check;
    }

    public boolean confirmed(Company com) {
        session = sf.openSession();
        tran = null;
        try {
            String hql = "update Company c set c.status = 1 where c.companyId = :id";
            tran = session.beginTransaction();
            Query query = session.createQuery(hql);
            query.setParameter("id", com.getCompanyId());
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
    //search schedule
    public ArrayList<Company> search(Company  com) {
        session = sf.openSession();
        ArrayList<Company> listCom;
        try {
            String hql = "from Company c where c.name like :key  and c.flag = 1";
            tran = session.beginTransaction();
            Query query = session.createQuery(hql)
                    .setParameter("key", "%" + com.getName() + "%");
            listCom = (ArrayList<Company>) query.list();
            tran.commit();
            return listCom;
        } catch (Exception e) {
            tran.rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }
        return null;
    }
    
    public static void main(String[] args) {
        CompanyModel model = new CompanyModel();
        Company u1 = new Company(13, "a", "0"," ", "0", "0", "0", "0", "0", "0", "0", "0", true, true);
//        boolean  check = model.UpdateObject(u1);
//        if (check) {
//            System.out.println("thanh cong");
//        } else {
//            System.out.println("that bai");
//        }

        ArrayList<Company> listUser = model.getAllObject();
        for (Company u : listUser) {
            System.out.println(u.toString());
        }
//        User u = model.getObject(1);
//        System.out.println(u.toString());
    }
}
