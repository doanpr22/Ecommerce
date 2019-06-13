/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import org.springframework.format.annotation.DateTimeFormat;

/**
 *
 * @author USER
 */
@Entity
@Table(name = "Orders")
public class OrdersEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate orderDate;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate shipDate;

    @ManyToOne
    @JoinColumn(name = "userId")
    private UsersEntity user;

    @OneToMany(mappedBy = "order")
    private List<OrderDestailsEntity> orderDestailsList;

    @ManyToOne
    @JoinColumn(name = "shippingId")
    private ShippingEntity shipping;

    @ManyToOne
    @JoinColumn(name = "paymentTypeId")
    private PaymentTypeEntity paymentType;

    public OrdersEntity() {
        orderDate=LocalDate.now();
        orderDestailsList=new ArrayList<OrderDestailsEntity>();
    }

    public ShippingEntity getShipping() {
        return shipping;
    }

    public PaymentTypeEntity getPaymentType() {
        return paymentType;
    }

    public void setPaymentType(PaymentTypeEntity paymentType) {
        this.paymentType = paymentType;
    }

    public void setShipping(ShippingEntity shipping) {
        this.shipping = shipping;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public LocalDate getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(LocalDate orderDate) {
        this.orderDate = orderDate;
    }

    public LocalDate getShipDate() {
        return shipDate;
    }

    public void setShipDate(LocalDate shipDate) {
        this.shipDate = shipDate;
    }

    public UsersEntity getUser() {
        return user;
    }

    public void setUser(UsersEntity user) {
        this.user = user;
    }


    public List<OrderDestailsEntity> getOrderDestailsList() {
        return orderDestailsList;
    }

    public void setOrderDestailsList(List<OrderDestailsEntity> orderDestailsList) {
        this.orderDestailsList = orderDestailsList;
    }

    public OrdersEntity addProduct(ProductEntity product) {
        boolean i = true;
        for (OrderDestailsEntity orderDestails : orderDestailsList) {
            if (orderDestails.checkProduct(product)) {
                orderDestails.addQuantity();
                i=false;
            }
        }
        if (i) {
            orderDestailsList.add(new OrderDestailsEntity(1,product));
        }
        return this;
    }

}
