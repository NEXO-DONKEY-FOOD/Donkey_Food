
package org.nexo.service;

import java.sql.Connection;
import java.sql.DriverManager;

public class conexion {
    private final String baseDatos = "DonkeyFoodDB";
    private final String servidor = "com.mysql.cj.jdbc.Driver" + baseDatos;
    private final String usuario = "root";
    private final String clave = "n0m3l0";
    
    public Connection conectar(){
        Connection cn = null;
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            cn = DriverManager.getConnection(servidor, usuario, clave);
        }catch(Exception e){
            System.out.println("Error al conectar" + e.getMessage());
        }
        return cn;
    }
            
}
