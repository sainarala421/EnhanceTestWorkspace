package co.nz.enhanceconsulting.library;

import org.testng.ITestContext;
import org.testng.annotations.AfterSuite;
import org.testng.annotations.AfterTest;
import org.testng.annotations.BeforeSuite;
import org.testng.annotations.BeforeTest;
import org.testng.annotations.Optional;
import org.testng.annotations.Parameters;

import co.nz.enhanceconsulting.globalvariables.GlobalVARS;
import co.nz.enhanceconsulting.library.CreateWebDriver;

/**
 * @author Francis John Agunday
 *
 * Setup and Teardown Scenarios
 *
 */

public class SetupTeardownScenarios{
	
	//constructor
    public SetupTeardownScenarios() throws Exception {
    }
    
    /**
     * suiteSetup method
     *
     * @param environment
     * @param context
     * @throws Exception
     */
    @Parameters({"environment"})
    @BeforeSuite(alwaysRun = true, enabled = true)
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
    @AfterSuite(alwaysRun = true, enabled = true)
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
    @BeforeTest(alwaysRun = true, enabled = true)
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
    @AfterTest(alwaysRun = true, enabled = true)
    protected void testTeardown() throws Exception {
        // close driver
        CreateWebDriver.getInstance().closeDriver();
    }
}