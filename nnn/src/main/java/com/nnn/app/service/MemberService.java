package com.nnn.app.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.nnn.app.dao.MemberDao;
import com.nnn.app.vo.CustomerVo;
import com.nnn.app.vo.MemberVo;

@Service
public class MemberService {

	private MemberDao memberDao;

	@Autowired
	public MemberService(MemberDao memberDao) {
		this.memberDao = memberDao;
	}
	
	
	// 회원정보 보기
	public MemberVo detail(Integer midx) {
		return memberDao.detail(midx);
	}
	public void detailAction(MemberVo memberVo) {
		memberDao.detailAction(memberVo);
	}
	public MemberVo detail2(String m_name) {
		return memberDao.detail2(m_name);
	}
	// 로그인 예시
	public MemberVo login(MemberVo memberVo) {
		return memberDao.login(memberVo);
	}
	// 시연용
	public CustomerVo login2(CustomerVo vo) {
		return memberDao.login2(vo);
	}
	public List<MemberVo> Memberlist(MemberVo vo) {

		return memberDao.Memberlist(vo);
	}
	// 시연용
	public List<CustomerVo> Memberlist2(CustomerVo vo) {

		return memberDao.Memberlist2(vo);
	}
	public int selectMember(Integer midx) {
		return memberDao.memberSelect(midx);
	}

	public void approveMember(Integer midx) {
		memberDao.approve(midx);

	}

	public String getAccessTokenFromCookie(HttpServletRequest request) {
	    String access_Token = null;

	    // Retrieve the access token from the cookie
	    Cookie[] cookies = request.getCookies();
	    if (cookies != null) {
	        for (Cookie cookie : cookies) {
	            if (cookie.getName().equals("access_token")) {
	                access_Token = cookie.getValue();
	                break;
	            }
	        }
	    }

	    return access_Token;
	}
	
	
	// 카카오 로그인 서비스
	public String getAccessToken(String authorize_code) {
		String access_Token = "";
		String refresh_Token = "";
		String reqURL = "https://kauth.kakao.com/oauth/token";
//		HttpServletRequest request = new HttpServletRequest();
//		String now_addres = javax.servlet.http.HttpUtils.getRequestURL(request).toString();
		System.out.println("########################");
//		System.out.println("now_addres : "+now_addres);
		
		
		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();

			// POST 요청을 위해 기본값이 false인 setDoOutput을 true로
			conn.setRequestMethod("POST");
			conn.setDoOutput(true);

			// POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			StringBuilder sb = new StringBuilder();
			sb.append("grant_type=authorization_code");
			sb.append("&client_id=ecfda70a16078a6b5a64478901f3dfb3");
			
			sb.append("&redirect_uri=http://localhost:8090/app/m/kakao/callback");			//로컬사이트
//			sb.append("&redirect_uri=http://csworktools.cafe24.com/m/kakao/callback");		//cswork
//			sb.append("&redirect_uri=https://hwtools.kr/m/kakao/callback");					//hwtools(https)
			sb.append("&code=" + authorize_code);
			bw.write(sb.toString());
			bw.flush();
			
			// 결과 코드가 200이라면 성공
			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);

			// 요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = "";
			String result = "";

			while ((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println("response body : " + result);

			// Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성

			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);
//			JsonArray array = new Gson().fromJson("JsonArray 문자열", JsonArray.class);
			access_Token = element.getAsJsonObject().get("access_token").getAsString();
			refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();

			System.out.println("access_token : " + access_Token);
			System.out.println("refresh_token : " + refresh_Token);

			br.close();
			bw.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return access_Token;
	}

	public HashMap<String, Object> getUserInfo(String access_Token) {

		
		// 요청하는 클라이언트마다 가진 정보가 다를 수 있기에 HashMap타입으로 선언
		HashMap<String, Object> userInfo = new HashMap<>();
		String reqURL = "https://kapi.kakao.com/v2/user/me";
		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("POST");

			// 요청에 필요한 Header에 포함될 내용
			conn.setRequestProperty("Authorization", "Bearer " + access_Token);

			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);

			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

			String line = "";
			String result = "";

			while ((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println("response body : " + result);

			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);

			JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
			JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();

			String nickname = properties.getAsJsonObject().get("nickname").getAsString();
			String email = kakao_account.getAsJsonObject().get("email").getAsString();
			
			// userInfo는 HashMap
			userInfo.put("nickname", nickname);
			userInfo.put("email", email);
			System.out.println("userInfo HashMap : "+userInfo);
			
			//메퍼로 넘기기?
			//memberDao.insert(userInfo);
			
			

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return userInfo;
	}


	public void kakaoLogout(String access_Token) {
	    String reqURL = "https://kapi.kakao.com/v1/user/logout";
	    try {
	        URL url = new URL(reqURL);
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("POST");
	        conn.setRequestProperty("Authorization", "Bearer " + access_Token);
	        
	        int responseCode = conn.getResponseCode();
	        System.out.println("responseCode : " + responseCode);
	        
	        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        
	        String result = "";
	        String line = "";
	        
	        while ((line = br.readLine()) != null) {
	            result += line;
	        }
	        System.out.println(result);
	    } catch (IOException e) {
	        // TODO Auto-generated catch block
	        e.printStackTrace();
	    }
	}

	public void getKakaoInfo(MemberVo vo) {
		memberDao.getKakaoInfo(vo);
	}
	
	
	
	
	// 시연용
	public void getKakaoInfo2(CustomerVo vo) {
		memberDao.getKakaoInfo2(vo);
	}
	
	public MemberVo getMemberByEmail(String email) {
	    return memberDao.getMemberByEmail(email);
	}
	public CustomerVo getMemberByEmail2(String email) {
	    return memberDao.getMemberByEmail2(email);
	}
	
	public void updatePoint(Map<String, Object> map) {
		memberDao.updatePoint(map);
	}

	// 회원정보 보기
	public CustomerVo detail3(String m_name) {
		return memberDao.detail3(m_name);
	}
	public CustomerVo detail4(Integer midx) {
		return memberDao.detail4(midx);
	}
	// 회원정보 수정
	public void detailAction2(CustomerVo vo) {
		memberDao.detailAction2(vo);
	}

	
}
