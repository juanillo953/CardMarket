/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
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

/**
 *
 * @author Alumno_2DAW
 */
public class ServletCarrito extends HttpServlet {

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
            out.println("<title>Servlet ServletCarrito</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ServletCarrito at " + request.getContextPath() + "</h1>");
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
        HttpSession sesion = request.getSession();
        int cuenta =0;
        int cantidad=0;
        int numero =0;
        int id = Integer.parseInt(request.getParameter("id_cart"));
        int id_cat = Integer.parseInt(request.getParameter("id_cat"));
        List<Carta> cartas = (List)sesion.getAttribute("carrito");
        for(int contador = 0;contador<cartas.size();contador++){
            if(cartas.get(contador).getId()==id){
                numero=contador;
                cuenta++;
                cantidad=cartas.get(contador).getCantidad();
                break;
                
            }
        }
        if(cuenta!=0){
            cartas.get(numero).setCantidad(cantidad+1);
        }
        else{
            Bd bd = new Bd();
            try {
                bd.abrirConexion();
                Carta carta = bd.obtenerCarta(id);
                carta.setCantidad(1);
                cartas.add(carta);
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(ServletCarrito.class.getName()).log(Level.SEVERE, null, ex);
            } catch (SQLException ex) {
                Logger.getLogger(ServletCarrito.class.getName()).log(Level.SEVERE, null, ex);
            }
            
        }
        sesion.setAttribute("carrito", cartas);
        rd = request.getRequestDispatcher("muestraArticulos.jsp?cat="+id_cat);
        rd.forward(request, response);
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
