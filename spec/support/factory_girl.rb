RSpec.configure do |config|
  # additional factory_girl configuration

  config.before(:suite) do
    begin
      DatabaseCleaner.start
      #FactoryGirl.lint
    ensure
      DatabaseCleaner.clean
    end
  end

  RSpec.configure do |config|
    config.include FactoryGirl::Syntax::Methods
  end

end
