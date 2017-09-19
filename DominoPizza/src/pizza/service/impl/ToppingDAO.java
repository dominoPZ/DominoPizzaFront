package pizza.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import pizza.service.ToppingDTO;
import pizza.service.ToppingService;

@Repository
public class ToppingDAO implements ToppingService{
	@Resource(name="template")
	private SqlSessionTemplate template;
	@Override
	public List<ToppingDTO> selectList() {
		return template.selectList("ToppingSelectList");
	}
	
	@Override
	public List<ToppingDTO> selectAddToppingList(Map map) {
		return template.selectList("addToppingSelectList", map);
	}
	
	@Override
	public List<ToppingDTO> selectToppingNameList(Map map) {
		return template.selectList("toppingNameSelectList", map);
	}
	
	
	@Override
	public List<ToppingDTO> selectToppingKindList() {
		return template.selectList("toppingKindSelectList");
	}

	@Override
	public ToppingDTO selectOne(ToppingDTO dto) {
		
		return null;
	}

	@Override
	public int insert(ToppingDTO dto) {
		
		return 0;
	}

	@Override
	public int update(ToppingDTO dto) {
		
		return 0;
	}

	@Override
	public int delete(ToppingDTO dto) {
		
		return 0;
	}

	@Override
	public List<ToppingDTO> selectToppingallergyList() {
		return template.selectList("toppingAllergySelectList");
	}
	
}
