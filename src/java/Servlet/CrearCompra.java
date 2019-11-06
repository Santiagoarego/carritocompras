/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import administrativo.Compra;
import gestion.GestionCompra;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author santi
 */
public class CrearCompra extends HttpServlet {

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
        PrintWriter out = response.getWriter();
        GestionCompra gc = new GestionCompra();
        Compra compra;
        int idproveedor = Integer.parseInt(request.getParameter("proveedores"));
        String cred = request.getParameter("credito");
        int credito;
        if (cred == null) {
            credito = 0;
        } else {
            credito = 1;
        }
        String fecha = request.getParameter("fechacompra");
        int id = Integer.parseInt(request.getParameter("cantidadFactura"));
        out.println("Proveedor: " + idproveedor);
        out.println("<br>Fecha Compra: " + fecha);
        out.println("<br> credito " + credito);

        float total = 0;
        for (int i = 1; i <= id; i++) {
            String producto = request.getParameter("prod" + i);
            Float precio = Float.parseFloat(request.getParameter("precio" + i));
            int cantidad = Integer.parseInt(request.getParameter("cantidad" + i));

            out.println("<br>Producto: " + producto + " Precio: " + precio + " Cantidad: " + cantidad + "<br>");
            total += cantidad * precio;

        }
        compra = new Compra(idproveedor, total, fecha, credito, 0);
        out.println("<br>Total: " + total);
        if (gc.crearCompra(compra)) {
            response.getWriter().print("La compra ha sida registrado correctamente");

        } else {
            response.getWriter().print("El producto no ha sido registrado correctamente");

        }

        response.getWriter().print("Asociado a la compra "+gc.getLastCompra().getId());
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
