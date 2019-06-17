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
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 *
 * @author USER
 */
@Entity
@Table(name = "Producers")
public class ProducersEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String producerName;
    private String producerAddress;
    private String producerEmail;
    private String producerPhone;
    
    @OneToMany(mappedBy = "producer")
    private List<ProductEntity> productList;

    public ProducersEntity() {
    }

    public ProducersEntity(int id) {
        this.id = id;
    }
 
    public ProducersEntity(String producerName) {
        this.producerName = producerName;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getProducerName() {
        return producerName;
    }

    public void setProducerName(String producerName) {
        this.producerName = producerName;
    }

    public String getProducerAddress() {
        return producerAddress;
    }

    public void setProducerAddress(String producerAddress) {
        this.producerAddress = producerAddress;
    }

    public String getProducerEmail() {
        return producerEmail;
    }

    public void setProducerEmail(String producerEmail) {
        this.producerEmail = producerEmail;
    }

    public String getProducerPhone() {
        return producerPhone;
    }

    public void setProducerPhone(String producerPhone) {
        this.producerPhone = producerPhone;
    }

    public List<ProductEntity> getProductList() {
        return productList;
    }

    public void setProductList(List<ProductEntity> productList) {
        this.productList = productList;
    }

    @Override
    public String toString() {
        return "ProducersEntity{" + "id=" + id + ", producerName=" + producerName + ", producerAddress=" + producerAddress + ", producerEmail=" + producerEmail + ", producerPhone=" + producerPhone + '}';
    }

    public ProducersEntity setProducer(){
        return new ProducersEntity(id);
    }
    
}
