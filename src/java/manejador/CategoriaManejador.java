/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package manejador;

import controladores.CategoriaController;

import entidades.Categoria;


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
public class CategoriaManejador {
    
   
    
    Categoria categoriaSeleccion  = new Categoria();
        
    private List<Categoria> lista;
    private CategoriaController  cc = new CategoriaController(); ;

    public CategoriaController getCc() {
        return this.cc;
    }

    public void setCc(CategoriaController cc) {
        this.cc = cc;
    }
    
    //Despues de construirse la pagina
    @PostConstruct
    public void cargarInformacion(){
        //this.categoriaSeleccion = new Categoria();
        
        
        lista= cc .encontarTodos();
        
        
    }
    
    
    public Categoria getCategoriaSeleccion() {
        return this.categoriaSeleccion;
    }
    
    public void setCategoriaSeleccion(Categoria categoriaSeleccion) {
        this.categoriaSeleccion= categoriaSeleccion;
    }
    
    
    public List<Categoria> getLista() {
        return lista;
    }

    public void setLista(List<Categoria> lista) {
        this.lista = lista;
    }
    
    
    public CategoriaManejador(){
        
    }
    
    @PreDestroy
    public void limpiar(){
        lista=null;
        
    }
    
    public void eliminar(){
        try {
            
            cc.destruir(categoriaSeleccion);
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
            //pc.crear(productoSeleccion);
            //this.categoriaSeleccion= new Categoria();
            
            /*this.categoriaSeleccion.setIdCategoria(4);
            this.categoriaSeleccion.setCategoria("JUVA JSF AQUI JJODER");
            this.categoriaSeleccion.setEstado("1");
            this.categoriaSeleccion.setIdUsuario(this.categoriaSeleccion.getIdUsuario());
            */
            System.out.println("");
            System.out.println("");
            
            System.out.println("Mostrando el nombre d"+this.categoriaSeleccion.getCategoria() );
            System.out.println("Mostrando el id de "+this.categoriaSeleccion.getIdCategoria() );
            System.out.println("Mostrando el estado "+this.categoriaSeleccion.getEstado() );
            System.out.println("");
            System.out.println("");
            
            
            this.cc.crear(this.getCategoriaSeleccion());
            
            UtilidadesManejador.desplegarMensajeInfo("Exito", "Producto guardado correctamete");
            
            cargarInformacion();
            
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("un errorsito "+e.getMessage());
        }
        
    }
}
