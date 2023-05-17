package org.nexo.service;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author gerdoc
 */
public class MySqlConnection implements Serializable
{
    public static String user = "root";
    public static String password = "n0m3l0";
    public static String db = "donkeyfooddb";
    public static boolean testDriver( )
    {
        try 
        {
            Class.forName("com.mysql.cj.jdbc.Driver").newInstance( );
            return true;
        } 
        catch (Exception ex) 
        {
            ex.printStackTrace();
        }
        return false;
    }
    
    public static Connection getConnection( String user, String password , String db , String server )
    {
        String url = null;
        if( user == null || password == null || db == null || server == null )
        {
            return null;
        }
        if( "".equals(user) || "".equals(password) || "".equals(db) || "".equals(server) )
        {
            return null;
        }
        url = String.format( "jdbc:mysql://%s/%s?user=%s&password=%s" , server , db , user , password );
        try 
        {
            if( !testDriver() )
            {
                return null;
            }
            return DriverManager.getConnection(url);
        } 
        catch (SQLException ex) 
        {
            ex.printStackTrace();
        }
        return null;
    }
    
    public static Connection getConnection( )
    {
        return getConnection( user, password, db , "127.0.0.1" );
    }
    
    public static void closeConnection( Connection connection )
    {
        try 
        {
            if( connection == null )
            {
                return;
            }
            if(connection.isClosed() )
            {
                return;
            }
            connection.close();
        } 
        catch (SQLException ex) 
        {
            ex.printStackTrace();
        }
    }
}
    
    
    