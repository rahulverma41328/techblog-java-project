package com.tech.blog.helper;

import java.io.File;

public class Helper {

    public static boolean deleteFile(String path){
        boolean f = false;

        try {
            File file = new File(path);
            f= file.delete();



        }catch (Exception e){
            e.printStackTrace();
        }
        return f;
    }



}
