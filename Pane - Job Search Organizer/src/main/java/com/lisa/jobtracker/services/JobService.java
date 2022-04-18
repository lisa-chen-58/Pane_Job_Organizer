package com.lisa.jobtracker.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lisa.jobtracker.models.Job;
import com.lisa.jobtracker.models.User;
import com.lisa.jobtracker.repositories.JobRepo;
import com.lisa.jobtracker.repositories.UserRepo;

@Service
public class JobService {
	
	@Autowired
	private JobRepo jobRepo;
	
	@Autowired
	private UserRepo userRepo;
	
	// returns all the jobs
    public List<Job> allJobs() {
        return jobRepo.findAll();
    }
	// returns all the jobs ordered by asc next follow up date
    public List<Job> findAllByOrderByNextFollowUpAsc() {
        return jobRepo.findAllByOrderByNextFollowUpAsc();
    }
    // creates a job
    public Job createJob(Job newJob) {
        return jobRepo.save(newJob);
    }
	// retrieve one job by ID
	public Job findJobById(Long id) {
		return jobRepo.findById(id).orElse(null);
	}
    // retrieves a book
	public Job findJob(Long id) {
        Optional<Job> optionalJob = jobRepo.findById(id);
        if(optionalJob.isPresent()) {
            return optionalJob.get();
        } else {
            return null;
        }
    }
    // updates the job
    public Job updateJob(Job updatedJob) {
    	return jobRepo.save(updatedJob);
    }
    
    // deletes the job    
    public void deleteJob(Long id) {
    	Optional<Job> deleteJobAction = jobRepo.findById(id);
    	if(deleteJobAction.isPresent()) {
    		jobRepo.deleteById(id);
    	} 
    	else {
    		System.out.println("Failed to delete");
    	}
    }
    
    /////////////// MARKING ////////////////////
    public void marking(User user, Job job) {
    	
    	List<Job> jobs = user.getFavorited();
    	jobs.add(job);
    	job.setMarkingPerson(user);
    	jobRepo.save(job);
    	userRepo.save(user);
    	
    }
    
    /////////////////UNMARKING //////////////
    public void unMarking(User user, Job job) {
    	
    	List<Job> jobs = user.getFavorited();
    	jobs.remove(job);
    	job.setMarkingPerson(null);
    	jobRepo.save(job);
    	userRepo.save(user);
    	
    }
	
	
}
