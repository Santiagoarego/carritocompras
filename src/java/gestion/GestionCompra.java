/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gestion;

import administrativo.Compra;
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
public class GestionCompra extends AbstractDB {

    public GestionCompra() {
        super();
    }

    public boolean crearCompra(Compra compra) {
        boolean flag = false;
        PreparedStatement pst = null;
        try {
            String sql = "call newCompra(?,?,?,?,?)";
            pst = this.conn.prepareStatement(sql);

            pst.setInt(1, compra.getIdproveedor());
            pst.setFloat(2, compra.getTotal());
            pst.setString(3, compra.getFecha());
            pst.setInt(4, compra.getCredito());
            pst.setFloat(5, compra.getAbono());

            if (pst.executeUpdate() == 1) {
                flag = true;
            }
        } catch (Exception e) {
            System.err.println(e.getMessage());
        }
        return flag;
    }

    public Compra getLastCompra() {
        Compra com = new Compra();

        try {
            Statement stmt = this.conn.createStatement();

            ResultSet res = stmt.executeQuery("call getLastCompra()");
            while (res.next()) {

                com.setId(res.getInt("idCompra"));
                com.setIdproveedor(res.getInt("idProveedor"));
                com.setTotal(res.getFloat("Total"));
                com.setFecha(res.getString("fecha"));
                com.setCredito(res.getInt("credito"));
                com.setAbono(res.getFloat("abono"));

            }
            res.close();

        } catch (SQLException ex) {
            System.out.println(ex);
        }

        return com;

    }

    public boolean crearDetalles(int idcompra, int idproducto, float precio, int cantidad) {
        boolean flag = false;
        PreparedStatement pst = null;
        try {
            String sql = "call newCompraProducto(?,?,?,?)";
            pst = this.conn.prepareStatement(sql);

            pst.setInt(1, idcompra);
            pst.setInt(2, idproducto);
            pst.setFloat(3, precio);
            pst.setInt(4, cantidad);

            pst.executeQuery();
        } catch (Exception e) {
            System.err.println(e.getMessage());
        }
        return flag;
    }

    public void ProveedorProducto(int idprov, int idprod) {
        PreparedStatement pst = null;
        try {
            String sql = "call newProveedorProducto(?,?)";
            pst = this.conn.prepareStatement(sql);
            pst.setInt(1, idprov);
            pst.setInt(2, idprod);
            pst.executeQuery();

        } catch (Exception e) {
            System.err.println(e.getMessage());
        }
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
