package com.mits.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mits.model.Course;
import com.mits.model.Student;
import com.mits.service.Course_Service;
import com.mits.service.Student_Service;



@Controller

public class Student_Controller {

    @Autowired
    private Student_Service service;
    @Autowired
    private Course_Service courseService;
   
    @RequestMapping("/")
    public String home() {
    	return "dashboard";
    }
    @RequestMapping("/students/")
    public ModelAndView studentsHome() {

        List<Student> students = service.getAllStudents();

        ModelAndView mav = new ModelAndView("dashboard"); 
        mav.addObject("students", students);

        mav.addObject("totalStudents", students.size());

        long activeStudents = students.stream()
                .filter(s -> "Active".equalsIgnoreCase(s.getStatus()))
                .count();

        mav.addObject("activeStudents", activeStudents);

        mav.addObject("totalCourses", courseService.getCourseCount());

        return mav;
    }
    // Register Page
    

    @RequestMapping("/students/register")
    public ModelAndView register() {

        List<Course> courses = courseService.getAllCourses();
        System.out.println("Courses = " + courses);

        ModelAndView mav = new ModelAndView("register");
        mav.addObject("student", new Student());
        mav.addObject("courses", courses);

        return mav;
    }

    // Save Student
    @RequestMapping("/students/save")
    public ModelAndView save(Student student) {

        service.saveStudent(student);

        return new ModelAndView("redirect:/students/list");
    }

    // Student List
    @RequestMapping("/students/list")
    public ModelAndView studentList() {

        ModelAndView mav = new ModelAndView("studentList");

        mav.addObject("students", service.getAllStudents());

        return mav;
    }

    // View Student
    @RequestMapping("/students/view")
    public ModelAndView view(@RequestParam("id") int id) {

        ModelAndView mav = new ModelAndView("viewStudent");

        mav.addObject("student", service.getStudentById(id));

        return mav;
    }

    // Edit Student
    @RequestMapping("/students/edit")
    public ModelAndView edit(@RequestParam("id") int id) {

        ModelAndView mav = new ModelAndView("editStudent");

        mav.addObject("student", service.getStudentById(id));

        return mav;
    }

    // Update Student
    @RequestMapping("/students/update")
    public ModelAndView update(@RequestParam int id,
                               @RequestParam String name,
                               @RequestParam String email,
                               @RequestParam String mobile,
                               @RequestParam int courseId) {

        Student student = service.getStudentById(id);

        student.setName(name);
        student.setEmail(email);
        student.setMobile(mobile);

        Course course = courseService.getCourseById(courseId);
        student.setCourse(course);

        service.saveStudent(student);

        return new ModelAndView("redirect:/students/list");
    }

    // Delete Student
    @RequestMapping("/students/delete")
    public ModelAndView delete(@RequestParam("id") int id) {

        service.deleteStudent(id);

        return new ModelAndView("redirect:/students/list");
    }

    // Search Page
    @RequestMapping("/students/search")
    public ModelAndView search(@RequestParam(value = "keyword", required = false) String keyword) {

        ModelAndView mav = new ModelAndView("search");

        if (keyword == null || keyword.trim().isEmpty()) {
            mav.addObject("students", service.getAllStudents());
        } else {
            mav.addObject("students", service.searchStudents(keyword));
        }

        return mav;
    }

}