package com.bit.dao;

import java.util.List;

import com.bit.entity.ExerciseEntity;

public interface ExerciseDAO {

	public boolean addExercise(ExerciseEntity exercise);
	public List<ExerciseEntity> getAllExercise() ;
	public ExerciseEntity getExerciseById(String exerciseId) ;
	public boolean deactivateExercise(String exerciseId);
	public boolean activateExercise(String exerciseId);
	public boolean updateExercise(ExerciseEntity exercise) ;
}
