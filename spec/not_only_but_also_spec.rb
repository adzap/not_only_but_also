require 'spec_helper'

describe NotOnlyButAlso do
  before do
    Object.send(:remove_const, :Post)    if Object.const_defined?(:Post)
    Object.send(:remove_const, :Comment) if Object.const_defined?(:Comment)
    ActiveSupport::Dependencies.loaded = []
    Post.class_eval do
      class << self
        attr_accessor :_not_only_but_also_contexts
      end
    end
  end

  describe ".not_only_but_also" do
    context "with array of symbols and no block" do
      it 'should require symbols as files' do
        NotOnlyButAlso::Helpers.should_receive(:require_context_file).with('Post', :validations)
        Post._not_only_but_also_contexts = {:validations => lambda { } }

        Post.also_has :validations
      end

      it 'should evaluate the block in the class context' do
        NotOnlyButAlso::Helpers.stub(:require_context_file).with('Post', :validations)
        Post._not_only_but_also_contexts = {:validations => lambda { def self.method_in_block; end } }
        Post.also_has :validations

        Post.should respond_to(:method_in_block)
      end
    end

    context "with a block" do

      context "and a context name" do
        it 'should store the block using context name provided' do
          Post.also_has(:validations) { }

          Post._not_only_but_also_contexts[:validations].should be_kind_of(Proc)
        end
      end

      context "and no context name" do
        it 'should determine context name from file' do
          Dir.mktmpdir do |dir|
            filename = "#{dir}/validations.rb"
            File.open(filename, 'w+') { |f|
              f.puts "Post.also_has { raise }"
            }

            load filename

            Post._not_only_but_also_contexts.should have_key(:validations)
            Post._not_only_but_also_contexts[:validations].should be_kind_of(Proc)
          end
        end
      end

    end
  end

  describe NotOnlyButAlso::Helpers do
    describe ".require_context_file" do
      it 'should require context file in folder with underscored class name' do
        NotOnlyButAlso::Helpers.should_receive(:require_dependency).with('post/validations')
        Post._not_only_but_also_contexts = {:validations => lambda { } }

        Post.also_has :validations
      end
    end

    describe ".context_name_from_file" do
      it 'should return a symbol from the filename without the file extension' do
        NotOnlyButAlso::Helpers.context_name_from_file(__FILE__).should == :not_only_but_also_spec
      end
    end
  end

  context "integration" do
    before do
      # Forced load all files to simulate no autoloading.
      Dir['spec/rails_root/app/models/post/*.rb'].each {|file| require file }
    end

    it 'should load files from named contexts' do
      Post.should_not respond_to(:class_method_from_validations)
      Post.should_not respond_to(:class_method_from_foo)
      Post.should_not respond_to(:class_method_from_bar)

      Post.also_has :validations, :foo

      Post.should respond_to(:class_method_from_validations)
      Post.should respond_to(:class_method_from_foo)
      Post.should_not respond_to(:class_method_from_bar)
    end
  end
end
