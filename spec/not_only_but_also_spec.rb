require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe NotOnlyButAlso do

  before do
    Object.send(:remove_const, :Post)    if Object.const_defined?(:Post)
    Object.send(:remove_const, :Comment) if Object.const_defined?(:Comment)
    ActiveSupport::Dependencies.loaded = []
  end

  it 'should include named context from file in sub-folder' do
    Post.class_eval do
      also_has :validations
    end
    Post.should respond_to(:test_validation_method)
    Post.should_not respond_to(:test_stuff_method)
  end

  it 'should include named context from named with suffix' do
    Comment.class_eval do
      also_has :validations
    end
    Comment.should respond_to(:test_validation_method)
  end

  it 'should include named contexts' do
    Post.class_eval do
      also_has :validations, :stuff
    end
    Post.should respond_to(:test_validation_method)
    Post.should respond_to(:test_stuff_method)
  end

end
