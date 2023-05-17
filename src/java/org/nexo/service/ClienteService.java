package org.nexo.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import org.nexo.dao.Cliente;

public class ClienteService 
{

    public ClienteService() 
    {
    }
    
    public List<Cliente> getClienteList( )
    {
        List<Cliente>clienteList = null;
        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;
        Cliente cliente = null;
        
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
            resultSet = statement.executeQuery( "SELECT * FROM CLIENTE" );
            if( resultSet == null )
            {
                return null;
            }
            clienteList = new ArrayList<>();
            while( resultSet.next() )
            {
                cliente = new Cliente();
                cliente.setIdClient( resultSet.getInt(1) );
                cliente.setAliClient(resultSet.getString(2) );
                cliente.setCorrClient(resultSet.getString(3) );
                cliente.setPassClient(resultSet.getString(4) );
                clienteList.add(cliente);
            }
            resultSet.close();
            MySqlConnection.closeConnection(connection);
            return clienteList;
        } 
        catch (SQLException ex) 
        {
            ex.printStackTrace();
        }
        return null;
    }
    
    public boolean addCliente( Cliente cliente )
    {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        String sql = "INSERT INTO CLIENTE(ALICLIENT,CORRCLIENT,PASSCLIENT) VALUES(?,?,?)";
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
            preparedStatement.setString(1, cliente.getAliClient());            
            preparedStatement.setString(2, cliente.getCorrClient());            
            preparedStatement.setString(3, cliente.getPassClient());            
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
    
    public boolean deleteCliente( Cliente cliente )
    {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        String sql = "DELETE FROM CLIENTE WHERE IDCLIENT = ?";
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
            preparedStatement.setInt(1, cliente.getIdClient());
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
    
    public Cliente getClienteById( Integer idcliente )
    {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        String sql = "SELECT * FROM CLIENTE WHERE IDCLIENT= ?";
        Cliente cliente = null;
        try 
        {
            connection = MySqlConnection.getConnection( );
            if( connection == null )
            {
                return null;
            }
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, idcliente );
            resultSet = preparedStatement.executeQuery( );
            if( resultSet == null )
            {
                return null;
            }
            while( resultSet.next() )
            {
                cliente = new Cliente();
                cliente.setIdClient(resultSet.getInt(1) );
                cliente.setAliClient(resultSet.getString(2) );
                cliente.setCorrClient(resultSet.getString(3) );
                cliente.setPassClient(resultSet.getString(4) );
                
            }
            resultSet.close();
            MySqlConnection.closeConnection(connection);
            return cliente;
        } 
        catch (SQLException ex) 
        {
            ex.printStackTrace();
        }
        return null;
    }
    
    public Cliente getCliente( String aliclient, String passclient )
    {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        String sql = "SELECT * FROM CLIENTE WHERE ALICLIENT=?  AND PASSCLIENT=?";
        Cliente cliente = null;
        try 
        {
            connection = MySqlConnection.getConnection( );
            if( connection == null )
            {
                return null;
            }
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, aliclient );
            preparedStatement.setString(2, passclient );
            resultSet = preparedStatement.executeQuery( );
            if( resultSet == null )
            {
                return null;
            }
            while( resultSet.next() )
            {
                cliente = new Cliente();
                cliente.setIdClient(resultSet.getInt(1) );
                cliente.setAliClient(resultSet.getString(2) );
                cliente.setCorrClient(resultSet.getString(3) );
                cliente.setPassClient(resultSet.getString(4) );
                
            }
            resultSet.close();
            MySqlConnection.closeConnection(connection);
            return cliente;
        } 
        catch (SQLException ex) 
        {
            ex.printStackTrace();
        }
        return null;
    }
        public Cliente getClienteByName( String aliclient )
    {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        String sql = "SELECT * FROM CLIENTE WHERE ALICLIENT=?";
        Cliente cliente = null;
        try 
        {
            connection = MySqlConnection.getConnection( );
            if( connection == null )
            {
                return null;
            }
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, aliclient );
            resultSet = preparedStatement.executeQuery( );
            if( resultSet == null )
            {
                return null;
            }
            while( resultSet.next() )
            {
                cliente = new Cliente();
                cliente.setIdClient(resultSet.getInt(1) );
                cliente.setAliClient(resultSet.getString(2) );
                cliente.setCorrClient(resultSet.getString(3) );
                cliente.setPassClient(resultSet.getString(4) );
                
            }
            resultSet.close();
            MySqlConnection.closeConnection(connection);
            return cliente;
        } 
        catch (SQLException ex) 
        {
            ex.printStackTrace();
        }
        return null;
    }
    
    public boolean updateCliente( Cliente cliente )
    {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        String sql = "update CLIENTE SET ALICLIENT=?, CORRCLIENT=?, PASSCLIENT=? WHERE IDCLIENT= ?";
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
            preparedStatement.setString(1, cliente.getAliClient());            
            preparedStatement.setString(2, cliente.getCorrClient());            
            preparedStatement.setString(3, cliente.getPassClient());   
            preparedStatement.setInt(4, cliente.getIdClient());
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