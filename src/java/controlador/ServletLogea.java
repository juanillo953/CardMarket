/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.Carta;
import modelo.Usuario;

/**
 *
 * @author Alumno_2DAW
 */
public class ServletLogea extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ServletLogea</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ServletLogea at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher rd;
        String user = request.getParameter("user");
        String pass = request.getParameter("pass");
        Bd bd = new Bd();
        try {
            bd.abrirConexion();
            List<Usuario> usuarios = bd.obtenerUsuarios();
            int cuenta=0;
            for(int contador = 0;contador<usuarios.size();contador++){
                if(usuarios.get(contador).getUser().equals(user) && usuarios.get(contador).getPass().equals(pass)){
                    HttpSession sesion = request.getSession();
                    sesion.setMaxInactiveInterval(900);
                    cuenta++;
                    sesion.setAttribute("usuario", usuarios.get(contador));
                    List<Carta> cartas = new ArrayList<Carta>();
                    sesion.setAttribute("carrito", cartas);
                    rd = request.getRequestDispatcher("./principal.jsp");
                    rd.forward(request, response);
                }
            }
            if(cuenta==0){
                request.setAttribute("errorLogin", "La informacion proporcionada no es correcta.");
                rd = request.getRequestDispatcher("./login.jsp");
                rd.forward(request, response);
            }
           
            
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ServletLogea.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ServletLogea.class.getName()).log(Level.SEVERE, null, ex);
        }
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
