/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package util;

/**
 *
 * @author developer
 */
public class NumberUtil {
    public static boolean check(String x) {
        try {
            Long a = Long.parseLong(x);
        }
        catch(NumberFormatException ex) {
            return false;
        }
        return true;
    }
}
