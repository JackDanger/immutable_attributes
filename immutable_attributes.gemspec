Gem::Specification.new do |s|
  s.name = %q{immutable_attributes}
  s.version = "1.0.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Jack Danger Canty"]
  s.date = %q{2007-12-16}
  s.email = ["git@6brand.com"]
  s.extra_rdoc_files = ["Manifest.txt"]
  s.files = ["Manifest.txt", "README", "Rakefile", "init.rb", "install.rb", "lib/immutable_attributes.rb", "rails/init.rb", "test/immutable_attributes_test.rb", "uninstall.rb"]
  s.has_rdoc = true
  s.rdoc_options = ["--main", "README.txt"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = "Immutable Attributes is an extension to ActiveRecord to prevent certain attributes from being overwritten"
end
