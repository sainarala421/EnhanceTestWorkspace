package SkyTV.keywords;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import java.util.List;
import java.util.Properties;

public class Keywords
{
    public static void ClickElement(WebDriver driver,Properties OR,String locator) throws Exception
    {
        driver.findElement(By.cssSelector(locator)).click();
    }
    public static void InputText(WebDriver driver,Properties OR,String locator, String text) throws Exception
    {
        driver.findElement(By.cssSelector(locator)).sendKeys(text);
    }
    public static void ElementShouldBeVisible(WebDriver driver,Properties OR,String locator) throws Exception
    {
        driver.findElement(By.cssSelector(locator)).isDisplayed();
    }
    
	protected boolean isVisible(String locator) {
		List<WebElement> elements = elementFind(locator, true, false);
		if (elements.size() == 0) {
			return false;
		}
		WebElement element = elements.get(0);
		return element.isDisplayed();
	}
}
