package com.mits.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mits.service.Report_Service;

@Controller
@RequestMapping("/reports")
public class Report_Controller {

    @Autowired
    private Report_Service reportService;

    @RequestMapping("")
    public ModelAndView reportDashboard() {

        return new ModelAndView("reports");

    }

    @RequestMapping("/students")
    public ModelAndView studentReport() {

        ModelAndView mv = new ModelAndView("student-report");

        mv.addObject("students", reportService.getStudentReport());

        return mv;

    }

    @RequestMapping("/courses")
    public ModelAndView courseReport() {

        ModelAndView mv = new ModelAndView("course-report");

        mv.addObject("courses", reportService.getCourseReport());

        return mv;

    }

    @RequestMapping("/attendance")
    public ModelAndView attendanceReport() {

        ModelAndView mv = new ModelAndView("attendance-report");

        mv.addObject("attendanceList", reportService.getAttendanceReport());

        return mv;

    }

    @RequestMapping("/fees")
    public ModelAndView feeReport() {

        ModelAndView mv = new ModelAndView("fee-report");

        mv.addObject("feeList", reportService.getFeeReport());

        return mv;

    }

}