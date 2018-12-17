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

//�Խ��� ������(������)
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
	
	//�ʱ�ȭ - 1ȸ ȣ���
	//��ɾ�� ��ɾ�ó�� Ŭ������ ���εǾ� �ִ� properties ������ �о �����ϴ� ����...
	@Override
	public void init(ServletConfig config) throws ServletException {
		//web.xml���� propertyConfig�� �ش��ϴ� init-param�� ���� �о��
		String props = config.getInitParameter("setingConfig");
		//��ɾ�� ó��Ŭ������ ���������� ������ Properties ��ü ����
		Properties pr = new Properties();
		FileInputStream  f = null;
		
		try {
			//Command.properties ������ ������ �о��
			f = new FileInputStream(props); 
			//Command.properties ������ ������ Properties ��ü�� ����
			pr.load(f); 
			
		} catch (Exception e) {
			throw new ServletException();
		} finally {
			if( f != null) try { f.close(); } catch(Exception e) { }
		} //try end
		
		Iterator  keyIter = pr.keySet().iterator();
		
		while( keyIter.hasNext() ){
			String command = (String)keyIter.next();
			//properties ������ ���ó�� �κ��� �޾ƿ´�.(Ŭ����������...)
			String className = pr.getProperty(command); //value : edu.kosta.controller.MessageProcess
			//MessageProcess mp = new MessageProcess();
			
			try {
				//forName()�� ���ڿ��� Ŭ������ ��ȯ...
				Class commandClass = Class.forName(className);
				//Ŭ������ ��ȯ���ױ� ������ ��ü ������...
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
			
			if( command.indexOf(request.getContextPath()) == 0 ) {  //��ΰ� ���ٸ�
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
		
		request.setAttribute("CONTENT", view);  //�߰�...
		
		RequestDispatcher dp = request.getRequestDispatcher("/decanter/template.jsp"); //����...
		dp.forward(request, response);
	}

}