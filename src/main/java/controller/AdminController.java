/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import static org.springframework.web.bind.annotation.RequestMethod.GET;



@Controller
@RequestMapping(value = "/admin")
public class AdminController {
    @RequestMapping(value = "index")
    public String helloAdmin(Model model){
        return "/admin/index-admin";
    }
}
