package com.ict.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ict.model.Command;
import com.ict.model.MyCommand06;

@WebServlet("/MyController06")
public class MyController06 extends HttpServlet {
	private static final long serialVersionUID = 1L;
   

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			request.setCharacterEncoding("utf-8");
			// 텍스트는 plain 로 받는다.
			response.setContentType("text/plain; charset=utf-8");
			PrintWriter out = response.getWriter();
			
			Command comm = new MyCommand06();
			String result =  comm.exec(request, response);
			
			
			out.print(result);
	}

	

}
