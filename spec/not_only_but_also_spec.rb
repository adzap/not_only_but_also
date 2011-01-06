require 'spec_helper'

describe NotOnlyButAlso do

  before do
    Object.send(:remove_const, :Post)    if Object.const_defined?(:Post)
    Object.send(:remove_const, :Comment) if Object.const_defined?(:Comment)
    ActiveSupport::Dependencies.loaded = []
  end

  it 'should include only named context' do
    Post.class_eval do
      also_has :validations
    end
    Post.should respond_to(:test_validation_method)
    Post.should_not respond_to(:test_stuff_method)
  end

  it 'should include all named contexts' do
    Post.class_eval do
      also_has :validations, :stuff
    end
    Post.should respond_to(:test_validation_method)
    Post.should respond_to(:test_stuff_method)
  end

end
