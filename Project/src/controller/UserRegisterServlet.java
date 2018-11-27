package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDao;
import model.User;

/**
 * Servlet implementation class UserRegisterServlet
 */
@WebServlet("/UserRegisterServlet")
public class UserRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserRegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/userRegister.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		String oldPassword = request.getParameter("password");
		String isPassword = request.getParameter("isPassword");
		String name = request.getParameter("name");
		String birthDate = request.getParameter("birthDate");

		UserDao userDao = new UserDao();
		User isId = userDao.findUser(id);
		if (isId != null || !oldPassword.equals(isPassword) || id == "" || oldPassword == "" || isPassword == "" || name == "" || birthDate == "") {
			// リクエストスコープにエラーメッセージをセット
			request.setAttribute("errMsg", "入力された内容は正しくありません");

			// ログインjspにフォワード
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/userRegister.jsp");
			dispatcher.forward(request, response);
			return;
		}
		String password = userDao.setPassword(oldPassword);
		userDao.register(id, password, name, birthDate);

		response.sendRedirect("UserListServlet");
	}
}
