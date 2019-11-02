package kr.or.ddit.prod.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import kr.or.ddit.vo.ProdVO;

public interface IProdDao {
	
	List<ProdVO> getAllProd();
	HashMap<String, Object> getDetail(String prod_id);
	void deleteProd(String prod_id);
	void updateProd(ProdVO vo);
	int checkProd(String prod_id);
	List<ProdVO> prodnmList(String prod_name);
	void insertProd(ProdVO vo);
	String getMaxgu(String prod_gu);
}
