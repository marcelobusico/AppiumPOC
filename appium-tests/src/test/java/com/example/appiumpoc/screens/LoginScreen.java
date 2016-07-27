package com.example.appiumpoc.screens;

import io.appium.java_client.AppiumDriver;
import io.appium.java_client.MobileElement;
import io.appium.java_client.pagefactory.AndroidFindBy;
import io.appium.java_client.pagefactory.AppiumFieldDecorator;
import io.appium.java_client.pagefactory.iOSFindBy;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.PageFactory;

public class LoginScreen {

    public static LoginScreen createLoginScreen(AppiumDriver driver){
        LoginScreen loginScreen = new LoginScreen();
        PageFactory.initElements(new AppiumFieldDecorator(driver), loginScreen);
        return loginScreen;
    }

    @AndroidFindBy(uiAutomator = "new UiSelector().resourceId(\"com.example.appiumandroidapp:id/txtUsername\")")
    @iOSFindBy(id = "txtUsername")
    public MobileElement txtUsername;

    @AndroidFindBy(uiAutomator = "new UiSelector().resourceId(\"com.example.appiumandroidapp:id/txtPassword\")")
    @iOSFindBy(id = "txtPassword")
    public MobileElement txtPassword;

    @AndroidFindBy(uiAutomator = "new UiSelector().resourceId(\"com.example.appiumandroidapp:id/btnLogin\")")
    @iOSFindBy(id = "btnLogin")
    public MobileElement btnLogin;
}
