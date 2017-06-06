/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import entity.*;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import org.hibernate.HibernateException;
import org.hibernate.Query;

/**
 *
 * @author root
 */
public class ScheduleModel extends BaseModel<Schedule> {

    public ScheduleModel() {
        super(Schedule.class);
    }

    @Override
    public ArrayList<Schedule> getAllObject() {
        session = sf.openSession();
        ArrayList<Schedule> listSchedule;
        try {
            String hql = "from Schedule s where s.flag = 1 ";
            tran = session.beginTransaction();
            listSchedule = (ArrayList<Schedule>) session.createQuery(hql).setMaxResults(10).list();
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

    @Override
    public Schedule getObject(int objKey) {
        session = sf.openSession();
        Schedule sche = new Schedule();
        try {
            String hql = "from Schedule s where s.scheduleId=:id and s.flag = 1";
            tran = session.beginTransaction();
            sche = (Schedule) session.createQuery(hql)
                    .setParameter("id", objKey)
                    .uniqueResult();
            tran.commit();
            return sche;
        } catch (Exception e) {
            tran.rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }
        return null;
    }

    @Override
    public boolean addObject(Schedule instence) {
        boolean check = false;
        Schedule s = new Schedule();
        try {
            sf.getCurrentSession().beginTransaction();

            Calendar cal = Calendar.getInstance();
            Date date = cal.getTime();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            String dateCreate = sdf.format(date);
            s.setDateCreate(dateCreate);
            s.setDateCreateLast(" ");
            s.setDateStart(instence.getDateStart());
            s.setFlag(true);
            s.setKilometer(instence.getKilometer());
            s.setNote(instence.getNote());
            s.setPlaceCome(instence.getPlaceCome());
            s.setPlaceStart(instence.getPlaceStart());
            s.setRoute(instence.getRoute());
            s.setStatus(instence.getStatus());
            s.setCompany(instence.getCompany());
            s.setDateStart(instence.getDateStart());
            sf.getCurrentSession().save(s);
            sf.getCurrentSession().getTransaction().commit();

            check = true;
        } catch (Exception e) {
            sf.getCurrentSession().getTransaction().rollback();
            e.printStackTrace();
        }
        return check;
    }

    @Override
    public boolean UpdateObject(Schedule instence) {
        session = sf.openSession();
        boolean check = false;
        try {
            String hql = "update Schedule s "
                    + "set s.route = :route,s.kilometer = :kilometer,s.dateStart = :dateStart, s.placeStart = :placeStart, s.placeCome = :placeCome,s.note = :note,s.status = :status,s.dateCreate = :dateCreate,s.dateCreateLast = :dateCreateLast,s.flag = :flag "
                    + "where s.scheduleId = :id";
            tran = session.beginTransaction();
            Query query = session.createQuery(hql);
            query.setParameter("route", instence.getRoute());
            query.setParameter("kilometer", instence.getKilometer());
            query.setParameter("dateStart", instence.getDateStart());
            query.setParameter("placeStart", instence.getPlaceStart());
            query.setParameter("placeCome", instence.getPlaceCome());
            query.setParameter("note", instence.getNote());
            query.setParameter("status", instence.getStatus());
            query.setParameter("dateCreate", instence.getDateCreate());
            Calendar cal = Calendar.getInstance();
            Date date = cal.getTime();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            String dateLast = sdf.format(date);
            query.setParameter("dateCreateLast", dateLast);
            query.setParameter("flag", true);
            query.setParameter("id", instence.getScheduleId());
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
    public boolean DeleteObject(Schedule instence) {
        session = sf.openSession();
        try {
            String hql = "update Schedule s set s.flag = 0 where scheduleId = :id";
            tran = session.beginTransaction();
            Query query = session.createQuery(hql)
                    .setParameter("id", instence.getScheduleId());
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

    public ArrayList<Company> getAllCompany() {
        session = sf.openSession();
        tran = null;
        ArrayList<Company> listUser;
        try {
            String hql = "from Company c where c.flag = 1 order by c.companyId desc";
            tran = session.beginTransaction();
            listUser = (ArrayList<Company>) session.createQuery(hql).setMaxResults(4).list();
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

    public ArrayList<Schedule> search(Schedule sche) {
        session = sf.openSession();
        ArrayList<Schedule> listSchedule;
        try {
            String hql = "from Schedule s where s.route like :key  and s.flag = 1";
            tran = session.beginTransaction();
            Query query = session.createQuery(hql)
                    .setParameter("key", "%" + sche.getRoute() + "%");
            listSchedule = (ArrayList<Schedule>) query.list();
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

    public ArrayList<Schedule> searchSchedule(Schedule sche) {
        session = sf.openSession();
        ArrayList<Schedule> listSchedule;
        try {
            String hql = "from Schedule s where s.placeStart like :key1 and s.placeCome like :key2  and s.flag = 1";
            tran = session.beginTransaction();
            Query query = session.createQuery(hql)
                    .setParameter("key1", "%" + sche.getPlaceStart() + "%")
                    .setParameter("key2", "%" + sche.getPlaceCome() + "%");
            listSchedule = (ArrayList<Schedule>) query.list();
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

    //lấy danh sách xe thông qua danh sách lịch trình tìm được
    public ArrayList<Car> getAllCarBySchedule(Schedule sche) {
        ArrayList<Car> listCar = new ArrayList<>();
        ArrayList<Car> listItems = new ArrayList<>();
        ArrayList<Schedule> listSchedule = searchSchedule(sche);
        Car car[] = new Car[listSchedule.size()];
        try {
            for (int i = 0; i < listSchedule.size(); i++) {
                int scheduleId = listSchedule.get(i).getScheduleId();
                session = sf.openSession();
                String hql = "from Car c where c.flag = 1 and c.schedule = " + scheduleId + " order by c.carId desc";
                tran = session.beginTransaction();
                listItems = (ArrayList<Car>) session.createQuery(hql).list();
                tran.commit();
                if (listItems.size() != 0) {
                    for (int j = 0; j < listItems.size(); j++) {
                        listCar.add(listItems.get(j));
                    }
                }
            }
            return listCar;
        } catch (Exception e) {
            tran.rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }
        return null;
    }

    //lấy danh sách xe với số ghế trống và ngày đi trong bảng ngày đi
    public ArrayList<String> getAllNgayDi(Schedule schedule) {
        ArrayList<Car> listCarId = getAllCarBySchedule(schedule);
        ArrayList<String> listNgaydi = new ArrayList<>();
        String ngaydi = schedule.getDateStart();
        CarModel carModel = new CarModel();
        try {
            for (int i = 0; i < listCarId.size(); i++) {
                int carId = listCarId.get(i).getCarId();
                session = sf.openSession();
                String hql = "from NgayDi n where n.car = ? and n.ngayDi = '" + ngaydi + "'";
                tran = session.beginTransaction();
                NgayDi items = (NgayDi) session.createQuery(hql).setInteger(0, carId).uniqueResult();
                tran.commit();
                if (items != null) {
                    listNgaydi.add(items.toString());
                }
                else
                {
                   Car itemsCar = carModel.getObject(carId);
                   listNgaydi.add(itemsCar.getNumberOfseat());
                }
            }
            return listNgaydi;
        } catch (Exception e) {
            tran.rollback();
            e.printStackTrace();

        } finally {
            session.close();
        }
        return null;
    }
    //lấy danh sách xe thông qua một lịch trình đã tìm được
    public ArrayList<Car> getAllCarByScheduleId(Schedule sche) {
        ArrayList<Car> listCar = new ArrayList<>();
        Schedule schedule = getObject(sche.getScheduleId());
        try {
            int scheduleId = schedule.getScheduleId();
            session = sf.openSession();
            String hql = "from Car c where c.flag = 1 and c.schedule = " + scheduleId + " order by c.carId desc";
            tran = session.beginTransaction();
            listCar = (ArrayList<Car>) session.createQuery(hql).list();
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
    
    //lấy danh sách chỗ trống của từng xe theo một lịch trình
    public ArrayList<String> getChoTrong(Schedule schedule) {
        ArrayList<Car> listCarId = getAllCarByScheduleId(schedule);
        ArrayList<String> listNgaydi = new ArrayList<>();
        String ngaydi = schedule.getDateStart();
        CarModel carModel = new CarModel();
        try {
            for (int i = 0; i < listCarId.size(); i++) {
                int carId = listCarId.get(i).getCarId();
                session = sf.openSession();
                String hql = "from NgayDi n where n.car = ? and n.ngayDi = '" + ngaydi + "'";
                tran = session.beginTransaction();
                NgayDi items = (NgayDi) session.createQuery(hql).setInteger(0, carId).uniqueResult();
                tran.commit();
                if (items != null) {
                    listNgaydi.add(items.toString());
                }
                else
                {
                   Car itemsCar = carModel.getObject(carId);
                   listNgaydi.add(itemsCar.getNumberOfseat());
                }
            }
            return listNgaydi;
        } catch (Exception e) {
            tran.rollback();
            e.printStackTrace();

        } finally {
            session.close();
        }
        return null;
    }

    //thêm dữ liệu vào bảng ngày đi
    public NgayDi addONgayDi(int carId, String ngaydi) {
        CarModel carModel = new CarModel();
        Car car = carModel.getObject(carId);
        boolean check = false;
        NgayDi n = new NgayDi();
        try {
            sf.getCurrentSession().beginTransaction();
            
            n.setCar(car);
            n.setNgayDi(ngaydi);
            n.setSoGheTrong(car.getNumberOfseat());
            
            sf.getCurrentSession().save(n);
            sf.getCurrentSession().getTransaction().commit();

            check = true;
        } catch (Exception e) {
            sf.getCurrentSession().getTransaction().rollback();
            e.printStackTrace();
        }
        return n;
    }
    //lấy ra số ghế trống của xe thông qua id car và ngày đi
    public NgayDi gheTrongNgayDi(int carId,String ngaydi){
        session = sf.openSession();
        NgayDi ghetrong = new NgayDi();
        try {
//            String hql = "from Schedule s where s.scheduleId=:id and s.flag = 1";
            String hql = "from NgayDi n where n.car = :carId and n.ngayDi = :ngaydi ";
            tran = session.beginTransaction();
            ghetrong = (NgayDi) session.createQuery(hql)
                    .setInteger("carId", carId)
                    .setString("ngaydi", ngaydi)
                    .uniqueResult();
            tran.commit();
            return ghetrong;
        } catch (Exception e) {
            tran.rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }
        return null;
    }

    //update số chỗ trong ngày trong bảng ngày đi
    public boolean UpdateSoChoTrong(NgayDi instence,String quantity) {
        session = sf.openSession();
        boolean check = false;
        try {
            String hql = "update NgayDi n "
                    + "set n.soGheTrong = :soGheTrong "
                    + "where n.ngaydiId = :id";
            tran = session.beginTransaction();
            Query query = session.createQuery(hql);
            int soghetrong = Integer.parseInt(instence.getSoGheTrong())-Integer.parseInt(quantity);
            query.setParameter("soGheTrong", String.valueOf(soghetrong));
            query.setParameter("id", instence.getNgaydiId());
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
    //update ghế trống khi khách hàng ấn hủy
    public boolean UpdateSoChoTrongKhiHuy(NgayDi instence,String quantity) {
        session = sf.openSession();
        boolean check = false;
        try {
            String hql = "update NgayDi n "
                    + "set n.soGheTrong = :soGheTrong "
                    + "where n.ngaydiId = :id";
            tran = session.beginTransaction();
            Query query = session.createQuery(hql);
            int soghetrong = Integer.parseInt(instence.getSoGheTrong())+Integer.parseInt(quantity);
            query.setParameter("soGheTrong", String.valueOf(soghetrong));
            query.setParameter("id", instence.getNgaydiId());
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
    public static void main(String[] args) {
        ScheduleModel model = new ScheduleModel();
        Schedule sche = new Schedule(1, "Hải Phòng - Yên Bái", " 150km", "2017-06-01", "Yên Bái", "Hải phòng", " dang hoat dong", " dang hoat dong", "01/01/2017", " ", true);
//        ArrayList<Car> list = model.getAllCarByScheduleId(sche);
//        ArrayList<Car> list = model.getAllCarByScheduleId(sche);
//        ArrayList<String> list = model.getAllNgayDi(sche);
        String ngay = sche.getDateStart();
        System.out.println(model.gheTrongNgayDi(25, ngay));
//        ArrayList<String> list = model.getChoTrong(sche);
//        for (String s : list) {
//            System.out.println(s);
//        }
        NgayDi ngaydi = model.addONgayDi(25, "2017-06-05");
        if(ngaydi!=null){
            System.out.println("thanh cong");
        }
        else
        {
            System.out.println("that");
        }
    }
}
