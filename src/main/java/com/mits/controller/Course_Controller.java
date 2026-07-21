package com.mits.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mits.model.Course;
import com.mits.service.Course_Service;


@Controller

public class Course_Controller {

    @Autowired
    private Course_Service service;

 
    @RequestMapping("/courses/list")
    public ModelAndView listCourses() {

        List<Course> courses = service.getAllCourses();

        ModelAndView mav = new ModelAndView("courseList");
        mav.addObject("courses", courses);

        return mav;
    }

   
    @RequestMapping("/courses/register")
    public ModelAndView registerCourse() {
        ModelAndView mav = new ModelAndView("courseRegister");
        mav.addObject("course", new Course());
        return mav;
    }

   
    @RequestMapping("/courses/save")
    public ModelAndView saveCourse(Course course) {

        service.saveCourse(course);

        return new ModelAndView("redirect:/courses/list");
    }

   
    @RequestMapping("/courses/edit")
    public ModelAndView edit(@RequestParam("id") int id) {

        ModelAndView mav = new ModelAndView("editCourse");
        mav.addObject("course", service.getCourseById(id));

        return mav;
    }
    @RequestMapping("/courses/update")
    public ModelAndView update(Course course) {

        service.saveCourse(course);

        return new ModelAndView("redirect:/courses/list");
    }

    
    @RequestMapping("/courses/delete")
    public ModelAndView deleteCourse(@RequestParam("id") int id) {

        service.deleteCourse(id);

        return new ModelAndView("redirect:/courses/list");
    }
}