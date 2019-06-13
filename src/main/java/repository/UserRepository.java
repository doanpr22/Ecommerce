/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package repository;

import entity.UsersEntity;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author USER
 */
@Repository
public interface UserRepository extends CrudRepository<UsersEntity, Integer>{
    
    public UsersEntity findByUsername(String username);
    @Query(value = "select *from users where username='?'",nativeQuery = true)
    public UsersEntity getUserByUsername(String username);

}
