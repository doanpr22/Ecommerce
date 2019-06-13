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
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;
import utility.FormatMoney;

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
    private String description;
    @ManyToOne
    @JoinColumn(name = "categoryId")
    private CategoryEntity category;

    @ManyToOne
    @JoinColumn(name = "producerId")
    private ProducersEntity producer;

    @OneToMany(mappedBy = "product")
    private List<PromotionDestailsEntity> promotionDestailsList;

    @OneToMany(mappedBy = "product")
    private List<OrderDestailsEntity> orderDestails;

    @OneToOne
    @PrimaryKeyJoinColumn
    private ProductDestailsEntity productDestails;
    @OneToMany(mappedBy = "product",fetch = FetchType.EAGER)
    private List<ProductImageEntity> listproductImage;

    public List<ProductImageEntity> getListproductImage() {
        return listproductImage;
    }

    public void setListproductImage(List<ProductImageEntity> listproductImage) {
        this.listproductImage = listproductImage;
    }

    public ProductEntity() {
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public ProductDestailsEntity getProductDestails() {
        return productDestails;
    }

    public void setProductDestails(ProductDestailsEntity productDestails) {
        this.productDestails = productDestails;
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

    public List<OrderDestailsEntity> getOrderDestails() {
        return orderDestails;
    }

    public void setOrderDestails(List<OrderDestailsEntity> orderDestails) {
        this.orderDestails = orderDestails;
    }

    public String getUnitPriceString(){
        return FormatMoney.getMoney(unitPrice);
    }

}
