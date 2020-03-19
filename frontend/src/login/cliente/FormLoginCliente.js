import React from 'react'

function FormLoginCliente() {
	return (
		<div className="row">
			<form className="col s12 color-white left-align frmLogin">
				<div className="row">
					<p>
						<label for="first_name" className="font-14">Digite seu e-mail:</label>
					</p>
					<div className="input-field col s12 border-purple camposFrmLogin">
						<input id="first_name" type="text" className="validate" />
					</div>

					<p>
						<label for="password" className="font-14">Digite sua senha:</label>
					</p>
					<div className="input-field col s12 border-purple camposFrmLogin">
						<input id="password" type="text" className="validate" />
					</div>
				</div>

				<div className="row">
					<div className="col s12 right-align">
						<button class="btn-large waves-effect waves-light submitFrmLogin" type="submit" name="action">
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


export default FormLoginCliente;