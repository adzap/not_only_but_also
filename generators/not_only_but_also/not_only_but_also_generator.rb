class NotOnlyButAlsoGenerator < Rails::Generator::NamedBase

  attr_reader :context

  def initialize(runtime_args, runtime_options = {})
    super
    unless File.exists?(File.join('app/models', file_name + ".rb"))
      raise "Model for #{class_name} does not seem to exist"
    end
    @context = args.shift
  end

  def manifest
    record do |m|
      m.directory(File.join('app/models', file_path))
      m.template 'context.erb', File.join('app/models', file_path, "#{context}.rb")
    end
  end

  protected
    def banner
      "Usage: #{$0} #{spec.name} Model context"
    end

end

