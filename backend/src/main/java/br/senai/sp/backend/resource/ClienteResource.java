package br.senai.sp.backend.resource;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import br.senai.sp.backend.model.Cliente;
import br.senai.sp.backend.repository.ClienteRepository;

@RestController
@RequestMapping("/photo")

@CrossOrigin
public class ClienteResource {
	
	@Autowired
	private ClienteRepository clienteRepository;
	
	//listar os clientes
	
	@GetMapping("/clientes")
	public List<Cliente> getClientes(){
		return clienteRepository.findAll();
	}
	
	@PostMapping("/cliente")
	
	@ResponseStatus(HttpStatus.CREATED)
	public Cliente gravar(@Valid @RequestBody Cliente cliente) {
		Cliente novoCliente = clienteRepository.save(cliente);
		return novoCliente;
	}
	
	
}
