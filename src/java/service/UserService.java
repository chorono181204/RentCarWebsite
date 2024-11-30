
package service;

import dao.UserDao;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import model.User;

public class UserService {
    private UserDao userDao = new UserDao();
    public List<User> adminGetListByPage(List<User> list, int start, int end) {
        List<User> newList = new ArrayList<>();
        for(int i = start; i < end; i++) {
            newList.add(list.get(i));
        }
        return newList;
    }
    
    public List<User> findAllUser(Map<String, String[]> params) {
        return userDao.findAll(params);
    }
    
    public List<String> findAllRoles() {
        return userDao.findAllRoles();
    }
    
    public List<Long> findAllStatus() {
        return userDao.findAllStatus();
    }
}
