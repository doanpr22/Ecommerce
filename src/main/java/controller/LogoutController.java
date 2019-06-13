/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import static org.springframework.web.bind.annotation.RequestMethod.GET;

/**
 *
 * @author USER
 */
@Controller
@RequestMapping(value = "logout")
public class LogoutController {

    @RequestMapping(method = GET)
    public String logout(Model model, HttpServletRequest request) {
        try {
            request.getSession().setAttribute("role", null);
            request.getSession().setAttribute("username", null);
            request.getSession().setAttribute("user", null);

        } catch (Exception e) {
        }

        return "redirect:/";
    }
}
