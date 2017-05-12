require 'test_helper'

class HealthDataControllerTest < ActionDispatch::IntegrationTest
  setup do
    @health_datum = health_data(:one)
  end

  test "should get index" do
    get health_data_url
    assert_response :success
  end

  test "should get new" do
    get new_health_datum_url
    assert_response :success
  end

  test "should create health_datum" do
    assert_difference('HealthDatum.count') do
      post health_data_url, params: { health_datum: {  } }
    end

    assert_redirected_to health_datum_url(HealthDatum.last)
  end

  test "should show health_datum" do
    get health_datum_url(@health_datum)
    assert_response :success
  end

  test "should get edit" do
    get edit_health_datum_url(@health_datum)
    assert_response :success
  end

  test "should update health_datum" do
    patch health_datum_url(@health_datum), params: { health_datum: {  } }
    assert_redirected_to health_datum_url(@health_datum)
  end

  test "should destroy health_datum" do
    assert_difference('HealthDatum.count', -1) do
      delete health_datum_url(@health_datum)
    end

    assert_redirected_to health_data_url
  end
end
