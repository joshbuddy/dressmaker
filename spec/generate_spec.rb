require File.expand_path(File.join(File.dirname(__FILE__), "spec_helper"))

describe 'Dressmaker' do
  
  before(:each) do
    FileUtils.rm_rf(File.expand_path(File.join(File.dirname(__FILE__), 'output')))
    FileUtils.mkdir_p(File.expand_path(File.join(File.dirname(__FILE__), 'output')))
  end
  
  after(:each) do
    FileUtils.rm_rf(File.expand_path(File.join(File.dirname(__FILE__), 'output')))
  end
  
  it "should generate" do
    maker = Dressmaker.new(File.expand_path(File.join(File.dirname(__FILE__), 'fixtures', 'template-test')), File.expand_path(File.join(File.dirname(__FILE__), 'output', 'template-test')))
    maker.generate
    File.exist?(File.expand_path(File.join(File.dirname(__FILE__), 'output', 'template-test', 'bin', 'runner'))).should be_true
    File.executable?(File.expand_path(File.join(File.dirname(__FILE__), 'output', 'template-test', 'bin', 'runner'))).should be_true
    File.executable?(File.expand_path(File.join(File.dirname(__FILE__), 'fixtures', 'template-test', 'bin', 'runner'))).should be_false
    File.read(File.expand_path(File.join(File.dirname(__FILE__), 'output', 'template-test', 'bin', 'runner'))).should == "this is my everyone for lovin'"
  end
end

