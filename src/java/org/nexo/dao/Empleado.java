package org.nexo.dao;

import java.io.Serializable;

public class Empleado implements Serializable {
    
    private Integer idEmp;
    private String NomEmp;
    private String PassEmp;
    public String CodEmp;
    private String CorrEmp;
    
    public Empleado(){
    }

    public Integer getIdEmp() {
        return idEmp;
    }

    public void setIdEmp(Integer idEmp) {
        this.idEmp = idEmp;
    }

    public String getNomEmp() {
        return NomEmp;
    }

    public void setNomEmp(String NomEmp) {
        this.NomEmp = NomEmp;
    }

    public String getPassEmp() {
        return PassEmp;
    }

    public void setPassEmp(String PassEmp) {
        this.PassEmp = PassEmp;
    }

    public String getCodEmp() {
        return CodEmp;
    }

    public void setCodEmp(String CodEmp) {
        this.CodEmp = CodEmp;
    }

    public String getCorrEmp() {
        return CorrEmp;
    }

    public void setCorrEmp(String CorrEmp) {
        this.CorrEmp = CorrEmp;
    }
    
    
}
