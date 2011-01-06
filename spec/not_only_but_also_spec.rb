require 'spec_helper'

describe NotOnlyButAlso do
  before do
    Object.send(:remove_const, :Post)    if Object.const_defined?(:Post)
    Object.send(:remove_const, :Comment) if Object.const_defined?(:Comment)
    ActiveSupport::Dependencies.loaded = []
  end

  describe ".not_only_but_also" do
    context "with array of symbols" do
      it 'should require symbols as file' do
        NotOnlyButAlso::Helpers.should_receive(:require_context_file).with('Post', :validations)
        Post.also_has :validations
      end
    end

    context "with block" do
      it 'should evaluate the block in the class context' do
        Post.also_has do
          def self.method_in_block; end
        end
        Post.should respond_to(:method_in_block)
      end
    end
  end

  describe NotOnlyButAlso::Helpers do
    describe ".require_context_file" do
      it 'should require context file in folder with underscored class name' do
        NotOnlyButAlso::Helpers.should_receive(:require_dependency).with('post/validations')
        Post.also_has :validations
      end
    end
  end

  context "integration" do
    it 'should load files from all contexts' do
      Post.should_not respond_to(:validation_class_method)
      Post.should_not respond_to(:stuff_class_method)

      Post.also_has :validations, :stuff

      Post.should respond_to(:validation_class_method)
      Post.should respond_to(:stuff_class_method)
    end
  end
end
