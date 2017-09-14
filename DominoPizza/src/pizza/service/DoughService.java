package pizza.service;

import java.util.List;
import java.util.Map;

public interface DoughService {
	//목록용]
	List<DoughDTO> selectList();
	//상세보기용]
	DoughDTO selectOne(DoughDTO dto);
	//입력/수정/삭제용]
	int insert(DoughDTO dto);
	int update(DoughDTO dto);
	int delete(DoughDTO dto);
}
