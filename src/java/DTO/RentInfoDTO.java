
package DTO;

public class RentInfoDTO {
    private long customerId;
    private long carId;
    private String email;
    private String phone;
    private String customerName;
    private String note;
    private String pickUpDate;
    private String pickOffDate;
    private String pickUpLocation;
    private String pickOffLocation;
    private String sentTime;

    public long getCustomerId() {
        return customerId;
    }

    public void setCustomerId(long customerId) {
        this.customerId = customerId;
    }

    public long getCarId() {
        return carId;
    }

    public void setCarId(long carId) {
        this.carId = carId;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public String getPickUpDate() {
        return pickUpDate;
    }

    public void setPickUpDate(String pickUpDate) {
        this.pickUpDate = pickUpDate;
    }

    public String getPickOffDate() {
        return pickOffDate;
    }

    public void setPickOffDate(String pickOffDate) {
        this.pickOffDate = pickOffDate;
    }

    public String getPickUpLocation() {
        return pickUpLocation;
    }

    public void setPickUpLocation(String pickUpLocation) {
        this.pickUpLocation = pickUpLocation;
    }

    public String getPickOffLocation() {
        return pickOffLocation;
    }

    public void setPickOffLocation(String pickOffLocation) {
        this.pickOffLocation = pickOffLocation;
    }

    public String getSentTime() {
        return sentTime;
    }

    public void setSentTime(String sentTime) {
        this.sentTime = sentTime;
    }
    
    
    
}
