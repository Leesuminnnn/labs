package com.nnn.app.interceptor;
import java.net.URLDecoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
import org.springframework.web.servlet.HandlerInterceptor;

import com.nnn.app.vo.MemberVo;


public class LoginInterceptor implements HandlerInterceptor{
	// HandlerInterceptor 인터페이스에서 JDK8 이후부터는 3개의 메소드를 디폴트 메소드로 정의해 둠
	// preGandle(), postHandle(), afterCompletion()
	// 이들 가운데 필요한 메소드를 Override해서 사용함
		
	@Override	// 사용자 요청이 Controller로 전달되기 전에 요청을 가로채어서 메소드 실행
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		String email = (String)session.getAttribute("email");
//		MemberVo memberVo = new MemberVo();
		
		if(email == null) {
			System.out.println("#########################");
			System.out.println("로그인을 하지 않음");
			String previousUrl = request.getHeader("referer");
			if(previousUrl != null) {
				String decoderUrl = URLDecoder.decode(previousUrl, "UTF-8");

				session.setAttribute("decoderUrl : ", decoderUrl);
			}
			Map<String, String[]> params = request.getParameterMap();
			session.setAttribute("previousUrl : ", previousUrl);
			session.setAttribute("params", params);
			try {
				/*
				 	파라미터 값들을 받아서 변수에 저장하고, 세션에 저장
				*/
				String h_name = (String)request.getParameter("h_name");
				String h_no = (String)request.getParameter("h_no");
				String h_number = (String)request.getParameter("h_number");
				session.setAttribute("h_name", h_name);
				session.setAttribute("h_no", h_no);
				session.setAttribute("h_number", h_number);
				System.out.println("h_name : "+ h_name);
				System.out.println("h_no : "+ h_no);
				System.out.println("h_number : "+ h_number);
				
			}catch (NumberFormatException e)  {
				
			}catch (Exception e) {
				// TODO: handle exception
			}
			
			
			
			
			System.out.println("#########################");
			System.out.println("previousUrl : "+previousUrl);
			
			System.out.println("params : "+params);
			System.out.println("#########################");
			response.sendRedirect(request.getContextPath()+"/m/Login.do"); 
			return false;	// Controller로 사용자 요청이 전달되지 못하도록 함
		}
		
		
		
		
		return true;	// Controller로 사용자 요청이 전달되게 함
	}
	
	
	
	
	
}
