/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author eyenach
 */
public class Order_customer {
    String title;
    String name;
    String status;
    
    public Order_customer(String title, String name, String status) {
        this.title = title;
        this.name = name;
        this.status = status;
    }
    
    public String getTitle() {
        return title;
    }

    public String getName() {
        return name;
    }

    public String getStatus() {
        return status;
    }
    
}
