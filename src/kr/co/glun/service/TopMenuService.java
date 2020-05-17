package kr.co.glun.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.glun.beans.BoardInfoBean;
import kr.co.glun.dao.TopMenuDao;

//@Service는 @Component와 동일하나 역할 명시를 하기위해! Service 역할을 하는 클래스들은
//@Service를 이용해서 등록한다.
@Service
public class TopMenuService {

	@Autowired
	private TopMenuDao topMenuDao;
	
	public List<BoardInfoBean> getTopMenuList(){
		List<BoardInfoBean> topMenuList = topMenuDao.getTopMenuList();
		return topMenuList;
	}
}
