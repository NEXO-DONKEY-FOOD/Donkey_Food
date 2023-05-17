package org.nexo.helper;

import java.io.Serializable;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.nexo.dao.BolsaProducto;
import org.nexo.service.BolsaProductoService;


/**
 *
 * @author gerdoc
 */
public class BolsaProductoHelper implements Serializable
{
    private List<BolsaProducto>list;
    private BolsaProducto bolsaproducto;

    public BolsaProductoHelper() 
    {
    }
    
    public boolean loadList( )
    {
        list = new BolsaProductoService().getBolsaProductoList();
        return list != null && list.size() > 0;
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

    public List<BolsaProducto> getList()
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

    public void setList(List<BolsaProducto> list) 
    {
        this.list = list;
    }

    public BolsaProducto getBolsaProducto() 
    {
        return bolsaproducto;
    }

    public void setBolsaProducto(BolsaProducto bolsaproducto) 
    {
        this.bolsaproducto = bolsaproducto;
    }
    
}