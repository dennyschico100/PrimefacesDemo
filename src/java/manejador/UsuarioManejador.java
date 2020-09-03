/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package manejador;

import manejador.*;
import entidades.Usuarios;
import javax.inject.Named;
import javax.enterprise.context.Dependent;
import javax.faces.bean.ManagedBean;

/**
 *
 * @author Franciso
 */
@ManagedBean
@Dependent
public class UsuarioManejador {
    private  Usuarios usuario;

    public Usuarios getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuarios usuario) {
        this.usuario = usuario;
    }
    
    
    public UsuarioManejador() {
    
    }
    
}



