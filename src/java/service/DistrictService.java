
package service;

import dao.DistrictDao;
import java.util.List;
import model.District;


public class DistrictService {
    public List<District> findAllDistricts() {
        DistrictDao districtDao = new DistrictDao();
        return districtDao.findAllDistricts();
    }
}
