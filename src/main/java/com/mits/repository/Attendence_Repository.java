package com.mits.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.mits.model.Attendence;

@Repository
public interface Attendence_Repository extends JpaRepository<Attendence, Integer> {

	void deleteById(Integer id);

}
