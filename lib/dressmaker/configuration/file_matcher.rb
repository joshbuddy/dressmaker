class Dressmaker
  class Configuration
    class FileMatcher < Matcher
      
      def initialize(configuration)
        @configuration = configuration
      end
      
      def matches(pattern, &block)
        rule = FileRule.new(pattern, &block)
        configuration.rules << rule
      end
      
      def all(&block)
        rule = FileRule::All.new(&block)
        update_description_on_rule(rule)
        configuration.rules << rule
      end
      
    end
  end
end