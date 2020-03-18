package br.senai.sp.backend.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import br.senai.sp.backend.model.Cliente;

public interface ClienteRepository extends JpaRepository<Cliente, Long>  {
	
}
