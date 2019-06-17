/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.CategoryEntity;
import entity.OrdersEntity;
import entity.PaymentEntity;
import entity.ProductEntity;
import entity.UsersEntity;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import static org.springframework.web.bind.annotation.RequestMethod.GET;
import org.springframework.web.bind.annotation.ResponseBody;
import service.CategoryService;
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

    @RequestMapping(method = GET)
    public String payment(Model model, HttpServletRequest request) {
        init(model);
        OrdersEntity order = (OrdersEntity) request.getSession().getAttribute("orderpayment");
        try {
            UsersEntity customer = (UsersEntity) request.getSession().getAttribute("user");
            if (customer != null) {
                order.setUser(customer);
            }
        } catch (Exception e) {
        }
       model.addAttribute("order", order);
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
