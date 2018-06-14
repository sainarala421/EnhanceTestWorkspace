package co.nz.enhanceconsulting.library;

import java.util.Properties;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;

public class Keywords{
	
    public Keywords() throws Exception {
    }
    
    public static void ClickElement(WebDriver driver,Properties OR,String locator) throws Exception{
        driver.findElement(By.cssSelector(locator)).click();
    }
    public static void InputText(WebDriver driver,Properties OR,String locator, String text) throws Exception{
        driver.findElement(By.cssSelector(locator)).sendKeys(text);
    }
    public static void ElementShouldBeVisible(WebDriver driver,Properties OR,String locator) throws Exception
    {
        driver.findElement(By.cssSelector(locator)).isDisplayed();
    }
}