/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utility;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.List;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author USER
 */
public class UpdateFile {
     public static String uploadFile(MultipartFile file,String url){
         String filePath=null;
        try {
            byte[] bytes = file.getBytes();
            // Creating the directory to store file
            // Assume uploaded file location on web server is D:\file-upload
            String pathName = "D:\\MyHome\\IViettech\\DoAn\\Program\\E-Commerce\\src\\main\\webapp"+url;
            
            File dir = new File(pathName);
            if (!dir.exists()) {
                dir.mkdirs();
            }

            // Create the file on server
            String fileSource = dir.getAbsolutePath() + File.separator 
                    + file.getOriginalFilename();
            File serverFile = new File(fileSource);
            BufferedOutputStream stream = 
                    new BufferedOutputStream(new FileOutputStream(serverFile));
            stream.write(bytes);
            stream.close();
           filePath=url+File.separator+file.getOriginalFilename();
            
        } catch (Exception e) {
            System.out.println(e);           
        }
        return filePath;
    }
     
    public static List<String> uploadFileList(MultipartFile[] files,String url){
        List<String> listUrl = new ArrayList<String>();
        
        for(MultipartFile file:files){
            listUrl.add(uploadFile(file, url));
        }
        return listUrl;
    }
}
