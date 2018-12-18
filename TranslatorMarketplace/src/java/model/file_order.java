/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

/**
 *
 * @author eyenach
 */
public class file_order {
    
    private String file_order;
    
    public String order(){
        return file_order;
    }
    
    public void fileOrder(String name, InputStream file) throws FileNotFoundException{
        File path = new File("/Users/eyenach/Documents/GitHub/Translator-Marketplace/TranslatorMarketplace/web/file_order/" + name + ".pdf");
        FileOutputStream outputStream = new FileOutputStream(path);

        file_order = "file_order/" + name + ".pdf";
        
        byte[] buffer = new byte[1024];
        try {
            while(file.read(buffer)>0){
                outputStream.write(buffer);
            }
            outputStream.close();
        } catch (IOException ex) {
            ex.printStackTrace();
        }   
    }
    
}
