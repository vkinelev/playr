require 'prime'

class Api::PrimeController < ApplicationController
  skip_before_action :verify_authenticity_token

  def check
    unless params.key?(:number)
      msg = 'JSON should contain "number" in the root. E.g. { number: 777 }'
      render json: { error_message: msg }, status: 400
      return
    end

    number = params[:number].to_i
    unless number >= 2
      msg = 'Please provide a natural number greater than 1'
      render json: { error_message: msg }, status: 422
      return
    end

    render json: { number: number, is_prime: primality_checker.prime?(number) }
  end

  private

  def primality_checker
    Prime
  end
end
