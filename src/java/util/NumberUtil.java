package util;

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
