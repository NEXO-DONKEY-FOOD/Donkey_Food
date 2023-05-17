/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.nexo.helper;

import java.io.Serializable;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.nexo.dao.Empleado;
import org.nexo.service.EmpleadoService;


/**
 *
 * @author gerdoc
 */
public class EmpleadoHelper implements Serializable
{
    private List<Empleado>list;
    private Empleado empleado;

    public EmpleadoHelper() 
    {
    }
    
    public boolean loadList( )
    {
        list = new EmpleadoService().getEmpleadoList();
        return list != null && list.size() > 0;
    }
    
    public boolean addEmpleado( HttpServletRequest request )
    {
        empleado = new Empleado( ); 
        empleado.setNomEmp( request.getParameter( "nomemp" ) );
        if( empleado.getNomEmp() == null || empleado.getNomEmp().length() == 0 )
        {
            return false;
        }
        empleado.setCorrEmp( request.getParameter( "corremp" ) );
        if( empleado.getCorrEmp() == null || empleado.getCorrEmp().length() == 0 )
        {
            return false;
        }
        empleado.setCodEmp( request.getParameter( "codemp" ) );
        if( empleado.getCodEmp() == null || empleado.getCodEmp().length() == 0 )
        {
            return false;
        }
        empleado.setPassEmp( request.getParameter( "passemp" ) );
        if( empleado.getPassEmp() == null || empleado.getPassEmp().length() == 0 )
        {
            return false;
        }
        return new EmpleadoService().addEmpleado(empleado);
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

    public Empleado getEmpleadoByNum( HttpServletRequest request )
    {
        Empleado empleado = null;
        String codemp = null;
        String passemp = null;
        codemp = request.getParameter( "codemp" );
        passemp = request.getParameter( "passemp" );
        if( codemp == null || passemp == null)
        {
            return null;
        }
        return new EmpleadoService().getEmpleado( codemp, passemp );
    }
    
    public List<Empleado> getList()
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

    public void setList(List<Empleado> list) 
    {
        this.list = list;
    }

    public Empleado getEmpleado() 
    {
        return empleado;
    }

    public void setEmpleado(Empleado empleado) 
    {
        this.empleado = empleado;
    }
    
}