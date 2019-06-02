/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

/**
 *
 * @author USER
 */
@Component
@Scope("session")
public class Cart {

    private OrdersEntity order;

    public Cart() {

        order = new OrdersEntity();
    }

    public Cart(OrdersEntity order) {
        this.order = order;
    }

    public OrdersEntity getOrder() {
        return order;
    }

    public void setOrder(OrdersEntity order) {
        this.order = order;
    }

    public Cart addItem(ProductEntity product) {
        order = order.addProduct(product);
        return this;
    }
}
