package com.example.appiumpoc.tests;

import com.example.appiumpoc.drivers.AppiumDriverFactory;
import com.example.appiumpoc.screens.AlertDialogScreen;
import com.example.appiumpoc.screens.LoginScreen;
import io.appium.java_client.AppiumDriver;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

public class LoginTest {

    private AppiumDriver driver;

    @Before
    public void setUp() throws Exception {
        driver = new AppiumDriverFactory().createAppiumDriver();
    }

    @After
    public void tearDown() throws Exception {
        driver.quit();
    }

    @Test
    public void login_validCredentials_shouldMoveToMainScreen() {
        LoginScreen loginScreen = LoginScreen.createLoginScreen(driver);
        loginScreen.txtUsername.sendKeys("Marcelo");
        loginScreen.txtPassword.sendKeys("Password");
        loginScreen.btnLogin.tap(1, 1);

        try {
            Thread.sleep(3000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }

        AlertDialogScreen alertDialogScreen = AlertDialogScreen.createAlertDialogScreen(driver);
        alertDialogScreen.btnOk.tap(1, 1);

        try {
            Thread.sleep(3000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }
}
