/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Springweb.controller;

import Springweb.repository.CategoryRepository;
import Springweb.repository.CustomersRepository;
import Springweb.repository.OrderRepository;
import Springweb.repository.VegetableRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller

public class AdminController {
    @Autowired
    VegetableRepository vegetableRepository;
    @Autowired
    CustomersRepository customersRepository;
    @Autowired
    OrderRepository orderRepository;
    @Autowired
    CategoryRepository categoryRepository;
    
     @GetMapping("/admin")
    public String adminPage(Model model) {
        long distinctVegetablesCount = vegetableRepository.countAllVegetables();
        model.addAttribute("distinctVegetablesCount", distinctVegetablesCount);
        
        long distinctCustomersCount = customersRepository.countAllCustomers();
        model.addAttribute("distinctCustomersCount", distinctCustomersCount);
        
        long distinctOrderCount = orderRepository.countAllOrders();
        model.addAttribute("distinctOrderCount", distinctOrderCount);
        
        long distinctOrderTotal = orderRepository.countTotal();
        model.addAttribute("distinctOrderTotal", distinctOrderTotal);
        
        long distinctCategoryCount = categoryRepository.countAllCategory();
        model.addAttribute("distinctCategoryCount", distinctCategoryCount);
        
        return "admin";
    }

    // Thêm các phương thức xử lý khác nếu cần thiết
}