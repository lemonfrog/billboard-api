# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{billboard-api}
  s.version = "0.6.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["simplificator"]
  s.date = %q{2009-08-25}
  s.description = %q{Billboard-API is needed to add the additional models for the billboard application.}
  s.email = %q{info@simplificator.com}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.rdoc"
  ]
  s.files = [
    ".document",
     ".gitignore",
     "LICENSE",
     "README.rdoc",
     "Rakefile",
     "VERSION",
     "billboard-api.gemspec",
     "lib/billboard-api.rb",
     "lib/billboard-api/config.rb",
     "lib/billboard-api/currency.rb",
     "lib/billboard-api/customer.rb",
     "lib/billboard-api/default_config.rb",
     "lib/billboard-api/order.rb",
     "lib/billboard-api/payment_method.rb",
     "lib/billboard-api/tax.rb",
     "test/billboard-api_test.rb",
     "test/config_test.rb",
     "test/test_helper.rb"
  ]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/simplificator/billboard-api}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.2}
  s.summary = %q{TODO: one-line summary of your gem}
  s.test_files = [
    "test/billboard-api_test.rb",
     "test/config_test.rb",
     "test/test_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<thoughtbot-shoulda>, [">= 0"])
    else
      s.add_dependency(%q<thoughtbot-shoulda>, [">= 0"])
    end
  else
    s.add_dependency(%q<thoughtbot-shoulda>, [">= 0"])
  end
end
