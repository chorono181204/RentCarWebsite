
package model;
public class Contact {
    private long id, status;
    private String username, email, subject, message, time_sent;

    public Contact() {
    }
    
    public Contact(long id, String username, String email, String subject, String message, long status, String time_sent) {
        this.id = id;
        this.username = username;
        this.email = email;
        this.subject = subject;
        this.message = message;
        this.status = status;
        this.time_sent = time_sent;
    }
    

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public long getStatus() {
        return status;
    }

    public void setStatus(long status) {
        this.status = status;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getTime_sent() {
        return time_sent;
    }

    public void setTime_sent(String time_sent) {
        this.time_sent = time_sent;
    }

    @Override
    public String toString() {
        return id + " " + status + " " + username + " " + email + " " + subject + " " + message + " " + time_sent;
    }

    
    
}
