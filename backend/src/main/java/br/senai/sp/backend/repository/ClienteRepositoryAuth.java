package br.senai.sp.backend.repository;

import org.springframework.data.repository.CrudRepository;

import br.senai.sp.backend.model.Cliente;

public interface ClienteRepositoryAuth extends CrudRepository<Cliente, Long>{
	Cliente findByEmail(String email);
}
