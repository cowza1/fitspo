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

  private

  def bio_params
    params.require(:bio).permit(:content, :goal, :body_type, :hobbies, :account_id)
  end
end
