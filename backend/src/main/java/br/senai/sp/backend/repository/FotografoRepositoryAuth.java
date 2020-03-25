package br.senai.sp.backend.repository;

import org.springframework.data.repository.CrudRepository;

import br.senai.sp.backend.model.Fotografo;

public interface FotografoRepositoryAuth extends CrudRepository<Fotografo,Long> {
	Fotografo findByEmail(String email);

}
