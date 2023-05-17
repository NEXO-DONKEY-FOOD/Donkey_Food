/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.nexo.helper;

import java.io.Serializable;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.nexo.dao.Cliente;
import org.nexo.service.ClienteService;


/**
 *
 * @author gerdoc
 */
public class ClienteHelper implements Serializable
{
    private List<Cliente>list;
    private Cliente cliente;

    public ClienteHelper() 
    {
    }
    
    public boolean loadList( )
    {
        list = new ClienteService().getClienteList();
        return list != null && list.size() > 0;
    }
    
    public boolean addCliente( HttpServletRequest request )
    {
        cliente = new Cliente( ); 
        cliente.setAliClient( request.getParameter( "aliclient" ) );
        if( cliente.getAliClient() == null || cliente.getAliClient().length() == 0 )
        {
            return false;
        }
        cliente.setCorrClient( request.getParameter( "corrclient" ) );
        if( cliente.getCorrClient() == null || cliente.getCorrClient().length() == 0 )
        {
            return false;
        }
        cliente.setPassClient( request.getParameter( "passclient" ) );
        if( cliente.getPassClient() == null || cliente.getPassClient().length() == 0 )
        {
            return false;
        }
        return new ClienteService().addCliente(cliente);
    }
    
    public Integer getInteger( String idClient )
    {
        Integer val = 0;
        if( idClient == null || idClient.length() == 0 )
        {
            return null;
        }
        try
        {
            val = new Integer(idClient);
            return val;
        }
        catch(NumberFormatException ex)
        {
            ex.printStackTrace();
        }
        return null;
    }

            public Cliente getClienteById( HttpServletRequest request )
    {
        Cliente cliente = null;
        Integer idcliente = null;
        idcliente = getInteger( request.getParameter( "idclient" ) );
        if( idcliente == null )
        {
            return null;
        }
        return new ClienteService().getClienteById( idcliente );
    }
    public Cliente getClienteByUsr( HttpServletRequest request )
    {
        Cliente cliente = null;
        String aliclient = null;
        String passclient = null;
        aliclient = request.getParameter( "aliclient" );
        passclient = request.getParameter( "passclient" );
        if( aliclient == null || passclient == null)
        {
            return null;
        }
        return new ClienteService().getCliente( aliclient, passclient );
    }
    public Cliente getClienteData( String aliclient )
    {
        Cliente cliente = null;
        if( aliclient == null)
        {
            return null;
        }
        return new ClienteService().getClienteByName(aliclient);
    }
    public Cliente getCliente( HttpServletRequest request )
    {
        Cliente cliente = null;
        String aliclient = null;
        String passclient = null;
        aliclient = request.getParameter( "aliclient" );
        passclient = request.getParameter( "passclient" );
        if( aliclient == null || passclient == null)
        {
            return null;
        }
        return new ClienteService().getCliente( aliclient, passclient );
    }
    
    public List<Cliente> getList()
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

    public void setList(List<Cliente> list) 
    {
        this.list = list;
    }

    public Cliente getCliente() 
    {
        return cliente;
    }

    public void setCliente(Cliente cliente) 
    {
        this.cliente = cliente;
    }
    
}