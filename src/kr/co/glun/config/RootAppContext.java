package kr.co.glun.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.context.annotation.SessionScope;

import kr.co.glun.beans.UserBean;

// 프로젝트 작업 시 사용할 Bean을 정의하는 클래스
@Configuration
public class RootAppContext {
		
	@Bean("loginUserBean")
	@SessionScope
	// UserBean을 한곳에서만 쓴다고 하면 클래스 자체에다가 이름을 컴포넌트로 등록하면서 해도 되지만
	// 다양한 목적으로 사용해야하기에 RootAppContext에 등록한다.
	public UserBean loginUserBean() {
		return new UserBean();
	}
	
}
	
