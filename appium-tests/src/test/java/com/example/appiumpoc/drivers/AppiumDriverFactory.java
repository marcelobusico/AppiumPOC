package com.example.appiumpoc.drivers;

import io.appium.java_client.AppiumDriver;
import io.appium.java_client.android.AndroidDriver;
import io.appium.java_client.ios.IOSDriver;
import io.appium.java_client.remote.MobileCapabilityType;
import org.openqa.selenium.remote.DesiredCapabilities;

import java.io.File;
import java.net.URL;

public class AppiumDriverFactory {

    public static final String APPIUM_SERVER_URL = "http://127.0.0.1:4723/wd/hub";

    public void setupEnvironment() {
        System.setProperty("http.proxyHost", "");
        System.setProperty("http.proxyPort", "");
    }

    public AppiumDriver createAppiumDriver() {
        String mobileEnv = System.getenv("MOBILE_ENV");
        if (mobileEnv == null) {
            throw new IllegalStateException("You need to set MOBILE_ENV to run tests.");
        }

        if (mobileEnv.equalsIgnoreCase("android")) {
            return createAppiumDriverForAndroid();
        } else if (mobileEnv.equalsIgnoreCase("ios")) {
            return createAppiumDriverForIOS();
        } else {
            throw new IllegalStateException("You need to set MOBILE_ENV to run tests.");
        }
    }

    public AppiumDriver createAppiumDriverForAndroid() {
        setupEnvironment();
        try {
            File classpathRoot = new File(System.getProperty("user.dir"));
            File appDir = new File(classpathRoot, "../android");
            File app = new File(appDir, "AppiumAndroidApp.apk");
            DesiredCapabilities capabilities = new DesiredCapabilities();

            capabilities.setCapability(MobileCapabilityType.DEVICE_NAME, "Android Emulator");
            capabilities.setCapability(MobileCapabilityType.PLATFORM_VERSION, "6.0");

            capabilities.setCapability(MobileCapabilityType.APP, app.getAbsolutePath());

            return new AndroidDriver(new URL(APPIUM_SERVER_URL), capabilities);
        } catch (Exception ex) {
            throw new IllegalStateException("Could not create Appium Driver for Android.", ex);
        }
    }

    public AppiumDriver createAppiumDriverForIOS() {
        setupEnvironment();
        try {
            File classpathRoot = new File(System.getProperty("user.dir"));
            File appDir = new File(classpathRoot, "../ios");
            File app = new File(appDir, "AppiumPOC.app");
            DesiredCapabilities capabilities = new DesiredCapabilities();

            capabilities.setCapability(MobileCapabilityType.DEVICE_NAME, "iPhone 6");
            capabilities.setCapability(MobileCapabilityType.PLATFORM_VERSION, "9.3");

            capabilities.setCapability(MobileCapabilityType.APP, app.getAbsolutePath());

            return new IOSDriver(new URL(APPIUM_SERVER_URL), capabilities);
        } catch (Exception ex) {
            throw new IllegalStateException("Could not create Appium Driver for iOS.", ex);
        }
    }
}
