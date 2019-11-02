package kr.or.ddit.buyer.service;

import java.util.HashMap;
import java.util.List;

import kr.or.ddit.vo.BuyerVO;

public interface IBuyerService {
	List<HashMap<String, Object>> getAllBuyer();
	BuyerVO getBuyerInfo(String buyer_id);
	void updateBuyerInfo(BuyerVO vo);
	void deleteBuyerInfo(String buyer_id);
	void insertBuyerInfo(BuyerVO vo);
	List<HashMap<String, Object>> lprodForBuyer(String prod_name);
}
