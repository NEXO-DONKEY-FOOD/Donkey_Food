package org.nexo.dao;
import java.io.Serializable;

public class Product implements Serializable {
    
    private Integer IdProd;
    private String NomProd;
    private String DescProd;
    private Integer UniProd;
    private Integer PreProd;
    
    public Product(){
    }

    public Integer getIdProd() {
        return IdProd;
    }

    public void setIdProd(Integer IdProd) {
        this.IdProd = IdProd;
    }

    public String getNomProd() {
        return NomProd;
    }

    public void setNomProd(String NomProd) {
        this.NomProd = NomProd;
    }

    public String getDescProd() {
        return DescProd;
    }

    public void setDescProd(String DescProd) {
        this.DescProd = DescProd;
    }

    public Integer getUniProd() {
        return UniProd;
    }

    public void setUniProd(Integer UniProd) {
        this.UniProd = UniProd;
    }

    public Integer getPreProd() {
        return PreProd;
    }

    public void setPreProd(Integer PreProd) {
        this.PreProd = PreProd;
    }

}