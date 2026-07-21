package com.mits.service;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mits.model.Fee;
import com.mits.model.FeeStatus;
import com.mits.model.Student;
import com.mits.repository.Fee_Repository;
import com.mits.repository.Student_Repository;

@Service
public class Fee_Service {

    @Autowired
    private Fee_Repository feeRepository;

    @Autowired
    private Student_Repository studentRepository;

    public List<Fee> getAllFees() {
        return feeRepository.findAll();
    }

    public void saveFee(Integer studentId, Double totalAmount, Double paidAmount, LocalDate date) {

        Student student = studentRepository.findById(studentId)
                .orElseThrow(() -> new RuntimeException("Student not found"));

        Fee fee = new Fee();

        fee.setStudent(student);
        fee.setTotalAmount(totalAmount);
        fee.setPaidAmount(paidAmount);
        fee.setDueAmount(totalAmount - paidAmount);

        if (paidAmount == 0) {
            fee.setStatus(FeeStatus.UNPAID);
        } else if (paidAmount < totalAmount) {
            fee.setStatus(FeeStatus.PARTIAL);
        } else {
            fee.setStatus(FeeStatus.PAID);
        }

        fee.setDate(date);

        feeRepository.save(fee);
    }

    public void deleteFee(Integer id) {
        feeRepository.deleteById(id);
    }
}
