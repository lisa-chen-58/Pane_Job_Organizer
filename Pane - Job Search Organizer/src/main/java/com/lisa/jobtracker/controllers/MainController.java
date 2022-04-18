package com.lisa.jobtracker.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.lisa.jobtracker.models.Job;
import com.lisa.jobtracker.models.LoginUser;
import com.lisa.jobtracker.models.User;
import com.lisa.jobtracker.services.JobService;
import com.lisa.jobtracker.services.UserService;

@Controller
public class MainController {

	@Autowired
		 private UserService userService;
	@Autowired
		 private JobService jobService;
	@Autowired
		 private HttpSession session;
		
	
//	.                                            .      .--.           
//	|                o                           |      |   )          
//	|     .-.  .-..  .  .--.       .-.  .--.  .-.|      |--'  .-.  .-..
//	|    (   )(   |  |  |  |      (   ) |  | (   |      |  \ (.-' (   |
//	'---' `-'  `-`|-' `-'  `-      `-'`-'  `- `-'`-     '   ` `--' `-`|
//	           ._.'                                                ._.'
//	
	/////// REGISTER USER //////////
	
	@GetMapping("/")
	public String home() {
	return "redirect:/pane/login";
	}

	@GetMapping("/pane/login")
	public String login(Model model) {
	model.addAttribute("newUser", new User());
	model.addAttribute("newLogin", new LoginUser());
	System.out.println("hi");
	return "login.jsp";
	}
	
	@PostMapping("/register")
	public String register(@Valid @ModelAttribute("newUser") User newUser, BindingResult result, Model model, HttpSession session) {
	userService.register(newUser,  result);
	
	if(result.hasErrors()) {
	    model.addAttribute("newLogin", new LoginUser()); 
	    return "login.jsp";
	}	    
	session.setAttribute("user_id", newUser.getId());
	return "redirect:/pane/welcome";
	}
	

/////// LOGIN POST ROUTE //////////
	
	@PostMapping("/login")
	public String login(@Valid @ModelAttribute("newLogin") LoginUser newLogin,BindingResult result, Model model, HttpSession session) {
	User user = userService.login(newLogin, result);
	
	if(result.hasErrors()) {
		model.addAttribute("newUser", new User());
	    return "login.jsp";
	}
	
	session.setAttribute("user_id", user.getId());
	return "redirect:/pane/welcome";
	}
	
	////////////LOGOUT GET ROUTE ///////////////
		
	@GetMapping("/logout")
	public String logout(HttpSession session) {
	session.invalidate();
	return "redirect:/";
	}
	
	//////////// DELETE GET ROUTE ///////////////
	
	@GetMapping("/delete/user/{id}")
	public String delete(@PathVariable("id") Long id) {
	userService.deleteUser(id);
	return "redirect:/jobs";
	}
	
	

//	.  .   .  ..---..     .--. .--. .    ..---.
//	 \  \ /  / |    |    :    :    :|\  /||    
//	  \  \  /  |--- |    |    |    || \/ ||--- 
//	   \/ \/   |    |    :    :    ;|    ||    
//	    ' '    '---''---' `--' `--' '    ''---'

	@GetMapping("pane/welcome")
    public String welcome(HttpSession session, Model model) {
    	if(session.getAttribute("user_id") == null) {
    		return "redirect:/";
    	}
    	Long userId = (Long) session.getAttribute("user_id");
    	User userLogin=userService.findUserById(userId);
    	model.addAttribute("userLogin",userLogin);
    	return "welcome.jsp";
    	}
	
//	.--.     .     .-. .   ..--.  .--.     .    .--. .--. 
//	|   :   / \   (   )|   ||   ):    :   / \   |   )|   :
//	|   |  /___\   `-. |---||--: |    |  /___\  |--' |   |
//	|   ; /     \ (   )|   ||   ):    ; /     \ |  \ |   ;
//	'--' '       ` `-' '   ''--'  `--' '       `'   `'--' 

    @GetMapping("/pane/dashboard")
    public String items(HttpSession session, Model model) {
    	if(session.getAttribute("user_id") == null) {
    		return "redirect:/";
    	}
    	Long userId = (Long) session.getAttribute("user_id");
    	User userLogin=userService.findUserById(userId);
    	model.addAttribute("userLogin",userLogin);
    	model.addAttribute("allJobs", jobService.allJobs());	
    	model.addAttribute("sortNextFollowUp", jobService.findAllByOrderByNextFollowUpAsc());	
    	System.out.println(jobService.findAllByOrderByNextFollowUpAsc());
    	return "dashboard.jsp";
    	}
    
//    .--..--. .---.    .    .---..---.
//    :    |   )|       / \     |  |    
//    |    |--' |---   /___\    |  |--- 
//    :    |  \ |     /     \   |  |    
//     `--''   `'---''       `  '  '---'                                     
	
	///////////// FORM /////////////
	@GetMapping("/pane/addjob")
	public String itemForm(@ModelAttribute("addJob") Job job, HttpSession session, Model model) {
	  if(session.getAttribute("user_id") == null) {
	  	return "redirect:/";
	  }
	  Long userId = (Long) session.getAttribute("user_id");
	  User userLogin = userService.findUserById(userId);
	  model.addAttribute("userLogin", userLogin);
	  return "addJob.jsp";
	}
	
	/////////// SUBMIT FORM /////////////	
	@PostMapping("/pane/create")
	public String createItem(@Valid @ModelAttribute("addJob") Job newJob, BindingResult result, HttpSession session) {
	
	  if(result.hasErrors()) {
	      return "addJob.jsp";
	  }
	
	  jobService.createJob(newJob);
	  return "redirect:/pane/dashboard";
	}
	
//
// 	.-. .   . .--. .  .   .  .      .--. .   ..---.
// (   )|   |:    : \  \ /  /      :    :|\  ||    
// 	`-. |---||    |  \  \  /       |    || \ ||--- 
// (   )|   |:    ;   \/ \/        :    ;|  \||    
// 	`-' '   ' `--'     ' '          `--' '   ''---'


	@GetMapping("/pane/detail/{id}")
	public String showJob(@PathVariable("id") Long id, @ModelAttribute("showJob") Job job, Model model, HttpSession session) {
	if(session.getAttribute("user_id")==null) {
	return "redirect:/";
	}
	Long userId = (Long) session.getAttribute("user_id");
	User userLogin=userService.findUserById(userId);
	model.addAttribute("userLogin", userLogin);
	model.addAttribute("showJob", jobService.findJobById(id));
	model.addAttribute("allJobs",jobService.allJobs());
	return "showJob.jsp";
	
	}
	
//    
//.---..--. --.--.---.      .--. .   ..---.
//|    |   :  |    |       :    :|\  ||    
//|--- |   |  |    |       |    || \ ||--- 
//|    |   ;  |    |       :    ;|  \||    
//'---''--' --'--  '        `--' '   ''---'
//    
	
	@GetMapping("/pane/edit/{id}")
	public String editForm(@PathVariable("id") Long id, @ModelAttribute("editJob") Job job, HttpSession session, Model model) {
	  if(session.getAttribute("user_id") == null) {
	  	return "redirect:/";
	  }
	  Long userId = (Long) session.getAttribute("user_id");
	  User userLogin = userService.findUserById(userId);
	  model.addAttribute("userLogin", userLogin);
	  model.addAttribute("editJob", jobService.findJobById(id)); 	  
	  return "editJob.jsp";
	}
	
	@PostMapping("/pane/edit/{id}")
	public String editJob(@PathVariable("id") Long id, @Valid @ModelAttribute("editJob") Job editJob, BindingResult result, Model model, HttpSession session, @ModelAttribute("modifier") User user) {
	  if(session.getAttribute("user_id") == null) {
		  	return "redirect:/";
		  }
	  if(result.hasErrors()) {	
	      return "editJob.jsp";
	  }

		Long userId = (Long) session.getAttribute("user_id");
		User userLogin = userService.findUserById(userId);
		
//		Set the person marking it as a favorite
		editJob.setMarkingPerson(userLogin);
		
		jobService.updateJob(editJob);
		
		return "redirect:/pane/dashboard";
	}

	
//    
//.--. .---..    .---..---..---.      .--. .   ..---.
//|   :|    |    |      |  |         :    :|\  ||    
//|   ||--- |    |---   |  |---      |    || \ ||--- 
//|   ;|    |    |      |  |         :    ;|  \||    
//'--' '---''---''---'  '  '---'      `--' '   ''---'
//

	@GetMapping("/pane/delete/{id}")
	public String deleteJob(@PathVariable("id") Long id) {
		
		// Uses the AutoWired Session
		if(session.getAttribute("user_id") == null) {
			return "redirect:/pane/edit/{id}";
	  }
	  jobService.deleteJob(id);
	  return "redirect:/pane/dashboard";
	}
	
//    
//.---.    .    .       . .--. .--. --.--.---..---. .-. 
//|       / \    \     / :    :|   )  |    |  |    (   )
//|---   /___\    \   /  |    ||--'   |    |  |---  `-. 
//|     /     \    \ /   :    ;|  \   |    |  |    (   )
//'    '       `    '     `--' '   `--'--  '  '---' `-' 
//
	
	@GetMapping("/mark/{id}")
	public String mark(@PathVariable("id") Long id, HttpSession session) {
		Long userId = (Long) session.getAttribute("user_id");
		User markingPerson = userService.findUser(userId);
		Job markJob = jobService.findJob(id);
		
		jobService.marking(markingPerson, markJob);
		
		return "redirect:/pane/dashboard";
	}
	

	@GetMapping("/unmark/{id}")
	public String unmark(@PathVariable("id") Long id, HttpSession session) {
		Long userId = (Long) session.getAttribute("user_id");
		User markingPerson = userService.findUser(userId);
		Job unmarkJob = jobService.findJob(id);
		
		jobService.unMarking(markingPerson, unmarkJob);
		
		return "redirect:/pane/dashboard";
	}
	
	
	
	
	
	

}
	
