package com.mits.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.mits.model.Fee;

@Repository
public interface Fee_Repository extends JpaRepository<Fee, Integer> {

}
