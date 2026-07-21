package com.mits.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mits.model.Student;
import com.mits.repository.Student_Repository;

@Service
public class Student_Service {

    @Autowired
    private Student_Repository repository;

    // Save Student
    public Student saveStudent(Student student) {

        return repository.save(student);

    }

    // Get All Students
    public List<Student> getAllStudents() {

        return repository.findAll();

    }

    // Get Student By Id
    public Student getStudentById(int id) {

        return repository.findById(id).orElse(null);

    }

    // Delete Student
    public void deleteStudent(int id) {

        repository.deleteById(id);

    }
    // Search Student
    public List<Student> searchStudents(String keyword) {

        List<Student> students = repository.findAll();

        if (keyword == null || keyword.trim().isEmpty()) {
            return students;
        }

        final String searchKey = keyword.toLowerCase();
        return students.stream()
                .filter(student ->
                        (student.getName() != null &&
                         student.getName().toLowerCase().contains(searchKey))

                     || (student.getEmail() != null &&
                         student.getEmail().toLowerCase().contains(searchKey))

                     || (student.getMobile() != null &&
                         student.getMobile().contains(searchKey))

                     || (student.getCourse() != null &&
                         student.getCourse().getCourseName() != null &&
                         student.getCourse().getCourseName().toLowerCase().contains(searchKey))

                     || (student.getStatus() != null &&
                         student.getStatus().toLowerCase().contains(searchKey))
                )
                .toList();
    }

}