class ApplicantsController < ApplicationController
  def new
    @applicant = Applicant.new
  end

  def create
    p params
    @applicant = Applicant.new(applicant_params.merge(workflow_state: 'applied'))

    if @applicant.save
      redirect_to @applicant
    else
      flash[:notice] = "Something went wrong! Did you fill out all fields?"
      render :new
    end
  end

  def update

  end

  def show
    # your code here
  end

  private

  def applicant_params
    params.require(:applicant).permit(:first_name, :last_name, :email, :phone, :phone_type, :region, :checkbox_value)
  end
end
