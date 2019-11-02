package kr.or.ddit.prod.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.ibatis.factory.SqlMapClientFactory;
import kr.or.ddit.vo.ProdVO;

public class IProdDaoImpl implements IProdDao {
	
	private static IProdDaoImpl dao = new IProdDaoImpl();
	private SqlMapClient client;
	
	private IProdDaoImpl(){
		client = SqlMapClientFactory.getSqlMapClient();
	}
	public static IProdDaoImpl getInstance(){
		return dao == null ? dao = new IProdDaoImpl(): dao;
	}
	
	@Override
	public List<ProdVO> getAllProd(){
		List<ProdVO> list = null;
		try {
			list = client.queryForList("prod.getAllProd");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	@Override
	public HashMap<String, Object> getDetail(String prod_id) {
		HashMap<String, Object> map = null;
		try {
			map = (HashMap<String, Object>) client.queryForObject("prod.getDetail", prod_id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return map;
	}
	@Override
	public void deleteProd(String prod_id) {
		try {
			client.update("prod.deleteProd", prod_id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	@Override
	public void updateProd(ProdVO vo) {
		try {
			client.update("prod.updateProd", vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	@Override
	public int checkProd(String prod_id) {
		int cnt = 0;
		try {
			cnt = (int) client.queryForObject("prod.checkProd",prod_id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cnt;
	}
	@Override
	public List<ProdVO> prodnmList(String prod_name) {
		List<ProdVO> prod_nameList = null;
		try {
			prod_nameList = client.queryForList("prod.prodnmList",prod_name);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return prod_nameList;
	}
	@Override
	public void insertProd(ProdVO vo) {
		try {
			client.insert("prod.insertProd",vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	@Override
	public String getMaxgu(String prod_gu) {
		String maxGu = null;
		try {
			maxGu = (String) client.queryForObject("prod.getMaxgu",prod_gu);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return maxGu;
	}
	

}
