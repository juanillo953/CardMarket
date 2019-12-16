/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import modelo.Carta;
import modelo.Usuario;

/**
 *
 * @author Alumno_2DAW
 */
public class Bd {
   private final static String drv = "com.mysql.jdbc.Driver";
   private final static String db = "jdbc:mysql://localhost:3306/cardmarket?useSSL=false";
   private final static String user = "root";
   private Connection conn;
   private PreparedStatement pst;
   private ResultSet rs; 
  
   
   public void abrirConexion() throws ClassNotFoundException, SQLException{
    Class.forName(drv);
    conn = DriverManager.getConnection(db,user,"");
       System.out.println("La conexion se realizo con exito");
   }
   public void cerrarConexion() throws SQLException{
    if(pst != null)pst.close();
    if(rs !=null)pst.close();
       System.out.println("Conexion Cerrada");
    }
   public boolean agregarUsuario(String user,String pass){//Inserta un usuario en la base de datos
        String sql = "INSERT INTO usuarios(username,password) VALUES(?,?)";
        try {
            pst = conn.prepareStatement(sql);
            pst.setString(1, user);
            pst.setString(2, pass);
            pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(Bd.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
        
        return true;
    }
    public List<Usuario> obtenerUsuarios(){ //Obtiene una lista de los usuarios
        String sql = "SELECT * FROM usuarios";
        List<Usuario> usuarios = new ArrayList<Usuario>();
        try {
           
            pst = conn.prepareStatement(sql);
            rs = pst.executeQuery();
            while(rs.next()){
                int id_usuario = rs.getInt(1);
                String user = rs.getString(2);
                String pass = rs.getString(3);
                int perfil = rs.getInt(4);
                String nombre = rs.getString(5);
                String apellidos = rs.getString(6);
                String direccion = rs.getString(7);
                String tarjeta = rs.getString(8);
                Usuario usuario = new Usuario(user, pass, perfil, nombre, apellidos, direccion, tarjeta,id_usuario);
                usuarios.add(usuario);
                }

        } catch (SQLException ex) {
            Logger.getLogger(Bd.class.getName()).log(Level.SEVERE, null, ex);
        }
        return usuarios;
    }
    public List<Carta> obtenerCartas(int id_cat){
        List<Carta> cartas = new ArrayList<Carta>();
        String sql = "SELECT * from productos where categoria="+id_cat;
       try {
           pst = conn.prepareStatement(sql);
           rs = pst.executeQuery();
           while(rs.next()){
                int id=rs.getInt(1);
                int categoria=rs.getInt(2);
                String foto=rs.getString(3);
                float precio=rs.getFloat(4);
                String descripcion=rs.getString(5);
                int descuento=rs.getInt(6);
                String texto = rs.getString(7);
                int cantidad = 0;
                Carta carta = new Carta(id, categoria, foto, precio, descripcion, descuento, texto, cantidad);
                cartas.add(carta);
           
           }
       } catch (SQLException ex) {
           Logger.getLogger(Bd.class.getName()).log(Level.SEVERE, null, ex);
       }
        return cartas;
    }
    public Carta obtenerCarta(int id){
        Carta carta = null;
        String sql = "SELECT * FROM productos WHERE id_prod="+id;
       try {
           pst = conn.prepareStatement(sql);
           rs = pst.executeQuery();
           rs.next();
           int categoria=rs.getInt(2);
           String foto=rs.getString(3);
           float precio=rs.getFloat(4);
           String descripcion=rs.getString(5);
           int descuento=rs.getInt(6);
           String texto = rs.getString(7);
           int cantidad = 0;
           carta = new Carta(id, categoria, foto, precio, descripcion, descuento, texto,cantidad);
       } catch (SQLException ex) {
           Logger.getLogger(Bd.class.getName()).log(Level.SEVERE, null, ex);
       }
       
        
        return carta;
    }
    public String obtenerCategoria(int id){
        String categoria="";
        String sql = "SELECT * FROM categoria WHERE id_categoria="+id;
       try {
           pst = conn.prepareStatement(sql);
           rs = pst.executeQuery();
           rs.next();
           categoria = rs.getString(2);
       } catch (SQLException ex) {
           Logger.getLogger(Bd.class.getName()).log(Level.SEVERE, null, ex);
       }
        return categoria;
    }
    public boolean editaUsuario(int id,String nombre,String apellidos,String direccion){
        String sql = "Update usuarios SET nombre ='"+nombre+"',apellidos='"+apellidos+"',direccion='"+direccion+"' WHERE id_usuario ="+id;
       try {
           pst = conn.prepareStatement(sql);
           pst.executeUpdate();
       } catch (SQLException ex) {
           Logger.getLogger(Bd.class.getName()).log(Level.SEVERE, null, ex);
           return false;
       }
     
        
    
    return true;
    }
}
