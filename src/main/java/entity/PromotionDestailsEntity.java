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
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import org.hibernate.annotations.ManyToAny;

/**
 *
 * @author USER
 */
@Entity
@Table(name = "PromotionDestails")
public class PromotionDestailsEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @ManyToOne
    @JoinColumn(name = "productId")
    private ProductEntity product;
    
    @ManyToOne
    @JoinColumn(name = "promotionId")
    private PromotionEntity promotion;

    public PromotionDestailsEntity() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public ProductEntity getProduct() {
        return product;
    }

    public void setProduct(ProductEntity product) {
        this.product = product;
    }

    

    public PromotionEntity getPromotion() {
        return promotion;
    }

    public void setPromotion(PromotionEntity promotion) {
        this.promotion = promotion;
    }

    
}
