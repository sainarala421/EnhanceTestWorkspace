package SkyTV.modules;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import java.util.Properties;

public class KeywordActions
{
    public static void ClickElement(WebDriver driver,Properties OR,String locator) throws Exception
    {
        driver.findElement(By.cssSelector(locator)).click();
    }
    
    public static void InputText(WebDriver driver,Properties OR,String locator, String text) throws Exception
    {
        driver.findElement(By.cssSelector(locator)).sendKeys(text);;
    }
}