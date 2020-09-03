/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package manejador;

import com.oracle.jrockit.jfr.Producer;
import controladores.ProductoController;
import entidades.Producto;

import java.util.List;
import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;
import javax.faces.bean.ManagedBean;
import javax.faces.view.ViewScoped;
import utilidades.UtilidadesManejador;


/**
 *
 * @author Franciso
 */
@ManagedBean
@ViewScoped
public class ProductoManejador {
    
   
    
    Producto productoSeleccion;
    private List<Producto> lista;
    private ProductoController pc = new ProductoController(); ;
    
    //Despues de construirse la pagina
    @PostConstruct
    public void cargarInformacion(){
        this.productoSeleccion = new Producto();
        
        lista=pc.encontarTodos();
        
        
    }
    
    
    public Producto getProductoSeleccion() {
        return this.productoSeleccion;
    }

    public void setProductoSeleccion(Producto productoSeleccion) {
        this.productoSeleccion = productoSeleccion;
    }
    
    
    public List<Producto> getLista() {
        return lista;
    }

    public void setLista(List<Producto> lista) {
        this.lista = lista;
    }
    
    
    public ProductoManejador(){
        
    }
    
    @PreDestroy
    public void limpiar(){
        lista=null;
        
    }
    
    public void eliminar(){
        try {
            
            pc.destruir(productoSeleccion);
            //Cuando se elimina volvemos a cargar todos los datos del producto
            
            cargarInformacion();
            
            UtilidadesManejador.desplegarMensajeInfo("Exito","Eliminado correctamente");
                    
            
                    
        } catch (Exception e) {
            e.printStackTrace();
            UtilidadesManejador.desplegarMensajeError("Error", ""+e.getMessage());
        }
        
        
    }
    
    public void guardar(){
        try {
            System.out.println("Mostrando el objeto selecion"+productoSeleccion.toString());
            //pc.crear(productoSeleccion);
            
            
            pc.editar(productoSeleccion);
            
            UtilidadesManejador.desplegarMensajeInfo("Exito", "Producto guardado correctamete");
            
            cargarInformacion();
            
        } catch (Exception e) {
            System.out.println("un errorsito "+e.getMessage());
        }
        
    }
}
