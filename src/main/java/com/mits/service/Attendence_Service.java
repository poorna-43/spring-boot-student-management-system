package com.mits.service;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mits.model.AttendanceStatus;
import com.mits.model.Attendence;
import com.mits.model.Course;
import com.mits.model.Student;
import com.mits.repository.Attendence_Repository;
import com.mits.repository.Course_Repository;
import com.mits.repository.Student_Repository;

@Service
public class Attendence_Service {
	@Autowired
private Attendence_Repository attendRepo;
	 @Autowired
	    private Student_Repository studentRepo;

	    @Autowired
	    private Course_Repository courseRepo;

	    public List<Attendence> getAllAttendance() {
	        return attendRepo.findAll();
	    }

	    // =========================
	    // SAVE ATTENDANCE
	    // =========================
	    public void saveAttendance(Integer studentId, Integer courseId, String date, String status) {

	        Student student = studentRepo.findById(studentId)
	                .orElseThrow(() -> new RuntimeException("Student not found"));

	        Course course = courseRepo.findById(courseId)
	                .orElseThrow(() -> new RuntimeException("Course not found"));

	        Attendence attendance = new Attendence();
	        attendance.setStudent(student);
	        attendance.setCourse(course);
	        attendance.setDate(LocalDate.parse(date)); // expects yyyy-MM-dd
	        attendance.setStatus(AttendanceStatus.valueOf(status)); // PRESENT / ABSENT / LATE

	        attendRepo.save(attendance);
	    }

	    // =========================
	    // DELETE ATTENDANCE
	    // =========================
	    public void deleteAttendance(Integer id) {
	        attendRepo.deleteById(id);
	    }
}
