require "delegate"

class Dressmaker
  class Configuration
    class Delegators
      
      class DirectoryDelegator < SimpleDelegator
        def for(pattern)
          Dir["#{__getobj__.path}/#{pattern}"].each {|e| Delegators.with(e) {|wrapper_e| yield wrapper_e}}
        end
      end

      class FileDelegator < SimpleDelegator
        def gsub!(pattern, replace = nil, &block)
          contents = self.read.gsub(pattern, replace, &block)
          File.open(self.path, 'w') {|f| f << contents }
        end
        
        def chmod(mode)
          File.chmod(mode, self.path)
        end
        
        def make_executable!
          chmod(0755)
        end
        
        def append!(header)
          contents = File.read(self.path)
          File.open(self.path, 'w') {|f| f << header << contents }
        end
      end
      
      def self.with(target)
        target = target.path unless target.is_a?(String)
        if File.directory?(target)
          yield DirectoryDelegator.new(File.open(target))
        elsif File.file?(target)
          yield FileDelegator.new(File.open(target))
        else
          yield target
        end
      end
    end
  end
end