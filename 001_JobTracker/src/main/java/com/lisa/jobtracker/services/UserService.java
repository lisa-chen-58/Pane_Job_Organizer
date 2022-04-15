package com.lisa.jobtracker.services;

import java.util.List;
import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.lisa.jobtracker.models.LoginUser;
import com.lisa.jobtracker.models.User;
import com.lisa.jobtracker.repositories.UserRepo;

@Service
public class UserService {
	
	@Autowired
	private UserRepo userRepo;
	
	public User register(User newUser, BindingResult result) {
		
		// Reject if username is taken
		if(userRepo.findByUsername(newUser.getUsername())!=null) {
			result.rejectValue("username", "unique", "This username already exists!");
		}

		// Reject if username is taken
		if(userRepo.findByEmail(newUser.getEmail())!=null) {
			result.rejectValue("email", "unique", "This email already exists!");
		}
		
		//Reject if password doesn't match confirmation (! in front of newUser means NOT Operator)
		if(!newUser.getPassword().equals(newUser.getConfirm())) {
			result.rejectValue("password", "Mismatch", "Password does not match");
		}
		
		// Return null if result has errors
		if(result.hasErrors()) {
			return null;
		}
		
		//Has and set password, save user to database
		String hashed = BCrypt.hashpw(newUser.getPassword(), BCrypt.gensalt());
		newUser.setPassword(hashed);
		userRepo.save(newUser);
		return null;
		
	}
	
	public User login(LoginUser newLogin, BindingResult result) {
		
		// Find user by email, reject if not present
		User user = userRepo.findByUsername(newLogin.getUsername());
		if(user==null) {
			result.rejectValue("username", "missingUsername", "Username not found");
			return null;
		}
		else {
			if (!BCrypt.checkpw(newLogin.getPassword(), user.getPassword())) {
				result.rejectValue("password", "Matches", "Invalid Password");
			}
		}
		return user;
		
	}
	// returns all the users
    public List<User> allUsers() {
        return userRepo.findAll();
    }
    // creates a user
    public User createUser(User newUser) {
        return userRepo.save(newUser);
    }
	// retrieve one user
	public User findUserById(Long id) {
		return userRepo.findById(id).orElse(null);
	}
    // updates the user
    public User updateUser(User updatedUser) {
    	return userRepo.save(updatedUser);
    }
    
    public void deleteUser(Long id) {
    	Optional<User> deleteUserAction = userRepo.findById(id);
    	if(deleteUserAction.isPresent()) {
    		userRepo.deleteById(id);
    	} 
    	else {
    		System.out.println("Failed to delete");
    	}
    }
	
	
}
