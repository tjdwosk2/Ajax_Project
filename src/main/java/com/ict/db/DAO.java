package com.ict.db;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

public class DAO {
	// 실제 사용하는 클래스  : SqlSession
	private static SqlSession ss;
	
	// 싱글턴 패턴으로 만들기 (동기화 처리) : 프로그램이 종료 될때 까지 
	// 한번 만들어진 객체를 재사용하게 하는 방식
	
	private synchronized static SqlSession getSession() {
		if(ss == null) {
			ss = DBService.getFactory().openSession();
		}
		return ss;
		
		
	}
	// 전체 정보 가져오기
	public static List<VO> getListAll(){
		List<VO> list =getSession().selectList("members.list");
		return list;
	}
	
	// 중복검사
	public static String getIdChk(String m_id) {
//			String result = "사용가능";
//			List<VO> list = getSession().selectList("members.idchk",m_id);
//			if (list.size()>0) {
//				result = "사용불가";
//			}
//			
//			return result;
		
		String result = "1";
		List<VO> list = getSession().selectList("members.idchk",m_id);
		if (list.size()>0) {
			result = "0";
		}
		
		return result;
		
	}
	
	//가입하기
	public static int getInsert(VO vo) {
		int result =getSession().insert("members.insert" , vo);
		ss.commit();
		return result;
		
	}
	//삭제하기
	public static int getDelete(String m_idx) {
		
	int result =getSession().delete("members.delete", m_idx);
			ss.commit();
			return result;
}


}








