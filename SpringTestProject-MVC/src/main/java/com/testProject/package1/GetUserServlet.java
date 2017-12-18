package com.testProject.package1;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class GetUserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

       
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String username = request.getParameter("text1").trim();
        String password = request.getParameter("text2").trim();
      

        System.out.println("name catched "+username);
        System.out.println("username catched"+password);
        HttpSession session=request.getSession(true);
        session.setAttribute("username", "nandu");

        
   
         response.setContentType("text/plain");
         response.getWriter().print("text is : "+username+" not correct");
         
       
         
         

    }

}