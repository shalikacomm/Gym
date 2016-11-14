package com.bit.dao;

import java.util.List;

import com.bit.entity.ExerciseEntity;
import com.bit.entity.SheduleDetailEntity;
import com.bit.entity.SheduleEntitiy;
import com.bit.entity.WorkoutDetailEntity;
import com.bit.entity.WorkoutEntity;

public interface SheduleDAO {
	
	public List<ExerciseEntity> getActiveExercise() ;
	
	public void addSheduleDetails(SheduleDetailEntity sheduleDetails) ;
	
	public SheduleEntitiy getMaxSheduleById(String userID) ;
	
	public void addShedule(SheduleEntitiy shedule) ;
	
	public List<SheduleEntitiy> getAllShedules();
	
	public boolean deactivateShedule(String shedule_id);

	public boolean activateShedule(String shedule_id)  ;
	
	public List<WorkoutEntity> getWorkoutList();
	
	public List<WorkoutDetailEntity> getOneWorkout(String workout_id) ;
}
