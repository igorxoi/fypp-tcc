package br.senai.sp.backend.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import br.senai.sp.backend.model.Fotografo;

public interface FotografoRepository extends JpaRepository<Fotografo, Long> {

	
	@Query(value = "SELECT f FROM Fotografo f WHERE f.nome LIKE %:nome% ")
	List<Fotografo> findByLikeNome(@Param("nome") String nome);
}
