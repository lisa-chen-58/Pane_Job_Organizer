package com.lisa.jobtracker.models;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;
    
public class LoginUser {
    
    @NotEmpty(message="Username is required!")
    @Size(min=2, max=20, message="Username must be between 2 and 20 characters")
    private String username;
    
    @NotEmpty(message="Password is required!")
    @Size(min=8, message="Password must be at least 8 characters")
    private String password;
    
    public LoginUser() {}

    
    // Shortcut Alt Shift S 
    // Source > Setters and Getters
//	
//    .--.      .   .                      .-.        .-.       .   .               
//    :         _|_ _|_                    (   )      (   )     _|_ _|_              
//    | --. .-.  |   |   .-. .--..--.      .--'        `-.  .-.  |   |   .-. .--..--.
//    :   |(.-'  |   |  (.-' |   `--.     (   `.)     (   )(.-'  |   |  (.-' |   `--.
//     `--' `--' `-' `-' `--''   `--'      `---'`      `-'  `--' `-' `-' `--''   `--'
//                                   
// 
    
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
}
    