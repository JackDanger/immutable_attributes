Gem::Specification.new do |s|
  s.name = %q{immutable_attributes}
  s.version = "1.0.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Jack Danger Canty"]
  s.date = %q{2009-03-19}
  s.email = ["rubygems@6brand.com"]
  s.extra_rdoc_files = ["Manifest.txt"]
  s.files = ["Manifest.txt", "README", "Rakefile", "immutable_attributes.gemspec", "init.rb", "install.rb", "lib/immutable_attributes.rb", "rails/init.rb", "test/immutable_attributes_test.rb", "uninstall.rb"]
  s.has_rdoc = true
  s.rdoc_options = ["--main", "README.txt"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{immutable_attributes}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Immutable Attributes is an ActiveRecord extension that prevents existing data from changing}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<hoe>, [">= 1.11.0"])
    else
      s.add_dependency(%q<hoe>, [">= 1.11.0"])
    end
  else
    s.add_dependency(%q<hoe>, [">= 1.11.0"])
  end
end
