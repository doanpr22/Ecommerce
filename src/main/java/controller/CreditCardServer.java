/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import javax.xml.ws.RespectBinding;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import static org.springframework.web.bind.annotation.RequestMethod.GET;
import org.springframework.web.bind.annotation.RestController;
import service.CreditCardService;

/**
 *
 * @author USER
 */
@Controller
@RequestMapping(value = "/cardServer")
public class CreditCardServer {
    @Autowired
    CreditCardService cardService;
    
    @RequestMapping(method = GET)
    @RespectBinding
    public Object listCard(){
        return cardService.getAllCard().get(0).getAmount();
    }
}
