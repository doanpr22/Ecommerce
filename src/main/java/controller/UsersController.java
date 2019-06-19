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
import java.io.File;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import static org.springframework.web.bind.annotation.RequestMethod.GET;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import service.CategoryService;
import service.OrdersService;
import service.ProducerService;
import service.ProductDestailsService;
import service.ProductImageService;
import service.ProductService;
import service.UserService;
import utility.UpdateFile;

/**
 *
 * @author USER
 */
@Controller
@RequestMapping(value = "/users")
public class UsersController {

    @Autowired
    ProductService productService;
    @Autowired
    ServletContext servletContext;
    @Autowired
    CategoryService categoryService;
    @Autowired
    ProducerService producerService;
    @Autowired
    ProductDestailsService productDestailsService;
    @Autowired
    ProductImageService productImageService;
    @Autowired
    UserService userService;
    @Autowired
    OrdersService ordersService;

    @RequestMapping(method = GET)
    public String index(Model model, HttpServletRequest request, HttpServletResponse response) {

        String role = (String) request.getSession().getAttribute("role");
        if (role != null && role.equals("ROLE_USER") || role != null && role.equals("ROLE_ADMIN")) {
            return "redirect:/";
        } else {
            model.addAttribute("error", "403");
            return "error/403";
        }
    }

    @RequestMapping(value = "orderList")
    public String orderList(Model model, HttpServletRequest request) {
        String role = (String) request.getSession().getAttribute("role");
        if (role != null && role.equals("ROLE_USER") || role != null && role.equals("ROLE_ADMIN")) {

            List<OrdersEntity> listOrder = ordersService.getListOrder();
            model.addAttribute("listorder", listOrder);
            return "user/orderList";
        } else {
            model.addAttribute("error", "403");
            return "error/403";
        }
    }

    public void init(Model model) {

        List<ProductEntity> productlistHot = (List<ProductEntity>) productService.getAllProductByDesc(5);
        model.addAttribute("productlistHot", productlistHot);

        List<ProductEntity> productlist = (List<ProductEntity>) productService.getProductlist();
        model.addAttribute("productlist", productlist);

        List<CategoryEntity> listCategory = categoryService.getListCategory();
        model.addAttribute("listCategory", listCategory);

    }
    @RequestMapping(value = "/profile")

    public String profile(Model model, HttpServletRequest request) {
        String role = (String) request.getSession().getAttribute("role");
        if (role != null && role.equals("ROLE_USER")) {
            init(model);
            return "/user/profileUser";
        } else {
            model.addAttribute("error", "403");
            return "error/403";
        }
    }
    @RequestMapping(value = "/editprofile")

    public String editprofile(Model model, HttpServletRequest request) {

        UsersEntity user = (UsersEntity) request.getSession().getAttribute("user");
        String role = (String) request.getSession().getAttribute("role");
        if (role != null && role.equals("ROLE_USER") && user != null) {
            init(model);
            model.addAttribute("user", user);
            return "/user/edituser";
        } else {
            model.addAttribute("error", "403");
            return "error/403";
        }
    }

}
