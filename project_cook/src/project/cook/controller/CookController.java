package project.cook.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//super interface import 
import project.cook.boardAction.CommandAction;

//게시판 시작점(진입점)
public class CookController extends HttpServlet {

	private Map commandMap = new HashMap();
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			process(request, response);
		} catch (Throwable e) {
			e.printStackTrace();
		}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			process(request, response);
		} catch (Throwable e) {
			e.printStackTrace();
		}
	}
	
	//초기화 - 1회 호출됨
	//명령어와 명령어처리 클래스가 매핑되어 있는 properties 파일을 읽어서 저장하는 역할...
	@Override
	public void init(ServletConfig config) throws ServletException {
		//web.xml에서 propertyConfig에 해당하는 init-param의 값을 읽어옴
		String props = config.getInitParameter("setingConfig");
		//명령어와 처리클래스의 매핑정보를 저장할 Properties 객체 생성
		Properties pr = new Properties();
		FileInputStream  f = null;
		
		try {
			//Command.properties 파일의 내용을 읽어옴
			f = new FileInputStream(props); 
			//Command.properties 파일의 정보를 Properties 객체에 저장
			pr.load(f); 
			
		} catch (Exception e) {
			throw new ServletException();
		} finally {
			if( f != null) try { f.close(); } catch(Exception e) { }
		} //try end
		
		Iterator  keyIter = pr.keySet().iterator();
		
		while( keyIter.hasNext() ){
			String command = (String)keyIter.next();
			//properties 파일의 명령처리 부분을 받아온다.(클래스형태임...)
			String className = pr.getProperty(command); //value : edu.kosta.controller.MessageProcess
			//MessageProcess mp = new MessageProcess();
			
			try {
				//forName()은 문자열을 클래스로 변환...
				Class commandClass = Class.forName(className);
				//클래스로 변환시켰기 때문에 객체 생성함...
				Object commandInstance = commandClass.newInstance();
				commandMap.put(command, commandInstance);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		} //end while
	}
	
	protected void process(HttpServletRequest request, HttpServletResponse response)
			throws Throwable {
		String view = null;
		CommandAction cp =null;
		
		try {
			String command = request.getRequestURI();
			System.out.println("command : " + command); // command : /boardMVC/list.do
			System.out.println("request.getContextPath() :"  + request.getContextPath());  //  /boardMVC
			
			if( command.indexOf(request.getContextPath()) == 0 ) {  //경로가 없다면
				command = command.substring(request.getContextPath().length() + 1);  //    /boardMVC/
				System.out.println("if command : " + command);  //if command : list.do
			} //end if
			
			cp = (CommandAction)commandMap.get(command);
			System.out.println("cp : " + cp);  // cp : com.kosta.boardController.~~~
			view = cp.process(request, response);
			System.out.println("view : " + view); //   /board/list.jsp
			
	} catch (Exception e) {
			throw new ServletException(e);
	} //end try
		
		request.setAttribute("CONTENT", view);  //추가...
		
		RequestDispatcher dp = request.getRequestDispatcher("/decanter/template.jsp"); //수정...
		dp.forward(request, response);
	}

}