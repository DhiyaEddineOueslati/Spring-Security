package tn.enig.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import tn.enig.model.Role;

public interface IRoleDao extends JpaRepository<Role, Integer> {

}
