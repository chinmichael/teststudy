package com.shop.controll;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import DBPKG.*;

@WebServlet("/Regist.do")
public class RegistServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public RegistServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		int custno = Integer.parseInt(request.getParameter("custno"));
		String custname = request.getParameter("custname");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		String joindate = request.getParameter("joindate");
		String grade = request.getParameter("grade");
		String city = request.getParameter("city");
		
		MemberVO mvo = new MemberVO();
		mvo.setCustno(custno);
		mvo.setCustname(custname);
		mvo.setPhone(phone);
		mvo.setAddress(address);
		mvo.setJoindate(joindate);
		mvo.setGrade(grade);
		mvo.setCity(city);
		
		ShopDAO dao = ShopDAO.getInstance();
		
		int result = dao.insertMember(mvo);
		
		request.setAttribute("result", result);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("member/registForm.jsp");
		dispatcher.forward(request, response);
	}

}
