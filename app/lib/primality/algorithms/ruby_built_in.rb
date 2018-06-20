module Primality
  module Algorithms
    class RubyBuiltIn
      require 'prime'
  
      def prime?(number)
        Prime.prime?(number)
      end
    end
  end
end