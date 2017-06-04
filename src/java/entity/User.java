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
@Table(name = "user")
public class User{
    public static final int USERID = 0;
    public static final String USERNAME = "";
    public static final String PASSWORD = "";
    public static final String FULLNAME = "";
    public static final boolean GENDER = false;
    public static final String BIRTHDAY = "";
    public static final String ADDRESS = "";
    public static final String EMAIL = "";
    public static final String PHONE = "";
    public static final String CMND = "";
    public static final String POSSITION = "";
    public static final String PERMISION = "";
    public static final String AVARTAR = "";
    public static final String NOTE = "";
    public static final String STATUS = "";
    public static final String DATECREATE = "";
    public static final String DATELAST = "";
    public static final boolean  FLAG =  false;
    
    @Id
    @Column(name = "userId")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int userId;
    
    @Column(name = "userName",unique = true)
    @Size(min = 1,max = 50)
    private String userName;
    
    @Column(name = "password")
    @Size(min = 1,max = 50)
    private String password;
    
    @Column(name = "fullName")
    @Size(min = 1,max = 100)
    private String fullName;
    
    @Column(name = "gender")
    private boolean gender;
    
    @Column(name = "birthDay")
    @Size(min = 1,max = 30)
    private String birthDay;
    
    @Column(name = "address")
    @Size(min = 1,max = 100)
    private String address;
    
    
    @Column(name = "email")
    @Size(min = 1,max = 50)
    private String email;
    
    @Column(name = "phone")
    @Size(min = 1,max = 20)
    private String phone;
    
    @Column(name = "cmnd")
    @Size(min = 1,max = 20)
    private String cmnd;
    
    @Column(name = "position")
    @Size(min = 1,max = 50)
    private String position;
    
    @Column(name = "permision")
    @Size(min = 1,max = 50)
    private String permision;
    
    @Column(name = "avatar")
    private String avatar;
    
    @Column(name = "note")
    @Size(min = 1,max = 200)
    private String note;
    
    @Column(name = "status")
    private String status;
    
    @Column(name = "dateCreate")
    private String dateCreate;
    
    @Column(name = "dateCreateLast")
    private String dateCreateLast;
    
    @Column(name = "flag")
    private boolean flag;
    
//    @OneToMany(mappedBy = "user",fetch = FetchType.EAGER,cascade = CascadeType.ALL)
//    private List<Ticket> tickets;

    public User() {
        this(User.USERID, User.USERNAME, User.PASSWORD, User.FULLNAME, User.GENDER, User.BIRTHDAY, User.ADDRESS, User.EMAIL, User.PHONE, User.CMND, User.POSSITION, User.PERMISION,User.AVARTAR, User.NOTE, User.STATUS, User.DATECREATE, User.DATELAST, User.FLAG);
//        tickets = new  ArrayList<>();
    }

    public User(int userId, String userName, String password, String fullName, boolean gender, String birthDay, String address, String email, String phone, String cmnd, String position, String permision,String avatar, String note, String status, String dateCreate, String dateCreateLast, boolean flag) {
        this.userId = userId;
        this.userName = userName;
        this.password = password;
        this.fullName = fullName;
        this.gender = gender;
        this.birthDay = birthDay;
        this.address = address;
        this.email = email;
        this.phone = phone;
        this.cmnd = cmnd;
        this.position = position;
        this.permision = permision;
        this.avatar = avatar;
        this.note = note;
        this.status = status;
        this.dateCreate = dateCreate;
        this.dateCreateLast = dateCreateLast;
        this.flag = flag;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public boolean isGender() {
        return gender;
    }

    public void setGender(boolean gender) {
        this.gender = gender;
    }

    public String getBirthDay() {
        return birthDay;
    }

    public void setBirthDay(String birthDay) {
        this.birthDay = birthDay;
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

    public String getCmnd() {
        return cmnd;
    }

    public void setCmnd(String cmnd) {
        this.cmnd = cmnd;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public String getPermision() {
        return permision;
    }

    public void setPermision(String permision) {
        this.permision = permision;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
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

    
    
    
    

//    public List<Ticket> getTickets() {
//        return tickets;
//    }
//
//    public void setTickets(List<Ticket> tickets) {
//        this.tickets = tickets;
//    }

    @Override
    public String toString() {
        return this.userId+"";
    }

    
}
