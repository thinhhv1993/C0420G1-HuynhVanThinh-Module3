package controllers;

import model.Customers;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "controllers.CustomersServlet", urlPatterns = "/controllers.CustomersServletPath")
public class CustomersServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Customers> customerList =  new ArrayList<>();
        customerList.add( new Customers("Mai Văn Hoàng" ,"1983-08-20","Hà Nội", "image/Capture.PNG"));
        customerList.add( new Customers("Nguyễn văn Nam" ,"1983-08-21","Bắc Giang","image/Capture1.PNG"));
        customerList.add( new Customers("Nguyễn Thái Hoà" ,"1983-08-22","Nam Định","image/Capture2.PNG"));
        customerList.add( new Customers("Trần Đăng Khoa" ,"1983-08-17","Hà Tây","image/Capture3.PNG"));
        customerList.add( new Customers("Nguyễn Đình Thi" ,"1983-08-19","Hà Nội","image/Capture4.PNG"));

        request.setAttribute("listCustomer",customerList);

        request.getRequestDispatcher("list.jsp").forward(request, response);
    }
}
