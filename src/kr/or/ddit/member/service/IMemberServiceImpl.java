package kr.or.ddit.member.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.member.dao.IMemberDao;
import kr.or.ddit.member.dao.IMemberDaoImpl;
import kr.or.ddit.vo.MemberVO;


public class IMemberServiceImpl implements IMemberService {
	// 싱글톤 패턴 : 외부에서 무분별하게 객체를 생성하는 것을 막아준다.
	private static IMemberService service = new IMemberServiceImpl();//
	private IMemberDao dao;
	
	private IMemberServiceImpl(){//밖에서 new IMemberServiceImpl()못하게 생성자를 private로 바꿔줌.
		dao = IMemberDaoImpl.getInstance();//생성자의 목적 : 초기화 => dao를 초기화하는데, 무분별한 생성, 초기화를 막기위해 dao의 싱글톤 사용.
	}
	
	public static IMemberService getInstance(){
		return (service == null) ? service = new IMemberServiceImpl() : service;
	}
	// ==================싱글톤 패턴 끝.============================
	@Override
	public MemberVO memberInfo(Map<String, String> params) {
		MemberVO memberInfo = null;
			try {
				memberInfo = dao.memberInfo(params);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		return memberInfo;
	}
	
	@Override
	public List<MemberVO> memberList(){
		List<MemberVO> memberList = null;
		try {
			memberList = dao.memberList();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return memberList;
	}

	@Override
	public void insertMemberInfo(MemberVO memberInfo) {
		try {
			dao.insertMemberInfo(memberInfo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void updateMemberInfo(MemberVO memberInfo) {
		try {
			dao.updateMemberInfo(memberInfo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void deleteMemberInfo(Map<String, String> params) {
		try {
			dao.deleteMemberInfo(params);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
