// random commit #random 63
var webdriver = require('selenium-webdriver');
var http = require('http');

const options = {
  host: 'localhost',
  port: 8099,
  method: 'GET'
}

const response = [];

http.request(options, (res) => {

  res.on('data', (chunk) => {
    response.push(chunk);
  });

  res.on('end', () => {
    console.log(Buffer.concat(response).toString());
  })
});

// Input capabilities
var capabilities = {
  'browserName': 'chrome',
  'os': 'os x',
  'build': process.env.BROWSERSTACK_BUILD_NAME,
  'project': process.env.BROWSERSTACK_PROJECT_NAME,
  'os_version': 'high sierra',
  'browserstack.user': process.env.BROWSERSTACK_USERNAME,
  'browserstack.key': process.env.BROWSERSTACK_ACCESS_KEY,
  'browserstack.local': 'true'
}

if (process.env.BROWSERSTACK_LOCAL_IDENTIFIER) {
  capabilities['browserstack.localIdentifier'] = process.env.BROWSERSTACK_LOCAL_IDENTIFIER;
}

var driver = new webdriver.Builder()
  .usingServer('http://hub-cloud.browserstack.com/wd/hub')
  .withCapabilities(capabilities)
  .build();

driver.get('http://localhost:8099').then(function () {
  driver.getTitle().then(function (title) {
    console.log(title);
    driver.quit();
  });
});
