class BiosController < ApplicationController
  def new
    @bio = Bio.new
  end

  def create
    @bio = Bio.new(bio_params)
    @bio.account = current_account
    if @bio.save
      redirect_to dashboard_path
    else
      render :new

    end
  end

  def edit
    @bio = Bio.find(params[:id])
  end

  def update
    @bio = Bio.find(params[:id])
    @bio.update(content: params[:bio][:content], goal: params[:bio][:goal], body_type: params[:bio][:body_type],
                hobbies: params[:bio][:hobbies])
    redirect_to dashboard_path
  end

  def destroy
    @bio = Bio.find(params[:id])
    if @bio.destroy
      redirect_to profile_path(current_account), status: :see_other
    else
      render dashboard_path
    end
  end

  private

  def bio_params
    params.require(:bio).permit(:content, :goal, :body_type, :hobbies, :account_id)
  end
end
