package com.guiji.utils;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

public class UpLoadServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 解决post请求中文乱码问题
        // 一定要在获取请求参数之前调用才有效
        req.setCharacterEncoding("UTF-8");
        //解决响应中文乱码问题
        resp.setContentType("text/html;charset=UTF-8");

        //创建FileItemFactory工厂实现类
        DiskFileItemFactory factory = new DiskFileItemFactory();
        //创建解析上传文件的数据的工具类ServletFileUpload类
        ServletFileUpload upload = new ServletFileUpload(factory);
        List items = null;
        try {
            //解析request请求发送数据，得到每一个表单项items
            items = upload.parseRequest(req);
        } catch (FileUploadException e) {
            e.printStackTrace();
        }
        Iterator iter = items.iterator();// 遍历表单中提交过来的内容
        String text1 = null;
        String text2 = null;
        while (iter.hasNext()) {
            FileItem item = (FileItem) iter.next();
            if (item.isFormField()) { // 如果是表单域 ，就是非文件上传元素
                String value = item.getString("UTF-8"); // 获取value属性的值，这里需要指明UTF-8格式，否则出现中文乱码问题
                if (item.getFieldName().equals("text1")) {// 对应form中属性的名字
                    text1 = value;
                } else if (item.getFieldName().equals("text2")) {
                    text2 = value;
                }
            } else {
                String fieldName = item.getFieldName(); // 文件域中name属性的值
                System.out.println("fieldName:" + fieldName);
                String filename = item.getName(); // 文件的全路径，绝对路径名加文件名
                /*
                 * String contentType = item.getContentType(); // 文件的类型 long
                 * size = item.getSize(); // 文件的大小，以字节为单位
                 */
                File saveFile = new File( "D:\\" + filename); // 定义一个file指向一个具体的文件
                try {
                    item.write(saveFile);// 把上传的内容写到一个文件中
                } catch (Exception e) {
                    /* e.printStackTrace(); */
                    System.out.println("文件为空");
                }
            }
        }
        System.out.println("text1:" + text1);
        System.out.println("text2:" + text2);

    }
}
