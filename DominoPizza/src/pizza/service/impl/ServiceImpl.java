package pizza.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import pizza.service.BasketDTO;
import pizza.service.DelAddrDTO;
import pizza.service.DoughDTO;
import pizza.service.PNutrientDTO;
import pizza.service.PizzaDTO;
import pizza.service.PizzaMenuList;
import pizza.service.SNutrientDTO;
import pizza.service.SaileCouponDTO;
import pizza.service.SideMenuList;
import pizza.service.StoresDTO;




/*
 * 이름 미 지정시 ID값은 소문자로 시작하는 클래스명이됨
 * 예]ReplyBBSServiceImpl클래인 경우 
 * ID값은 replyBBSServiceImpl
 * 지정도 가능 @Service("임의의ID값")
 */

@Service("service")
public class ServiceImpl implements pizza.service.Service {

	@Resource(name="daotest")
	private Daotest dao;

	
	
	
	@Override
	public int test(Map map) throws Exception {
		return dao.test(map);
	}
	
	@Override
	public List menuList(Map map) throws Exception {
		return dao.menuList(map);
	}

	@Override
	public int selectaddr(Map map) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}
	
	
	public int addrselect(Map map) {
		return dao.addrselect(map);
		
	}

	public PizzaDTO pizzaview(Map map) {
		return dao.pizzaview(map);
	}

	public List<DoughDTO> doughlist(Map map) {
		return dao.doughlist(map);
	}

	public List<PNutrientDTO> pnutrient(Map map) {
		return dao.pnutrient(map);
	}

	public int sinsert(Map map) {
		return dao.sinsert(map);
		
	}

	public int stinsert(BasketDTO dto) {
		return dao.stinsert(dto);
	}


	

	public StoresDTO deladdrsel(Map map) {
		return dao.deladdrsel(map);
	}

	public int deladdrin(Map map) {
		return dao.deladdrin(map);
	}

	public List<StoresDTO> deladdrprint(Map map) {
		return dao.deladdrprint(map);
	}

	public StoresDTO sessionInDel(Map map) {
		return dao.sessionInDel(map);
	}



	public UserDto callUser(Map map) {
		return dao.callUser(map);
	}

	public SideMenuList Sideview(Map map) {
		return dao.sideView(map);
	}

	public SNutrientDTO snprint(Map map) {
		return dao.snprint(map);
	}

	public List<SaileCouponDTO> callcoupon(Map map) {
		return dao.callcoupon(map);
	}
	
	
	

}
