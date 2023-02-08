package com.ict.model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ict.db.DAO;
import com.ict.db.VO;

public class MyCommand01 implements Command {
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		
		
		// 실제 DB 처리 후 MyController01  로 되돌아 간다 .
		// DB 처리 ( 전체 정보 가져오기)
		List<VO> list = DAO.getListAll();
		
		
		// xml 로 만들자 controller 에서도 만들수 있다 
		// String 와 StringBuffer 차이
		
		StringBuffer sb = new StringBuffer();
		sb.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
		sb.append("<members>");
		for (VO k : list) {
			sb.append("<member>");
			sb.append("<m_idx>"+k.getM_idx()+"</m_idx>" );
			sb.append("<m_id>"+k.getM_id()+"</m_id>" );
			sb.append("<m_pw>"+k.getM_pw()+"</m_pw>" );
			sb.append("<m_name>"+k.getM_name()+"</m_name>" );
			sb.append("<m_reg>"+k.getM_reg().substring(0,10)+"</m_reg>" );
			sb.append("<m_addr>"+k.getM_addr()+"</m_addr>" );
			sb.append("</member>");
		}
		
		sb.append("</members>");
		
		// 일반적인 MVC 는 뷰 경로를 작성하지만
		//AJAX는 만들어진  정보를 작성한다.
		return sb.toString();
	}

}
