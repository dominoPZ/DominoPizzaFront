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
import pizza.service.StoresDTO;
import pizza.service.impl.Daotest;
import pizza.service.impl.ServiceImpl;

@Controller
public class Order {


	@Resource(name="service")
	private ServiceImpl service;
	
	@RequestMapping("/AddrSelect.pz")
	public String AddrSelect(@RequestParam Map map, Model model,HttpServletRequest req , HttpSession session) throws Exception{
		String id = session.getAttribute("ID").toString();
		map.put("id", id);
		String url="";
		if(session.getAttribute("DE_NO")!=null) {

			BasketDTO dto = new BasketDTO();
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
			dto.setQty(map.get("qty").toString());
			dto.setSize(map.get("size").toString().toUpperCase().contains("L")?"L":"M");
			dto.setTopping(map.get("topping").toString());
			dto.setKind(map.get("kind").toString());
			dto.setDoughno(map.get("doughno").toString());
			List<BasketDTO> list = new Vector<>();
			if(session.getAttribute("BUYLIST")!=null)
			list=(List<BasketDTO>)session.getAttribute("BUYLIST");
			list.add(dto);
			req.setAttribute("list", list);
			session.setAttribute("BUYLIST", list);
			session.setAttribute("BUYNUM", list.size());
			req.setAttribute("SUC_FAIL", 1);
			req.setAttribute("WHERE", "SID");
			
			url= "/WEB-INF/Pizza/view/Addr/Message.jsp";
			
		}else {
		List<StoresDTO> list = new Vector<StoresDTO>();
		list = service.deladdrprint(map);
		System.out.println("???");
		model.addAttribute("list",list);
		url = "/WEB-INF/Pizza/view/Addr/AddrSelect.jsp";
		}
		
		return url;
		
	}

	@RequestMapping("SelectAddrFrame.pz")
	public String AddrSelectFrame(@RequestParam Map map, Model model, HttpServletRequest req) throws Exception{
	
		
		return "/WEB-INF/Pizza/view/Addr/AddrSelectFrame.jsp";
		
	}

	@RequestMapping("AddrIn.pz")
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
	
	@RequestMapping("/SessionInDel.pz")
	public String sessionInDel(@RequestParam Map map,HttpServletRequest req, HttpSession session) {
		String de_no = map.get("de_no").toString();
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
	
	
	
}
