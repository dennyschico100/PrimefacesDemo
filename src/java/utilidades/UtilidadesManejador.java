/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utilidades;

import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;

/**
 *
 * @author Franciso
 */
public class UtilidadesManejador {
    
    public static void desplegarMensaje(FacesMessage.Severity severidad,String header, String detalle){
        FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(severidad,header, detalle));
    
     
    }
     public static  void desplegarMensajeInfo(String header, String detalle){
         desplegarMensaje(FacesMessage.SEVERITY_INFO, header, detalle);
        
     
    }
     public static  void desplegarMensajeError(String header, String detalle){
         desplegarMensaje(FacesMessage.SEVERITY_ERROR, header, detalle);
        
     
    }
     
     
     

}
