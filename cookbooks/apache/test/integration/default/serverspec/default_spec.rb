require 'serverspec'
set :backend, :exec

describe 'apache' do
  it "is awesome" do
    expect(true).to eq(true)
  end

  it "is installed" do
    expect(package('httpd')).to be_installed
  end

  it "is running" do
    expect(service('httpd')).to be_running
  end

  it "is responding to http requests" do
    expect(command('curl http://localhost').exit_status).to eq(0)
  end

  it "is displaying the proper home page"

  it "is running on the default port"
end
