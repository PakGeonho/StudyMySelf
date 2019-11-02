package kr.or.ddit.buyer.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import kr.or.ddit.buyer.dao.IBuyerDao;
import kr.or.ddit.buyer.dao.IBuyerDaoImpl;
import kr.or.ddit.vo.BuyerVO;

public class IBuyerServiceImpl implements IBuyerService {
	
	private static IBuyerServiceImpl service = new IBuyerServiceImpl();
	private IBuyerDao dao;
	
	public static IBuyerServiceImpl getInstance(){
		return service == null ? service = new IBuyerServiceImpl() : service ;
	}
	
	public IBuyerServiceImpl() {
		dao = IBuyerDaoImpl.getInstance();
	}
	
	
	@Override
	public List<HashMap<String, Object>> getAllBuyer() {
		List<HashMap<String, Object>> list = null;
		try {
			list = dao.getAllBuyer();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public BuyerVO getBuyerInfo(String buyer_id) {
		BuyerVO vo = null;
		try {
			vo = dao.getBuyerInfo(buyer_id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return vo;
	}

	@Override
	public void updateBuyerInfo(BuyerVO vo) {
		try {
			dao.updateBuyerInfo(vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void deleteBuyerInfo(String buyer_id) {
		try {
			dao.deleteBuyerInfo(buyer_id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public void insertBuyerInfo(BuyerVO vo) {
		try {
			dao.insertBuyerInfo(vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<HashMap<String, Object>> lprodForBuyer(String prod_name) {
		List<HashMap<String, Object>> list = null;
		try {
			list = dao.lprodForBuyer(prod_name);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
}
