require 'test_helper'
require 'minitest/mock'

class PrimalityTesterTest < ActiveSupport::TestCase
  test 'it uses OptimizedTrialDivision algorithm by default' do
    tester = Primality::Tester.new
    assert_instance_of Primality::Algorithms::OptimizedTrialDivision, tester.algorithm
  end

  test 'it can be initialized to work with RubyBuiltIn algorithm' do
    tester = Primality::Tester.new(:ruby)
    assert_instance_of Primality::Algorithms::RubyBuiltIn, tester.algorithm
  end

  test 'it raises ArgumentError if a non integer value has been passed' do
    tester = Primality::Tester.new
    assert_raises(ArgumentError, 'a number should be Integer') do
      tester.prime?(2.3)
    end
  end

  test 'it can be initialized to work with a custom algorithm class' do
    algorithm = Minitest::Mock.new
    algorithm.expect(:instance_of?, false, [Symbol])
    algorithm.expect(:==, true, [algorithm])

    tester = Primality::Tester.new(algorithm)
    assert_equal algorithm, tester.algorithm
  end

  test 'it tests a number for primality' do
    algorithm = Minitest::Mock.new
    algorithm.expect(:instance_of?, false, [Symbol])
    algorithm.expect(:prime?, false, [100])

    tester = Primality::Tester.new(algorithm)
    tester.prime?(100)
    algorithm.verify
  end
end
