const puppeteer = require('puppeteer');

const startUrl = process.env.STOREDOG_URL;
console.log(`Start Url: ${startUrl}`);

const choosePhone = () => {
  const deviceNames = [
    'Pixel 2 XL',
    'Pixel 2',
    'Nokia N9',
    'Nokia Lumia 520',
    'Nexus 7',
    'Nexus 6P',
    'LG Optimus L70',
    'Galaxy S5',
    'iPhone 11 Pro Max',
    'iPhone 11',
    'iPhone XR',
    'iPhone X',
    'iPhone SE',
    'iPhone 8 Plus',
    'iPhone 6',
    'iPad Pro',
    'iPad Mini',
  ];

  const deviceIndex = Math.floor(Math.random() * deviceNames.length);
  const device = deviceNames[deviceIndex];
  return puppeteer.devices[device];
};

const getNewBrowser = async () => {
  const browser = await puppeteer.launch({
    defaultViewport: null,
    timeout: 30000,
    slowMo: 1000,
    args: [
      // Required for Docker version of Puppeteer
      '--no-sandbox',
      '--disable-setuid-sandbox',
      // This will write shared memory files into /tmp instead of /dev/shm,
      // because Docker’s default for /dev/shm is 64MB
      '--disable-dev-shm-usage',
    ],
  });
  const browserVersion = await browser.version();
  console.log(`Started ${browserVersion}`);
  return browser;
};

const openPage = async (url,browser) => {
  
  let page = await browser.newPage();
  await page.setDefaultNavigationTimeout(
    process.env.PUPPETEER_TIMEOUT || 25000
  );
  await page.emulate(choosePhone());
  await page.goto(url, { waitUntil: 'domcontentloaded' });
  const pageTitle = await page.title();
  console.log(`"${pageTitle}" loaded`);
  return page;
};

const runSession = async (name,browser,url,selectors) => {
  try {
    console.log(`Session: ${name}`);
    const page = await openPage(url,browser);
    for (const selector of selectors) {
      await page.waitForSelector(selector);
      console.log(`Going to click on ${selector}...`);
      await Promise.all([page.waitForNavigation(), page.click(selector)]);
    }
  } catch (err) {
    console.log(`Session failed: ${err}`);
  }
};

(async () => {
  const browser = await getNewBrowser();
  try {
    await runSession("#1",browser, startUrl,
    [
      '#search-bar > .ml-2 > .btn',
      '#taxonomies > .mt-4 > .list-group > .list-group-item:nth-child(1)',
      '.breadcrumb > .breadcrumb-item:nth-child(1) > span > a > span',
    ]);

    await runSession("#2",browser, startUrl,
    [
      '#product_2 > .card > .card-body > .d-block > .info',
      '#add-to-cart-button',
    ]);

    await runSession("#3",browser, startUrl,
    [
      'div > #taxonomies > .mt-4 > .list-group > .list-group-item:nth-child(1)',
      '.row > #sidebar > div > #sidebar_products_search > .btn',
      '.container > #main-nav-bar > .nav > #home-link > .nav-link',
    ]);

    await runSession("#4",browser, startUrl,
    [
      'div > #taxonomies > .mt-4 > .list-group > .list-group-item:nth-child(3)',
      '#product_8 > .card > .card-body > .d-block > .info',
      '#add-to-cart-button',
      '#home-link > .nav-link',
    ]);

    await runSession("#5",browser, startUrl,
    [
      'div > #taxonomies > .mt-4 > .list-group > .list-group-item:nth-child(3)',
      '#product_8 > .card > .card-body > .d-block > .info',
      '#add-to-cart-button',
      '#home-link > .nav-link',
    ]);

  } catch (err) {
    console.log(`Execution failed: ${err}`);
  } finally {
    browser.close();
    console.log(`Browser closed`);
  }
})();
