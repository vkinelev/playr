require 'test_helper'

class OptimizedTrialDivisionTest < ActiveSupport::TestCase
  def setup
    @algorithm = Primality::Algorithms::OptimizedTrialDivision.new
  end

  test 'it returns true if a prime number has been passed' do
    assert algorithm.prime?(2)
  end

  private

  attr_reader :algorithm
end
