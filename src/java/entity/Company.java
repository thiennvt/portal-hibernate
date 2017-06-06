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
import javax.validation.constraints.*;

/**
 *
 * @author NGUYEN VAN THIEN
 */
@Entity
@Table(name = "company")
public class Company {

    public static final int COMPANYID = 0;
    public static final String NAME = "";
    public static final String ACCOUNTNAME = "";
    public static final String PASSWORD = "";
    public static final String ADDRESS = "";
    public static final String EMAIL = "";
    public static final String PHONE = "";
    public static final String HOTLINE = "";
    public static final String DATECREATE = "";
    public static final String DATELAST = "";
    public static final String NOTE = "";
    public static final boolean STATUS = false;
    public static final boolean FLAG = true;
    @Id
    @Column(name = "companyId")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int companyId;

    @Column(name = "name")
    @Size(min = 1, max = 50)
    private String name;

    @Column(name = "accountCompany",unique = true)
    @Size(min = 1, max = 50)
    private String accountName;

    @Column(name = "password")
    @Size(min = 1, max = 50)
    private String password;

    @Column(name = "address")
    @Size(min = 1, max = 100)
    private String address;

    @Column(name = "email")
    @Size(min = 1, max = 50)
    private String email;

    @Column(name = "phone")
    @Size(min = 1, max = 50)
    private String phone;

    @Column(name = "hotline")
    @Size(min = 1, max = 50)
    private String hotline;

    
    @Column(name = "dateCreate")
    @Size(min = 1, max = 50)
    private String dateCreate;

    @Column(name = "dateCreatelast")
    @Size(min = 1, max = 50)
    private String dateCreatelast;

    @Column(name = "note")
    @Size(min = 1, max = 500)
    private String note;

    @Column(name = "status")
    private boolean status;

    @Column(name = "flag")
    private boolean flag;

    @OneToMany(mappedBy = "company", fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    private List<Car> cars;
    
    @OneToMany(mappedBy = "company",fetch = FetchType.EAGER,cascade = CascadeType.ALL)
    private List<Schedule> sches;
    
    @OneToMany(mappedBy = "company",fetch = FetchType.EAGER,cascade = CascadeType.ALL)
    private List<Ticket> tickets;
    
    public Company() {
       this(COMPANYID, NAME, ACCOUNTNAME, PASSWORD, ADDRESS, EMAIL, PHONE, HOTLINE, DATECREATE, DATELAST, NOTE, STATUS, FLAG);
        cars = new ArrayList<Car>();
        sches = new ArrayList<>();
        tickets = new ArrayList<>();
    }

    public Company(int companyId, String name, String accountName, String password, String address, String email, String phone, String hotline, String dateCreate, String dateCreatelast, String note, boolean status, boolean flag) {
        this.companyId = companyId;
        this.name = name;
        this.accountName = accountName;
        this.password = password;
        this.address = address;
        this.email = email;
        this.phone = phone;
        this.hotline = hotline;
        this.dateCreate = dateCreate;
        this.dateCreatelast = dateCreatelast;
        this.note = note;
        this.status = status;
        this.flag = flag;
    }


    public Company(int companyId) {
        this.companyId = companyId;
    }

    
    public Car atblcarar(Car car) {
        this.cars.add(car);
        car.setCom(this);
        return car;
    }

    public Car remover(Car car) {
        this.cars.remove(car);
        car.setCom(null);
        return car;
    }

    public int getCompanyId() {
        return companyId;
    }

    public void setCompanyId(int companyId) {
        this.companyId = companyId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAccountName() {
        return accountName;
    }

    public void setAccountName(String accountName) {
        this.accountName = accountName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getHotline() {
        return hotline;
    }

    public void setHotline(String hotline) {
        this.hotline = hotline;
    }

    public String getDateCreate() {
        return dateCreate;
    }

    public void setDateCreate(String dateCreate) {
        this.dateCreate = dateCreate;
    }

    public String getDateCreatelast() {
        return dateCreatelast;
    }

    public void setDateCreatelast(String dateCreatelast) {
        this.dateCreatelast = dateCreatelast;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public boolean isFlag() {
        return flag;
    }

    public void setFlag(boolean flag) {
        this.flag = flag;
    }

    public List<Car> getCars() {
        return cars;
    }

    public void setCars(List<Car> cars) {
        this.cars = cars;
    }

    public List<Schedule> getSches() {
        return sches;
    }

    public void setSches(List<Schedule> sches) {
        this.sches = sches;
    }

    public List<Ticket> getTickets() {
        return tickets;
    }

    public void setTickets(List<Ticket> tickets) {
        this.tickets = tickets;
    }

    

    @Override
    public String toString() {
        return this.companyId+"";
    }

//    @Override
//    public String toString() {
//        return "Company{" + "companyId=" + companyId + ", name=" + name + ", accountName=" + accountName + ", password=" + password + ", address=" + address + ", email=" + email + ", phone=" + phone + ", hotline=" + hotline + ", dateCreate=" + dateCreate + ", dateCreatelast=" + dateCreatelast + ", note=" + note + ", status=" + status + ", flag=" + flag + ", cars=" + cars + '}';
//    }

    

    

    

}
