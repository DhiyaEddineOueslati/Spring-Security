package tn.enig.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetailsService;

import tn.enig.dao.IUserDao;
import tn.enig.model.User;

public interface UserService extends UserDetailsService {
	public User findByUsername(String username);
	
}
