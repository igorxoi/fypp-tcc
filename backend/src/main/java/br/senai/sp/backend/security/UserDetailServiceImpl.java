package br.senai.sp.backend.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import br.senai.sp.backend.model.Cliente;
import br.senai.sp.backend.model.Fotografo;
import br.senai.sp.backend.repository.ClienteRepositoryAuth;
import br.senai.sp.backend.repository.FotografoRepositoryAuth;

@Service
public class UserDetailServiceImpl implements UserDetailsService {
	
	@Autowired
	private ClienteRepositoryAuth clienteRepositoryAuth;
	
	@Autowired
	private FotografoRepositoryAuth fotografoRepositoryAuth;

	@Override
	public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
		Cliente cliente = clienteRepositoryAuth.findByEmail(email);
		
		Fotografo fotografo = fotografoRepositoryAuth.findByEmail(email);
		
		if(cliente !=null) {
			UserDetails userDetails = new User
					(email, cliente.getSenha(), 
						AuthorityUtils.createAuthorityList(cliente.getRole()));	
			return userDetails;
		}
		
		UserDetails userDetails = new User(email, fotografo.getSenha(), AuthorityUtils.createAuthorityList(fotografo.getRole()));	
		return userDetails;	
	}

}
