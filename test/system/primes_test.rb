require "application_system_test_case"

class PrimesTest < ApplicationSystemTestCase
  test "display number is prime" do
    visit primality_check_url
  
    fill_in 'number', with: 3
    click_button 'Is prime?'
    
    assert_selector "p", text: "🎉👍 3 is a prime number"
  end

  test "display number is not prime" do
    visit primality_check_url
  
    fill_in 'number', with: 4
    click_button 'Is prime?'
    
    assert_selector "p", text: "👎 4 is not a prime number"
  end

  test "fills in a random number" do
    visit primality_check_url
  
    click_button 'Fill-in a random number'
    
    assert_field "number", with: /\d+/
  end    

  test "displays an error" do
    visit primality_check_url
  
    fill_in 'number', with: 'hello'
    click_button 'Is prime?'

    assert_selector "p", text: "Please provide a natural number greater than 1"
  end    
end
