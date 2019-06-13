/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utility;

import java.text.NumberFormat;
import java.util.Locale;

/**
 *
 * @author USER
 */

public class FormatMoney {
    
    public static String getMoney(double money){
        Locale localeVN = new Locale("vi", "VN");
       NumberFormat currencyVN = NumberFormat.getCurrencyInstance(localeVN);
       return currencyVN.format(money);
    }
    
}
