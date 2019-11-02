package kr.or.ddit.prod.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import kr.or.ddit.prod.dao.IProdDao;
import kr.or.ddit.prod.dao.IProdDaoImpl;
import kr.or.ddit.vo.ProdVO;

public class IProdServiceImpl implements IProdService {
	
	private static IProdServiceImpl service = new IProdServiceImpl();
	private IProdDao dao;
	
	private IProdServiceImpl(){
		dao = IProdDaoImpl.getInstance();
	}
	public static IProdServiceImpl getInstance(){
		return service == null ? service = new IProdServiceImpl(): service;
	}
	
	
	@Override
	public List<ProdVO> getAllProd() throws SQLException {
		List<ProdVO> list = null;
		list = dao.getAllProd();
		return list;
	}
	@Override
	public HashMap<String, Object> getDetail(String prod_id) throws SQLException {
		return dao.getDetail(prod_id);
	}
	@Override
	public void deleteProd(String prod_id) throws SQLException {
		dao.deleteProd(prod_id);
	}
	@Override
	public void updateProd(ProdVO vo) throws SQLException {
		dao.updateProd(vo);
	}
	@Override
	public int checkProd(String prod_id) throws SQLException {
		return dao.checkProd(prod_id);
	}
	@Override
	public List<ProdVO> prodnmList(String prod_name) throws SQLException {
		return dao.prodnmList(prod_name);
	}
	@Override
	public void insertProd(ProdVO vo) throws SQLException {
		dao.insertProd(vo);
	}
	@Override
	public String getMaxgu(String prod_gu) throws SQLException {
		return dao.getMaxgu(prod_gu);
	}
	

}
