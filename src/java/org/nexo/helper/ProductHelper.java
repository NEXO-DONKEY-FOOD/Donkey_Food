/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.nexo.helper;

import java.io.Serializable;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.nexo.dao.Product;
import org.nexo.service.ProductService;


/**
 *
 * @author gerdoc
 */
public class ProductHelper implements Serializable
{
    private List<Product>list;
    private Product product;

    public ProductHelper() 
    {
    }
    
    public boolean loadList( )
    {
        list = new ProductService().getProductList();
        return list != null && list.size() > 0;
    }
    
    public boolean addProduct( HttpServletRequest request )
    {
        product = new Product( ); 
        product.setNomProd( request.getParameter( "nomprod" ) );
        if( product.getNomProd() == null || product.getNomProd().length() == 0 )
        {
            return false;
        }
        product.setDescProd( request.getParameter( "descprod" ) );
        if( product.getDescProd() == null || product.getDescProd().length() == 0 )
        {
            return false;
        }
        product.setUniProd(getInteger( request.getParameter( "uniprod" )) );
        if( product.getUniProd() == null)
        {
            return false;
        }
        product.setPreProd(getInteger( request.getParameter( "preprod" )) );
        if( product.getPreProd() == null)
        {
            return false;
        }
        return new ProductService().addProduct(product);
    }
    
    public Integer getInteger( String idProd )
    {
        Integer val = 0;
        if( idProd == null || idProd.length() == 0 )
        {
            return null;
        }
        try
        {
            val = new Integer(idProd);
            return val;
        }
        catch(NumberFormatException ex)
        {
            ex.printStackTrace();
        }
        return null;
    }

            public Product getProductById( HttpServletRequest request )
    {
        Product product = null;
        Integer idprod = null;
        idprod = getInteger( request.getParameter( "id" ) );
        if( idprod == null )
        {
            return null;
        }
        return new ProductService().getProductById( idprod );
    }
    public Product getProductByName( HttpServletRequest request )
    {
        Product product = null;
        String nomprod = null;
        nomprod = request.getParameter( "nomprod" );
        if( nomprod == null)
        {
            return null;
        }
        return new ProductService().getProduct( nomprod );
    }
    
        public boolean deleteProduct( HttpServletRequest request )
    {
        product = new Product( ); 
        product.setIdProd( getInteger( request.getParameter( "idprod" )) );
        if( product.getIdProd( ) == null )
        {
            return false;
        }
        return new ProductService().deleteProduct( product );
    }
        
        public boolean updateProduct( HttpServletRequest request )
    {
        
        product = new Product( ); 
        product.setIdProd( getInteger( request.getParameter( "idprod" )) );
        if( product.getIdProd( ) == null )
        {
            return false;
        }
        product.setNomProd( request.getParameter( "nomprod" ) );
        if( product.getNomProd() == null || product.getNomProd().length() == 0 )
        {
            return false;
        }
        product.setDescProd( request.getParameter( "descprod" ) );
        if( product.getDescProd() == null || product.getDescProd().length() == 0 )
        {
            return false;
        }
        product.setUniProd(getInteger( request.getParameter( "uniprod" )) );
        if( product.getUniProd() == null)
        {
            return false;
        }
        product.setPreProd(getInteger( request.getParameter( "preprod" )) );
        if( product.getPreProd() == null)
        {
            return false;
        }
        return new ProductService().updateProduct( product );
    }
    
    public List<Product> getList()
    {
        if( list == null || list.size( )== 0 )
        {
            if( !loadList( ) )
            {
                return null;
            }
        }
        return list;
    }

    public void setList(List<Product> list) 
    {
        this.list = list;
    }

    public Product getProduct() 
    {
        return product;
    }

    public void setProduct(Product product) 
    {
        this.product = product;
    }
    
}