// random commit #random 27

console.log("CHECK FOR THE SET ENV VARIABLES");
console.log(process.env.BROWSERSTACK_USERNAME);
console.log(process.env.BROWSERSTACK_ACCESS_KEY);
console.log(process.env.BROWSERSTACK_LOCAL_IDENTIFIER);
console.log(process.env.BROWSERSTACK_BUILD_NAME);
console.log(process.env.BROWSERSTACK_PROJECT_NAME);
console.log(process.env.PATH.split(';')[0]);

var webdriver = require('selenium-webdriver');

// Input capabilities
var capabilities = {
  'browserName': 'chrome',
  'os': 'os x',
  'build': process.env.BROWSERSTACK_BUILD_NAME,
  'project': process.env.BROWSERSTACK_PROJECT_NAME,
  'os_version': 'high sierra',
  'browserstack.user': process.env.BROWSERSTACK_USERNAME,
  'browserstack.key': process.env.BROWSERSTACK_ACCESS_KEY
}

var driver = new webdriver.Builder()
  .usingServer('http://hub-cloud.browserstack.com/wd/hub')
  .withCapabilities(capabilities)
  .build();

driver.get('http://www.google.com').then(function () {
  driver.findElement(webdriver.By.name('q')).sendKeys('BrowserStack\n').then(function () {
    driver.getTitle().then(function (title) {
      console.log(title);
      driver.quit();
    });
  });
});