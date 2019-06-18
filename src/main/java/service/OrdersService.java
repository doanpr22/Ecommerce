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
import repository.OrderRepository;

/**
 *
 * @author USER
 */
@Service
public class OrdersService {
    @Autowired OrderRepository orderRepository;
    
    public List<OrdersEntity> getListOrder(){
        return (List<OrdersEntity>)orderRepository.findAll();
    }
    public OrdersEntity save(OrdersEntity ordersEntity){
     //   List<OrderDestailsEntity> list=ordersEntity.getOrderDestailsList();
      //  ordersEntity.setOrderDestailsList(null);
        
     ////   ordersEntity=orderRepository.save(ordersEntity);
      //  for(OrderDestailsEntity ode: list){
            
      //  }
     // ordersEntity.setOrderDestailsList(null);
        return orderRepository.save(ordersEntity);
    }
    public List<OrdersEntity> getOrderbyCustomer(int idCus){
        return orderRepository.getOrderByCustomer(idCus);
    }
}
