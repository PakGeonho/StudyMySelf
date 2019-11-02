package kr.or.ddit.member.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.ibatis.factory.SqlMapClientFactory;
import kr.or.ddit.vo.MemberVO;

import com.ibatis.sqlmap.client.SqlMapClient;

public class IMemberDaoImpl implements IMemberDao {
	
	private static IMemberDao dao = new IMemberDaoImpl();
	private SqlMapClient client;
	
	private IMemberDaoImpl(){ //다오에선 SqlMap클라이언트가 있어야 퍼시스턴스 레이어에 접근이 가능하기 때문에, sqlMapClient를 생성해준다.
		client = SqlMapClientFactory.getSqlMapClient();//때문에 dao와 sqlmapClient는 결합도가 높다.
	}
	public static IMemberDao getInstance(){
		return (dao == null) ? dao = new IMemberDaoImpl() : dao;
	}
	
	@Override
	public MemberVO memberInfo(Map<String, String> params) throws SQLException {
		return (MemberVO) client.queryForObject("member.memberInfo", params);//queryForObject는 Object로 return해주기 때문에,
											//리턴값인 MemberVO로 downCasting해서 return해야한다.
	}

	@Override
	public List<MemberVO> memberList() throws SQLException{
		return client.queryForList("member.memberList");
	}
	@Override
	public void insertMemberInfo(MemberVO memberInfo) throws SQLException {
		client.insert("member.insertMember", memberInfo);
	}

	@Override
	public void updateMemberInfo(MemberVO memberInfo) throws SQLException {
		// 동적인 테이블 생성, 시퀀스 생성, 뷰 생성, 유저 생성...
		client.update("member.updateMember", memberInfo);
	}

	@Override
	public void deleteMemberInfo(Map<String, String> params) throws SQLException {
		client.update("member.deleteMember",params);
	}

}
