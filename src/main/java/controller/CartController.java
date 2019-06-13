/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.Cart;
import entity.OrderDestailsEntity;
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
import org.springframework.web.bind.annotation.ResponseBody;
import service.ProductService;

/**
 *
 * @author USER
 */
@Controller
@RequestMapping(value = "/cart")
@Scope("session")
public class CartController {

    @Autowired
    ProductService productService;

    @Autowired
    Cart cart;

    @RequestMapping(method = GET)
    public String displayCart(Model model) {
        OrdersEntity order = cart.getOrder();
        model.addAttribute("order", order);
        return "/cart";
    }

    @RequestMapping(value = "/add", method = GET)
    public String addItemCart(@RequestParam(name = "id") int idProduct, Model model) {
        //get product by id
        ProductEntity product = productService.getProduct(idProduct);
        //add product in cartEntity
        cart = cart.addItem(product);
        OrdersEntity order = cart.getOrder();
        model.addAttribute("order", order);
         return "redirect:/cart";
    }

    @RequestMapping(value = "/delete", method = GET)
    public String deleteCart(@RequestParam(name = "id") int orderDestailsId, Model model) {
        List<OrderDestailsEntity> orderDestailsEntitys = cart.getOrder().getOrderDestailsList();
        orderDestailsEntitys.remove(orderDestailsId);
        OrdersEntity order = cart.getOrder();
        order.setOrderDestailsList(orderDestailsEntitys);

        cart.setOrder(order);
       return "redirect:/cart";
    }

}
