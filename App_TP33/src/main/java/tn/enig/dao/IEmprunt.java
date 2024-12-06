package tn.enig.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import tn.enig.model.Emprunt;
@Repository
public interface IEmprunt extends JpaRepository<Emprunt, Long> {
    List<Emprunt> findByAdherantId(Long adherantId);
    List<Emprunt> findByLivreId(Long livreId);
}
