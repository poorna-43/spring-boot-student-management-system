package com.mits.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.mits.model.Student;

@Repository
public interface Student_Repository extends JpaRepository<Student, Integer> {

}