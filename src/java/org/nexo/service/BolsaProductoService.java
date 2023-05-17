package org.nexo.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import org.nexo.dao.BolsaProducto;

public class BolsaProductoService 
{
    public static int Total;
    
    public BolsaProductoService() 
    {
    }
    
    public List<BolsaProducto> getBolsaProductoList( )
    {
        List<BolsaProducto>bolsaproductoList = null;
        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;
        BolsaProducto bolsaproducto = null;
        
        try 
        {
            connection = MySqlConnection.getConnection( );
            if( connection == null )
            {
                return null;
            }
            statement = connection.createStatement( );
            if( statement == null )
            {
                return null;
            }
            resultSet = statement.executeQuery( "SELECT * FROM BOLSAPRODUCTO" );
            if( resultSet == null )
            {
                return null;
            }
            bolsaproductoList = new ArrayList<>();
            while( resultSet.next() )
            {
                bolsaproducto = new BolsaProducto();
                bolsaproducto.setProducto( resultSet.getString(1) );
                bolsaproducto.setPrecio(resultSet.getInt(2) );
                bolsaproducto.setUnidades(resultSet.getInt(3) );
                bolsaproducto.setPrecioFinal(resultSet.getInt(4) );
                bolsaproductoList.add(bolsaproducto);
            }
            resultSet.close();
            MySqlConnection.closeConnection(connection);
            return bolsaproductoList;
        } 
        catch (SQLException ex) 
        {
            ex.printStackTrace();
        }
        return null;
    }
    
    public boolean addPizza( )
    {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        String sql = "INSERT INTO BOLSAPRODUCTO(PRODUCTO,PRECIO,UNIDADES,PRECIOFINAL) VALUES('Rebanada de pizza', 25, 1, 25)";
        int row = 0;
        try 
        {
            connection = MySqlConnection.getConnection( );
            if( connection == null )
            {
                return false;
            }
            preparedStatement = connection.prepareStatement(sql);
            if( preparedStatement == null )
            {
                return false;
            }
            row = preparedStatement.executeUpdate();
            MySqlConnection.closeConnection(connection);
            return row == 1;
        } 
        catch (SQLException ex) 
        {
            ex.printStackTrace();
        }
        return false;
    }
    public boolean addHam( )
    {
            Total = Total + 35;
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        String sql = "INSERT INTO BOLSAPRODUCTO(PRODUCTO,PRECIO,UNIDADES,PRECIOFINAL) VALUES('Hamburguesa', 35, 1, 35)";
        int row = 0;
        try 
        {
            connection = MySqlConnection.getConnection( );
            if( connection == null )
            {
                return false;
            }
            preparedStatement = connection.prepareStatement(sql);
            if( preparedStatement == null )
            {
                return false;
            }
            row = preparedStatement.executeUpdate();
            MySqlConnection.closeConnection(connection);
            return row == 1;
        } 
        catch (SQLException ex) 
        {
            ex.printStackTrace();
        }
        return false;
    }
    
    public boolean addPaste( )
    {
        Total = Total + 22;
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        String sql = "INSERT INTO BOLSAPRODUCTO(PRODUCTO,PRECIO,UNIDADES,PRECIOFINAL) VALUES('Paste', 22, 1, 22)";
        int row = 0;
        try 
        {
            connection = MySqlConnection.getConnection( );
            if( connection == null )
            {
                return false;
            }
            preparedStatement = connection.prepareStatement(sql);
            if( preparedStatement == null )
            {
                return false;
            }
            row = preparedStatement.executeUpdate();
            MySqlConnection.closeConnection(connection);
            return row == 1;
        } 
        catch (SQLException ex) 
        {
            ex.printStackTrace();
        }
        return false;
    }
    
    public boolean addTortas( )
    {
            Total = Total + 25;
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        String sql = "INSERT INTO BOLSAPRODUCTO(PRODUCTO,PRECIO,UNIDADES,PRECIOFINAL) VALUES('Torta', 25, 1, 25)";
        int row = 0;
        try 
        {
            connection = MySqlConnection.getConnection( );
            if( connection == null )
            {
                return false;
            }
            preparedStatement = connection.prepareStatement(sql);
            if( preparedStatement == null )
            {
                return false;
            }
            row = preparedStatement.executeUpdate();
            MySqlConnection.closeConnection(connection);
            return row == 1;
        } 
        catch (SQLException ex) 
        {
            ex.printStackTrace();
        }
        return false;
    }
    public boolean addChila( )
    {
        Total = Total + 30;
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        String sql = "INSERT INTO BOLSAPRODUCTO(PRODUCTO,PRECIO,UNIDADES,PRECIOFINAL) VALUES('Chilaquiles', 30, 1, 30)";
        int row = 0;
        try 
        {
            connection = MySqlConnection.getConnection( );
            if( connection == null )
            {
                return false;
            }
            preparedStatement = connection.prepareStatement(sql);
            if( preparedStatement == null )
            {
                return false;
            }
            row = preparedStatement.executeUpdate();
            MySqlConnection.closeConnection(connection);
            return row == 1;
        } 
        catch (SQLException ex) 
        {
            ex.printStackTrace();
        }
        return false;
    }
    
    
    public boolean deleteBolsaProducto( BolsaProducto bolsaproducto )
    {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        String sql = "DELETE FROM BOLSAPRODUCTO WHERE PRODUCTO = ?";
        int row = 0;
        try 
        {
            connection = MySqlConnection.getConnection( );
            if( connection == null )
            {
                return false;
            }
            preparedStatement = connection.prepareStatement(sql);
            if( preparedStatement == null )
            {
                return false;
            }
            preparedStatement.setString(1, bolsaproducto.getProducto());
            row = preparedStatement.executeUpdate();
            MySqlConnection.closeConnection(connection);
            return row == 1;
        } 
        catch (SQLException ex) 
        {
            ex.printStackTrace();
        }
        return false;
    }
    public boolean CanPedido()
    {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        String sql = "truncate table BolsaProducto;";
        int row = 0;
        try 
        {
            connection = MySqlConnection.getConnection( );
            if( connection == null )
            {
                return false;
            }
            preparedStatement = connection.prepareStatement(sql);
            if( preparedStatement == null )
            {
                return false;
            }
            row = preparedStatement.executeUpdate();
            MySqlConnection.closeConnection(connection);
            return row == 1;
        } 
        catch (SQLException ex) 
        {
            ex.printStackTrace();
        }
        return false;
    }
    
    
}