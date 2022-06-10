require 'dry/inflector'

class LogParser
  module String
    refine ::String do
      def pluralize(count = nil)
        return inflector.singularize(self) if count == 1

        inflector.pluralize(self)
      end

      private

      def inflector
        @inflector = Dry::Inflector.new
      end
    end
  end
end
