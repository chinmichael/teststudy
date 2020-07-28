package com.shop.controll;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DBPKG.MemberVO;
import DBPKG.ShopDAO;

@WebServlet("/Update.do")
public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public UpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
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
		
		MemberVO mv = new MemberVO();
		mv.setCustno(custno);
		mv.setCustname(custname);
		mv.setPhone(phone);
		mv.setAddress(address);
		mv.setJoindate(joindate);
		mv.setGrade(grade);
		mv.setCity(city);
		
		ShopDAO dao = ShopDAO.getInstance();
		
		int result = dao.updateMember(mv);
		
		request.setAttribute("result", result);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("member/changeForm.jsp");
		dispatcher.forward(request, response);
	}

}
