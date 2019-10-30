/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gestion;

import administrativo.Producto;
import administrativo.Usuario;
import conexion.AbstractDB;
import java.security.NoSuchAlgorithmException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;

/**
 *
 * @author luismb
 */
public class GestionProducto extends AbstractDB {

    public GestionProducto() {
        super();
    }

    public boolean crearProducto(Producto prod) {
        boolean flag = false;
        PreparedStatement pst = null;
        try {
            String sql = "call newProducto(?,?,?,?,?)";
            pst = this.conn.prepareStatement(sql);
            pst.setString(1, prod.getId());
            pst.setString(2, prod.getNombre());
            pst.setFloat(3, prod.getPrecioCompra());
            pst.setFloat(4, prod.getPrecioVenta());
            pst.setInt(5, prod.getExistencias());

            if (pst.executeUpdate() == 1) {
                flag = true;
            }
        } catch (Exception e) {
            System.err.println(e.getMessage());
        } finally {
            cierraConexion();
        }
        return flag;
    }

    public ArrayList<Producto> getTodos() {
        ArrayList<Producto> productos = new ArrayList();

        try {
            Statement stmt = this.conn.createStatement();

            ResultSet res = stmt.executeQuery("call getAllProducts()");
            while (res.next()) {
                Producto prod = new Producto();
                prod.setId(res.getString("idProducto"));
                prod.setNombre(res.getString("nombre"));
                prod.setPrecioCompra(res.getFloat("precioCompra"));
                prod.setPrecioVenta(res.getFloat("precioVenta"));
                prod.setExistencias(res.getInt("existencias"));

                productos.add(prod);
                

            }
            res.close();

        } catch (SQLException ex) {
            System.out.println(ex);
        }

        return productos;

    }

    public Usuario loginUsuario(String usuario, String pass) {
        Usuario user = null;

        try {
            ResultSet res;
            PreparedStatement stmt = this.conn.prepareStatement("call autenticar(?,?)");
            stmt.setString(1, usuario);
            stmt.setString(2, pass);

            res = stmt.executeQuery();
            while (res.next()) {
                user = new Usuario();
                user.setId(res.getString("idUsuario"));
                user.setNombre(res.getString("nombre"));
                user.setApellido("apellido");
                user.setUsuario(res.getString("username"));
                user.setPassword(res.getString("pass"));
                user.setCorreo(res.getString("correo"));
                user.setRango(res.getInt("rango"));

            }
            res.close();

        } catch (SQLException ex) {
            System.out.println(ex);

        }
        return user;
    }

    public void cierraConexion() {
        try {
            this.conn.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
    //==========================================================================

}
