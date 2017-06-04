/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.io.Serializable;
import java.util.AbstractList;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.*;
import javax.persistence.criteria.Fetch;
import javax.validation.constraints.Size;

/**
 *
 * @author NGUYEN VAN THIEN
 */
@Entity
@Table(name = "schedule")
public class Schedule{
    public static final int SCHEDULEID = 0;
    public static final String ROUTE = "";
    public static final String KILOMETTER = " ";
    public static final String DATESTART = "";
    public static final String PLACESTART = "";
    public static final String PLACECOME = "";
    public static final String NOTE = "";
    public static final String STATUS = "";
    public static final String DATECREATE = "";
    public static final String DATELAST = "";
    public static final boolean  FLAG =  false;
    @Id
    @Column(name = "scheduleId")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int scheduleId;
    
    @Column(name = "route")
    @Size(min = 1,max = 100)
    private String route;
    
    @Column(name = "kilometer")
    @Size(min = 1,max = 50)
    private String kilometer;
    
    @Column(name = "dateStart")
    @Size(min = 1,max = 50)
    private String dateStart;
            
    @Column(name = "placeStart")
    @Size(min = 1,max = 50)
    private String placeStart;
    
    @Column(name = "placeCome")
    @Size(min = 1,max = 50)
    private String placeCome;
    
    @Column(name = "note")
    @Size(min = 1,max = 50)
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
    @JoinColumn(name = "companyId")
    private Company company;
    
    @OneToMany(mappedBy = "schedule", fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    private List<Car> cars;
    
    public Schedule() {
        this(SCHEDULEID, ROUTE, KILOMETTER,DATESTART,PLACESTART, PLACECOME, NOTE, STATUS,DATECREATE, DATELAST, FLAG);
        company = new Company();
        cars = new ArrayList<Car>();

    }

    public Schedule(int scheduleId, String route, String kilometer, String dateStart, String placeStart, String placeCome, String note, String status, String dateCreate, String dateCreateLast, boolean flag) {
        this.scheduleId = scheduleId;
        this.route = route;
        this.kilometer = kilometer;
        this.dateStart = dateStart;
        this.placeStart = placeStart;
        this.placeCome = placeCome;
        this.note = note;
        this.status = status;
        this.dateCreate = dateCreate;
        this.dateCreateLast = dateCreateLast;
        this.flag = flag;
        company = new Company();
        cars = new ArrayList<Car>();
    }

    

    public Schedule(int scheduleId) {
        this.scheduleId = scheduleId;
    }

    public int getScheduleId() {
        return scheduleId;
    }

    public void setScheduleId(int scheduleId) {
        this.scheduleId = scheduleId;
    }

    public String getRoute() {
        return route;
    }

    public void setRoute(String route) {
        this.route = route;
    }

    public String getKilometer() {
        return kilometer;
    }

    public void setKilometer(String kilometer) {
        this.kilometer = kilometer;
    }

    public String getDateStart() {
        return dateStart;
    }

    public void setDateStart(String dateStart) {
        this.dateStart = dateStart;
    }

    public String getPlaceStart() {
        return placeStart;
    }

    public void setPlaceStart(String placeStart) {
        this.placeStart = placeStart;
    }

    public String getPlaceCome() {
        return placeCome;
    }

    public void setPlaceCome(String placeCome) {
        this.placeCome = placeCome;
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

    public Company getCompany() {
        return company;
    }

    public void setCompany(Company company) {
        this.company = company;
    }

    public List<Car> getCars() {
        return cars;
    }

    public void setCars(List<Car> cars) {
        this.cars = cars;
    }


    
    public Car addCar(Car car) {
        this.cars.add(car);
        car.setSchedule(this);
        return car;
    }

    public Car removerCar(Car car) {
        this.cars.remove(car);
        car.setSchedule(null);
        return car;
    }

    @Override
    public String toString() {
        return this.scheduleId+"";
    }


}
