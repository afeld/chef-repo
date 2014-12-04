require 'serverspec'
set :backend, :exec

describe 'apache' do
  it "is awesome" do
    expect(true).to eq(true)
  end

  it "is installed" do
    expect(package('httpd')).to be_installed
  end

  describe service('httpd') do
    it "is running" do
      expect(subject).to be_running
    end

    it "is enabled" do
      expect(subject).to be_enabled
    end
  end

  describe command('curl http://localhost') do
    it "is responding to http requests" do
      expect(subject.exit_status).to eq(0)
    end

    it "is displaying the proper home page" do
      expect(subject.stdout).to include("Aidan's Home Page")
    end
  end

  it "is running on the default port" do
    expect(port(80)).to be_listening.with('tcp')
  end
end
