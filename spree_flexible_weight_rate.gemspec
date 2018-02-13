# encoding: UTF-8
Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_flexible_weight_rate'
  s.version     = '2.1.1'
  s.summary     = 'A flexible weight rate calculator'
  s.description = 'This allows us to specify a base cost for an item, and an additional cost for weighing a certain amount'
  s.required_ruby_version = '>= 1.9.3'

  s.author    = 'FreeRunning Technologies'
  s.email     = 'contact@freerunningtechnologies.com'
  s.homepage  = 'http://www.freerunningtechnologies.com'

  #s.files       = `git ls-files`.split("\n")
  #s.test_files  = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency 'spree_core', '~> 3.0'

  s.add_development_dependency 'capybara', '~> 1.1.2'
  s.add_development_dependency 'coffee-rails'
  s.add_development_dependency 'factory_girl', '~> 2.6.4'
  s.add_development_dependency 'ffaker'
  s.add_development_dependency 'rspec-rails',  '~> 2.9'
  s.add_development_dependency 'sass-rails'
  s.add_development_dependency 'sqlite3'
end
