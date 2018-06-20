require 'test_helper'
require "minitest/benchmark"

class OptimizedTrialDivisionTest < ActiveSupport::TestCase
  def setup
    @algorithm = Primality::Algorithms::OptimizedTrialDivision.new
  end

  test 'it returns true if a prime number has been passed' do
    assert algorithm.prime?(9999991)
  end

  test 'it returns true if a composite number has been passed' do
    refute algorithm.prime?(9999999)
  end

  private

  attr_reader :algorithm
end

class OptimizedTrialDivisionBenchmark < Minitest::Benchmark
  def setup
    @algorithm = Primality::Algorithms::OptimizedTrialDivision.new
  end

  protected

  attr_reader :algorithm
end

class LargePrimes < OptimizedTrialDivisionBenchmark
  def bench_large_primes
    assert_performance_power 0.9999 do |n| # n is a range value
      10000.times { algorithm.prime?(n) }
    end
  end

  def self.bench_range
    [28087, 104729, 1299439, 9999991]
  end
end

class NumbersLessThan100 < OptimizedTrialDivisionBenchmark
  def bench_number_less_than_100
    assert_performance_constant 0.9999 do |n| # n is a range value
      10000.times { algorithm.prime?(n) }
    end
  end

  def self.bench_range
    [2, 29, 61, 97]
  end
end



# bench_number_less_than_100	 0.000683	 0.004482	 0.004723	 0.005925
# bench_large_primes	 0.094473	 0.180707	 0.633801	 1.754694
