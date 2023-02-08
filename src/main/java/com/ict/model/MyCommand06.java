package com.ict.model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ict.db.DAO;
import com.ict.db.VO;

public class MyCommand06 implements Command{
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
			String m_id = request.getParameter("m_id");
			String result = DAO.getIdChk(m_id);
			
			
			
			//콘솔에 값이 뜨는지 확인한다
			//System.out.println(m_id);
		
		
		return result;
	}
}
