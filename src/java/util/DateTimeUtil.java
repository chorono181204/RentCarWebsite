/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package util;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;

/**
 *
 * @author Hacom
 */
public class DateTimeUtil {
    public static long calculateDaysBetween(String startDateStr, String endDateStr) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
     
     LocalDate  startDate = LocalDate.parse(startDateStr, formatter); 
     LocalDate endDate = LocalDate.parse(endDateStr, formatter);
     
     return ChronoUnit.DAYS.between(startDate, endDate);
    }
}
