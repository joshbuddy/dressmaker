# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{dressmaker}
  s.version = "0.0.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Joshua Hull"]
  s.date = %q{2009-12-01}
  s.default_executable = %q{dressmaker}
  s.description = %q{Application templating in ruby. Define beautiful patterns and cut them out.}
  s.email = %q{joshbuddy@gmail.com}
  s.executables = ["dressmaker"]
  s.extra_rdoc_files = [
    "README.rdoc"
  ]
  s.files = [
    "README.rdoc",
    "Rakefile",
    "VERSION",
    "lib/dressmaker.rb",
    "lib/dressmaker/configuration.rb",
    "lib/dressmaker/configuration/delegators.rb",
    "lib/dressmaker/configuration/directory_matcher.rb",
    "lib/dressmaker/configuration/directory_rule.rb",
    "lib/dressmaker/configuration/file_matcher.rb",
    "lib/dressmaker/configuration/file_rule.rb",
    "lib/dressmaker/configuration/matcher.rb",
    "lib/dressmaker/configuration/rule.rb",
    "lib/dressmaker/tasks.rb",
    "spec/fixtures/template-test/Pattern",
    "spec/fixtures/template-test/bin/runner",
    "spec/fixtures/template-test/bin/script",
    "spec/generate_spec.rb",
    "spec/spec.opts",
    "spec/spec_helper.rb"
  ]
  s.homepage = %q{http://github.com/joshbuddy/dressmaker}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{dressmaker}
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{Application templating in ruby. Define beautiful patterns and cut them out.}
  s.test_files = [
    "spec/generate_spec.rb",
    "spec/spec_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end

