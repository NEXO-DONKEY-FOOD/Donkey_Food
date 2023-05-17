package org.nexo.dao;
import java.io.Serializable;

public class BolsaProducto implements Serializable {
    
    private String Producto;
    private Integer Precio;
    private Integer Unidades;
    private Integer PrecioFinal;
    public int Total;

    public Integer getTotal() {
        return Total;
    }

    public void setTotal(Integer Total) {
        this.Total = Total;
    }

    public BolsaProducto(){
    }

    public String getProducto() {
        return Producto;
    }

    public void setProducto(String Producto) {
        this.Producto = Producto;
    }

    public Integer getPrecio() {
        return Precio;
    }

    public void setPrecio(Integer Precio) {
        this.Precio = Precio;
    }

    public Integer getUnidades() {
        return Unidades;
    }

    public void setUnidades(Integer Unidades) {
        this.Unidades = Unidades;
    }

    public Integer getPrecioFinal() {
        return PrecioFinal;
    }

    public void setPrecioFinal(Integer PrecioFinal) {
        this.PrecioFinal = PrecioFinal;
    }

}