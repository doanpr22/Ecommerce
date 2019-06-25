/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package repository;

import entity.OrdersEntity;
import java.util.List;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author USER
 */
@Repository
public interface OrderRepository  extends CrudRepository<OrdersEntity, Integer>{
    @Query(value = "select * from orders where userId=?",nativeQuery = true)
    public List<OrdersEntity> getOrderByCustomer(int customerId);
    @Query(value = "select *from orders where creditcardid is null; ",nativeQuery = true)
    public List<OrdersEntity> getOrderUnpaid();
    @Query(value = "select *from orders where creditcardid is not null; ",nativeQuery = true)
    public List<OrdersEntity> getOrderPaid();
}
