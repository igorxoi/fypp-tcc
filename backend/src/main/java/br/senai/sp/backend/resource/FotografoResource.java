package br.senai.sp.backend.resource;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import br.senai.sp.backend.dto.ClienteToken;
import br.senai.sp.backend.dto.FotografoToken;
import br.senai.sp.backend.model.Fotografo;
import br.senai.sp.backend.repository.FotografoRepository;
import br.senai.sp.backend.security.JwtAuthService;

@RestController
@RequestMapping("/photo")

@CrossOrigin
public class FotografoResource {

	@Autowired
	private FotografoRepository fotografoRepository;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@Autowired
	private JwtAuthService jwtAuthService;
	
	//listar todos os fotografos
	@GetMapping("/fotografos")
	public List<Fotografo> getFotografos(){
		return fotografoRepository.findAll();
	}
	
	//listar os fotografos por codigo
	@GetMapping("/fotografos/{id}")
	public ResponseEntity<?> getFotografo(@PathVariable Long id){
		Optional codFotografo = fotografoRepository.findById(id);
		return codFotografo.isPresent() ? ResponseEntity.ok(codFotografo) : ResponseEntity.notFound().build();
 	}
	
	//listar pelo nome
	@GetMapping("/fotografos/nome/{nome}")
	public List<Fotografo> getFotografoLikeNome(@PathVariable String nome){
		return fotografoRepository.findByLikeNome(nome);
	}
	
	//cadastrar um fotografo
	@PostMapping("/fotografo")
	@ResponseStatus(HttpStatus.CREATED)
	public FotografoToken gravar(@Valid @RequestBody Fotografo fotografo) {
		
		String senhaCodificada = bCryptPasswordEncoder.encode(fotografo.getSenha());
		
		Fotografo novoFotografo = new Fotografo();
		fotografo.setSenha(senhaCodificada);
		novoFotografo =	fotografoRepository.save(fotografo);
		
		FotografoToken fotografoToken = new FotografoToken();
		List<String> roles = new ArrayList<>();
		String token =  jwtAuthService.createToken(fotografo.getEmail(), roles);
		
		fotografoToken.setToken(token);
		fotografoToken.setEmail(fotografo.getEmail());
		fotografoToken.setNome(fotografo.getNome());
		fotografoToken.setCep(fotografo.getCep());
		fotografoToken.setFotoPerfil(fotografo.getFotoPerfil());
		fotografoToken.setId(fotografo.getId());
		fotografoToken.setSenha(fotografo.getSenha());
		fotografoToken.setTelefone(fotografo.getTelefone());
		fotografoToken.setSenha(fotografo.getSenha());
		fotografoToken.setRole(fotografo.getRole());
		
		
		
		return fotografoToken;
	}
}
