/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.Cart;
import entity.CategoryEntity;
import entity.OrdersEntity;
import entity.ProductEntity;
import entity.UsersEntity;
import java.util.List;
import java.util.Random;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import static org.springframework.web.bind.annotation.RequestMethod.GET;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import service.CategoryService;
import service.OrdersService;
import service.ProductDestailsService;
import service.ProductService;
import service.UserService;
import utility.SendGmail;

/**
 *
 * @author USER
 */
@Controller
@RequestMapping(value = "/")
public class EcommerceController {

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

    @RequestMapping(method = GET)
    public String index(Model model, HttpServletRequest request) {
        init(model);
        String role = (String) request.getSession().getAttribute("role");
        if (role != null) {
            String username = (String) request.getSession().getAttribute("username");
            UsersEntity user = userService.getUserByUserName(username);
            request.getSession().setAttribute("user", user);
        }
        return "index";

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

    @RequestMapping(value = "/product-destails")
    public String productDestails(@RequestParam(name = "productId") int id, Model model) {
        init(model);
        ProductEntity product = productService.getProduct(id);
        model.addAttribute("product", product);
        List<ProductEntity> listProductSearchCategory = productService.getSearchProduct(product.getCategory().getCategoryName());
        model.addAttribute("productlistSameCategory", listProductSearchCategory);

        List<ProductEntity> listProductSearchPrice = productService.getSearchProductUnitPrice(product, 12);

        model.addAttribute("productlistSamePrice", listProductSearchPrice);

        return "/product-destails";
    }

    @RequestMapping(value = "/search")
    public String search(@RequestParam(name = "searchValue") String searchValue, Model model, HttpServletRequest request) {
        init(model);

        request.getSession().setAttribute("searchValue", searchValue);

        List<ProductEntity> listProductSearch = productService.getSearchProduct(searchValue);
        model.addAttribute("productlist", listProductSearch);
        return "/index";
    }

    @RequestMapping(value = "/registration")
    public String registration(Model model) {
        init(model);
        model.addAttribute("customer", new UsersEntity());
        return "/registration";
    }

    @RequestMapping(value = "/saveRegistration")
    public String saveRegistration(Model model, UsersEntity customer, HttpServletRequest request) {
        try {
            customer = userService.saveCustomer(customer);
            model.addAttribute("registration", "success");

        } catch (Exception e) {
            model.addAttribute("registration", "error");

        }

        return "redirect:/";
    }

    @RequestMapping(value = "/order")
    public String order(OrdersEntity order, Model model, HttpServletRequest request) {
        Cart cart = (Cart) request.getSession().getAttribute("cart");
        if (order.getUser().getId() == 0) {
            order.setCustomerEmail(order.getUser().getProfile().getEmail());
            String name = order.getUser().getProfile().getLastname() + " " + order.getUser().getProfile().getFirstname();
            order.setCustomerName(name);
            order.setCustomerPhone(order.getUser().getProfile().getPhone());
            order.setUser(null);
        }
        order.setOrderDestailsList(cart.getOrder().getOrderDestailsList());
        try {
            ordersService.save(order);
        } catch (Exception e) {
            //  return "index11";
        }
        return index(model, request);
    }

    @RequestMapping(value = "productAsc")
    public String listProductAsc(Model model, HttpServletRequest request) {
        init(model);
        List<ProductEntity> listProduct = productService.getAllProductByAsc(28);

        model.addAttribute("productlistSamePrice", listProduct);
        return "index";

    }
}
