class ExercisesController < ApplicationController
  def new
    @exercise = Exercise.new
  end

  # def create
  #   @workout = Workout.find(params[:workout_id])
  #   @exercise = @workout.exercises.create(params[:exercise].permit(:name, :set, :rep, :distance))

  #   redirect_to workout_path(@workout)
  # end

  def create
    @exercise = Exercise.new(exercise_params)
    @workout = Workout.find(params[:workout_id])
    @exercise.workout = @workout
    if @exercise.save!
      redirect_to workouts_path
    else
      flash[:notice] = 'This needs to be filled'
      # raise 'this needs to be filled'
    end
  end

  def destroy
    @exercise = Exercise.find(params[:id])
    @exercise.destroy
    @workout = Workout.find(params[:workout_id])
    redirect_to workout_path(@workout), status: :see_other
  end

  def show
    @exercise = Exercise.find(params[:id])
  end

  private

  def exercise_params
    params.require(:exercise).permit(:name, :set, :rep, :weight, :workout_id)
  end
end
