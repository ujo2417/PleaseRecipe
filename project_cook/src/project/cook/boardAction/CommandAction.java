package project.cook.boardAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//요청 파라미터로 명령어를 전달하는 방식의 수퍼 인터페이스
//super interface - 시작점 : 자손클래스들을 만들어냄....
public interface CommandAction {
	
	public String process(HttpServletRequest request, 
			HttpServletResponse response) throws Throwable;
}
