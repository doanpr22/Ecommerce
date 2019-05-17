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
import javax.persistence.OneToOne;
import javax.persistence.Table;

/**
 *
 * @author USER
 */
@Entity
@Table(name = "Product")
public class ProductEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String productName;
    private double unitPrice;
    private String urlImage;
    
    @ManyToOne(cascade = CascadeType.ALL,fetch = FetchType.LAZY)
    @JoinColumn(name = "categoryId")
    private CategoryEntity category;
    
    @ManyToOne(cascade = CascadeType.ALL,fetch = FetchType.LAZY)
    @JoinColumn(name = "producerId")
    private ProducersEntity producer;
    
    @OneToMany(cascade = CascadeType.ALL,mappedBy = "product")
    private List<PromotionDestailsEntity> promotionDestailsList;
    
    @OneToOne(cascade = CascadeType.ALL,fetch = FetchType.LAZY,mappedBy = "product")
    private OrderDestailsEntity orderDestails;

    public ProductEntity() {
    }

    public ProductEntity(int id, String productName, double unitPrice, String urlImage, CategoryEntity category, ProducersEntity producer, List<PromotionDestailsEntity> promotionDestailsList, OrderDestailsEntity orderDestails) {
        this.id = id;
        this.productName = productName;
        this.unitPrice = unitPrice;
        this.urlImage = urlImage;
        this.category = category;
        this.producer = producer;
        this.promotionDestailsList = promotionDestailsList;
        this.orderDestails = orderDestails;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public double getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(double unitPrice) {
        this.unitPrice = unitPrice;
    }

    public String getUrlImage() {
        return urlImage;
    }

    public void setUrlImage(String urlImage) {
        this.urlImage = urlImage;
    }

    public CategoryEntity getCategory() {
        return category;
    }

    public void setCategory(CategoryEntity category) {
        this.category = category;
    }

    public ProducersEntity getProducer() {
        return producer;
    }

    public void setProducer(ProducersEntity producer) {
        this.producer = producer;
    }

    public List<PromotionDestailsEntity> getPromotionDestailsList() {
        return promotionDestailsList;
    }

    public void setPromotionDestailsList(List<PromotionDestailsEntity> promotionDestailsList) {
        this.promotionDestailsList = promotionDestailsList;
    }

    public OrderDestailsEntity getOrderDestails() {
        return orderDestails;
    }

    public void setOrderDestails(OrderDestailsEntity orderDestails) {
        this.orderDestails = orderDestails;
    }
    
    
}
