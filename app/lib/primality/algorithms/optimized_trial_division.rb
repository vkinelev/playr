module Primality
  module Algorithms
    class OptimizedTrialDivision
      require 'prime'

      class << self
        def first_primes_hash
          @first_primes_hash ||= generated_primes
           .each_with_object(Hash.new) { |number, hash| hash[number] = true }.freeze
        end

        def generated_primes
          @generated_primes ||= [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41,
            43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97, 101].freeze
        end

        def max_first_generated_prime
          generated_primes.last
        end
      end

      def prime?(number)
        return false if number <= 1
        if number <= self.class.max_first_generated_prime
          return self.class.first_primes_hash.key?(number)
        end

        return false if number % 2 == 0  || number % 3 == 0

        k = 1
        while (divider = 6 * k - 1) <= Math.sqrt(number)
          return false if number % divider == 0 || number % (divider + 2) == 0
          k += 1
        end

        true
      end
    end
  end
end
