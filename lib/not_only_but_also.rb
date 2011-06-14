module NotOnlyButAlso

  module ClassMethods

    def not_only_but_also(*contexts, &block)
      @_not_only_but_also_contexts ||= {}
      if block_given?
        context = contexts.first || NotOnlyButAlso::Helpers.context_name_from_file(caller.first)
        @_not_only_but_also_contexts[context] = block
      else
        contexts.each do |context|
          NotOnlyButAlso::Helpers.require_context_file(name, context)
          class_eval &@_not_only_but_also_contexts[context]
        end
      end
    end
    alias also_has not_only_but_also

  end

  module Helpers

    def self.require_context_file(class_name, context)
      require_dependency "#{class_name.underscore}/#{context}" 
    rescue MissingSourceFile => ex
      raise ex, "NotOnlyButAlso could not find a file for #{class_name} using context #{context}"
    end

    def self.context_name_from_file(filename)
       filename.split('/').last.split('.').first.to_sym
    end
  end

end

Class.send :include, NotOnlyButAlso::ClassMethods
