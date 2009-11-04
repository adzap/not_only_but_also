require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe NotOnlyButAlso do

  it 'should include context from file in sub-folder' do
    Post.should respond_to(:test_validation_method)
  end

  it 'should include context from named with suffix' do
    Comment.should respond_to(:test_validation_method)
  end

end
