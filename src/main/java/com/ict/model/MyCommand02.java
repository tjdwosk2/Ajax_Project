package com.ict.model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ict.db.DAO;
import com.ict.db.VO;

public class MyCommand02 implements Command{
		@Override
		public String exec(HttpServletRequest request, HttpServletResponse response) {
			StringBuffer sb = new StringBuffer();
			List<VO> list = DAO.getListAll();
			sb.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
			sb.append("<members>");
			for (VO k : list) {
				//<member>  하고 띄어쓰기 여부가참 중요하다
				// 그래서 m_idx 등 앞에 띄어쓰기를 해준것이다
				// 마지막으로  /> 앞에도  띄어쓰기를 꼭 신경 써주기
				
				sb.append("<member ");
				sb.append(" m_idx=\""+k.getM_idx()+"\"" );
				sb.append(" m_id=\""+k.getM_id()+"\"" );
				sb.append(" m_pw=\""+k.getM_pw()+"\"" );
				sb.append(" m_name=\""+k.getM_name()+"\"" );
				sb.append(" m_reg=\""+k.getM_reg().substring(0,10)+"\"" );
				sb.append(" m_addr=\""+k.getM_addr()+"\"" );
				sb.append("/>");
			}
			
			
			sb.append("</members>");
			//String 으로 바꾸는 거면 toString ()
			return sb.toString();
		}
}
