package SkyTV.stepDefinitions;
import java.io.IOException;
import java.util.Properties;
import SkyTV.helpers.ObjectRepository;
import SkyTV.keywords.Keywords;

import org.openqa.selenium.WebDriver;
import cucumber.api.java.en.When;

public class KeywordDefinitions {
    public WebDriver driver;
    public Properties OR;
    public KeywordDefinitions() throws IOException {
    	driver = Hooks.driver;
     	OR = ObjectRepository.ObjectRepo(System.getProperty("user.dir")+"//src//test//resources//OR.properties");
    }
    @When("User inputs \"(.*?)\" in \"(.*?)\" field$")
    public void user_inputs_in_field(String text, String locator) throws Throwable {
    	Keywords.InputText(driver, OR, text, locator);
    }
    
    @When("User clicks \"(.*?)\" button$")
    public void user_clicks(String locator) throws Throwable {
    	Keywords.ClickElement(driver, OR, locator);
    }
}