package com.lisa.jobtracker.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lisa.jobtracker.models.Job;
import com.lisa.jobtracker.repositories.JobRepo;

@Service
public class JobService {
	
	@Autowired
	private JobRepo userRepo;
	
	// returns all the users
    public List<Job> allJobs() {
        return userRepo.findAll();
    }
    // creates a user
    public Job createJob(Job newJob) {
        return userRepo.save(newJob);
    }
	// retrieve one user
	public Job findJobById(Long id) {
		return userRepo.findById(id).orElse(null);
	}
    // updates the user
    public Job updateJob(Job updatedJob) {
    	return userRepo.save(updatedJob);
    }
    
    public void deleteJob(Long id) {
    	Optional<Job> deleteJobAction = userRepo.findById(id);
    	if(deleteJobAction.isPresent()) {
    		userRepo.deleteById(id);
    	} 
    	else {
    		System.out.println("Failed to delete");
    	}
    }
	
	
}
