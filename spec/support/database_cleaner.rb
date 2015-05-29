require 'database_cleaner'

RSpec.configure do |config|

  config.before :each do |example|
    DatabaseCleaner.start unless example.metadata[:type] == :feature
  end

  config.after :each do |example|
    if example.metadata[:type] == :feature then load('./db/seeds.rb')
    else DatabaseCleaner.clean unless example.metadata[:type] == :feature
    end
  end

end
