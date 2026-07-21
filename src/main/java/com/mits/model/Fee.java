package com.mits.model;

import java.time.LocalDate;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor

public class Fee {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    private Student student;

    private Double totalAmount;

    private Double paidAmount;

    private Double dueAmount;

    @Enumerated(EnumType.STRING)
    private FeeStatus status;

    private LocalDate date;
}