package pizza.service;

import java.util.List;
import java.util.Map;

public interface ToppingService {
	//목록용]
	List<ToppingDTO> selectList(); //내맘대로피자-추가토핑안내
	List<ToppingDTO> selectAddToppingList(); //내맘대로피자-하프앤하프-토핑추가하기
	List<ToppingDTO> selectToppingallergyList(); //토핑 알레르기 유발성분 출력용
	//상세보기용]
	ToppingDTO selectOne(ToppingDTO dto);
	//입력/수정/삭제용]
	int insert(ToppingDTO dto);
	int update(ToppingDTO dto);
	int delete(ToppingDTO dto);
}
