require 'test_helper'

class ApplicantTest < ActiveSupport::TestCase
  def setup
    @applicant = Applicant.new(first_name: "First",
              last_name: "Last",
              region: "SF",
              phone: "555-555-5555",
              email: "sample@email.com",
              phone_type: "cell",
              source: "Google",
              over_21: true,
              reason: "Lorem ipsum...",
              workflow_state: "quiz_started")
  end

  test "should be valid" do
    assert @applicant.valid?
  end

  test "first name should be present" do
    @applicant.first_name = ""
    assert_not @applicant.valid?
  end

  test "email should be present" do
    @applicant.email = ""
    assert_not @applicant.valid?
  end
end
