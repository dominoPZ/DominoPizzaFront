package pizza.service;

import java.util.List;
import java.util.Map;

public interface MyPizzaService {
	//목록용]
	List<MyPizzaDTO> selectList();
	List<MyPizzaDTO> selectSecondPizzaList(MyPizzaDTO dto);
	//상세보기용]
	String hnhAddPriceSelectOne(Map map);
	MyPizzaDTO selectOne(MyPizzaDTO dto);
	//입력/수정/삭제용]
	int insert(MyPizzaDTO dto);
	int update(MyPizzaDTO dto);
	int delete(MyPizzaDTO dto);
	
}
