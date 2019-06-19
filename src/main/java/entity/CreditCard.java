/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.util.List;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;

/**
 *
 * @author USER
 */
@Entity
public class CreditCard {

    @Id
    private int id;

    private long amount;
    private String password;
    private String name;

    private String PIN;
    @OneToMany(mappedBy = "creditCard")
    private List<OrdersEntity> order;

    public CreditCard() {
    }

    public String getName() {
        return name;
    }

    public String getPIN() {
        return PIN;
    }

    public void setPIN(String PIN) {
        this.PIN = PIN;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(long amount) {
        this.amount = amount;
    }

    public String getPassword() {
        return password;
    }

    public List<OrdersEntity> getOrder() {
        return order;
    }

    public void setOrder(List<OrdersEntity> order) {
        this.order = order;
    }

   
}
