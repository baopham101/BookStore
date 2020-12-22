/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author baoph
 */
public class MainController extends HttpServlet {
    private static final String REGISTER = "RegisterController";
    private static final String LOGIN = "LoginController";
    private static final String LOGOUT = "LogoutController";
    private static final String ERROR = "invalid.jsp";
    private static final String ADD_BOOK = "AddBookController";
    private static final String DETAIL = "DetailController";
    private static final String SEARCH = "HomeController";
    private static final String UPDATE_BOOK = "UpdateController";
    private static final String DELETE_BOOK = "DeleteController";
    private static final String ADD_TO_CART = "AddToCartController";
    private static final String DELETE_CART = "DeleteCartController";
    private static final String UPDATE_CART = "UpdateCartController";
    private static final String CHECKOUT = "CheckOutController";

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
        try {
            String action = request.getParameter("btnAction");
            if ("Register".equals(action)) {
                url = REGISTER;
            } else if ("Login".equals(action)) {
                url = LOGIN;
            } else if ("Logout".equals(action)) {
                url = LOGOUT;
            } else if ("Create".equals(action)) {
                url = ADD_BOOK;
            } else if ("Detail".equals(action)) {
                url = DETAIL;
            } else if ("Search".equals(action)) {
                url = SEARCH;
            } else if ("Update".equals(action)) {
                url = UPDATE_BOOK;
            } else if ("Delete".equals(action)) {
                url = DELETE_BOOK;
            } else if ("AddToCart".equals(action)) {
                url = ADD_TO_CART;
            } else if ("DeleteCart".equals(action)) {
                url = DELETE_CART;
            } else if ("Update_Cart".equals(action)) {
                url = UPDATE_CART;
            } else if ("CheckOut".equals(action)) {
                url = CHECKOUT;
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
