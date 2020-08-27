require 'rubygems'
require 'selenium-webdriver'

userName = ENV['BROWSERSTACK_USERNAME']
accessKey = ENV['BROWSERSTACK_ACCESS_KEY']
localIdentifier = ENV['BROWSERSTACK_LOCAL_IDENTIFIER']
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
caps['browserstack.localIdentifier'] = localIdentifier
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
sleep 2
driver.navigate.to "https://whatismyipaddress.com/"
puts driver.title
sleep 2
driver.quit


   # echo $PWD
        # cd /var/lib
        # sudo chmod -R a+w gems/
        # echo $PWD
        # cd
        # cd /home/runner/work/dummy-repo/dummy-repo
        # echo $PWD

         # - uses: actions/setup-ruby@v1
    #   with:
    #     ruby-version: '2.5.0'