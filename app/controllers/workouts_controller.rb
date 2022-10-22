class WorkoutsController < ApplicationController
  def index
    @workouts = Workout.all
    @workout = Workout.new
    @exercise = Exercise.new
  end

  def show
    @workout = Workout.find(params[:id])
    # @account = Account.find(params[:id])
    @exercises = @workout.exercises
  end

  def accounts
    @account = Account.find_by(username: params[:username])
    @workouts = Workout.all
  end

  def new
    @workout = Workout.new
  end

  def create
    @workout = Workout.new(workout_params)
    @workout.account = current_account
    if @workout.save
      redirect_to workouts_path
    else
      render :new

    end
  end

  def edit
    @workout = Workout.find(params[:id])
  end

  def update
    @workout = Workout.find(params[:id])
    @workout.update(name: params[:workout][:name], date: params[:workout][:date], activity: params[:workout][:activity],
                    length: params[:workout][:length])
    redirect_to workout_path(@workout)
  end

  def destroy
    @workout = Workout.find(params[:id])
    if @workout.destroy
      redirect_to workouts_path, status: :see_other
    else
      render "workouts/index"
    end
  end

  private

  def workout_params
    params.require(:workout).permit(:name, :date, :activity, :length, :account_id)
  end
end
