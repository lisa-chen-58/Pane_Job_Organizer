package com.lisa.jobtracker.models;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

    
@Entity
@Table(name="users")
public class User {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @NotEmpty(message="First Name is required!")
    @Size(min=2, max=20, message="First Name must be between 2 and 20 characters")
    private String firstName;
    
    @NotEmpty(message="Last Name is required!")
    @Size(min=2, max=20, message="Last Name must be between 2 and 20 characters")
    private String lastName;
    
    @NotEmpty(message="Username is required!")
    @Size(min=2, max=20, message="Username must be between 2 and 20 characters")
    private String username;
    
    @NotEmpty(message="Email is required!")
    @Email(message="Please enter a valid email!")
    private String email;
    
    @NotEmpty(message="Password is required!")
    @Size(min=8, max=255, message="Password must be at least 8 characters")
    private String password;
    
    @Transient
    @NotEmpty(message="Confirm Password is required!")
    @Size(min=8, max=255, message="Confirm Password must be between 8 and 255 characters")
    private String confirm;

    
//  
//  .--. .---..        .    .---.--.-- .--. .   . .-. .   .--.--.--.  .-. 
//  |   )|    |       / \     |    |  :    :|\  |(   )|   |  |  |   )(   )
//  |--' |--- |      /___\    |    |  |    || \ | `-. |---|  |  |--'  `-. 
//  |  \ |    |     /     \   |    |  :    ;|  \|(   )|   |  |  |    (   )
//  '   `'---''---''       `  '  --'-- `--' '   ' `-' '   '--'--'     `-' 
                                                           
    // One User has Many jobs
    @OneToMany(mappedBy="user", fetch=FetchType.EAGER)
    private List<Job> jobs;
    
    //FAVORITES
    @OneToMany(mappedBy="markingPerson", cascade=CascadeType.ALL, fetch=FetchType.LAZY)
    private List<Job> favorited;
    
    
//    // Many users have many likes
//    @ManyToMany(fetch=FetchType.LAZY)
//    @JoinTable(
//        name="likes", 
//        joinColumns=@JoinColumn(name="user_id"), 
//        inverseJoinColumns=@JoinColumn(name="job_id")
//        )
//    private List<Job> jobLikes;

    
    //
//  .--..---..---..---..---..--.  .-.        .-.  
//  :    |      |    |  |    |   )(   )      (   ) 
//  | --.|---   |    |  |--- |--'  `-.       .--'  
//  :   ||      |    |  |    |  \ (   )     (   `.)
//   `--''---'  '    '  '---''   ` `-'       `---'`
//   .-. .---..---..---..---..--.  .-. 
//   (   )|      |    |  |    |   )(   )
//    `-. |---   |    |  |--- |--'  `-. 
//   (   )|      |    |  |    |  \ (   )
//    `-' '---'  '    '  '---''   ` `-' 
//                                   
//
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getConfirm() {
		return confirm;
	}

	public void setConfirm(String confirm) {
		this.confirm = confirm;
	}

	public List<Job> getJobs() {
		return jobs;
	}

	public void setJobs(List<Job> jobs) {
		this.jobs = jobs;
	}

	public List<Job> getFavorited() {
		return favorited;
	}

	public void setFavorited(List<Job> favorited) {
		this.favorited = favorited;
	}

	
    
}
    