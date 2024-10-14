package service;

import DTO.CarDTO;
import dao.CarBrandDao;
import dao.CarDao;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import model.Car;
import model.CarBrand;

public class CarService {
    public List<CarDTO> findAll(Map<String, String[]> params) {
        CarDao carDao = new CarDao();
        CarBrandDao carBrandDao = new CarBrandDao();
        List<Car> car = carDao.findAll(params);
        List<CarDTO> result = new ArrayList<>();
        for(Car item : car) {
            CarDTO carDTO = new CarDTO();
            carDTO.setName(item.getName());
            CarBrand carBrand = carBrandDao.findNameById(item.getCarBrandId());
            carDTO.setBrand(carBrand.getName());
            carDTO.setImage(item.getImage());
            carDTO.setPrice(item.getPrice());
            result.add(carDTO);
        }
        return result;
    }
    
    public List<CarDTO> getListByPage(List<CarDTO> list, int start, int end) {
        List<CarDTO> newList = new ArrayList<>();
        for(int i = start; i < end; i++) {
            newList.add(list.get(i));
        }
        return newList;
    }
}
