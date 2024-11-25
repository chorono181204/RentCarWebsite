package model;

import java.util.ArrayList;
import java.util.List;


public class Car {
    private String car_name, fuel, transmission, img, description, color, current_address;
    private long id_car, seats, luggage, rate, status, price, year_of_manufacture, car_type_id, car_brand_id, rent_id, district_id;
    private List<Car> listResult = new ArrayList<>();

    public Car() {
    }

    public Car(String car_name, String fuel, String transmission, String img, String description, String color, String current_address, long id_car, long seats, long luggage, long rate, long status, long price, long year_of_manufacture, long car_type_id, long car_brand_id, long rent_id, long district_id) {
        this.car_name = car_name;
        this.fuel = fuel;
        this.transmission = transmission;
        this.img = img;
        this.description = description;
        this.color = color;
        this.current_address = current_address;
        this.id_car = id_car;
        this.seats = seats;
        this.luggage = luggage;
        this.rate = rate;
        this.status = status;
        this.price = price;
        this.year_of_manufacture = year_of_manufacture;
        this.car_type_id = car_type_id;
        this.car_brand_id = car_brand_id;
        this.rent_id = rent_id;
        this.district_id = district_id;
    }

    

    public String getCar_name() {
        return car_name;
    }

    public void setCar_name(String car_name) {
        this.car_name = car_name;
    }

    public String getFuel() {
        return fuel;
    }

    public void setFuel(String fuel) {
        this.fuel = fuel;
    }

    public String getTransmission() {
        return transmission;
    }

    public void setTransmission(String transmission) {
        this.transmission = transmission;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getCurrent_address() {
        return current_address;
    }

    public void setCurrent_address(String current_address) {
        this.current_address = current_address;
    }

    public Long getId_car() {
        return id_car;
    }

    public void setId_car(long id_car) {
        this.id_car = id_car;
    }

    public long getSeats() {
        return seats;
    }

    public void setSeats(long seats) {
        this.seats = seats;
    }

    public long getLuggage() {
        return luggage;
    }

    public void setLuggage(long luggage) {
        this.luggage = luggage;
    }

    public long getRate() {
        return rate;
    }

    public void setRate(long rate) {
        this.rate = rate;
    }

    public long getStatus() {
        return status;
    }

    public void setStatus(long status) {
        this.status = status;
    }

    public long getPrice() {
        return price;
    }

    public void setPrice(long price) {
        this.price = price;
    }

    public long getYear_of_manufacture() {
        return year_of_manufacture;
    }

    public void setYear_of_manufacture(long year_of_manufacture) {
        this.year_of_manufacture = year_of_manufacture;
    }

    public long getCar_type_id() {
        return car_type_id;
    }

    public void setCar_type_id(long car_type_id) {
        this.car_type_id = car_type_id;
    }

    public long getCar_brand_id() {
        return car_brand_id;
    }

    public void setCar_brand_id(long car_brand_id) {
        this.car_brand_id = car_brand_id;
    }

    public long getRent_id() {
        return rent_id;
    }

    public void setRent_id(long rent_id) {
        this.rent_id = rent_id;
    }

    public long getDistrict_id() {
        return district_id;
    }

    public void setDistrict_id(long district_id) {
        this.district_id = district_id;
    }

    public List<Car> getListResult() {
        return listResult;
    }

    public void setListResult(List<Car> listResult) {
        this.listResult = listResult;
    }
    
    
}

