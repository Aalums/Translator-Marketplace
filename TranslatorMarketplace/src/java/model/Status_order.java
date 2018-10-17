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
public class Status_order {
    
    String description;
    String translator_name;
    String status;

    public Status_order(String description, String translator_name, String status) {
        this.description = description;
        this.translator_name = translator_name;
        this.status = status;
    }
    
    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getTranslator_name() {
        return translator_name;
    }

    public void setTranslator_name(String translator_name) {
        this.translator_name = translator_name;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
}
