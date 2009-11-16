class Dressmaker
  class Configuration
    class Matcher
      
      attr_reader :configuration
      
      def update_description_on_rule(rule)
        if rule.respond_to?(:description=)
          rule.description = configuration.description_holder
          configuration.description_holder = nil
        end
      end
      
    end
  end
end