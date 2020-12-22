/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import daos.UserDAO;
import dtos.ErrorUserDTO;
import dtos.UserDTO;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author baoph
 */
public class RegisterController extends HttpServlet {
    private static final String SUCCESS = "login.html";
    private static final String ERROR = "register.jsp";

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
            boolean check = true;
            String userID = request.getParameter("txtUserID");
            String address = request.getParameter("txtAddress");
            String phone = request.getParameter("txtPhone");
            String name = request.getParameter("txtName");
            String email = request.getParameter("txtEmail");
            String password = request.getParameter("txtPass");
            String confirm = request.getParameter("txtRePass");
            UserDAO dao = new UserDAO();
            ErrorUserDTO errorUserDTO = new ErrorUserDTO("","","","","","");
            boolean existed = dao.checkID(userID);
            if (userID.length() < 5 || userID.length() > 50) {
                errorUserDTO.setErrorUserID("UserID must be between 5 and 50");
            }
            if (!password.equals(confirm)) {
                errorUserDTO.setConfirm("Password not match");
            }
            if (!existed) {
                errorUserDTO.setErrorUserID("UserID existed");
                check = false;
            }
            if (check) {
                UserDTO dto = new UserDTO(userID, name, address, phone, email, password, 2);
                dao.create(dto);
                url = SUCCESS;
            } else {
                request.setAttribute("ERROR", errorUserDTO);
            }
        } catch (Exception e) {
            log("Error at RegisterController" + e.toString());
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
