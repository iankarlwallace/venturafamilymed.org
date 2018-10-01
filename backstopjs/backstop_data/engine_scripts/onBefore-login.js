module.exports = async (page, scenario, vp) => {
  console.log('SCENARIO > ' + scenario.label + ' START onBefore-login script');
  await require('./loadCookies')(page, scenario);

  console.log('SCENARIO > ' + scenario.label + ' FINISHED onBefore-login script');
};
