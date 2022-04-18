package com.lisa.jobtracker.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.lisa.jobtracker.models.Job;

@Repository
public interface JobRepo extends CrudRepository<Job,Long>{
	List<Job> findAll();
	List<Job> findAllByOrderByNextFollowUpAsc();
	
//	Optional<User> findByEmail(String email);
	
	
//	boolean existsByEmail(String email);

//	Job findByUsername(String username);
//	Job findByEmail(String email);
	
}
