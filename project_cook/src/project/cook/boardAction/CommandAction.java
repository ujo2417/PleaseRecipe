package project.cook.boardAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//��û �Ķ���ͷ� ��ɾ �����ϴ� ����� ���� �������̽�
//super interface - ������ : �ڼ�Ŭ�������� ����....
public interface CommandAction {
	
	public String process(HttpServletRequest request, 
			HttpServletResponse response) throws Throwable;
}
