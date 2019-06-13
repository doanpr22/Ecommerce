/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

/**
 *
 * @author USER
 */
@Entity
@Table(name = "productdestails")
public class ProductDestailsEntity {
    @Id
    private int id;
     private String manhinh;
     private String  mau;
     private String cameratruoc;
     private String camerasau;
     private String ram;
     private String bonhotrong;
     private int khecamsim;
     private String hedieuhanh;
     private String baohanh;
     private String dophangiai;
     private String CPU;
     private String kichthuoc;
     private String trongluong;
     @OneToOne(mappedBy = "productDestails")
     @PrimaryKeyJoinColumn
     private ProductEntity product;

    public ProductDestailsEntity() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getManhinh() {
        return manhinh;
    }

    public void setManhinh(String manhinh) {
        this.manhinh = manhinh;
    }

    public String getMau() {
        return mau;
    }

    public void setMau(String mau) {
        this.mau = mau;
    }

    public String getCameratruoc() {
        return cameratruoc;
    }

    public void setCameratruoc(String cameratruoc) {
        this.cameratruoc = cameratruoc;
    }

    public String getCamerasau() {
        return camerasau;
    }

    public void setCamerasau(String camerasau) {
        this.camerasau = camerasau;
    }

    public String getRam() {
        return ram;
    }

    public void setRam(String ram) {
        this.ram = ram;
    }

    public String getBonhotrong() {
        return bonhotrong;
    }

    public void setBonhotrong(String bonhotrong) {
        this.bonhotrong = bonhotrong;
    }

    public int getKhecamsim() {
        return khecamsim;
    }

    public void setKhecamsim(int khecamsim) {
        this.khecamsim = khecamsim;
    }

    public String getHedieuhanh() {
        return hedieuhanh;
    }

    public void setHedieuhanh(String hedieuhanh) {
        this.hedieuhanh = hedieuhanh;
    }

    public String getBaohanh() {
        return baohanh;
    }

    public void setBaohanh(String baohanh) {
        this.baohanh = baohanh;
    }

    public String getDophangiai() {
        return dophangiai;
    }

    public void setDophangiai(String dophangiai) {
        this.dophangiai = dophangiai;
    }

    public String getCPU() {
        return CPU;
    }

    public void setCPU(String CPU) {
        this.CPU = CPU;
    }

    public String getKichthuoc() {
        return kichthuoc;
    }

    public void setKichthuoc(String kichthuoc) {
        this.kichthuoc = kichthuoc;
    }

    public String getTrongluong() {
        return trongluong;
    }

    public void setTrongluong(String trongluong) {
        this.trongluong = trongluong;
    }

    public ProductEntity getProduct() {
        return product;
    }

    public void setProduct(ProductEntity product) {
        this.product = product;
    }

   
     
}