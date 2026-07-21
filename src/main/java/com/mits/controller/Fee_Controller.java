package com.mits.controller;

import java.time.LocalDate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mits.service.Fee_Service;
import com.mits.service.Student_Service;

@Controller
public class Fee_Controller {

    @Autowired
    private Fee_Service feeService;

    @Autowired
    private Student_Service studentService;

    @RequestMapping(value = "/fees/list", method = RequestMethod.GET)
    public ModelAndView listFees() {

        ModelAndView mv = new ModelAndView("fee-list");
        mv.addObject("feeList", feeService.getAllFees());

        return mv;
    }

    @RequestMapping(value = "/fees/add", method = RequestMethod.GET)
    public ModelAndView addFeeForm() {

        ModelAndView mv = new ModelAndView("fee-form");
        mv.addObject("students", studentService.getAllStudents());

        return mv;
    }

    @RequestMapping(value = "/fee/save", method = RequestMethod.POST)
    public ModelAndView saveFee(
            @RequestParam Integer studentId,
            @RequestParam Double totalAmount,
            @RequestParam Double paidAmount,
            @RequestParam String date
    ) {

        feeService.saveFee(studentId, totalAmount, paidAmount, LocalDate.parse(date));

        return new ModelAndView("redirect:/fees/list");
    }

    @RequestMapping(value = "/fees/delete", method = RequestMethod.GET)
    public ModelAndView deleteFee(@RequestParam Integer id) {

        feeService.deleteFee(id);

        return new ModelAndView("redirect:/fees/list");
    }
}