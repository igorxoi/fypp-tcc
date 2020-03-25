package br.senai.sp.backend.resource;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import br.senai.sp.backend.dto.ClienteDTO;
import br.senai.sp.backend.model.Cliente;
import br.senai.sp.backend.repository.ClienteRepository;
import br.senai.sp.backend.repository.ClienteRepositoryAuth;
import br.senai.sp.backend.repository.FotografoRepository;
import br.senai.sp.backend.security.JwtAuthService;

@RestController
@RequestMapping("/photo")

@CrossOrigin
public class Authentication {
	
	@Autowired
	private ClienteRepositoryAuth clienteRepositoryAuth;
	
	@Autowired
	private FotografoRepository fotografoRepository;
	
	@Autowired
	private JwtAuthService jwtAuthService;
	
	@Autowired()
	private AuthenticationManager authManager;
	
	
	@PostMapping("/auth/login")
	public ResponseEntity<Map<Object, Object>> signIn(@RequestBody ClienteDTO credential){
		System.out.println("***Autenticando***");
		
		try {
			UsernamePasswordAuthenticationToken cliente = new UsernamePasswordAuthenticationToken(credential.getEmail(), credential.getSenha());
		authManager.authenticate(cliente);
		List<String> roles = new ArrayList<>();
		Cliente clienteLogin = new Cliente();
		clienteLogin = clienteRepositoryAuth.findByEmail(credential.getEmail());
		roles.add(clienteLogin.getRole());
		String token =  jwtAuthService.createToken(credential.getEmail(), roles) ;
		Map<Object, Object> jsonResponse = new HashMap<>();
		jsonResponse.put("email", credential.getEmail());
		jsonResponse.put("token", token);
		//System.out.println(token);
		return ResponseEntity.ok(jsonResponse);
		}catch (Exception e) {
			System.out.println(e);
		}
		
		return null;
		
	}
}
