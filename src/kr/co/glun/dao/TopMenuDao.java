package kr.co.glun.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.glun.beans.BoardInfoBean;
import kr.co.glun.mapper.TopMenuMapper;

//@Repository는 @Component와 동일하나 역할 명시를 하기위해! DAO 역할을 하는 클래스들은
//@Repository를 이용해서 등록한다.
@Repository
public class TopMenuDao {

	@Autowired
	private TopMenuMapper topMenuMapper;
	
	public List<BoardInfoBean> getTopMenuList(){
		List<BoardInfoBean> topMenuList = topMenuMapper.getTopMenuList();
		return topMenuList;
	} 
	
}
