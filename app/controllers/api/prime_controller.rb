require 'prime'

class Api::PrimeController < ApplicationController
  skip_before_action :verify_authenticity_token

  def check
    number = params[:number].to_i
    is_prime = Prime.prime?(number)
    
    render json: { number: number, is_prime: is_prime }
  end
end
