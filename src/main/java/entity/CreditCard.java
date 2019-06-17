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
    
    @OneToMany(mappedBy = "creditCard")
    private List<PaymentEntity> listPayMent;

    public CreditCard() {
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

    public void setPassword(String password) {
        this.password = password;
    }

    public List<PaymentEntity> getListPayMent() {
        return listPayMent;
    }

    public void setListPayMent(List<PaymentEntity> listPayMent) {
        this.listPayMent = listPayMent;
    }
    
    
}
