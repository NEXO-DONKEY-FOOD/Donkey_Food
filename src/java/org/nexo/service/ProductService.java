package org.nexo.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import org.nexo.dao.Product;

public class ProductService 
{

    public ProductService() 
    {
    }
    
    public List<Product> getProductList( )
    {
        List<Product>productList = null;
        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;
        Product product = null;
        
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
            resultSet = statement.executeQuery( "SELECT * FROM PRODUCT" );
            if( resultSet == null )
            {
                return null;
            }
            productList = new ArrayList<>();
            while( resultSet.next() )
            {
                product = new Product();
                product.setIdProd( resultSet.getInt(1) );
                product.setNomProd(resultSet.getString(2) );
                product.setDescProd(resultSet.getString(3) );
                product.setUniProd( resultSet.getInt(4) );
                product.setPreProd( resultSet.getInt(5) );
                productList.add(product);
            }
            resultSet.close();
            MySqlConnection.closeConnection(connection);
            return productList;
        } 
        catch (SQLException ex) 
        {
            ex.printStackTrace();
        }
        return null;
    }
    
    public boolean addProduct( Product product )
    {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        String sql = "INSERT INTO PRODUCT(NomProd,DescProd,UniProd,PreProd) VALUES(?,?,?,?)";
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
            preparedStatement.setString(1, product.getNomProd());            
            preparedStatement.setString(2, product.getDescProd());            
            preparedStatement.setInt(3, product.getUniProd());            
            preparedStatement.setInt(4, product.getPreProd());            
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
    
    public boolean deleteProduct( Product product )
    {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        String sql = "DELETE FROM PRODUCT WHERE IDPROD = ?";
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
            preparedStatement.setInt(1, product.getIdProd());
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
    
    public Product getProductById( Integer idprod )
    {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        String sql = "SELECT * FROM PRODUCT WHERE IDPROD= ?";
        Product product = null;
        try 
        {
            connection = MySqlConnection.getConnection( );
            if( connection == null )
            {
                return null;
            }
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, idprod );
            resultSet = preparedStatement.executeQuery( );
            if( resultSet == null )
            {
                return null;
            }
            while( resultSet.next() )
            {
                product = new Product();
                product.setIdProd(resultSet.getInt(1) );
                product.setNomProd(resultSet.getString(2) );
                product.setDescProd(resultSet.getString(3) );
                product.setUniProd(resultSet.getInt(4) );
                product.setPreProd(resultSet.getInt(5) );
                
            }
            resultSet.close();
            MySqlConnection.closeConnection(connection);
            return product;
        } 
        catch (SQLException ex) 
        {
            ex.printStackTrace();
        }
        return null;
    }
    
    public Product getProduct( String nomprod )
    {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        String sql = "SELECT * FROM PRODUCT WHERE NOMPROD=?";
        Product product = null;
        try 
        {
            connection = MySqlConnection.getConnection( );
            if( connection == null )
            {
                return null;
            }
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, nomprod );
            resultSet = preparedStatement.executeQuery( );
            if( resultSet == null )
            {
                return null;
            }
            while( resultSet.next() )
            {
                product = new Product();
                product.setIdProd(resultSet.getInt(1) );
                product.setNomProd(resultSet.getString(2) );
                product.setDescProd(resultSet.getString(3) );
                product.setUniProd(resultSet.getInt(4) );
                product.setPreProd(resultSet.getInt(5) );
            }
            resultSet.close();
            MySqlConnection.closeConnection(connection);
            return product;
        } 
        catch (SQLException ex) 
        {
            ex.printStackTrace();
        }
        return null;
    }
    
    public boolean updateProduct( Product product )
    {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        String sql = "update PRODUCT SET NomProd=?, DescProd=?, UniProd=?, PreProd=? WHERE IDPROD= ?";
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
            preparedStatement.setString(1, product.getNomProd());            
            preparedStatement.setString(2, product.getDescProd());            
            preparedStatement.setInt(3, product.getUniProd());   
            preparedStatement.setInt(4, product.getPreProd());   
            preparedStatement.setInt(5, product.getIdProd());
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
    public boolean restaProduct( Integer uniprod, Integer idprod )
    {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        String sql = "update PRODUCT SET UniProd= ( ? - 1 ) WHERE IDPROD= ?";
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
            preparedStatement.setInt(1, uniprod );
            preparedStatement.setInt(2, idprod );
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