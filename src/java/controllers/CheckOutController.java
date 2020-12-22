/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import daos.BookDAO;
import daos.OrderDAO;
import dtos.*;

import java.io.IOException;
import java.sql.Timestamp;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * @author baoph
 */
public class CheckOutController extends HttpServlet {
    private static final String ERROR = "invalid.jsp";
    private static final String SUCCESS = "EmailSendingController";

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        BookDAO bookDAO = new BookDAO();
        HttpSession session = request.getSession();
        CartDTO cartDTO = (CartDTO) session.getAttribute("CART");
        try {
            OrderDAO dao = new OrderDAO();
            UserDTO user = (UserDTO) request.getSession().getAttribute("MEMBER");
            String userGoogle = String.valueOf(request.getSession().getAttribute("GOOGLE"));
            if (user == null && userGoogle.equals("null")) {
                request.setAttribute("MESSAGE", "You need to login to continue");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            } else if (!userGoogle.equals("null")) {
                String googleEmail = request.getParameter("googleEmail");
                String googleName = request.getParameter("googleName");
                String googleAddress = request.getParameter("googleAddress");
                String googlePhoneNumber = request.getParameter("googlePhone");
                Timestamp orderDate = new Timestamp(System.currentTimeMillis());
                float totalPrice = (float) session.getAttribute("TOTAL");
                OrderDTO dto = new OrderDTO(0, googleName, googleAddress, googlePhoneNumber, googleEmail, orderDate, totalPrice, null);
                dao.createOrder(dto);
                for (BookDTO book : cartDTO.getCart().values()) {
                    int bookID = book.getBookID();
                    int bookQuantity = bookDAO.getQuantityByBookID(bookID);
                    float price = book.getBookPrice();
                    int cartQuantity = book.getCartQuantity();
                    int orderID = dao.getOrderID();
                    if (bookQuantity > cartQuantity) {
                        OrderDAO orderDAO = new OrderDAO();
                        OrderDetailDTO orderDetailDTO = new OrderDetailDTO(0, price, cartQuantity, orderID, bookID);
                        orderDAO.createOrderDetail(orderDetailDTO);
                        bookDAO.updateBookQuantity(bookID, bookQuantity - cartQuantity);
                    }
                }
                session.setAttribute("NUM", null);
                session.setAttribute("TOTAL", null);
                session.setAttribute("CART", null);
                url = SUCCESS;
            } else {
                String email = user.getEmail();
                String name = user.getName();
                String address = user.getAddress();
                String phoneNumber = user.getPhoneNumber();
                Timestamp orderDate = new Timestamp(System.currentTimeMillis());
                String userID = user.getUserID();
                float totalPrice = (float) session.getAttribute("TOTAL");
                OrderDTO dto = new OrderDTO(0, name, address, phoneNumber, email, orderDate, totalPrice, userID);
                dao.createOrder(dto);
                for (BookDTO book : cartDTO.getCart().values()) {
                    int bookID = book.getBookID();
                    int bookQuantity = bookDAO.getQuantityByBookID(bookID);
                    float price = book.getBookPrice();
                    int cartQuantity = book.getCartQuantity();
                    int orderID = dao.getOrderID();
                    if (bookQuantity > cartQuantity) {
                        OrderDAO orderDAO = new OrderDAO();
                        OrderDetailDTO orderDetailDTO = new OrderDetailDTO(0, price, cartQuantity, orderID, bookID);
                        orderDAO.createOrderDetail(orderDetailDTO);
                        bookDAO.updateBookQuantity(bookID, bookQuantity - cartQuantity);
                    }
                }
                session.setAttribute("NUM", null);
                session.setAttribute("TOTAL", null);
                session.setAttribute("CART", null);
                url = SUCCESS;
            }
        } catch (Exception e) {
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">

    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
