import React from 'react';
import ModalLoginFotografo from './fotografo/ModalLoginFotografo'
import ModalLoginCliente from './cliente/ModalLoginCliente' 

function ModalSelecaoLogin(){
    return(
        <div className="container center">
            <div className="row ">
                <div className="col s6 offset-s3">
                    <div className="card z-depth-3">
                        <div className=" card-content dark-text">
                            <span className="card-title">Bem-vindo</span>
                            <p className="grey-text">Como deseja fazer login ?</p>
                            <ul className="no-line">
                                <ModalLoginFotografo />
                            </ul>
                            <ul className="center no-line">
                                <ModalLoginCliente />
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>        
    );
}

export default ModalSelecaoLogin;