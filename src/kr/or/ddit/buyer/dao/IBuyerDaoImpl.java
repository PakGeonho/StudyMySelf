package kr.or.ddit.buyer.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.ibatis.factory.SqlMapClientFactory;
import kr.or.ddit.prod.dao.IProdDaoImpl;
import kr.or.ddit.vo.BuyerVO;

public class IBuyerDaoImpl implements IBuyerDao {

	private static IBuyerDaoImpl dao = new IBuyerDaoImpl();
	private SqlMapClient client;
	
	private IBuyerDaoImpl(){
		client = SqlMapClientFactory.getSqlMapClient();
	}
	public static IBuyerDaoImpl getInstance(){
		return dao == null ? dao = new IBuyerDaoImpl(): dao;
	}
	
	
	@Override
	public List<HashMap<String, Object>> getAllBuyer() throws SQLException {
		List<HashMap<String, Object>> list = null;
		list = (List<HashMap<String, Object>>) client.queryForList("buyer.getAllBuyer");
		return list;
	}
	@Override
	public BuyerVO getBuyerInfo(String buyer_id) throws SQLException {
		BuyerVO vo = null;
		vo = (BuyerVO) client.queryForObject("buyer.getBuyerInfo", buyer_id);
		return vo;
	}
	@Override
	public void updateBuyerInfo(BuyerVO vo) throws SQLException {
		client.update("buyer.updateBuyerInfo", vo);
	}
	@Override
	public void deleteBuyerInfo(String buyer_id) throws SQLException {
		client.update("buyer.deleteBuyerInfo", buyer_id);
	}
	@Override
	public void insertBuyerInfo(BuyerVO vo) throws SQLException {
		client.insert("buyer.insertBuyerInfo",vo);
	}
	@Override
	public List<HashMap<String, Object>> lprodForBuyer(String prod_name) throws SQLException {
		return (List<HashMap<String, Object>>) client.queryForList("buyer.lprodForBuyer", prod_name);
	}

}
