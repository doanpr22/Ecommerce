/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.CategoryEntity;
import entity.OrdersEntity;
import entity.ProducersEntity;
import entity.ProductEntity;
import entity.UsersEntity;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import org.hibernate.internal.CriteriaImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import static org.springframework.web.bind.annotation.RequestMethod.GET;
import org.springframework.web.bind.annotation.ResponseBody;
import service.CategoryService;
import service.OrdersService;
import service.ProducerService;
import service.ProductDestailsService;
import service.ProductService;
import service.UserService;

/**
 *
 * @author USER
 */
@Controller
@RequestMapping(value = "/customer")
public class CustomerController {

    @Autowired
    ProductService productService;
    @Autowired
    ServletContext servletContext;

    @Autowired
    CategoryService categoryService;
    @Autowired
    UserService userService;
    @Autowired
    ProductDestailsService productDestailsService;
    @Autowired
    ProducerService producerService;
    @Autowired
    OrdersService ordersService;

    @RequestMapping(method = GET)
    public String index(Model model, HttpServletRequest request) {
        String role = (String) request.getSession().getAttribute("role");
        if (role != null && role.equals("ROLE_CUSTOMER")) {
            String username = (String) request.getSession().getAttribute("username");
            UsersEntity customer = userService.getUserByUserName(username);
            request.getSession().setAttribute("user", customer);
            return "redirect:/";
        } else {
            model.addAttribute("error", "403");
            return "error/403";
        }
    }

    @RequestMapping(value = "/profile")

    public String profile(Model model, HttpServletRequest request) {
        String role = (String) request.getSession().getAttribute("role");
        if (role != null && role.equals("ROLE_CUSTOMER")) {
            init(model);
            return "/customer/profilecustomer";
        } else {
            model.addAttribute("error", "403");
            return "error/403";
        }
    }

    @RequestMapping(value = "/editprofile")

    public String editprofile(Model model, HttpServletRequest request) {

        UsersEntity customer = (UsersEntity) request.getSession().getAttribute("user");
        String role = (String) request.getSession().getAttribute("role");
        if (role != null && role.equals("ROLE_CUSTOMER") && customer != null) {
            init(model);
            model.addAttribute("customer", customer);
            return "/customer/editCustomer";
        } else {
            model.addAttribute("error", "403");
            return "error/403";
        }
    }

    public void init(Model model) {

        List<ProductEntity> productlistHot = (List<ProductEntity>) productService.getAllProductByDesc(6);
        model.addAttribute("productlistHot", productlistHot);

        List<ProductEntity> productlist = (List<ProductEntity>) productService.getAllProductByDesc(28);
        model.addAttribute("productlist", productlist);

        List<CategoryEntity> listCategory = categoryService.getListCategory();
        model.addAttribute("listCategory", listCategory);
    }

    @RequestMapping(value = "listOrder")
    public String listOrder(Model model, HttpServletRequest request) {

        UsersEntity customer = (UsersEntity) request.getSession().getAttribute("user");
        List<OrdersEntity> listOrder = ordersService.getOrderbyCustomer(customer.getId());
        model.addAttribute("listOrder", listOrder);
        return "customer/orderList";
    }

    @RequestMapping(value = "saveRegistration")
    public String saveRegistration(Model model, UsersEntity customer, HttpServletRequest request) {
        customer = userService.saveCustomer(customer);
        if (customer != null) {
            model.addAttribute("saveRegistration", "success");
            return "index";
        } else {
            return "redirect:/";
        }
    }
}
