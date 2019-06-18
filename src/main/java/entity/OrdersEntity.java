/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
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
import utility.FormatMoney;

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

    @ManyToOne
    @JoinColumn(name = "userId")
    private UsersEntity user;

    @OneToMany(mappedBy = "order",cascade = CascadeType.ALL)
    private List<OrderDestailsEntity> orderDestailsList;

    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "shippingId")
    private ShippingEntity shipping;

    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "paymentTypeId")
    private PaymentTypeEntity paymentType;
    @OneToOne(mappedBy = "order")
    private PaymentEntity payment;

    public PaymentEntity getPayment() {
        return payment;
    }

    public void setPayment(PaymentEntity payment) {
        this.payment = payment;
    }
    
    
    public OrdersEntity() {
        orderDate=LocalDate.now();
        orderDestailsList=new ArrayList<OrderDestailsEntity>();
    }

    public ShippingEntity getShipping() {
        return shipping;
    }

    public PaymentTypeEntity getPaymentType() {
        return paymentType;
    }

    public void setPaymentType(PaymentTypeEntity paymentType) {
        this.paymentType = paymentType;
    }

    public void setShipping(ShippingEntity shipping) {
        this.shipping = shipping;
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

    public UsersEntity getUser() {
        return user;
    }

    public void setUser(UsersEntity user) {
        this.user = user;
    }


    public List<OrderDestailsEntity> getOrderDestailsList() {
        return orderDestailsList;
    }

    public void setOrderDestailsList(List<OrderDestailsEntity> orderDestailsList) {
        this.orderDestailsList = orderDestailsList;
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
            Random random=new Random();
            int id=random.nextInt();
            for(OrderDestailsEntity destailsEntity:this.getOrderDestailsList()){
                if(id==destailsEntity.getId()){
                    id=random.nextInt(10000);
                    break;
                }
            }
            orderDestailsList.add(new OrderDestailsEntity(id,1,product));
        }
        return this;
    }
    public OrdersEntity setOrderDestailsQuantity(int productid,int quantity){
        
         for (int  i=0;i<orderDestailsList.size();i++) {
            if(productid==orderDestailsList.get(i).getProduct().getId()){
                orderDestailsList.get(i).setQuantity(quantity);
            }
        }
        return this;
    }

    public String getSumPrice(){
        double price=0;
        for(OrderDestailsEntity destailsEntity:orderDestailsList){
            price+=destailsEntity.getQuantity()*destailsEntity.getProduct().getUnitPrice();
        }
        return FormatMoney.getMoney(price);
    }
    public OrdersEntity addOrderDestails(OrderDestailsEntity orderdestails){
        if(this==null){
            OrdersEntity order=new OrdersEntity();
            order.getOrderDestailsList().add(orderdestails);
            return order;
        }
        else{
            this.getOrderDestailsList().add(orderdestails);
            return this;
        }
    }

    @Override
    public String toString() {
        return "OrdersEntity{" + "id=" + id + ", orderDate=" + orderDate + ", shipDate=" + shipDate + ", user=" + user + ", orderDestailsList=" + orderDestailsList + ", shipping=" + shipping + '}';
    }
    
}
