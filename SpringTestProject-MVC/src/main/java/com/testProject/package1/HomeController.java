package com.testProject.package1;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.testProject.Models.testmodel;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model,HttpServletRequest request,HttpServletRequest response) {
		
		logger.info("Welcome home! The client locale is {}.", locale);
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		String formattedDate = dateFormat.format(date);
		model.addAttribute("serverTime", formattedDate );
		
	
		return "Login";

		
	}
	
	@RequestMapping("/add")
	public ModelAndView add(HttpServletRequest request, HttpServletResponse response){
		
		int i=Integer.parseInt(request.getParameter("text1"));
		int j=Integer.parseInt(request.getParameter("text2"));
		
		int n=new Addservice().add(i,j);
		
		ModelAndView mv=new ModelAndView();
		mv.setViewName("Display");
		mv.addObject("result", n);
		
		return mv;
	}
	
	@RequestMapping("/loadtestmodel")
	public ModelAndView DisplayTestModel(HttpServletRequest request, HttpServletResponse response,
			@RequestParam("text1") String text1){
		
		testmodel tm=new testmodel();
		
		tm.setName(text1);
		tm.setMessage(request.getParameter("text2"));
	    ModelAndView mv=new ModelAndView();
	    mv.setViewName("DisplayTestModel");
	    mv.addObject("welcome", tm);
	
	    return mv;
	}
	
	
	
}
