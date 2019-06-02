/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.time.LocalDate;
import java.util.ArrayList;
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
import javax.persistence.OneToOne;
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

    @ManyToOne(cascade = CascadeType.ALL,fetch = FetchType.LAZY)
    @JoinColumn(name = "customer")
    private CustomerEntity customer;
    
    @OneToMany(mappedBy = "order",cascade = CascadeType.ALL,fetch = FetchType.LAZY)
    private List<OrderDestailsEntity> orderDestailsList;
    
    @OneToOne(mappedBy = "order",cascade = CascadeType.ALL,fetch = FetchType.LAZY)
    private BillEntity bill;

    public OrdersEntity() {
        orderDate=LocalDate.now();
        orderDestailsList=new ArrayList<OrderDestailsEntity>();
    }

    public OrdersEntity(int id, LocalDate orderDate, LocalDate shipDate, CustomerEntity customer, List<OrderDestailsEntity> orderDestailsList, BillEntity bill) {
        this.id = id;
        this.orderDate = orderDate;
        this.shipDate = shipDate;
        this.customer = customer;
        this.orderDestailsList = orderDestailsList;
        this.bill = bill;
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

    public CustomerEntity getCustomer() {
        return customer;
    }

    public void setCustomer(CustomerEntity customer) {
        this.customer = customer;
    }

    public List<OrderDestailsEntity> getOrderDestailsList() {
        return orderDestailsList;
    }

    public void setOrderDestailsList(List<OrderDestailsEntity> orderDestailsList) {
        this.orderDestailsList = orderDestailsList;
    }

    public BillEntity getBill() {
        return bill;
    }

    public void setBill(BillEntity bill) {
        this.bill = bill;
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
            orderDestailsList.add(new OrderDestailsEntity(1, product));
        }
        return this;
    }

}
