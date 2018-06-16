package co.nz.enhanceconsulting.stepdefinitions;

import org.json.simple.JSONObject;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.testng.ITestContext;
import org.testng.ITestResult;
import org.testng.annotations.*;

import co.nz.enhanceconsulting.globalvariables.GlobalVARS;
import co.nz.enhanceconsulting.library.BrowserManagement;
import co.nz.enhanceconsulting.library.CreateWebDriver;
import co.nz.enhanceconsulting.utils.JSONDataProvider;
import co.nz.enhanceconsulting.pageobjects.PassionTeaCoWelcomePO;
import co.nz.enhanceconsulting.pageobjects.PassionTeaCoWelcomePO.WELCOME_PAGE_IMG;
import co.nz.enhanceconsulting.pageobjects.PassionTeaCoWelcomePO.MENU_LINKS;
import cucumber.api.java.Before;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.When;
import cucumber.api.java.en.Then;
import cucumber.api.Scenario;

/**
 * @author Francis John Agunday
 *
 * Passion Tea Co Test Class
 *
 */
public class PassionTeaCoSteps{
    // local vars
    private PassionTeaCoWelcomePO<WebElement> welcome = null;
    private static final String DATA_FILE = "src/test/resources/testdata/PassionTeaCo.json";
    BrowserManagement bm = new BrowserManagement();
    //public static BrowserManagement bm;
    // constructor
    public PassionTeaCoSteps() throws Exception {
    }

    // setup/teardown methods

    /**
     * suiteSetup method
     *
     * @param environment
     * @param context
     * @throws Exception
     */

    /*
    @Parameters({"url","browser"})
    //@BeforeTest(alwaysRun = true, enabled = true)
    @When("^User opens url \"(.*?)\" in \"(.*?)\" browser$")
    public void user_opens_browser(@Optional String url,
    		@Optional String browser) throws Throwable {
    	System.out.println("Test Line 24");
    	bm.openBrowser(
    			url, 
    			browser, 
    			"browser1"
    			);
    	bm.goTo(url);
	}
    */
    @Parameters({"environment"})
    //@BeforeSuite(alwaysRun = true, enabled = true)
    protected void suiteSetup(@Optional(GlobalVARS.ENVIRONMENT) String environment,
                              ITestContext context)
                              throws Exception {

        GlobalVARS.DEF_ENVIRONMENT = System.getProperty("environment", environment);
        GlobalVARS.SUITE_NAME = context.getSuite().getXmlSuite().getName();
    }

    /**
     * suiteTeardown method
     *
     * @throws Exception
     */
   // @AfterSuite(alwaysRun = true, enabled = true)
    protected void suiteTeardown() throws Exception {
    }

    /**
     * testSetup method
     *
     * @param browser
     * @param platform
     * @param includePattern
     * @param excludePattern
     * @param ctxt
     * @throws Exception
     */
    @Parameters({"browser", "platform", "includePattern", "excludePattern"})
    //@BeforeTest(alwaysRun = true, enabled = true)
    protected void testSetup(@Optional(GlobalVARS.BROWSER) String browser,
                             @Optional(GlobalVARS.PLATFORM) String platform,
                             @Optional String includePattern,
                             @Optional String excludePattern,
                             ITestContext ctxt)
                             throws Exception {

        // data provider filters
        if ( includePattern != null ) {
            System.setProperty("includePattern", includePattern);
        }

        if ( excludePattern != null ) {
            System.setProperty("excludePattern", excludePattern);
        }

        // global variables
        GlobalVARS.DEF_BROWSER = System.getProperty("browser", browser);
        GlobalVARS.DEF_PLATFORM = System.getProperty("platform", platform);

        // create driver
        CreateWebDriver.getInstance().setDriver(GlobalVARS.DEF_BROWSER,
                                             GlobalVARS.DEF_PLATFORM,
                                             GlobalVARS.DEF_ENVIRONMENT);
    }

    /**
     * testTeardown method
     *
     * @throws Exception
     */
  // @AfterTest(alwaysRun = true, enabled = true)
    protected void testTeardown() throws Exception {
        // close driver
        CreateWebDriver.getInstance().closeDriver();
    }

    /**
     * testClassSetup method
     *
     * @param context
     * @throws Exception
     */
   // @BeforeClass(alwaysRun = true, enabled = true)
    protected void testClassSetup(ITestContext context) throws Exception {
        // instantiate page object classes
        welcome = new PassionTeaCoWelcomePO<WebElement>();

        // set datafile for data provider
        JSONDataProvider.dataFile = DATA_FILE;

        // load page
        welcome.loadPage(GlobalVARS.TARGET_URL, GlobalVARS.TIMEOUT_MINUTE);
    }

    /**
     * testClassTeardown method
     *
     * @param context
     * @throws Exception
     */
   // @AfterClass(alwaysRun = true, enabled = true)
    protected void testClassTeardown(ITestContext context) throws Exception {
    }

    /**
     * testMethodSetup method
     *
     * @param result
     * @throws Exception
     */
   // @BeforeMethod(alwaysRun = true, enabled = true)
    protected void testMethodSetup(ITestResult result) throws Exception {
    }

    /**
     * testMethodTeardown method
     *
     * @param result
     * @throws Exception
     */
   // @AfterMethod(alwaysRun = true, enabled = true)
    protected void testMethodTeardown(ITestResult result) throws Exception {
        WebDriver driver = CreateWebDriver.getInstance().getDriver();

        if ( !driver.getCurrentUrl().contains("welcome.html") ) {
            welcome.setTitle("Welcome");
            welcome.navigate("Welcome");
        }
    }

    // test methods

    /**
     * user_navigates_to_passion_tea_new_page
     *
     * @param rowID
     * @param description
     * @param testData
     * @throws Exception
     */
   // @When("^User navigates to Passion Tea New page$")
  //  @Test(groups={"PASSION_TEA"}, dataProvider="fetchData_JSON", dataProviderClass=JSONDataProvider.class, enabled=true)
    public void user_navigates_to_passion_tea_new_page(String rowID,
                                   String description,
                                   JSONObject testData) throws Exception {

        // set the page title on-the-fly
        welcome.setTitle(testData.get("title").toString());

        // navigate to the new page
        welcome.navigate(testData.get("menu").toString());

        // retrieve and verify the page title
        welcome.verifyTitle(testData.get("title").toString());
    }

    /**
     * tc002_passionTeaCo method to test image source
     *
     * @param rowID
     * @param description
     * @param testData
     * @throws Exception
     */
   // @Test(groups={"PASSION_TEA"}, dataProvider="fetchData_JSON", dataProviderClass=JSONDataProvider.class, enabled=true)
    public void tc002_passionTeaCo(String rowID,
                                   String description,
                                   JSONObject testData) throws Exception {

        // verify image source
        welcome.verifyImgSrc(WELCOME_PAGE_IMG.valueOf(testData.get("img").toString()),
                             testData.get("src").toString());
    }

    /**
     * tc003_passionTeaCo method to test page span text
     *
     * @param rowID
     * @param description
     * @param testData
     * @throws Exception
     */
   // @Test(groups={"PASSION_TEA"}, dataProvider="fetchData_JSON", dataProviderClass=JSONDataProvider.class, enabled=true)
    public void tc003_passionTeaCo(String rowID,
                                   String description,
                                   JSONObject testData) throws Exception {

        // verify text labels
        welcome.verifySpan(testData.get("pattern").toString(),
                           testData.get("text").toString());
    }

    /**
     * tc004_passionTeaCo method to test page heading text
     *
     * @param rowID
     * @param description
     * @param testData
     * @throws Exception
     */
   // @Test(groups={"PASSION_TEA"}, dataProvider="fetchData_JSON", dataProviderClass=JSONDataProvider.class, enabled=true)
    public void tc004_passionTeaCo(String rowID,
                                   String description,
                                   JSONObject testData) throws Exception {

        // verify headings
        welcome.verifyHeading(testData.get("pattern").toString(),
                              testData.get("text").toString());
    }

    /**
     * tc005_passionTeaCo method to test page paragraph text
     *
     * @param rowID
     * @param description
     * @param testData
     * @throws Exception
     */
   // @Test(groups={"PASSION_TEA"}, dataProvider="fetchData_JSON", dataProviderClass=JSONDataProvider.class, enabled=true)
    public void tc005_passionTeaCo(String rowID,
                                   String description,
                                   JSONObject testData) throws Exception {

        // verify paragraphs
        welcome.verifyParagraph(testData.get("pattern").toString(),
                                testData.get("text").toString());
    }

    /**
     * tc006_passionTeaCo method to test navigating all "Menu" links
     *
     * @param rowID
     * @param description
     * @param testData
     * @throws Exception
     */
   // @Test(groups={"PASSION_TEA"}, dataProvider="fetchData_JSON", dataProviderClass=JSONDataProvider.class, enabled=true)
    public void tc006_passionTeaCo(String rowID,
                                   String description,
                                   JSONObject testData) throws Exception {

        // verify menu links
        welcome.navigateMenuLink(MENU_LINKS.valueOf(testData.get("element").toString()),
                                 testData.get("title").toString());
    }

}