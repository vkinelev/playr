module Primality
  module Algorithms
    class OptimizedTrialDivision

      PRIMES_LESS_THAN_100 =

      def self.primes_less_than_100
        @primes_less_than_100 ||= [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67,
         71, 73, 79, 83, 89, 97].reduce(Hash.new) { |hash, number| hash[number] = true }
      end

      def prime?(number)
        return false if number <= 1
        return true if number == 2 || number == 3

        k = 2
        while k < Math.sqrt(number)
          return false if number % k == 0
          k += 1
        end

        true
      end
    end
  end
end
