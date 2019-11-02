package kr.or.ddit.prod.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import kr.or.ddit.vo.ProdVO;

public interface IProdService {
	List<ProdVO> getAllProd() throws SQLException;
	HashMap<String, Object> getDetail(String prod_id) throws SQLException;
	void deleteProd(String prod_id) throws SQLException;
	void updateProd(ProdVO vo) throws SQLException;
	int checkProd(String prod_id) throws SQLException;
	List<ProdVO> prodnmList(String prod_name) throws SQLException;
	void insertProd(ProdVO vo) throws SQLException;
	String getMaxgu(String prod_gu) throws SQLException;
}
