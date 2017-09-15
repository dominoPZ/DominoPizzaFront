package pizza.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.annotation.Resource;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import pizza.service.BasketDTO;
import pizza.service.DelAddrDTO;
import pizza.service.DoughDTO;
import pizza.service.PNutrientDTO;
import pizza.service.PizzaDTO;
import pizza.service.PizzaMenuList;
import pizza.service.SMenuDTO;
import pizza.service.SaileCouponDTO;
import pizza.service.StoresDTO;
import pizza.service.ToppingDTO;
import pizza.service.impl.Daotest;
import pizza.service.impl.ServiceImpl;
import pizza.service.impl.UserDto;

@Controller
public class Order {


	@Resource(name="service")
	private ServiceImpl service;
	
	@RequestMapping("/AddrSelect.pz")
	public String AddrSelect(@RequestParam Map map, Model model,HttpServletRequest req , HttpSession session) throws Exception{
		String id = session.getAttribute("ID").toString();
		map.put("id", id);
		String url="";
		if(session.getAttribute("DE_NO")!=null && req.getParameter("reset")==null) {

			//매장선택 되어 있을경우 장바구니에 저장
			BasketDTO dto = new BasketDTO();
			if(map.get("dough")!=null)
			dto.setDough(map.get("dough").toString());
			dto.setImg(map.get("img").toString());
			dto.setName(map.get("na").toString());
			String price="";
			char[] pri = map.get("price").toString().toCharArray();
			for(char cha : pri) {
				if(cha >= '0' && cha <= '9')
					price+=cha;
			}
			System.out.println(price);
			dto.setPrice(price);
			int totprice = 0;
			if(session.getAttribute("TOTALPRICE")!=null)
				totprice = Integer.parseInt(session.getAttribute("TOTALPRICE").toString());
			dto.setQty(map.get("qty").toString());
			if(map.get("size")!=null)
			dto.setSize(map.get("size").toString().toUpperCase().contains("L")?"L":"M");
			if(map.get("topping")!=null) {
			String toppings[] = req.getParameterValues("topping");
			List<ToppingDTO> tlist = new Vector<ToppingDTO>();
			for(String top : toppings) {
			ToppingDTO tdto = new ToppingDTO();
			tdto.setTs_no(top);
			tlist.add(tdto);
			}
			dto.setToppingList(tlist);
			}
			dto.setKind(map.get("kind").toString());
			if(map.get("doughno")!=null)
			dto.setDoughno(map.get("doughno").toString());
			List<BasketDTO> list = new Vector<>();
			if(session.getAttribute("BUYLIST")!=null)
			list=(List<BasketDTO>)session.getAttribute("BUYLIST");
			list.add(dto);
			req.setAttribute("list", list);
			session.setAttribute("BUYLIST", list);
			session.setAttribute("BUYNUM", list.size());
			totprice += Integer.parseInt(price);
			session.setAttribute("TOTALPRICE", totprice);
			req.setAttribute("SUC_FAIL", 1);
			req.setAttribute("WHERE", "SID");
			
			url= "/WEB-INF/Pizza/view/Addr/Message.jsp";
			
		}
		else {/// 매장 선택 안 되었을경우 매장선택으로
			if(req.getParameter("reset")!=null)
			{
			session.setAttribute("BUYLIST", null);	
			session.setAttribute("BUYNUM", null);	
			session.setAttribute("DE_ADDR",null);
			session.setAttribute("ST_NO", null);
			session.setAttribute("ST_NAME", null);
			session.setAttribute("ST_TEL", null);
			session.setAttribute("DE_NO", null);
			}
			
		List<StoresDTO> list = new Vector<StoresDTO>();
		list = service.deladdrprint(map);
		System.out.println("???");
		model.addAttribute("list",list);
		url = "/WEB-INF/Pizza/view/Addr/AddrSelect.jsp";
		}
		
		return url;
		
	}
	
	
	//음료 피클 장바구니에 저장
	@RequestMapping("/DrinkPncBuy.pz")
	public String DrinkPncBuy(@RequestParam Map map, Model model,HttpServletRequest req , HttpSession session) throws Exception{
		String id = session.getAttribute("ID").toString();
		map.put("id", id);
		String where="";
		String from="";
		if(session.getAttribute("DE_NO")!=null && req.getParameter("reset")==null) {
			if(req.getParameter("kind").equals("3")) {
				//음료
				from = " DRINK ";
				where = " D_NO = ";
				
			}
			else if(req.getParameter("kind").equals("4")) {
				//피클
				from = " PICKLE ";
				where = " pc_no = ";
				
			}
			else if(req.getParameter("kind").equals("5")) {
				//소스
				from = " sauce ";
				where = " sc_no =  ";
				
			}
			map.put("from", from);
			
			
			
		}else {/// 매장 선택 안 되었을경우 매장선택으로
			if(req.getParameter("reset")!=null)
			{
			session.setAttribute("BUYLIST", null);	
			session.setAttribute("BUYNUM", null);	
			session.setAttribute("DE_ADDR",null);
			session.setAttribute("ST_NO", null);
			session.setAttribute("ST_NAME", null);
			session.setAttribute("ST_TEL", null);
			session.setAttribute("DE_NO", null);
			}
			
		List<StoresDTO> list = new Vector<StoresDTO>();
		list = service.deladdrprint(map);
		System.out.println("???");
		model.addAttribute("list",list);
		}
		
		return "";
	}
	

	@RequestMapping("/SelectAddrFrame.pz")
	public String AddrSelectFrame(@RequestParam Map map, Model model, HttpServletRequest req) throws Exception{
	
		
		return "/WEB-INF/Pizza/view/Addr/AddrSelectFrame.jsp";
		
	}

	@RequestMapping("/AddrIn.pz")
	public String AddrIn(@RequestParam Map map, Model model,HttpSession session ,HttpServletRequest req) throws Exception{
		String pos = map.get("ret").toString();
		String addr = map.get("addr").toString();
		String xposs=pos.replace(")", "").replace("(", "").split(",")[0].trim();
		String yposs=pos.replace(")", "").replace("(", "").split(",")[1].trim();
		String kind = "1";
		System.out.println("x:"+xposs+" y:"+yposs);
		float xpos = Float.parseFloat(xposs);
		float ypos = Float.parseFloat(yposs);
		System.out.println(xpos);
		System.out.println(ypos);
		StoresDTO dto = service.deladdrsel(map);
		System.out.println("성공한듯???");
		int result = 0 ;
		model.addAttribute("WHERE","INS");
		if(dto!=null) {
		System.out.println(dto.getSt_name());
		System.out.println(dto.getSt());
		String id = session.getAttribute("ID").toString();
		map.put("id", id);
		map.put("st_no", dto.getSt_no());
		map.put("kind", kind);
		map.put("st_addr", dto.getSt_addr());
		result = service.deladdrin(map);
		}
		if(result==1) {
			System.out.println("입력성공");
			model.addAttribute("SUC_FAIL","1");
		}else {
			model.addAttribute("SUC_FAIL","0");
		}
		return "/WEB-INF/Pizza/view/Addr/Message.jsp";
	}
	
	
	//장바구니 삭제
	
	@RequestMapping("/sessionDelete.pz")
	public String sessionDelete(@RequestParam Map map,HttpServletRequest req, HttpSession session) {
		List<BasketDTO> list = (List<BasketDTO>)session.getAttribute("BUYLIST");
		int idx = Integer.parseInt(map.get("idx").toString());
		list.remove(idx-1);
		session.setAttribute("BUYLIST", list);
		session.setAttribute("BUYNUM", list.size()==0?null:list.size());
		return "/WEB-INF/Pizza/view/Menu/Basket.jsp";		
	}
	
	@RequestMapping("/SessionInDel.pz")
	public String sessionInDel(@RequestParam Map map,HttpServletRequest req, HttpSession session) {
		String de_no = map.get("de_no").toString();
		
		StoresDTO dto =  service.sessionInDel(map);
		
		session.setAttribute("DE_ADDR", dto.getDe_addr());
		session.setAttribute("ST_NO", dto.getSt_no());
		session.setAttribute("ST_NAME", dto.getSt_name());
		session.setAttribute("ST_TEL", dto.getSt_tel());
		
		int res=0;
		session.setAttribute("DE_NO", de_no);
		if(de_no!=null)
			res=2;
		
		req.setAttribute("SUC_FAIL", res);
		req.setAttribute("WHERE", "SID");
		return "/WEB-INF/Pizza/view/Addr/Message.jsp";
	}
	
	@RequestMapping("/GoBasket.pz")
	public String GoBasket(@RequestParam Map map,HttpServletRequest req, HttpSession session) {

		return "/WEB-INF/Pizza/view/Menu/Basket.jsp";
	}
	
	@RequestMapping("/CouponLay.pz")
	public String CallLay(@RequestParam Map map,HttpServletRequest req, HttpSession session) {
		String id = session.getAttribute("ID").toString();
		map.put("id", id);
		System.out.println(id);
		List<SaileCouponDTO> list = new Vector<SaileCouponDTO>();
		list = service.callcoupon(map);
		req.setAttribute("Slist", list);
		System.out.println(list.get(0).getC_name());
		return "/WEB-INF/Pizza/view/Menu/CouponLay.jsp";
	}
	
	
	@RequestMapping("/LastOrder.pz")
	public String LastOrder(@RequestParam Map map,HttpServletRequest req, HttpSession session) {
		int len=0;
		List<BasketDTO> list = new Vector<BasketDTO>();
		System.out.println("@!#@!#$@!$!@$");
		if(map.get("lengths")!=null)
		len = Integer.parseInt(map.get("lengths").toString());
		System.out.println(len);
		int k=0;
		int totalPrice=0;
		list = (List<BasketDTO>)session.getAttribute("BUYLIST");
		for(int i=1 ; i<=len ; i++) {
			list.get(k).setQty(map.get("qty"+i).toString());
			list.get(k).setPrice(map.get("price"+i).toString());
			System.out.println(list.get(k).getPrice());
			totalPrice+=Integer.parseInt(list.get(k).getPrice());
			k++;
		}
		UserDto userdto = callUser(session.getAttribute("ID").toString());
		System.out.println(userdto.getName());
		req.setAttribute("callUser", userdto);
		req.setAttribute("Flist", list);
		session.setAttribute("BUYLIST", list);
		req.setAttribute("totalprice", totalPrice);
		
		return "/WEB-INF/Pizza/view/Menu/info.jsp";
	}
	
	
	
	public UserDto callUser(String id) {
		UserDto dto = new UserDto();
		Map map = new HashMap<>();
		map.put("id", id);
		dto = service.callUser(map);
		
		return dto;
	}
	
	
	
	//하프앤하프 & 마이키친 메뉴 - 토핑 리스트 출력용
	@RequestMapping(value="/Pizza/BuyPizza/toppingLayer_LEJ.pz", produces="text/html; charset=UTF-8")
	public String toppingList() throws Exception{
/*		List<ToppingDTO> toppinglist = toppService.selectAddToppingList();
		List<Map> list = new Vector<Map>();
		Map map =null;
		for(ToppingDTO dto : toppinglist) {
			map = new HashMap();
			map.put( "topping_name", dto.getT_name());
			map.put( "topping_gram", dto.getT_gram());
			map.put( "topping_img", dto.getT_img());
			map.put( "topping_kind", dto.getT_kind());
			map.put( "topping_price", dto.getT_price());
			map.put( "topping_size", dto.getT_size());
			list.add(map);
		}*/
		//return JSONArray.toJSONString(list);
		//return "/WEB-INF/Pizza/view/BuyPizza/toppingLayer.jsp";
		return "/WEB-INF/Pizza/view/BuyPizza/toppingLayer_LEJ.jsp";
	}	
	
	
	
}
