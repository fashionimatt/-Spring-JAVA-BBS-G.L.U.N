package kr.co.glun.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import kr.co.glun.beans.UserBean;

public class UserValidator implements Validator{

	@Override
	public boolean supports(Class<?> clazz) {
		// TODO Auto-generated method stub
		return UserBean.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		// TODO Auto-generated method stub
		UserBean userBean = (UserBean) target;
		
		String beanName = errors.getObjectName();
		
		if(beanName.equals("joinUserBean") || beanName.equals("modifyUserBean")) {
			if(userBean.getUser_pw().equals(userBean.getUser_pw2()) == false) {
				errors.rejectValue("user_pw2", "NotEquals");
			}
		}
		
		if(beanName.equals("joinUserBean")) {
			// 회원 가입 시 사용하기 위해 만들어둔 유효성 검사가 로그인 절차에도 적용되며 오류 발생
			// -> 로그인 시에는 아이디 중복 확인이 필요없음
			// 
			if(userBean.isUserIdExist() == false) {
				errors.rejectValue("user_id", "NotCheckUserIdExist");
			}
		}
	}
}
