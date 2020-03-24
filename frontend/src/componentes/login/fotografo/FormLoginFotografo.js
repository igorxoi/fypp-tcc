import React, { Component } from 'react'
import linkAPI from '../../../consts'
import axios from 'axios'

const stateInicial = {
	email: '',
	senha: '',
	emailError: '',
	senhaError: ''
}

class FormFotografo extends Component {
	state = stateInicial

	constructor(props) {
		super(props)				
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

	validacao = () => {
		let emailError = ''
		let senhaError = ''

		if(this.state.senha == ''){
			senhaError = "• Digite sua senha"
		}

		if(this.state.email == ''){
			emailError = "• Preencha o email";
		}else if(!this.state.email.includes('@') || !this.state.email.includes('.com')){
			emailError = "• Email invalido";
		}

		if(emailError || senhaError){
			this.setState({emailError, senhaError})
			return false;
		}
		

		return true
	}

	autenticar = () => {
		let dados = {}
		
		const validado = this.validacao();
		// this.setState(stateInicial)
		if(validado){
			dados = {
				email: this.state.email,
				senha: this.state.senha
			}
	
			console.log(dados)
			this.setState(stateInicial)
		}
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
						<div className="col s6 left-align" style={{color: "#ef5350"}}>
							{this.state.emailError}<br/>
							{this.state.senhaError}
						</div>
						<div className="col s6 right-align">
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