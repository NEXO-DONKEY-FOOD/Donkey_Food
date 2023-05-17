package org.nexo.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import org.nexo.dao.Empleado;

public class EmpleadoService 
{

    public EmpleadoService() 
    {
    }
    
    public List<Empleado> getEmpleadoList( )
    {
        List<Empleado>empleadoList = null;
        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;
        Empleado empleado = null;
        
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
            resultSet = statement.executeQuery( "SELECT * FROM EMPLEADO" );
            if( resultSet == null )
            {
                return null;
            }
            empleadoList = new ArrayList<>();
            while( resultSet.next() )
            {
                empleado = new Empleado();
                empleado.setIdEmp( resultSet.getInt(1) );
                empleado.setNomEmp(resultSet.getString(2) );
                empleado.setPassEmp(resultSet.getString(3) );
                empleado.setCodEmp(resultSet.getString(4) );
                empleado.setCorrEmp(resultSet.getString(5) );
                empleadoList.add(empleado);
            }
            resultSet.close();
            MySqlConnection.closeConnection(connection);
            return empleadoList;
        } 
        catch (SQLException ex) 
        {
            ex.printStackTrace();
        }
        return null;
    }
    
    public boolean addEmpleado( Empleado empleado )
    {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        String sql = "INSERT INTO EMPLEADO(NomEmp,PassEmp,CodEmp,CorrEmp) VALUES(?,?,?,?)";
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
            preparedStatement.setString(1, empleado.getNomEmp());            
            preparedStatement.setString(2, empleado.getPassEmp());            
            preparedStatement.setString(3, empleado.getCodEmp());            
            preparedStatement.setString(4, empleado.getCorrEmp());            
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
    
    public boolean deleteEmpleado( Empleado empleado )
    {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        String sql = "DELETE FROM Empleado WHERE IdEmp = ?";
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
            preparedStatement.setInt(1, empleado.getIdEmp());
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
    
    public Empleado getEmpleado( String codemp, String passemp )
    {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        String sql = "SELECT * FROM Empleado WHERE CodEmp=?  AND PassEmp=?";
        Empleado empleado = null;
        try 
        {
            connection = MySqlConnection.getConnection( );
            if( connection == null )
            {
                return null;
            }
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, codemp );
            preparedStatement.setString(2, passemp );
            resultSet = preparedStatement.executeQuery( );
            if( resultSet == null )
            {
                return null;
            }
            while( resultSet.next() )
            {
                empleado = new Empleado();
                empleado.setIdEmp( resultSet.getInt(1) );
                empleado.setNomEmp(resultSet.getString(2) );
                empleado.setPassEmp(resultSet.getString(3) );
                empleado.setCodEmp(resultSet.getString(4) );
                empleado.setCorrEmp(resultSet.getString(5) );
                
            }
            resultSet.close();
            MySqlConnection.closeConnection(connection);
            return empleado;
        } 
        catch (SQLException ex) 
        {
            ex.printStackTrace();
        }
        return null;
    }
    
}