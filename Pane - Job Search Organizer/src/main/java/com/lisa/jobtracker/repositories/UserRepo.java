package com.lisa.jobtracker.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.lisa.jobtracker.models.User;

@Repository
public interface UserRepo extends CrudRepository<User,Long>{
	List<User> findAll();
	
//	Optional<User> findByEmail(String email);
	
	
//	boolean existsByEmail(String email);

	User findByUsername(String username);
	User findByEmail(String email);
	
	//we do not need to make a repository for the LoginUser since we only want to save instances of User to the database
}
