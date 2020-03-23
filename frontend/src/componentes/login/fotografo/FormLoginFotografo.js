import React, { Component } from 'react'
import linkAPI from '../../../consts'
import axios from 'axios'

class FormFotografo extends Component {

	constructor(props) {
		super(props)

		this.state = {
			email: '',
			senha: ''
		} 		
	}

	setEmail = (e) => {
        this.setState({
			email: e.target.value
		});
	}
	
	setSenha = (e) => {
        this.setState({
			senha: e.target.value
		});
	}
	
	autenticar = () => {

		if(this.state.email == ''){
			alert('Preencha o campo email')
		}if(!this.state.email.includes('@') || !this.state.email.includes('.com')){
			alert('email invalido')
		}

		console.log(
			linkAPI,
			this.state.email,
			this.state.senha
		)
	}

	/*autenticar = () => {
		console.log(linkAPI, this.state.email, this.state.senha) 
	
		dados = {
			email: this.state.email,
			senha: this.state.senha
		}

		axios.post(
			linkAPI + **** link do recurso da API **** , dados
		).then((res) => {
			
			**** Aqui é onde vamos pegar o token e guardar em uma variavel para futuras requisições na API ****
			
		}).catch(erro => {
			
			alert("Usuario ou senha invalidos")
		})
	}
	*/


	render(){
		return (
			<div className="row">
				<form className="col s12 color-white left-align frmLogin">
					<div className="row">
						<p>
							<label htmlFor="emailLogin" className="font-14">Digite seu e-mail:</label>
						</p>
						<div className="input-field col s12 border-purple camposFrmLogin">
							<input id="emailLogin" type="text" onChange={this.setEmail} className="validate" />
						</div>
	
						<p>
							<label htmlFor="senhaLogin" className="font-14">Digite sua senha:</label>
						</p>
						<div className="input-field col s12 border-purple camposFrmLogin">
							<input id="senhaLogin" type="password" onChange={this.setSenha} className="validate" />
						</div>
					</div>
	
					<div className="row">
						<div className="col s12 right-align">
							<button className="btn-large waves-effect waves-light submitFrmLogin" type="button" onClick={ this.autenticar } name="action">
								Entrar
							</button>
						</div>
					</div>
				</form>
				<div className="row">
					<div className="col s12">
						<span className="linkCadastroFrmLogin">
							Ainda não possui uma conta? <br />
							<a href="">
								<p>
									Clique aqui para se cadastrar
								</p>
							</a>
						</span>
					</div>
				</div>
			</div>
		);
	}
}


export default FormFotografo;