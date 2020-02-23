require 'webmock/minitest'
require 'minitest/autorun'
require 'mocha/minitest'

ENV['RAILS_ENV'] = 'test'

require_relative '../test/dummy/config/environment'
ActiveRecord::Migrator.migrations_paths = [File.expand_path('../test/dummy/db/migrate', __dir__)]
ActiveRecord::Migrator.migrations_paths << File.expand_path('../db/migrate', __dir__)
require 'rails/test_help'

Minitest.backtrace_filter = Minitest::BacktraceFilter.new

Dir["#{File.expand_path('../../repositories', __dir__)}/test/factories/**/*.rb"].each { |file| require file }
Dir['./test/support/**/*.rb'].each { |file| require file }

class ActiveSupport::TestCase
  extend MiniTest::Spec::DSL
  include FactoryBot::Syntax::Methods

  def json_response
    ActiveSupport::JSON.decode @response.body
  end
end