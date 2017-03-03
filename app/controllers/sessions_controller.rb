class SessionsController < ApplicationController
  def new
  end

  def create
    @applicant = Applicant.find_by(email: params[:email])
    redirect_to @applicant
  end
end
