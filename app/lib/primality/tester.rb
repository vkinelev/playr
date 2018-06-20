module Primality
  class Tester
    attr_accessor :algorithm

    def initialize(algorithm_obj_or_symbol = :optimized_trial_division)
      @algorithm = get_algorithm(algorithm_obj_or_symbol)
    end

    def prime?(number)
      raise ArgumentError, "a number should be Integer" unless number.kind_of? Integer   
      algorithm.prime?(number)
    end

    private

    def get_algorithm(obj_or_symbol)
      return obj_or_symbol unless obj_or_symbol.instance_of? Symbol

      case obj_or_symbol
      when :ruby then Algorithms::RubyBuiltIn.new
      when :optimized_trial_division then Algorithms::OptimizedTrialDivision.new
      else
        raise ArgumentError, "Unknown primality testing algorithm: #{obj_or_symbol}"
      end
    end
  end
end
