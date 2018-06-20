module Primality
  module Algorithms
    # it's just wrapper around Ruby's Prime.prime?
    class RubyBuiltIn
      require 'prime'

      def prime?(number)
        Prime.prime?(number)
      end
    end
  end
end
