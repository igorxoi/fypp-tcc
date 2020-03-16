package br.senai.sp.backend.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import br.senai.sp.backend.model.Fotografo;

public interface FotografoRepository extends JpaRepository<Fotografo, Long> {

}
