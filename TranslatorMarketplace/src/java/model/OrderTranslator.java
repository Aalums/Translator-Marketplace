/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Date;

/**
 *
 * @author may
 */
public class OrderTranslator {
    
    int id_order;
    String employer;
    String desc;
    String type;
    int page;
    float price;
    Date date;
    String file_order;
    
    String status;
    
    public OrderTranslator(int id_order, String employer, String desc, int page, Date date, String status, String type, float price, String file_order) {
        this.id_order = id_order;
        this.employer = employer;
        this.desc = desc;
        this.page = page;
        this.date = date;
        this.status = status;
        this.type = type;
        this.price = price;
        this.file_order = file_order;
    }
    
    public int getId_order() {
        return id_order;
    }

    public void setId_order(int id_order) {
        this.id_order = id_order;
    }

    public String getEmployer() {
        return employer;
    }

    public void setEmployer(String employer) {
        this.employer = employer;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public String getFile_order() {
        return file_order;
    }

    public void setFile_order(String file_order) {
        this.file_order = file_order;
    }

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

}
