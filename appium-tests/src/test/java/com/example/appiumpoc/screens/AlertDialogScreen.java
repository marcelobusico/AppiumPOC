package com.example.appiumpoc.screens;

import io.appium.java_client.AppiumDriver;
import io.appium.java_client.MobileElement;
import io.appium.java_client.pagefactory.AndroidFindBy;
import io.appium.java_client.pagefactory.AppiumFieldDecorator;
import org.openqa.selenium.support.PageFactory;

public class AlertDialogScreen {

    public static AlertDialogScreen createAlertDialogScreen(AppiumDriver driver){
        AlertDialogScreen alertDialogScreen = new AlertDialogScreen();
        PageFactory.initElements(new AppiumFieldDecorator(driver), alertDialogScreen);
        return alertDialogScreen;
    }

    @AndroidFindBy(uiAutomator = "new UiSelector().resourceId(\"android:id/button1\")")
    public MobileElement btnOk;

}
