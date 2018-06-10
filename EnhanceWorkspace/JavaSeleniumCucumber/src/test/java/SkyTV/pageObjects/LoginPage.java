package SkyTV.pageObjects;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.How;

public class LoginPage extends BaseClass
{
	public LoginPage(WebDriver driver)
	{
		super(driver);
	}
	@FindBy(how=How.CSS, using="input[name='username']")
	public static WebElement email_field;
	
	@FindBy(how=How.CSS, using="input[name='password']")
	public static WebElement password_field;
	
	@FindBy(how=How.CSS, using="input[value='Sign in']")
	public static WebElement sign_in_button;

}