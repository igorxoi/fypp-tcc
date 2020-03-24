import React, {Component} from 'react'
import { MdPerson } from "react-icons/md";
import FormLoginCliente from './FormLoginCliente'

class ModalLoginCliente extends Component {

    // Função que chama o modal quando o botão é clicado
    componentDidMount(){
        const M = window.M;
        document.addEventListener('DOMContentLoaded', function() {
            var elems = document.querySelectorAll('.modal');
            var instances = M.Modal.init(elems, {});
          }
        );
    }

    render(){
        return(
            <div>
                {/**** Botão que abrirá o modal ****/}
                <a className="modal-trigger" id="modalFrmLoginFotografo" href="#modalLoginFotografo">
                    <li className="center">
                        <div className="valign-wrapper collapsible-header border-purple hoverable" > 
                            <div className="col"></div>
                                <i className="material-icons margin-top-icons-login">
                                    <MdPerson />
                                </i>
                            <h6 className="valign-wrapper">Cliente</h6>
                        </div>                                    
                   </li>
                </a>

                {/****  Modal ****/}
                <div className="row center">
                    <div id="modalLoginFotografo" className="modal col l4 m8 s10">
                        <div className="modal-content">
                            <h4 className="font-color-purple left-align">Login</h4>
                            <FormLoginCliente/>                                    
                        </div>
                    </div>
                </div>
            </div>
        )
    }
}

export default ModalLoginCliente;
