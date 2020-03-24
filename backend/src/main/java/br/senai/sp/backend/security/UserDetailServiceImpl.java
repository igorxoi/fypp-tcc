package br.senai.sp.backend.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import br.senai.sp.backend.model.Cliente;
import br.senai.sp.backend.repository.ClienteRepositoryAuth;

@Service
public class UserDetailServiceImpl implements UserDetailsService {
	
	@Autowired
	private ClienteRepositoryAuth clienteRepositoryAuth;

	@Override
	public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
		Cliente cliente = clienteRepositoryAuth.findByEmail(email);
		UserDetails userDetails = new User(email, cliente.getEmail(), AuthorityUtils.createAuthorityList(cliente.getRole()));
		return userDetails;
	}

}










