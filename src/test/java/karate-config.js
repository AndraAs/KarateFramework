function fn() {
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }
  var config = {
    env: env,
    myVarName: 'myValue',
    username: 'admin1',
    password: 'welcome',
    _url: 'http://localhost:9898'
  }
  if (env == 'dev') {
    // customize
    config.username= 'adminDev';
    config.password= 'passwordDev';
    // e.g. config.foo = 'bar';
  } else if (env == 'e2e') {
    config.username= 'adminE2E';
    config.password= 'passwordE2E';
    // customize
  }
  else if (env == 'staging') {
    config.username= 'adminStaging';
    config.password= 'passwordStaging';
    config._url='http://localhost:9897';
    // customize
  }
  else if (env == 'preprod') {
    config.username= 'adminPreprod';
    config.password= 'passwordPreprod';
    config._url='http://localhost:9898';
    // customize
  }
  else if (env == 'prod') {
    config.username= 'adminProd';
    config.password= 'passwordProd';
    config._url='http://localhost:9897';
    // customize
  }
  return config;
}