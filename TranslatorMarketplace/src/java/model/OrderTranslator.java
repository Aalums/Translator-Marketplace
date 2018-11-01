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
    String file_name;
    int page;
    Date date;
    String status;
    
    public OrderTranslator(int id_order, String employer, String desc, String file_name, int page, Date date, String status) {
        this.id_order = id_order;
        this.employer = employer;
        this.desc = desc;
        this.file_name = file_name;
        this.page = page;
        this.date = date;
        this.status = status;
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

    public String getFile_name() {
        return file_name;
    }

    public void setFile_name(String file_name) {
        this.file_name = file_name;
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

}
