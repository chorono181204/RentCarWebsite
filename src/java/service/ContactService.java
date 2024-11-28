
package service;

import dao.ContactDao;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import model.Contact;

public class ContactService {
    private ContactDao contactDao = new ContactDao();
    public List<Contact> GetListByPage(List<Contact> list, int start, int end) {
        List<Contact> newList = new ArrayList<>();
        for(int i = start; i < end; i++) {
            newList.add(list.get(i));
        }
        return newList;
    }
    
    public List<Contact> findAllContact(Map<String, String[]> params) {
        return contactDao.findAll(params);
    }
    
    
    public List<Long> findAllStatus() {
        return contactDao.findAllStatus();
    }
}
