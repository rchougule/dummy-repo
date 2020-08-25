require 'rubygems'
require 'selenium-webdriver'

userName = ENV['BROWSERSTACK_USERNAME']
accessKey = ENV['BROWSERSTACK_ACCESS_KEY']
# localIdentifier = ENV['BROWSERSTACK_LOCAL_IDENTIFIER']
buildName = ENV['BROWSERSTACK_BUILD_NAME']
projectName = ENV['BROWSERSTACK_PROJECT_NAME']

# Input capabilities
caps = Selenium::WebDriver::Remote::Capabilities.new
caps['browser'] = 'Chrome'
caps['os_version'] = '10'
caps['resolution'] = '1920x1080'
caps['os'] = 'Windows'
caps['browser_version'] = '84.0'
driver = Selenium::WebDriver.for(:remote,
  :url => "https://" + userName + ":" + accessKey + "@hub-cloud.browserstack.com/wd/hub",
  :desired_capabilities => caps)
driver.navigate.to "https://www.google.com"
element = driver.find_element(:name, 'q')
element.send_keys "BrowserStack"
element.submit
puts driver.title
driver.quit