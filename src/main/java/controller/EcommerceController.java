/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.Cart;
import entity.OrdersEntity;
import entity.ProductEntity;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import static org.springframework.web.bind.annotation.RequestMethod.GET;
import org.springframework.web.bind.annotation.RequestParam;
import service.ProductService;

/**
 *
 * @author USER
 */
@Controller
@Scope("session")
public class EcommerceController {

    @Autowired
    ProductService productService;
    
    @Autowired
    Cart cart;
    @RequestMapping(value = "/login")
    public String login(Model model) {
        return "/login";
    }

    @RequestMapping(value = "/")
    public String index(Model model) {
        List<ProductEntity> productlist = (List<ProductEntity>) productService.getProductlist();

        model.addAttribute("productlist", productlist);
        return "/index";
    }

    @RequestMapping(value = "/demo")
    public String demo(Model model) {

        return "/demo";
    }

    @RequestMapping(value = "/cart")
    public String card(Model model) {
                  
        return "/cart";
    }

    @RequestMapping(value = "/product-destails")
    public String productDestails(@RequestParam(name = "productId") int id, Model model) {
        ProductEntity product = productService.getProduct(id);
        model.addAttribute("product", product);

        return "/product-destails";
    }
    
    @RequestMapping(value = "/addcart", method = GET)
    public String addItemCart(@RequestParam(name = "id") int idProduct, Model model) {

        //get product by id
        ProductEntity product = productService.getProduct(idProduct);

        //add product in cartEntity
        cart = cart.addItem(product);
        OrdersEntity order = cart.getOrder();
        model.addAttribute("order", order);
        return "cart";
    }

    @RequestMapping(value = "/displayCart", method = GET)
    public String displayCart(Model model) {
        OrdersEntity order = cart.getOrder();
        
        model.addAttribute("order", order);
        return "cart";
    }
}
