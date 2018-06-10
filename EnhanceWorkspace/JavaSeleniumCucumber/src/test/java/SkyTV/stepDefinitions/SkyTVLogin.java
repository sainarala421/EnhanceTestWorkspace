package SkyTV.stepDefinitions;
import java.io.IOException;
import java.util.Properties;
import SkyTV.helpers.ObjectRepository;
import SkyTV.modules.KeywordActions;
import org.openqa.selenium.WebDriver;
import cucumber.api.java.en.When;

public class SkyTVLogin {
    public WebDriver driver;
    public Properties OR;
    public SkyTVLogin() throws IOException {
    	driver = Hooks.driver;
     	OR = ObjectRepository.ObjectRepo(System.getProperty("user.dir")+"//src//test//resources//OR.properties");
    }
    @When("User inputs \"(.*?)\" in \"(.*?)\" field$")
    public void user_inputs_in_field(String arg1, String arg2) throws Throwable {
    	KeywordActions.InputText(driver, OR, arg1, arg2);
    }
    
}