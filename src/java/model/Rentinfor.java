package model;

public class Rentinfor {
    private long rent_id, id_user, status,id_car, rent_price;
    private String customer_name, phone, email, customer_note, pick_up_date, pick_off_date, pick_up_location, pick_off_location, pick_time;

    
    public Rentinfor() {
    }

    public Rentinfor(long rent_id, String customer_name, String phone, String email, String customer_note, String pick_up_date, String pick_off_date, String pick_up_location, String pick_off_location, long id_user, String pick_time, long status,long id_car,long rent_price) {
        this.rent_id = rent_id;
        this.customer_name = customer_name;
        this.phone = phone;
        this.email = email;
        this.customer_note = customer_note;
        this.pick_up_date = pick_up_date;
        this.pick_off_date = pick_off_date;
        this.pick_up_location = pick_up_location;
        this.pick_off_location = pick_off_location;
        this.id_user = id_user;
        this.pick_time  = pick_time;
        this.status = status;
        this.id_car=id_car;
        this.rent_price=rent_price;
    }
     public Rentinfor(long rent_id, String customer_name, String phone, String email, String customer_note, String pick_up_date, String pick_off_date, String pick_up_location, String pick_off_location, long id_user, String pick_time, long status,long id_car) {
        this.rent_id = rent_id;
        this.customer_name = customer_name;
        this.phone = phone;
        this.email = email;
        this.customer_note = customer_note;
        this.pick_up_date = pick_up_date;
        this.pick_off_date = pick_off_date;
        this.pick_up_location = pick_up_location;
        this.pick_off_location = pick_off_location;
        this.id_user = id_user;
        this.pick_time  = pick_time;
        this.status = status;
        this.id_car=id_car;
       
    }
    
    
    public long getRent_id() {
        return rent_id;
    }

    public void setRent_id(long rent_id) {
        this.rent_id = rent_id;
    }

    public long getId_user() {
        return id_user;
    }

    public void setId_user(long id_user) {
        this.id_user = id_user;
    }

    public long getStatus() {
        return status;
    }

    public void setStatus(long status) {
        this.status = status;
    }

    public String getCustomer_name() {
        return customer_name;
    }

    public void setCustomer_name(String customer_name) {
        this.customer_name = customer_name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getCustomer_note() {
        return customer_note;
    }

    public void setCustomer_note(String customer_note) {
        this.customer_note = customer_note;
    }

    public String getPick_up_date() {
        return pick_up_date;
    }

    public void setPick_up_date(String pick_up_date) {
        this.pick_up_date = pick_up_date;
    }

    public String getPick_off_date() {
        return pick_off_date;
    }

    public void setPick_off_date(String pick_off_date) {
        this.pick_off_date = pick_off_date;
    }

    public String getPick_up_location() {
        return pick_up_location;
    }

    public void setPick_up_location(String pick_up_location) {
        this.pick_up_location = pick_up_location;
    }

    public String getPick_off_location() {
        return pick_off_location;
    }

    public void setPick_off_location(String pick_off_location) {
        this.pick_off_location = pick_off_location;
    }
    public String getPick_time() {
        return pick_time;
    }

    public void setPick_time(String pick_time) {
        this.pick_time = pick_time;
    }

    public long getId_car() {
        return id_car;
    }

    public void setId_car(long id_car) {
        this.id_car = id_car;
    }

    public long getRent_price() {
        return rent_price;
    }

    public void setRent_price(long rent_price) {
        this.rent_price = rent_price;
    }

   
    
}
