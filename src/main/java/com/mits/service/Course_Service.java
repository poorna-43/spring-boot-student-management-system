package com.mits.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mits.model.Course;
import com.mits.repository.Course_Repository;


@Service
public class Course_Service {

    @Autowired
    private Course_Repository repository;

    public Course saveCourse(Course course) {
        return repository.save(course);
    }

    public List<Course> getAllCourses() {
        return repository.findAll();
    }

    public Course getCourseById(int id) {
        return repository.findById(id).orElse(null);
    }

    public void deleteCourse(int id) {
        repository.deleteById(id);
    }
    public long getCourseCount() {
        return repository.count();
    }
}