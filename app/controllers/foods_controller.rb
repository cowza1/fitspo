class FoodsController < ApplicationController
  def index
    @foods = Food.all
    @food = Food.new
  end

  def show
    @food = Food.find(params[:id])
  end

  def create
    @food = Food.new(food_params)
    @food.account_id = current_account.id
    if @food.save
      redirect_to foods_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @food = Food.find(params[:id])
    if @food.destroy
      redirect_to foods_path, status: :see_other
    else
      render "foods/index"
    end
  end

  private

  def food_params
    params.require(:food).permit(:date, :account_id)
  end
end
