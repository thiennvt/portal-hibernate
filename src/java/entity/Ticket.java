/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.io.Serializable;
import javax.persistence.*;
import javax.validation.constraints.*;

/**
 *
 * @author NGUYEN VAN THIEN
 */
@Entity
@Table(name = "ticket")
public class Ticket {

    public static final int TICKETID = 0;
    public static final String TICKETTYPE = " ";
    public static final String CUSTOMERNAME = " ";
    public static final String ADDRESS = " ";
    public static final String PHONE = " ";
    public static final String EMAIL = " ";
    public static final String QUANTITYTIC = "1";
    public static final String DATESTART = " ";
    public static final String NUMBEROFSEAT = " ";
    public static final String PRICE = "0";
    public static final String DATEORDER = " ";
    public static final String DATELAST = " ";
    public static final String NOTE = " ";
    public static final String STATUS = " ";
    public static final String RESONCANCEL = " ";
    public static final String PRICECANCEL = "0";
    public static final boolean FLAG = false;
    public static final Car CARID = new Car();
    public static final Company COMPANYID = new Company();

    @Id
    @Column(name = "ticketId")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int ticketId;

    @Column(name = "ticketType")
    @Size(min = 1, max = 50)
    private String ticketType;

    @Column(name = "customerName")
    @Size(min = 1, max = 50)
    private String customerName;

    @Column(name = "address")
    @Size(min = 1, max = 50)
    private String address;

    @Column(name = "email")
    @Size(min = 1, max = 50)
    private String email;

    @Column(name = "phone")
    @Size(min = 1, max = 50)
    private String phone;

    @Column(name = "quanTicket")
    @Size(min = 1, max = 50)
    private String quanTicket;

    @Column(name = "numberOfSeat")
    @Size(min = 1, max = 50)
    private String numberOfSeat;

    @Column(name = "dateStart")
    @Size(min = 1, max = 50)
    private String dateStart;

    @Column(name = "price")
    private String price;

    @Column(name = "dateOrder")
    @Size(min = 1, max = 50)
    private String dateOrder;

    @Column(name = "dateLast")
    @Size(min = 1, max = 50)
    private String dateLast;

    @Column(name = "note")
    @Size(min = 1, max = 200)
    private String note;

    @Column(name = "status")
    @Size(min = 1, max = 50)
    private String status;

    @Column(name = "reasonCancel")
    @Size(min = 1, max = 100)
    private String reasonCancel;

    @Column(name = "priceCancel")
    private String priceCancel;

    @Column(name = "flag")
    private boolean flag;

    @ManyToOne
    @JoinColumn(name = "carId")
    private Car car;

    @ManyToOne
    @JoinColumn(name = "companyId")
    private Company company;
    

    public Ticket() {
        this(Ticket.TICKETID, Ticket.TICKETTYPE, Ticket.CUSTOMERNAME, Ticket.ADDRESS, Ticket.EMAIL, Ticket.PHONE, Ticket.QUANTITYTIC, Ticket.NUMBEROFSEAT, Ticket.DATESTART, Ticket.PRICE, Ticket.DATEORDER, Ticket.DATELAST, Ticket.NOTE, Ticket.STATUS, Ticket.RESONCANCEL, Ticket.PRICECANCEL, Ticket.FLAG, Ticket.CARID, Ticket.COMPANYID);
//        car = new Car();
    }

    public Ticket(int ticketId, String ticketType, String customerName, String address, String email, String phone, String quanTicket, String numberOfSeat, String dateStart, String price, String dateOrder, String dateLast, String note, String status, String reasonCancel, String priceCancel, boolean flag, Car car, Company company) {
        this.ticketId = ticketId;
        this.ticketType = ticketType;
        this.customerName = customerName;
        this.address = address;
        this.email = email;
        this.phone = phone;
        this.quanTicket = quanTicket;
        this.numberOfSeat = numberOfSeat;
        this.dateStart = dateStart;
        this.price = price;
        this.dateOrder = dateOrder;
        this.dateLast = dateLast;
        this.note = note;
        this.status = status;
        this.reasonCancel = reasonCancel;
        this.priceCancel = priceCancel;
        this.flag = flag;
        this.car = car;
        this.company = company;
    }

    public int getTicketId() {
        return ticketId;
    }

    public void setTicketId(int ticketId) {
        this.ticketId = ticketId;
    }

    public String getTicketType() {
        return ticketType;
    }

    public void setTicketType(String ticketType) {
        this.ticketType = ticketType;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
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

    public String getQuanTicket() {
        return quanTicket;
    }

    public void setQuanTicket(String quanTicket) {
        this.quanTicket = quanTicket;
    }

    public String getNumberOfSeat() {
        return numberOfSeat;
    }

    public void setNumberOfSeat(String numberOfSeat) {
        this.numberOfSeat = numberOfSeat;
    }

    public String getDateStart() {
        return dateStart;
    }

    public void setDateStart(String dateStart) {
        this.dateStart = dateStart;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getDateOrder() {
        return dateOrder;
    }

    public void setDateOrder(String dateOrder) {
        this.dateOrder = dateOrder;
    }

    public String getDateLast() {
        return dateLast;
    }

    public void setDateLast(String dateLast) {
        this.dateLast = dateLast;
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

    public String getReasonCancel() {
        return reasonCancel;
    }

    public void setReasonCancel(String reasonCancel) {
        this.reasonCancel = reasonCancel;
    }

    public String getPriceCancel() {
        return priceCancel;
    }

    public void setPriceCancel(String priceCancel) {
        this.priceCancel = priceCancel;
    }

    public boolean isFlag() {
        return flag;
    }

    public void setFlag(boolean flag) {
        this.flag = flag;
    }

    public Car getCar() {
        return car;
    }

    public void setCar(Car car) {
        this.car = car;
    }

    public Company getCompany() {
        return company;
    }

    public void setCompany(Company company) {
        this.company = company;
    }


    
    @Override
    public String toString() {
        return this.ticketId + "";
    }

}
