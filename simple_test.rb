require 'rubygems'
require 'selenium-webdriver'

userName = ENV['BROWSERSTACK_USERNAME']
accessKey = ENV['BROWSERSTACK_ACCESS_KEY']
# localIdentifier = ENV['BROWSERSTACK_LOCAL_IDENTIFIER']
buildName = ENV['BROWSERSTACK_BUILD_NAME']
projectName = ENV['BROWSERSTACK_PROJECT_NAME']

# Input capabilities
caps = Selenium::WebDriver::Remote::Capabilities.new
caps['browser'] = ''
caps['os_version'] = ''
caps['resolution'] = ''
caps['os'] = ''
caps['browser_version'] = ''
caps['browserstack.local'] = 'true'
caps['build'] = buildName
caps['project'] = projectName
driver = Selenium::WebDriver.for(:remote,
  :url => "https://" + userName + ":" + accessKey + "@hub-cloud.browserstack.com/wd/hub",
  :desired_capabilities => caps)
driver.navigate.to "https://www.google.com"
element = driver.find_element(:name, 'q')
element.send_keys "BrowserStack"
element.submit
puts driver.title
sleep 1
driver.navigate.to "http://localhost:5000"
puts driver.title
driver.quit