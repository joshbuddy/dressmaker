begin
  require 'jeweler'

  Jeweler::Tasks.new do |s|
    s.name = "dressmaker"
    s.description = s.summary = "Application templating in ruby. Define beautiful patterns and cut them out."
    s.email = "joshbuddy@gmail.com"
    s.homepage = "http://github.com/joshbuddy/dressmaker"
    s.authors = ["Joshua Hull"]
    s.files = FileList["[A-Z]*", "{lib,spec}/**/*"]
    s.rubyforge_project = 'dressmaker'
  end
  Jeweler::GemcutterTasks.new
  Jeweler::RubyforgeTasks.new do |rubyforge|
    rubyforge.doc_task = "rdoc"
    rubyforge.remote_doc_path = ''
  end
rescue LoadError
  puts "Jeweler not available. Install it with: sudo gem install technicalpickles-jeweler -s http://gems.github.com"
end
