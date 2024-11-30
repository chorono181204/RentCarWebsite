package util;
import org.mindrot.jbcrypt.BCrypt;

public class SecurityUtil {

    // Băm mật khẩu
    public static String hashPassword(String password) {
        return BCrypt.hashpw(password, BCrypt.gensalt());
    }

    // Xác thực mật khẩu
    public static boolean checkPassword(String plainPassword, String hashedPassword) {
        return BCrypt.checkpw(plainPassword, hashedPassword);
    }
}
