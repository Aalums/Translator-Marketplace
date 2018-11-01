package model;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

public class file_create {
    private String file_create;
    
    public String create(){
        return file_create;
    }
    
    public void fileCreate(String name, InputStream file) throws FileNotFoundException{
        File path = new File("/Users/Planoi/Documents/GitHub/Translator-Marketplace/TranslatorMarketplace/web/file_create/" + name + ".pdf");
        FileOutputStream outputStream = new FileOutputStream(path);

        file_create = "file_create/" + name + ".pdf";
        
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
