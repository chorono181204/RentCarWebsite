
package model;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author developer
 */
public class Car {
    private Long id;
    private Long carBrandId;
    private String name;
    private Long price;
    private String image;
    private List<Car> listResult = new ArrayList<>();

    public List<Car> getListResult() {
        return listResult;
    }

    public void setListResult(List<Car> listResult) {
        this.listResult = listResult;
    }
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Long getPrice() {
        return price;
    }

    public void setPrice(Long price) {
        this.price = price;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public Long getCarBrandId() {
        return carBrandId;
    }

    public void setCarBrandId(Long carBrandId) {
        this.carBrandId = carBrandId;
    }
    
}
