package com.lisa.jobtracker.models;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="jobs")
public class Job {
	
	// Using Bean Validation Constraints: https://javaee.github.io/tutorial/bean-validation002.html
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

    @Min(value=0, message="Must be equal or greater than 0")
    @Max(value=10, message="Must be less than or equal to 10")
    private float excitementLevel;
	
	@NotEmpty(message="Company is required!")
	@Size(min=1, max=50, message="Company must be between 1 and 50 characters")
	private String Company;
	
	@NotEmpty(message="Contact Information is required!")
	@Size(min=1, max=255, message="Contact Information must be between 1 and 255 characters")
	private String contactInformation;

	//	Date Applied - Cannot be blank
	//	Cannot be before current year (optional)
    @Column(updatable=true)
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date dateApplied;

	//	Next Follow-up: Cannot be blank
	//	Cannot be before current year? (optional)
    @Column(updatable=true)
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date nextFollowUp;
	
    @NotEmpty(message="Stage of Interview is required!")
    @Size(min=1, max=100, message="Stage of Interview must be between 1 and 100 characters")
    private String stageOfInterview;

    @NotEmpty(message="Job Title is required!")
    @Size(min=1, max=30, message="Job Title must be between 1 and 30 characters")
    private String jobTitle;

    @NotEmpty(message="Area of expertise is required!")
    @Size(min=1, max=30, message="Area of Expertise must be between 1 and 100 characters")
    private String areaOfExpertise;

    @Min(value=0, message="Must be equal or greater than 0")
    private float salary;

	// https://mkyong.com/spring-mvc/spring-mvc-dropdown-box-example/
	//	Remote / Hybrid / In Person / Unknown: 
    @NotNull
    private String location;
    
    // https://www.javainterviewpoint.com/spring-mvc-textarea-example/
    //	Optional
    private String jobDescription;
//
//    	Optional
    private String notableBenefits;

//    	Optional
    private String additionalNotes;

    @Column(updatable=false)
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date createdAt;
    
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date updatedAt;

//  
//  .        .                     .                  
//  |       _|_   o                |      o           
//.--. .-. |  .-.   |    .   .-. .--. .--.|--.   .  .,-. .--.
//|   (.-' | (   )  |    |  (   )|  | `--.|  |   |  |   )`--.
//'    `--'`- `-'`- `-'-' `- `-' '  `-`--''  `--' `-|`-' `--'
//                                           |        
//                                           '         
  // Many Jobs to one user
    @ManyToOne(fetch=FetchType.EAGER)
    @JoinColumn(name="user_id")
    private User user;
    
    
    
    
//    .--.      .   .                      .-.        .-.       .   .               
//    :         _|_ _|_                    (   )      (   )     _|_ _|_              
//    | --. .-.  |   |   .-. .--..--.      .--'        `-.  .-.  |   |   .-. .--..--.
//    :   |(.-'  |   |  (.-' |   `--.     (   `.)     (   )(.-'  |   |  (.-' |   `--.
//     `--' `--' `-' `-' `--''   `--'      `---'`      `-'  `--' `-' `-' `--''   `--'
//                                   
// 
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getCompany() {
		return Company;
	}
	public void setCompany(String company) {
		Company = company;
	}
	public String getContactInformation() {
		return contactInformation;
	}
	public void setContactInformation(String contactInformation) {
		this.contactInformation = contactInformation;
	}
	public Date getDateApplied() {
		return dateApplied;
	}
	public void setDateApplied(Date dateApplied) {
		this.dateApplied = dateApplied;
	}
	public Date getNextFollowUp() {
		return nextFollowUp;
	}
	public void setNextFollowUp(Date nextFollowUp) {
		this.nextFollowUp = nextFollowUp;
	}
	public String getStageOfInterview() {
		return stageOfInterview;
	}
	public void setStageOfInterview(String stageOfInterview) {
		this.stageOfInterview = stageOfInterview;
	}
	public String getJobTitle() {
		return jobTitle;
	}
	public void setJobTitle(String jobTitle) {
		this.jobTitle = jobTitle;
	}
	public String getAreaOfExpertise() {
		return areaOfExpertise;
	}
	public void setAreaOfExpertise(String areaOfExpertise) {
		this.areaOfExpertise = areaOfExpertise;
	}
	public float getSalary() {
		return salary;
	}
	public void setSalary(float salary) {
		this.salary = salary;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getJobDescription() {
		return jobDescription;
	}
	public void setJobDescription(String jobDescription) {
		this.jobDescription = jobDescription;
	}
	public String getNotableBenefits() {
		return notableBenefits;
	}
	public void setNotableBenefits(String notableBenefits) {
		this.notableBenefits = notableBenefits;
	}
	public String getAdditionalNotes() {
		return additionalNotes;
	}
	public void setAdditionalNotes(String additionalNotes) {
		this.additionalNotes = additionalNotes;
	}
	public float getExcitementLevel() {
		return excitementLevel;
	}
	public void setExcitementLevel(float excitementLevel) {
		this.excitementLevel = excitementLevel;
	}
	public Date getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
	public Date getUpdatedAt() {
		return updatedAt;
	}
	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
}