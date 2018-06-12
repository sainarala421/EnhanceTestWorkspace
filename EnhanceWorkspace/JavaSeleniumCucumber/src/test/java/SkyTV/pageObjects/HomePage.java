package SkyTV.pageObjects;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.How;

public class HomePage extends BaseClass{
	public HomePage(WebDriver driver){
		super(driver);
	}
	@FindBy(how=How.CSS, using=".iop-header-links .container")
	public static WebElement header_container;
	
	@FindBy(how=How.CSS, using=".iop-header-links a[href='https://www.sky.co.nz/aboutus']")
	public static WebElement about_us_link;
	
	@FindBy(how=How.CSS, using=".iop-header-links a[href*='http://www.skygo.co.nz']")
	public static WebElement skygo_link;
	
	@FindBy(how=How.CSS, using=".iop-header .container")
	public static WebElement main_menu_container;

}