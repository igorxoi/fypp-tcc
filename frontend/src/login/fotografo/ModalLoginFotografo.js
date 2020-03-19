import React, {Component} from 'react'
import { TiCamera } from "react-icons/ti";
import FormFotografo from './FormLoginFotografo'

class ModalLoginFotografo extends Component {

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
                                    <TiCamera />
                                </i>
                            <h6 className="valign-wrapper">Fotografo</h6>
                        </div>                                    
                   </li>
                </a>

                {/****  Modal ****/}
                <div className="row center">
                    <div id="modalLoginFotografo" className="modal col s4">
                        <div className="modal-content">
                            <h4 className="font-color-purple left-align">Login</h4>
                            <FormFotografo/>                                    
                        </div>
                    </div>
                </div>
            </div>
        )
    }

}

export default ModalLoginFotografo;
