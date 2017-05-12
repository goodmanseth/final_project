require 'test_helper'

class ActivitiesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get activities_path
    assert_response :success
  end

end
