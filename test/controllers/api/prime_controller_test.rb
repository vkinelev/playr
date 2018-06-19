require 'test_helper'

class Api::PrimeControllerTest < ActionDispatch::IntegrationTest
  test "returns bad request status if number attribute is missing" do
    post api_prime_check_url, params: {}
    assert_response :bad_request
  end

  test "returns unprocessable entity status if number is not greater than 1" do
    post api_prime_check_url, params: { number: 1 }
    assert_response :unprocessable_entity 
  end

  test "successful result includes number and is_prime attributes" do
    post api_prime_check_url, params: { number: 3 }
    
    assert_response :success
    assert_json number: 3, is_prime: true
  end

  private

  def assert_json(hash)
    assert_equal hash, JSON.parse(@response.body, symbolize_names: true)
  end
end
