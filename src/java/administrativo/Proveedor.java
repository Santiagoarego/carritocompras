/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package administrativo;

/**
 *
 * @author luismb
 */
public class Proveedor {

    private String id;
    private String nombre;
    

    public Proveedor() {
        this.nombre = "";

        this.id = "";
       

    }

    public Proveedor(String id, String nombre) {
        this.id = id;
        this.nombre = nombre;
        

    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    
    
}
