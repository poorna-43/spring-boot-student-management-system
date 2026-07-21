package com.mits.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.mits.model.Course;

@Repository
public interface Course_Repository extends JpaRepository<Course, Integer> {

}
