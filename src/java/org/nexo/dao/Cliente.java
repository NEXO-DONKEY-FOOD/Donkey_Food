package org.nexo.dao;
import java.io.Serializable;

public class Cliente implements Serializable {
    
    private Integer idClient;
    private String AliClient;
    private String CorrClient;
    private String PassClient;
    
    public Cliente(){
    }

    public Integer getIdClient() {
        return idClient;
    }

    public void setIdClient(Integer idClient) {
        this.idClient = idClient;
    }

    public String getAliClient() {
        return AliClient;
    }

    public void setAliClient(String AliClient) {
        this.AliClient = AliClient;
    }

    public String getCorrClient() {
        return CorrClient;
    }

    public void setCorrClient(String CorrClient) {
        this.CorrClient = CorrClient;
    }

    public String getPassClient() {
        return PassClient;
    }

    public void setPassClient(String PassClient) {
        this.PassClient = PassClient;
    }
    
    
}
