

package org.nexo.service;


public class comprobar {
    public static void main(String[] args){
        MySqlConnection c = new MySqlConnection();
        if(c.getConnection()!= null){
            System.out.println("conexion es correcta");
        }else{
            System.out.println("conexion erronea ");
        }
    }
}

