package co.nz.enhanceconsulting.stepdefinitions;

import org.openqa.selenium.WebDriver;
import org.testng.annotations.BeforeTest;
import org.testng.annotations.Test;
import co.nz.enhanceconsulting.library.BrowserManagement;
//import cucumber.api.java.Before;
import cucumber.api.java.en.When;

public class RFTestSteps{
	//public WebDriver driver;
    public RFTestSteps() throws Exception {
    }
    public static WebDriver driver;
    // public static BrowserManagement bm;
    BrowserManagement bm = new BrowserManagement();
    
    // @Test(enabled=true)
    /*
    @BeforeTest(alwaysRun = true, enabled = true)
    @When("^User opens url \"(.*?)\" in \"(.*?)\" browser$")
    public void user_opens_browser(String url,
            String browser) throws Throwable {
    	System.out.println("Test Line 24");
    	bm.openBrowser(
    			url, 
    			browser, 
    			"browser1"
    			);
    	bm.goTo("https://www.netflix.com");
	}*/
   
    //@Test(enabled=true)
    @When("^User gets info$")
    public void get_system_info() throws Throwable {
    	System.out.println("Test Line 17");
    	bm.getSystemInfo();
    	bm.goTo("https://www.netflix.com/");
	}
    

}