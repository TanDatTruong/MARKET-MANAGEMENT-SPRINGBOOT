package Springweb.service;

import java.util.Optional;
import Springweb.entity.Customers;

import org.springframework.stereotype.Service;


@Service
public interface CustomerService {
    Iterable<Customers> findAll();
    Customers update(int id, Customers cusID);
    
    Optional<Customers> findById(int id);
    
    
    boolean checkLogin(String name, String password);
    
    boolean checkEmail(String email);

    boolean checkRegister(Customers cus);
}
