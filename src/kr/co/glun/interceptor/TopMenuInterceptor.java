package kr.co.glun.interceptor;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;

import kr.co.glun.beans.BoardInfoBean;
import kr.co.glun.beans.UserBean;
import kr.co.glun.service.TopMenuService;

public class TopMenuInterceptor implements HandlerInterceptor{
	
	// Interceptor에서는 자동 주입을 통한 Bean의 주입이 불가하다
	// Interceptor에서 사용할 객체는 Interceptor를 등록하는 쪽에서 Bean을 주입 받은 다음 생성자로 넘겨야 한다.
//	@Autowired
	private TopMenuService topMenuService;
	private UserBean loginUserBean;
	
	public TopMenuInterceptor(TopMenuService topMenuService, UserBean loginUserBean) {
		this.topMenuService = topMenuService;
		this.loginUserBean = loginUserBean;
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		List<BoardInfoBean> topMenuList = topMenuService.getTopMenuList();
		request.setAttribute("topMenuList", topMenuList);
		request.setAttribute("loginUserBean", loginUserBean);
		
		return true;
	}

}
