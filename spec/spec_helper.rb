gem "rspec", "=2.2.0"

RSpec.configure do |config|
  config.before(:each) do
    ScrewServer::Base.spec_base_dir = File.join(File.dirname(__FILE__), 'fixtures', 'spec')
    ScrewServer::Base.code_base_dir = File.join(File.dirname(__FILE__), 'fixtures', 'code')
  end
end

def fixture_code_file(name)
  "#{ScrewServer::Base.code_base_dir}/#{name}"
end

def fixture_spec_file(name)
  "#{ScrewServer::Base.spec_base_dir}/#{name}"
end