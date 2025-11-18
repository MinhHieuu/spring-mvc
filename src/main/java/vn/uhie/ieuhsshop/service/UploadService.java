package vn.uhie.ieuhsshop.service;

import jakarta.servlet.ServletContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.List;

@Service
public class UploadService {
    @Autowired
    private ServletContext servletContext;
    public String handleSaveUploadFile(MultipartFile file, String targetFolder) {
        String rootPath = servletContext.getRealPath("/resources/images");
        String finalName = "";
        try{
            byte[] bytes = file.getBytes();
            File dir = new File(rootPath + File.separator + targetFolder);
            if(dir.exists()){
                dir.mkdirs();
            }
            finalName =System.currentTimeMillis() + file.getOriginalFilename();
            File serverFile = new File(dir.getAbsolutePath() + File.separator + finalName);
            BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
            stream.write(bytes);
            stream.close();
        }catch (Exception e){
            e.printStackTrace();
        }
        return finalName;
    }

    public List<String> handleSaveUploadFiles(MultipartFile[] files, String targetFolder) {
        List<String> fileNames = new ArrayList<>();
        for(MultipartFile file : files) {
            if(!file.isEmpty()) {
                String imgName = this.handleSaveUploadFile(file, targetFolder);
                fileNames.add(imgName);
            }
        }
        return fileNames;
    }
}
