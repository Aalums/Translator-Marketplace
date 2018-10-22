/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author may
 */
public class OrderTranslator {
    int id_order;
    String desc;
    String status;

    public OrderTranslator(int id_order, String desc, String status) {
        this.id_order = id_order;
        this.desc = desc;
        this.status = status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getId_order() {
        return id_order;
    }
    
    public String getDesc() {
        return desc;
    }

    public String getStatus() {
        return status;
    }
}
