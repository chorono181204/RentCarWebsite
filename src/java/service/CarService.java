package service;

import DTO.AdminCarDTO;
import DTO.CarDTO;
import dao.CarBrandDao;
import dao.CarDao;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import model.Car;
import model.CarBrand;

public class CarService {
    
    private CarDao carDao = new CarDao();
    
    public List<CarDTO> findAll(Map<String, String[]> params) {
        CarBrandDao carBrandDao = new CarBrandDao();
        List<Car> car = carDao.findAll(params);
        List<CarDTO> result = new ArrayList<>();
        for(Car item : car) {
            CarDTO carDTO = new CarDTO();
            carDTO.setId(item.getId_car());
            carDTO.setName(item.getCar_name());
            CarBrand carBrand = carBrandDao.findNameById(item.getCar_brand_id());
            carDTO.setBrand(carBrand.getName());
            carDTO.setImage(item.getImg());
            carDTO.setPrice(item.getPrice());
            result.add(carDTO);
        }
        return result;
    }
    
    public List<AdminCarDTO> adminFindAll(Map<String, String[]> params) {
        List<Car> car = carDao.adminFindAll(params);
        List<AdminCarDTO> result = new ArrayList<>();
        for(Car item : car) {
            AdminCarDTO adminCarDTO = new AdminCarDTO();
            adminCarDTO.setId(item.getId_car());
            adminCarDTO.setName(item.getCar_name());
            adminCarDTO.setPrice(item.getPrice());
            adminCarDTO.setCurrentAddress(item.getCurrent_address());
            adminCarDTO.setDescription(item.getDescription());
            adminCarDTO.setYear(item.getYear_of_manufacture());
            result.add(adminCarDTO);
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
    
    public List<AdminCarDTO> adminGetListByPage(List<AdminCarDTO> list, int start, int end) {
        List<AdminCarDTO> newList = new ArrayList<>();
        for(int i = start; i < end; i++) {
            newList.add(list.get(i));
        }
        return newList;
    }
    
    public List<String> findAllColors() {
        return carDao.findAllColors();
    }
    
    public List<String> findAllTransmission() {
        return carDao.findAllTransmission();
    }
    
    public List<Long> findAllSeats() {
        return carDao.findAllSeats();
    }
    
    public List<Long> findAllLuggage() {
        return carDao.findAllLuggage();
    }
}
