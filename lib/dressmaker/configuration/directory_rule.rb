require 'ftools'
require "delegate"

class Dressmaker
  class Configuration
    class DirectoryRule < Rule

      class All < DirectoryRule

        def matches?(base, target)
          File.directory?(File.join(base, target))
        end

      end
      
      class Pattern < DirectoryRule
        
        attr_reader :pattern, :action
        
        def initialize(pattern, &action)
          @pattern = pattern
          @action = action
        end

        def matches?(base, target)
          File.directory?(File.join(base, target)) && File.fnmatch(pattern, target)
        end
        
      end

      attr_accessor :description, :name

      def execute!(target)
        Delegators.with(File.join(target)) do |dir|
          action.call(dir)
        end
      end

    end
  end
end