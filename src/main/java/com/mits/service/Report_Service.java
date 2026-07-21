package com.mits.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mits.model.Attendence;
import com.mits.model.Course;
import com.mits.model.Fee;
import com.mits.model.Student;

@Service
public class Report_Service {

    @Autowired
    private Student_Service studentService;

    @Autowired
    private Course_Service courseService;

    @Autowired
    private Attendence_Service attendenceService;

    @Autowired
    private Fee_Service feeService;

    public List<Student> getStudentReport() {
        return studentService.getAllStudents();
    }

    public List<Course> getCourseReport() {
        return courseService.getAllCourses();
    }

    public List<Attendence> getAttendanceReport() {
        return attendenceService.getAllAttendance();
    }

    public List<Fee> getFeeReport() {
        return feeService.getAllFees();
    }

}