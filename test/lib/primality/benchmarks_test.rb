require "minitest/benchmark"

class OptimizedTrialDivisionBenchmark < Minitest::Benchmark
  def setup
    @algorithm = Primality::Algorithms::OptimizedTrialDivision.new
  end

  protected

  attr_reader :algorithm
end

class LargePrimesBenchmark < OptimizedTrialDivisionBenchmark
  def bench_large_primes
    assert_performance_power 0.9 do |n| # n is a range value
      10000.times { algorithm.prime?(n) }
    end
  end

  def self.bench_range
    [28087, 104729, 1299439, 9999991]
  end
end

class NumbersLessThan100Benchmark < OptimizedTrialDivisionBenchmark
  def bench_number_less_than_100
    assert_performance_constant 0.9 do |n| # n is a range value
      1000000.times { algorithm.prime?(n) }
    end
  end

  def self.bench_range
    [2, 29, 61, 97]
  end
end

# bench_number_less_than_100	 0.000683	 0.004482	 0.004723	 0.005925
# bench_large_primes	 0.094473	 0.180707	 0.633801	 1.754694
# bench_large_primes	 0.094054	 0.180084	 0.628558	 1.742997
# bench_large_primes  0.109802	 0.195733	 0.650090	 1.783471
# bench_large_primes	 0.027305	 0.051289	 0.174892	 0.478983
# bench_large_primes	 0.026775	 0.049911	 0.165322	 0.446510
