module NotOnlyButAlso

  module ClassMethods

    def not_only_but_also(*contexts, &block)
      if block_given?
        self.class_eval(&block)
      else
        contexts.each do |context|
          NotOnlyButAlso::Helpers.require_context_file(name, context)
        end
      end
    end
    alias also_has not_only_but_also

  end

  module Helpers

    def self.require_context_file(class_name, context)
      require_dependency "#{class_name.underscore}/#{context}" 
    rescue MissingSourceFile => e
      raise e, "NotOnlyButAlso could not find a file for #{class_name} using context #{context}"
    end

  end

end

ActiveRecord::Base.extend NotOnlyButAlso::ClassMethods
