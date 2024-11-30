
package service;

import dao.CarTypeDao;
import java.util.List;
import model.CarType;

public class CarTypeService {
    public List<CarType> findAllTypes() {
        CarTypeDao carTypeDao = new CarTypeDao();
        return carTypeDao.findAllTypes();
    }
}
