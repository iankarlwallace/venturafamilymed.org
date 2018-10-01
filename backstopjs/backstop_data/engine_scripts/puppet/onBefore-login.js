module.exports = async (page, scenario, vp) => {
  console.log('SCENARIO > ' + scenario.label + ' START onBefore-login script');
  await require('./loadCookies')(page, scenario);

  console.log('SCENARIO > headed to [' + scenario.url + ']');
  await page.goto(scenario.url,{waitUntil: "networkidle0"});
  await page.waitFor(500);
  await page.type('#username','resident');
  await page.type('#password','play');
	await page.keyboard.press('Enter');
  await page.waitFor(500);

  console.log('SCENARIO > ' + scenario.label + ' FINISHED onBefore-login script');
};
