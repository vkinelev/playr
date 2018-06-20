require 'test_helper'

class RubyBuiltInTest < ActiveSupport::TestCase
  test 'it returns true if a prime number has been passed' do
    algorithm = Primality::Algorithms::RubyBuiltIn.new
    assert algorithm.prime?(2)
  end
end
