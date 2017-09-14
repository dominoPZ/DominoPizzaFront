package pizza.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import pizza.service.PizzaSauceDTO;
import pizza.service.PizzaSauceService;
@Service("pizzaSauceService")
public class PizzaSauceServiceImpl implements PizzaSauceService {
	@Resource(name="pizzaSauceDAO")
	private PizzaSauceDAO dao;

	@Override
	public List<PizzaSauceDTO> selectList() {
		return dao.selectList();
	}

	@Override
	public PizzaSauceDTO selectOne(PizzaSauceDTO dto) {
		return dao.selectOne(dto);
	}

	@Override
	public int insert(PizzaSauceDTO dto) {
		return dao.insert(dto);
	}

	@Override
	public int update(PizzaSauceDTO dto) {
		return dao.update(dto);
	}

	@Override
	public int delete(PizzaSauceDTO dto) {
		return dao.delete(dto);
	}
	
}
