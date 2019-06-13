/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 *
 * @author USER
 */
@Entity
@Table(name = "OrderDestails")
public class OrderDestailsEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private int quantity;
    @ManyToOne
    @JoinColumn(name = "productId")
    private ProductEntity product;
    
    @ManyToOne
    @JoinColumn(name = "orderId")
    private OrdersEntity order;

     public OrderDestailsEntity(){
        quantity=1;
        product=new ProductEntity();
    }
    public OrderDestailsEntity(int quantity, ProductEntity product, OrdersEntity order) {
        this.quantity = quantity;
        this.product = product;
        this.order = order;
    }

    OrderDestailsEntity(int quantity, ProductEntity product) {
        this.quantity=quantity;
        this.product=product;
    }


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public ProductEntity getProduct() {
        return product;
    }

    public void setProduct(ProductEntity product) {
        this.product = product;
    }

    public OrdersEntity getOrder() {
        return order;
    }

    public void setOrder(OrdersEntity order) {
        this.order = order;
    }

    boolean checkProduct(ProductEntity product) {
        return product.getId()==this.product.getId();
    }

    void addQuantity() {
        quantity++;
    }
    
    
}
