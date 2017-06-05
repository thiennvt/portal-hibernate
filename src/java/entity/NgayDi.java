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
 * @author THIEN-NVT
 */
@Entity
@Table(name = "ngaydi")
public class NgayDi {
    @Id
    @Column(name = "ngaydiId")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int ngaydiId;
    
    @Column(name = "ngayDi")
    private String ngayDi;
    @Column(name = "soGheTrong")
    private String soGheTrong;
    
    @ManyToOne
    @JoinColumn(name = "carId")
    private Car car;
    
    public NgayDi() {
    }

    public NgayDi(int ngaydiId, String ngayDi, String soGheTrong, Car car) {
        this.ngaydiId = ngaydiId;
        this.ngayDi = ngayDi;
        this.soGheTrong = soGheTrong;
        this.car = car;
    }
    

    public int getNgaydiId() {
        return ngaydiId;
    }

    public void setNgaydiId(int ngaydiId) {
        this.ngaydiId = ngaydiId;
    }

    public String getNgayDi() {
        return ngayDi;
    }

    public void setNgayDi(String ngayDi) {
        this.ngayDi = ngayDi;
    }

    public String getSoGheTrong() {
        return soGheTrong;
    }

    public void setSoGheTrong(String soGheTrong) {
        this.soGheTrong = soGheTrong;
    }

    public Car getCar() {
        return car;
    }

    public void setCar(Car car) {
        this.car = car;
    }

    @Override
    public String toString() {
        return getSoGheTrong();
    }

}
