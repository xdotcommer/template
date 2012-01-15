Rails.application.config.generators do |g|
  g.test_framework :rspec, :view_specs => false, :controller_specs => false, :fixture => true
  g.fixture_replacement :factory_girl, :dir => 'spec/factories'
  g.form_builder :simple_form
end