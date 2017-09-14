package pizza.service;

import java.util.List;
import java.util.Map;

public interface PizzaSauceService {
	//목록용]
	List<PizzaSauceDTO> selectList();
	//상세보기용]
	PizzaSauceDTO selectOne(PizzaSauceDTO dto);
	//입력/수정/삭제용]
	int insert(PizzaSauceDTO dto);
	int update(PizzaSauceDTO dto);
	int delete(PizzaSauceDTO dto);
	
}
