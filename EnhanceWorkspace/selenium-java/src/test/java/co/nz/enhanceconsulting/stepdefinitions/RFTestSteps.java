package co.nz.enhanceconsulting.stepdefinitions;

import org.testng.annotations.Test;

import co.nz.enhanceconsulting.library.BrowserManagement;
import cucumber.api.java.en.When;

public class RFTestSteps{
    public static BrowserManagement bm;
    
    @Test
    @When("^User opens url \"(.*?)\" in \"(.*?)\" browser$")
    public void user_opens_browser(String url,
            String browser) throws Throwable {
		bm.openBrowser(url, browser);
	}
}