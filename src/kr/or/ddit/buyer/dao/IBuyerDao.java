package kr.or.ddit.buyer.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import kr.or.ddit.vo.BuyerVO;

public interface IBuyerDao {

	List<HashMap<String, Object>> getAllBuyer() throws SQLException;
	BuyerVO getBuyerInfo(String buyer_id) throws SQLException;
	void updateBuyerInfo(BuyerVO vo) throws SQLException;
	void deleteBuyerInfo(String buyer_id) throws SQLException;
	void insertBuyerInfo(BuyerVO vo) throws SQLException;
	List<HashMap<String, Object>> lprodForBuyer(String prod_name) throws SQLException;
}
