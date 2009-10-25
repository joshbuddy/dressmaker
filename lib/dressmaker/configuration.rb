class Dressmaker
  class Configuration 
    
    autoload :DirectoryRule, File.join(File.dirname(__FILE__), 'configuration', 'directory_rule')

    attr_accessor :description_holder

    def self.load(file)
      configuration = new
      configuration.instance_eval(File.read(file))
      configuration
    end

    def initialize
      @rules = []
    end
    
    def directory(directory, &block)
      rule = DirectoryRule.new(directory, &block)
      if rule.respond_to?(:description=)
        rule.description = description_holder
        self.description_holder = nil
      end
      @rules << rule
    end
    
    def process!(target)
      @rules.each do |rule|
        if rule.matches?(target)
          rule.execute!(target)
        end
      end
    end
    
    alias_method :desc, :description_holder=
    def desc(description)
      @description_holder = description
    end
    
  end
end