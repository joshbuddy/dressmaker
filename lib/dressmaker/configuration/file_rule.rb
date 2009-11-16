require 'ftools'
require "delegate"

class Dressmaker
  class Configuration
    class FileRule < Rule

      class All < FileRule
        
        def initialize(&action)
          @action = action
        end
        
        def matches?(base, target)
          File.file?(File.join(base, target))
        end
      end

      attr_reader :directory, :action
      attr_accessor :description, :name
      
      class Pattern
        def initialize(pattern, &action)
          @pattern = pattern
          @action = action
        end

        def matches?(base, target)
          File.file?(File.join(base, target)) and File.fnmatch(pattern, File.join(base, target))
        end

      end

      def execute!(target)
        Delegators.with(target) do |file|
          action.call(file)
        end
      end

    end
  end
end