require 'test_helper'

class OptimizedTrialDivisionTest < ActiveSupport::TestCase
  def setup
    @algorithm = Primality::Algorithms::OptimizedTrialDivision.new
  end

  test 'it returns true if a prime number has been passed' do
    assert algorithm.prime?(2)
    assert algorithm.prime?(3)
    assert algorithm.prime?(9999991)
  end

  test 'it returns false if a composite number has been passed' do
    refute algorithm.prime?(1)
    refute algorithm.prime?(4)
    refute algorithm.prime?(9999999)
  end

  private

  attr_reader :algorithm
end
