
package service;

import dao.CarBrandDao;
import java.util.List;
import model.CarBrand;

public class CarBrandService {
    private CarBrandDao carBrandDao = new CarBrandDao();
    
    public CarBrand findNameById(Long id) {
        return carBrandDao.findNameById(id);
    }
    
    public List<CarBrand> findAllBrands() {
        return carBrandDao.findAllBrands();
    }
}
