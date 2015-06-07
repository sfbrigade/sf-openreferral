ENV["RAILS_ENV"] = "test"

require File.expand_path("../../config/environment", __FILE__)

require "rspec/rails"
require "shoulda/matchers"
require "devise"

Dir[Rails.root.join("spec/support/**/*.rb")].sort.each { |file| require file }

module Features
  # Extend this module in spec/support/features/*.rb
  include Formulaic::Dsl

  include Warden::Test::Helpers
  Warden.test_mode!
end

RSpec.configure do |config|
  config.include Features, type: :feature
  config.infer_base_class_for_anonymous_controllers = false
  config.infer_spec_type_from_file_location!
  config.use_transactional_fixtures = false
  config.include Devise::TestHelpers, type: :controller
  config.include ControllerMacros, type: :controller

  config.around(:each, type: :feature) do |example|
    run_background_jobs_immediately do
      example.run
    end
  end

  config.include BackgroundJobs
end

ActiveRecord::Migration.maintain_test_schema!
Capybara.javascript_driver = :webkit

def response_json
  JSON.parse( response.body )
end

