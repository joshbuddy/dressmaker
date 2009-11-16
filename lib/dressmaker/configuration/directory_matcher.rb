class Dressmaker
  class Configuration
    class DirectoryMatcher < Matcher
      
      attr_reader :configuration
      
      def initialize(configuration)
        @configuration = configuration
      end
      
      def matches(pattern, &block)
        rule = DirectoryRule::Pattern.new(pattern, &block)
        update_description_on_rule(rule)
        configuration.rules << rule
      end
      
      def all(&block)
        rule = DirectoryRule::All.new(&block)
        update_description_on_rule(rule)
        configuration.rules << rule
      end
      
    end
  end
end