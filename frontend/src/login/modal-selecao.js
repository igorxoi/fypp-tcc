import React from 'react';

function ModalSelecaoLogin(){
    return(
        <div className="container">
            <div className="row">
                <div class="col s6 center">
                    <div className="card blue-grey ">
                        <div class="card-content white-text">
                            <span class="card-title">Bem-vindo</span>
                            <p>Como deseja fazer login ?</p>
                            <ul class="collapsible">
                            <li>
                                <div class="collapsible-header">
                                <i class="material-icons">filter_drama</i>
                                First
                                </div>
                                
                            </li>
                            <li>
                                <div class="collapsible-header">
                                <i class="material-icons">place</i>
                                Second
                                <span class="badge">1</span></div>
                                <div class="collapsible-body"><p>Lorem ipsum dolor sit amet.</p></div>
                            </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    );
}

export default ModalSelecaoLogin;