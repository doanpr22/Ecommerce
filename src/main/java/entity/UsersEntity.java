/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.time.LocalDate;
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
import javax.persistence.Table;
import org.springframework.format.annotation.DateTimeFormat;

/**
 *
 * @author USER
 */
@Entity
@Table(name = "users")
public class UsersEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String username;
    private String password;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate createday;
    private int enabled;

    public int getEnabled() {
        return enabled;
    }

    public void setEnabled(int enabled) {
        this.enabled = enabled;
    }
    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "profileId")
    private ProfileEntity profile;

    @OneToMany(mappedBy = "user",fetch = FetchType.LAZY)
    private List<OrdersEntity> orderList;

    @ManyToOne(cascade = CascadeType.ALL)
    private User_role role;

    
    public UsersEntity() {
        createday=LocalDate.now();
    }

    public User_role getRole() {
        return role;
    }

    public void setRole(User_role role) {
        this.role = role;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public LocalDate getCreateday() {
        return createday;
    }

    public void setCreateday(LocalDate createday) {
        this.createday = createday;
    }

    public UsersEntity(int id, String username, String password, LocalDate createday, ProfileEntity profile) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.createday = createday;
        this.profile = profile;
    }

    public ProfileEntity getProfile() {
        return profile;
    }

    public void setProfile(ProfileEntity profile) {
        this.profile = profile;
    }

    public List<OrdersEntity> getOrderList() {
        return orderList;
    }

    public void setOrderList(List<OrdersEntity> orderList) {
        this.orderList = orderList;
    }

    public String getPassword() {
        return password;
    }
   }
