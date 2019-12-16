/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

/**
 *
 * @author Alumno_2DAW
 */
public class Carta {
    private int id;
    private int categoria;
    private String foto;
    private float precio;
    private String descripcion;
    private int descuento;
    private String texto;
    private int cantidad;

    public Carta(int id, int categoria, String foto, float precio, String descripcion, int descuento,String texto,int cantidad) {
        this.id = id;
        this.categoria = categoria;
        this.foto = foto;
        this.precio = precio;
        this.descripcion = descripcion;
        this.descuento = descuento;
        this.texto = texto;
        this.cantidad = cantidad;
    }   

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }
    
    public String getTexto() {
        return texto;
    }

    public void setTexto(String texto) {
        this.texto = texto;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getCategoria() {
        return categoria;
    }

    public void setCategoria(int categoria) {
        this.categoria = categoria;
    }

    public String getFoto() {
        return foto;
    }

    public void setFoto(String foto) {
        this.foto = foto;
    }

    public float getPrecio() {
        return precio;
    }

    public void setPrecio(float precio) {
        this.precio = precio;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public int getDescuento() {
        return descuento;
    }

    public void setDescuento(int descuento) {
        this.descuento = descuento;
    }
    
}
