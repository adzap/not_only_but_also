# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{not_only_but_also}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Adam Meehan"]
  s.autorequire = %q{not_only_but_also}
  s.date = %q{2009-11-06}
  s.description = %q{Rails plugin to split large models into separate files of concern. Like concerned_with but a little more convenient.}
  s.email = %q{adam.meehan@gmail.com}
  s.extra_rdoc_files = ["README.rdoc"]
  s.files = ["MIT-LICENSE", "README.rdoc", "Rakefile", "lib/not_only_but_also.rb", "spec/not_only_but_also_spec.rb", "spec/spec_helper.rb", "spec/rails_root", "spec/rails_root/app", "spec/rails_root/app/models", "spec/rails_root/app/models/post", "spec/rails_root/app/models/post/stuff.rb", "spec/rails_root/app/models/post/validations.rb", "spec/rails_root/app/models/post.rb"]
  s.homepage = %q{http://github.com/adzap/not_only_but_also}
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{not_only_but_also}
  s.rubygems_version = %q{1.3.4}
  s.summary = %q{Rails plugin to split large models into separate files of concern. Like concerned_with but a little more convenient.}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
