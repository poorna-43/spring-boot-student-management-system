package com.mits.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mits.model.Attendence;
import com.mits.service.Attendence_Service;
import com.mits.service.Student_Service;
import com.mits.service.Course_Service;

@Controller

public class Attendence_Controller {

    @Autowired
    private Attendence_Service attendanceService;

    @Autowired
    private Student_Service studentService;

    @Autowired
    private Course_Service courseService;
    @RequestMapping(value = "/attendance/list", method = RequestMethod.GET)
    public ModelAndView showAttendanceList() {

        List<Attendence> list = attendanceService.getAllAttendance();

        ModelAndView mv = new ModelAndView("attendance-list");
        mv.addObject("attendanceList", list);

        return mv;
    }

   
    // 3. SHOW ADD FORM
    
    @RequestMapping(value = "/attendance/add", method = RequestMethod.GET)
    public ModelAndView showAddForm() {

        ModelAndView mv = new ModelAndView("attendance-form");

        mv.addObject("students", studentService.getAllStudents());
        mv.addObject("courses", courseService.getAllCourses());

        return mv;
    }

  
    // 4. SAVE ATTENDANCE
    
    @RequestMapping(value = "/attendance/save", method = RequestMethod.POST)
    public ModelAndView saveAttendance(
            @RequestParam Integer studentId,
            @RequestParam Integer courseId,
            @RequestParam String date,
            @RequestParam String status
    ) {

        attendanceService.saveAttendance(studentId, courseId, date, status);

        return new ModelAndView("redirect:/attendance/list");
    }


    // 5. DELETE ATTENDANCE
 
    @RequestMapping(value = "/attendance/delete", method = RequestMethod.GET)
    public ModelAndView deleteAttendance(@RequestParam Integer id) {

        attendanceService.deleteAttendance(id);

        return new ModelAndView("redirect:/attendance/list");
    }
}