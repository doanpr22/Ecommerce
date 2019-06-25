/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.Cart;
import entity.CategoryEntity;
import entity.OrdersEntity;
import entity.PaymentTypeEntity;
import entity.ProductEntity;
import entity.UsersEntity;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import static org.springframework.web.bind.annotation.RequestMethod.GET;
import org.springframework.web.bind.annotation.RequestParam;
import service.CategoryService;
import service.OrdersService;
import service.PaymenttypeService;
import service.ProductDestailsService;
import service.ProductService;
import service.UserService;

/**
 *
 * @author USER
 */
@Controller

@RequestMapping(value = "/payment")
public class PaymentController {

    @Autowired
    ProductService productService;
    @Autowired
    ServletContext servletContext;
    @Autowired
    CategoryService categoryService;
    @Autowired
    ProductDestailsService productDestailsService;
    @Autowired
    UserService userService;
    @Autowired
    OrdersService ordersService;
    @Autowired 
    PaymenttypeService paymenttypeService;

    @RequestMapping(method = GET, value = "orders")

    public String paymentorders(Model model, HttpServletRequest request) {
        init(model);
        try {
            Cart cart = (Cart) request.getSession().getAttribute("cart");
            UsersEntity customer = (UsersEntity) request.getSession().getAttribute("user");
            OrdersEntity order=cart.getOrder();
            List<PaymentTypeEntity> paymentTypes=paymenttypeService.getListpayment();
            if (customer != null) {
                order.setUser(customer);
            }
           model.addAttribute("listPaymentType", paymentTypes);
           model.addAttribute("order", order);
           return "payment";
        } catch (Exception e) {
        }
        return "payment";
    }
    

    public void init(Model model) {

        List<ProductEntity> productlist = (List<ProductEntity>) productService.getAllProductByDesc(18);
        model.addAttribute("productlist", productlist);

        List<ProductEntity> productlistHot = (List<ProductEntity>) productService.getAllProductByDesc(6);
        model.addAttribute("productlistHot", productlistHot);

        productlist.listIterator(5);
        List<CategoryEntity> listCategory = categoryService.getListCategory();
        model.addAttribute("listCategory", listCategory);
    }

    
}
