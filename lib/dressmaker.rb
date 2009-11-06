require 'fileutils'

class Dressmaker

  autoload :Configuration, File.join(File.dirname(__FILE__), 'dressmaker', 'configuration')

  attr_reader :source, :destination

  @@description_writer = $stdout

  def self.description_writer
    @@description_writer
  end

  def self.inform(source, status)
    description_writer << "%40s : %s" % [source.name, status] << "\n"
  end

  def initialize(source, destination)
    @source, @destination = source, destination
  end

  def name
    "Application generator"
  end

  def generate(options = nil)
    create_destination
    copy_files_from_source
    run_configuration(options)
  end
  
  protected
  def create_destination
    Dressmaker.inform(self, "creating destination")
    FileUtils.mkdir_p(destination)
  end
  
  def copy_files_from_source
    Dressmaker.inform(self, "copying files")
    FileUtils.cp_r(entries_from_source, destination)
    File.unlink(File.join(destination, 'Pattern'))
  end
  
  def entries_from_source
    (Dir.entries(source) - ['.', '..']).map{|e| File.join(source, e)}
  end
  
  def run_configuration(options)
    configuration = Configuration.load(File.join(source, 'Pattern'), options)
    configuration.process!(destination)
  end

end