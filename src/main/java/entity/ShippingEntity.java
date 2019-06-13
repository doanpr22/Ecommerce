/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 *
 * @author USER
 */
@Entity
@Table(name = "Shipping")
public class ShippingEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private double shipPrice;

    @ManyToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    @JoinColumn(name = "profileId")
    private ProfileEntity profile;
    @OneToMany(mappedBy = "shipping")
    private List<OrdersEntity> orderList;

    public ShippingEntity() {
    }

    public List<OrdersEntity> getOrderList() {
        return orderList;
    }

    public void setOrderList(List<OrdersEntity> orderList) {
        this.orderList = orderList;
    }    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public double getShipPrice() {
        return shipPrice;
    }

    public void setShipPrice(double shipPrice) {
        this.shipPrice = shipPrice;
    }

    public ProfileEntity getProfile() {
        return profile;
    }

    public void setProfile(ProfileEntity profile) {
        this.profile = profile;
    }

    
}
