require 'ftools'
require "delegate"

class Dressmaker
  class Configuration
    class DirectoryRule

      attr_reader :directory, :action
      attr_accessor :description, :name

      def initialize(directory, &action)
        @directory = directory
        @action = action
      end
      
      def matches?(target)
        self.name = "Directory (#{File.join(target, directory)})"
        File.directory?(File.join(target, directory))
      end

      def execute!(target)
        Dressmaker.inform(self, description) if description
        dir = DirectoryDelegator.new(File.open(File.join(target, directory)))
        action.call(dir)
      end

      class DirectoryDelegator < SimpleDelegator
        def for(pattern)
          Dir["#{__getobj__.path}/#{pattern}"].each {|e| yield e}
        end
      end
    end
  end
end