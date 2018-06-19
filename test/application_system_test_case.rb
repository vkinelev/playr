require "test_helper"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  # A few tweaks to make it working inside Docker containers 
  driven_by :selenium, using: :chrome, screen_size: [1400, 1400], options: {
    # this is an url to manage ChromeDriver
    url: ENV['CHROME_URL'],
  }

  def setup
    # this is for ChromeDriver to access our web application
    host! "http://#{IPSocket.getaddress(Socket.gethostname)}:3000"
    super
  end
end
