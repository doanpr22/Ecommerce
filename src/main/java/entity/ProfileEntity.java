/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.time.LocalDate;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import org.springframework.format.annotation.DateTimeFormat;

/**
 *
 * @author USER
 */
@Entity
@Table(name = "Profile")
public class ProfileEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private  int id;
    private String firstname;
    private String lastname;
    private String email;
    private String phone;
    private String address;
    private boolean gender;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate birthDay;
    private String position;
    
    @OneToOne(mappedBy = "profile")
    private UsersEntity users;
    
    
    @OneToOne(mappedBy = "profile")
    private CustomerEntity customer;
    
    @OneToOne(mappedBy = "profile")
    private ShippingEntity shipping;

    public ProfileEntity() {
    }

    public ProfileEntity(int id, String firstname, String lastname, String email, String phone, String address, boolean gender, LocalDate birthDate, String position, UsersEntity users, CustomerEntity customer, ShippingEntity shipping) {
        this.id = id;
        this.firstname = firstname;
        this.lastname = lastname;
        this.email = email;
        this.phone = phone;
        this.address = address;
        this.gender = gender;
        this.birthDay = birthDate;
        this.position = position;
        this.users = users;
        this.customer = customer;
        this.shipping = shipping;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public boolean isGender() {
        return gender;
    }

    public void setGender(boolean gender) {
        this.gender = gender;
    }

    public LocalDate getBirthDay() {
        return birthDay;
    }

    public void setBirthDay(LocalDate birthDay) {
        this.birthDay = birthDay;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public UsersEntity getUsers() {
        return users;
    }

    public void setUsers(UsersEntity users) {
        this.users = users;
    }

    public CustomerEntity getCustomer() {
        return customer;
    }

    public void setCustomer(CustomerEntity customer) {
        this.customer = customer;
    }

    public ShippingEntity getShipping() {
        return shipping;
    }

    public void setShipping(ShippingEntity shipping) {
        this.shipping = shipping;
    }

    @Override
    public String toString() {
        return "ProfileEntity{" + "id=" + id + ", firstname=" + firstname + ", lastname=" + lastname + ", email=" + email + ", phone=" + phone + ", address=" + address + ", gender=" + gender + ", birthDay=" + birthDay + ", position=" + position + ", users=" + users + ", customer=" + customer + ", shipping=" + shipping + '}';
    }

  
    
}
