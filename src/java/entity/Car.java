/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.*;
import javax.validation.constraints.Size;
/**
 *
 * @author NGUYEN VAN THIEN
 */
@Entity
@Table(name = "car")
public class Car{
    public static final int CARID = 0;
    public static final String CARTYPE = "";
    public static final String CARNUMBER = "";
    public static final String COLOR = "";
    public static final String NUMBEROFSEAT = "";
    public static final String COMPANY = "";
    public static final String TIMESTART = "";
    public static final String TIMECOME = "";
    public static final String PRICETICKET = "0";
    public static final String NOTE = "";
    public static final String STATUS = "";
    public static final String DATECREATE = "";
    public static final String DATELAST = "";
    public static final boolean  FLAG =  false;
    public static final Schedule SCHE = null;
    public static final Company COM = null;
    
    @Id
    @Column(name = "carId")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int carId;
    
    @Column(name = "carType")
    @Size(min = 1,max = 50)
    private String carType;
    
    @Column(name = "numberCar")
    @Size(min = 1,max = 30)
    private String numberCar;
    
    @Column(name = "color")
    @Size(min = 1,max = 50)
    private String color;
    
    @Column(name = "numberOfseat")
    @Size(min = 1,max = 50)
    private String numberOfseat;
    
    @Column(name = "company")
    @Size(min = 1,max = 100)
    private String company;
    
    @Column(name = "timeStart")
    @Size(min = 1,max = 100)
    private String timeStart;
    
    @Column(name = "timeCome")
    @Size(min = 1,max = 100)
    private String timeCome;
    
    @Column(name = "priceTicket")
    @Size(min = 1,max = 100)
    private String priceTicket;
    
    @Column(name = "note")
    @Size(min = 1,max = 100)
    private String note;
    
    @Column(name = "status")
    @Size(min = 1,max = 50)
    private String status;
    
    @Column(name = "dateCreate")
    @Size(min = 1,max = 50)
    private String dateCreate;
    
    @Column(name = "dateCreateLast")
    @Size(min = 1,max = 50)
    private String dateCreateLast;
    
    @Column(name = "flag")
    private boolean flag;
    
    @ManyToOne
    @JoinColumn(name = "scheduleId")
    private Schedule schedule;
    
    @ManyToOne
    @JoinColumn(name = "companyId")
    private Company com;
    
    @OneToMany(mappedBy = "car",fetch = FetchType.EAGER,cascade = CascadeType.ALL)
    private List<Ticket> tickets;
    
    @OneToMany(mappedBy = "car",fetch = FetchType.EAGER,cascade = CascadeType.ALL)
    private List<NgayDi> ngaydi;
    
    public Car() {
        this(Car.CARID, Car.CARTYPE, Car.NUMBEROFSEAT, Car.COLOR, Car.NUMBEROFSEAT, Car.COMPANY,Car.TIMESTART,Car.TIMECOME, Car.PRICETICKET, Car.NOTE, Car.STATUS, Car.DATECREATE, Car.DATELAST, Car.FLAG,Car.SCHE,Car.COM);
        schedule = new Schedule();
        com = new Company();
        tickets = new ArrayList<Ticket>();
        ngaydi = new ArrayList<>();
    }

    public Car(int carId) {
        this.carId = carId;
    }

    public Car(int carId, String carType, String numberCar, String color, String numberOfseat, String company, String timeStart, String timeCome, String priceTicket, String note, String status, String dateCreate, String dateCreateLast, boolean flag, Schedule schedule, Company com) {
        this.carId = carId;
        this.carType = carType;
        this.numberCar = numberCar;
        this.color = color;
        this.numberOfseat = numberOfseat;
        this.company = company;
        this.timeStart = timeStart;
        this.timeCome = timeCome;
        this.priceTicket = priceTicket;
        this.note = note;
        this.status = status;
        this.dateCreate = dateCreate;
        this.dateCreateLast = dateCreateLast;
        this.flag = flag;
        this.schedule = schedule;
        this.com = com;
        schedule = new Schedule();
        com = new Company();
        tickets = new ArrayList<Ticket>();
        ngaydi = new ArrayList<>();
    }


//    public Ticket addTicket(Ticket ticket) {
//        this.tickets.add(ticket);
//        ticket.setCar(this);
//        return ticket;
//    }
//    public Ticket removeTicket(Ticket ticket) {
//        this.tickets.remove(ticket);
//        ticket.setCar(null);
//        return ticket;
//    }

    public int getCarId() {
        return carId;
    }

    public void setCarId(int carId) {
        this.carId = carId;
    }

    public String getCarType() {
        return carType;
    }

    public void setCarType(String carType) {
        this.carType = carType;
    }

    public String getNumberCar() {
        return numberCar;
    }

    public void setNumberCar(String numberCar) {
        this.numberCar = numberCar;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getNumberOfseat() {
        return numberOfseat;
    }

    public void setNumberOfseat(String numberOfseat) {
        this.numberOfseat = numberOfseat;
    }
 
    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }

    public String getTimeStart() {
        return timeStart;
    }

    public void setTimeStart(String timeStart) {
        this.timeStart = timeStart;
    }

    public String getTimeCome() {
        return timeCome;
    }

    public void setTimeCome(String timeCome) {
        this.timeCome = timeCome;
    }

    public String getPriceTicket() {
        return priceTicket;
    }

    public void setPriceTicket(String priceTicket) {
        this.priceTicket = priceTicket;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getDateCreate() {
        return dateCreate;
    }

    public void setDateCreate(String dateCreate) {
        this.dateCreate = dateCreate;
    }

    public String getDateCreateLast() {
        return dateCreateLast;
    }

    public void setDateCreateLast(String dateCreateLast) {
        this.dateCreateLast = dateCreateLast;
    }

    public boolean isFlag() {
        return flag;
    }

    public void setFlag(boolean flag) {
        this.flag = flag;
    }

    public Schedule getSchedule() {
        return schedule;
    }

    public void setSchedule(Schedule schedule) {
        this.schedule = schedule;
    }

    public Company getCom() {
        return com;
    }

    public void setCom(Company com) {
        this.com = com;
    }

    public List<Ticket> getTickets() {
        return tickets;
    }

    public void setTickets(List<Ticket> tickets) {
        this.tickets = tickets;
    }

    public List<NgayDi> getNgaydi() {
        return ngaydi;
    }

    public void setNgaydi(List<NgayDi> ngaydi) {
        this.ngaydi = ngaydi;
    }
    

    @Override
    public String toString() {
        return this.carId+"";
    }


    

}
