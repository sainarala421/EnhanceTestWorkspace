package modules;
import java.util.HashMap;
import java.util.List;
import org.junit.Assert;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.support.ui.WebDriverWait;
import org.testng.Reporter;
import pageObjects.AutomationHomePage;
import pageObjects.ContactUsPage;


public class ContactUsAction {

	public static void Execute(WebDriver driver,List<HashMap<String,String>> map) throws Exception{
		
		AutomationHomePage.contact_us.click();
		WebDriverWait wait = new WebDriverWait(driver,10);
		((JavascriptExecutor)driver).executeScript("window.scrollBy(10,0)");
		ContactUsPage.email.sendKeys((String)map.get(0).get("email"));
		ContactUsPage.message.sendKeys(map.get(0).get("message"));
		ContactUsPage.submit.click();
		Assert.assertTrue(ContactUsPage.error_message.getText().contains("There is 1 error"));
	}
}
