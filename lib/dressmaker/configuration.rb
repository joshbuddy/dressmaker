class Dressmaker
  class Configuration 
    
    autoload :Delegators,       File.join(File.dirname(__FILE__), 'configuration', 'delegators')
    autoload :Rule,             File.join(File.dirname(__FILE__), 'configuration', 'rule')
    autoload :FileRule,         File.join(File.dirname(__FILE__), 'configuration', 'file_rule')
    autoload :DirectoryRule,    File.join(File.dirname(__FILE__), 'configuration', 'directory_rule')
    autoload :Matcher,          File.join(File.dirname(__FILE__), 'configuration', 'matcher')
    autoload :FileMatcher,      File.join(File.dirname(__FILE__), 'configuration', 'file_matcher')
    autoload :DirectoryMatcher, File.join(File.dirname(__FILE__), 'configuration', 'directory_matcher')

    attr_accessor :description_holder
    attr_reader   :options, :rules

    def self.load(file, options)
      configuration = new(options)
      configuration.instance_eval(File.read(file))
      configuration
    end

    def initialize(options)
      @options = options
      @rules = []
    end
    
    def directory
      DirectoryMatcher.new(self)
    end
    
    def files
      FileMatcher.new(self)
    end
    
    def process!(target)
      rules.each do |rule|
        Dir.glob("#{target}/**/*") do |file|
          rel_file = file[target.size, file.size]
          rule.inform && rule.execute!(file) if rule.matches?(target, rel_file)
        end
      end
    end
    
    alias_method :desc, :description_holder=
    def desc(description)
      @description_holder = description
    end
    
  end
end