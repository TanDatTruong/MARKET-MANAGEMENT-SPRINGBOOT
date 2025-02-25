package Springweb.controller;

import Springweb.entity.Customers;
import Springweb.entity.Order;
import Springweb.repository.CustomersRepository;
import Springweb.repository.OrderRepository;
import Springweb.service.CustomerService;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class CustomersController {

    @Autowired
    private CustomerService customerService;
    @Autowired
    private CustomersRepository customersReposity;
    @Autowired
    private OrderRepository orderRepository;
   
    @GetMapping("/register")
    public String registerForm(HttpSession session, Model model) {
        if (session.getAttribute("USERNAME") != null) {
            return "home";
        }
        model.addAttribute("customer", new Customers());
        return "register";
    }
    
    @GetMapping("/forgot-password")
    public String forgotpasswordForm(HttpSession session) {
        return "forgot_password";
    }
    
    @GetMapping("/reset-password")
    public String resetpasswordForm(HttpSession session, Customers customer) {
        return "reset_password";
}
    
    @PostMapping("/customer/checkEmail")
   public String checkEmail(Model model, @RequestParam("email") String email, HttpSession session, Customers customer) {
        boolean check = customerService.checkEmail(email);
        if (check) {
            model.addAttribute("SUCCESS", "Email confirmation successful");
        }else{
            model.addAttribute("ERROR", "Email not found");
            return "forgot_password";
        }
        customer = customersReposity.findbyEmail(email);
        session.setAttribute("EMAIL", email);
        session.setAttribute("USER_PASSWORD", customer.getPassword());
        session.setAttribute("USER_FULLNAME", customer.getFullname());
        return "redirect:/reset-password";
    }
    
    @GetMapping("/login")
    public String loginForm(HttpSession session){
        if(session.getAttribute("USERNAME") != null) 
            return "home";
        return "login";
    }
    
    
    @PostMapping("/customer/update")
    public String update(Model model, @ModelAttribute("customer") Customers customer){
        Optional<Customers> cus = customersReposity.findById(customer.getCustomerID());
        Customers c;
        c = cus.get();
        //c.setCustomerID(customer.getCustomerID());
        if(customer.getPassword().equalsIgnoreCase("")) {
           c.setPassword(c.getPassword());
        } else {
            c.setPassword(customer.getPassword());
        }
        c.setEmail(customer.getEmail());
        c.setCity(customer.getCity());
        c.setFullname(customer.getFullname());
        customersReposity.save(c);
        if ("admin".equals(c.getFullname())){
            return "redirect:/customer/all";
        } else { return "redirect:/home";}
    }
    
    @GetMapping("/customer/all")
    public String showAllCustomer(Model m)
    {
        Iterable<Customers> list = customersReposity.findAll();
        m.addAttribute("data", list);
        return "customer_all";
        
    }
    
    @GetMapping(value = {"customer/edit/{id}"})
    public String edit(@PathVariable("id") int id, Model model) {
        Optional<Customers> cus = customersReposity.findById(id);
        cus.ifPresent(customer->model.addAttribute("customer", cus));
        //model.addAttribute("customer", cus);
        return "customer_edit";
    }
    
   @RequestMapping("/customer/delete/{id}")
    public String CusDelete(@PathVariable int id, Model model) {
         ArrayList<Order> list = (ArrayList<Order>) orderRepository.CheckForeignKey(id);
        if(!list.isEmpty()) {
            model.addAttribute("flag", "Exit in orther table");
            return "redirect:/customer/all";
        }
        customersReposity.deleteById(id);
        model.addAttribute("listCustomer", customersReposity.findAll());
        return "redirect:/customer/all";
    }  
 
    
    //

   @PostMapping("/customer/checklogin")
   public String checklogin(Model model, @RequestParam("taikhoan") String username, 
        @RequestParam("pass") String password, HttpSession session) {
        boolean check = customerService.checkLogin(username, password);
        if (check == false) {
            model.addAttribute("ERROR", "Username or Password is wrong");
            return "login";
        }
        Customers c = customersReposity.findbyName(username, password);
            if ("admin".equals(c.getUsertype())) {
                session.setAttribute("USERNAME", username);
                return "redirect:/admin";
            }else if ("seller".equals(c.getUsertype())) {
                session.setAttribute("USERNAME", username);
                return "redirect:/seller";
            }
        // If it's a regular user login
        session.setAttribute("USERNAME", username);
        session.setAttribute("USER_ID", c.getCustomerID()); // Add user ID to the session
        session.setAttribute("USER_INFO", c);
        return "redirect:/home";
    }



    
    @GetMapping("/logout")
    public String logout(HttpSession session){
        session.removeAttribute("USERNAME");
        return "redirect:/home";
    }
    
    @PostMapping("/customer/checkRegister")
    public String checkRegister(Model model, @ModelAttribute("customer") Customers customer,HttpSession session){
        boolean check = customerService.checkRegister(customer);
        if(check == false){
            model.addAttribute("ERROR", "Username has exist");
            return "register";
        }
        String userType = customer.getUsertype();
        customer.setUsertype(userType);

        // Lưu thông tin người dùng vào cơ sở dữ liệu
        customersReposity.save(customer);
        session.setAttribute("USERNAME", customer.getFullname());
        return "login";
    }   
}
