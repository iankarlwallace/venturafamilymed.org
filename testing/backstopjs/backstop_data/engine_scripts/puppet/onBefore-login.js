module.exports = async (page, scenario, vp, isReference) => {
  await require('./loadCookies')(page, scenario);
  
  console.log('SCENARIO > ' + scenario.label + ' START onBefore-login script');
  console.log('isReference [' + isReference + ']');
  if ( isReference == true ) {
    await page.goto(scenario.referenceUrl, {waitUntil: "networkidle0"});
  } else {
    await page.goto(scenario.url, {waitUntil: "networkidle0"});
  }

  await page.click('#username');
  await page.keyboard.type('resident', {delay: 75});

  await page.click('#password');
  await page.keyboard.type('play', {delay: 75});

  await page.click('#content>div.login>form>fieldset>div:nth-child(3)>div>button')

  console.log('SCENARIO > ' + scenario.label + ' FINISHED onBefore-login script');
};
