class FunnelsController < ApplicationController
  def index
    start_date = Date.parse(params[:start_date])
    end_date = Date.parse(params[:end_date])

    @funnel = {}

    until start_date >= end_date

      range = start_date..(start_date + 1.week)

      applicants = Applicant.where(:created_at => start_date..(start_date + 1.week))

      @funnel[range.to_s] = {
        "applied": applicants.size,
        "quiz_started": applicants.where(workflow_state: 'quiz_started').size,
        "quiz_completed": applicants.where(workflow_state: 'quiz_completed').size,
        "onboarding_requested": applicants.where(workflow_state: 'onboarding_requested').size,
        "onboarding_completed": applicants.where(workflow_state: 'onboarding_completed').size,
        "hired": applicants.where(workflow_state: 'hired').size,
        "rejected": applicants.where(workflow_state: 'rejected').size
      }

      start_date = start_date + 1.week + 1.day
    end


    respond_to do |format|
      format.html { @chart_funnel = formatted_funnel }
      format.json { render json: @funnel }
    end
  end

  private

  # generates a formatted version of the funnel for display in d3
  def formatted_funnel
    formatted = Hash.new { |h, k| h[k] = [] }

    @funnel.each do |date, state_counts|
      state_counts.each do |state, count|
        formatted[state] << {label: date, value: count}
      end
    end

    formatted.map do |k, v|
      {
        key: k,
        values: v
      }
    end
  end
end
