
package model;

public class CarType {
    long id;
    String type;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public CarType(Long id, String type) {
        this.id = id;
        this.type = type;
    }

    public CarType() {
    }
    
    
}
