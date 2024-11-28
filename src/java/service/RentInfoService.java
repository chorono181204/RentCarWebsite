package service;

import dao.RentinforDao;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import model.Rentinfor;

public class RentInfoService {
    private RentinforDao rentinforDao = new RentinforDao();
    public List<Rentinfor> GetListByPage(List<Rentinfor> list, int start, int end) {
        List<Rentinfor> newList = new ArrayList<>();
        for(int i = start; i < end; i++) {
            newList.add(list.get(i));
        }
        return newList;
    }
    
    public List<Rentinfor> findAllInfor(Map<String, String[]> params) {
        return rentinforDao.findAll(params);
    }
    
    
    public List<Long> findAllStatus() {
        return rentinforDao.findAllStatus();
    }
}
