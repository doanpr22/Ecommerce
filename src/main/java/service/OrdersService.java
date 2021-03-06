/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import entity.OrderDestailsEntity;
import entity.OrdersEntity;
import java.util.List;
import org.hibernate.internal.CriteriaImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import repository.OrderDestailsRepository;
import repository.OrderRepository;

/**
 *
 * @author USER
 */
@Service
public class OrdersService {
    
    @Autowired
    OrderRepository orderRepository;
    @Autowired
    OrderDestailsRepository orderDestailsRepository;
    
    public List<OrdersEntity> getListOrder() {
        List<OrdersEntity> list = (List<OrdersEntity>) orderRepository.findAll();
        for(OrdersEntity order:list){
          if(order.getOrderDestailsList()==null) list.remove(order);
      }
        return list;
    }
    
    public void save(OrdersEntity ordersEntity) {
        List<OrderDestailsEntity> listOrderDestails = ordersEntity.getOrderDestailsList();
        ordersEntity.setOrderDestailsList(null);
        
        ordersEntity = orderRepository.save(ordersEntity);
        
        for (OrderDestailsEntity ode : listOrderDestails) {
            OrderDestailsEntity newOrderDestails = new OrderDestailsEntity();
            
            newOrderDestails.setOrder(ordersEntity);
            
            newOrderDestails.setProduct(ode.getProduct());
            
            newOrderDestails.setQuantity(ode.getQuantity());
            
            orderDestailsRepository.save(newOrderDestails);
        }
    }
    
    public List<OrdersEntity> getOrderbyCustomer(int idCus) {
      List<OrdersEntity> list=orderRepository.getOrderByCustomer(idCus);
      for(OrdersEntity order:list){
          if(order.getOrderDestailsList()==null) list.remove(order);
      }
        return list;
    }
    
    public OrdersEntity getOrderById(int id) {
        return orderRepository.findOne(id);
    }
    
    public void deleteOrderDestails(int orderDestailsId) {
        
        OrderDestailsEntity orderDestails = orderDestailsRepository.findOne(orderDestailsId);
        orderDestails.setOrder(null);
        orderDestailsRepository.save(orderDestails);
        orderDestailsRepository.delete(orderDestailsId);
    }
    public List<OrdersEntity> getListOrderUnpaid(){
        return  filterData(orderRepository.getOrderUnpaid());
    }
    public List<OrdersEntity> getListOrderPaid(){
        return  orderRepository.getOrderPaid();
    }
    public List<OrdersEntity> filterData(List<OrdersEntity> listFilter){
        for(OrdersEntity order: listFilter){
            if(order.getOrderDestailsList()==null){
                listFilter.remove(order);
            }
        }
        return listFilter;
    }
    
    public void delete(int orderid){
        
        OrdersEntity order=orderRepository.findOne(orderid);
        List<OrderDestailsEntity> ordeDestailsList=order.getOrderDestailsList();
        
        order.setOrderDestailsList(null);
        order.setCreditCard(null);
        order.setPaymentType(null);
        order.setUser(null);
        orderRepository.save(order);
        orderRepository.delete(order.getId());
        
        for(OrderDestailsEntity orderdestails:ordeDestailsList){
            orderdestails.setOrder(null);
            orderdestails.setProduct(null);
            orderDestailsRepository.save(orderdestails);
            orderDestailsRepository.delete(orderdestails.getId());
        }
    }
}
