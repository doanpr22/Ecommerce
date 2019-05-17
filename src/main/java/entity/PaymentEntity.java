/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.util.List;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 *
 * @author USER
 */
@Entity
@Table(name = "payment")
public class PaymentEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String payentType;

    @OneToMany(mappedBy = "payment")
    private List<BillEntity> billList;

    public PaymentEntity() {
    }

    public PaymentEntity(int id, String payentType, List<BillEntity> billList) {
        this.id = id;
        this.payentType = payentType;
        this.billList = billList;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getPayentType() {
        return payentType;
    }

    public void setPayentType(String payentType) {
        this.payentType = payentType;
    }

    public List<BillEntity> getBillList() {
        return billList;
    }

    public void setBillList(List<BillEntity> billList) {
        this.billList = billList;
    }

    
}
