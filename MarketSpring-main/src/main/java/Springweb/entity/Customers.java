package Springweb.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import java.io.Serializable;

import javax.validation.constraints.NotNull;
import org.hibernate.validator.constraints.Length;

@Entity
@Table(name = "Customers")
public class Customers implements Serializable {

    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer CustomerID;
    
   @Length(min =6, message = "Password phải tối thiểu 6 ký tự!")
    private String Password;
    
   @NotNull
    private String Fullname;
   @NotNull
    private String Email;
   @NotNull
    private String City;
   @NotNull
    private String Usertype;

    public Integer getCustomerID() {
        return CustomerID;
    }

    public void setCustomerID(Integer CustomerID) {
        this.CustomerID = CustomerID;
    }

    public String getPassword() {
        return Password;
    }

    public void setPassword(String Password) {
        this.Password = Password;
    }

    public String getFullname() {
        return Fullname;
    }

    public void setFullname(String Fullname) {
        this.Fullname = Fullname;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

    public String getCity() {
        return City;
    }

    public void setCity(String City) {
        this.City = City;
    }
    
    public String getUsertype() {
        return Usertype;
    }

    public void setUsertype(String Usertype) {
        this.Usertype = Usertype;
    }
    
}
