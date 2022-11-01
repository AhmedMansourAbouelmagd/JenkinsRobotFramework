*** Settings ***
Resource        ../resources/Insulte_ios_app_resources.robot

Suite Setup    clear everything on the device after deactivation
#Suite Setup     initializing everything before start
#Suite Setup     Run Keywords        initializing everything before start

*** Test Cases ***
Test Case 5
   [Documentation]    Testing that the App should reconnect to the peer device if the peer device is reset.
   [Tags]     APPDM IOS APP
   setup and open appdm app
   AppiumLibrary.Click Element   accessibility_id=ResetSDKBtn
   Run Keyword And Ignore Error   press ok
   AppiumLibrary.Click Element   accessibility_id=RegisterMyPhoneBtn
   AppiumLibrary.page should contain element  accessibility_id=Validating your device
   AppiumLibrary.wait until element is visible    accessibility_id=ResetSDKBtn    90s
   scan for devices
   AppiumLibrary.wait until element is visible    accessibility_id=FoundDeviceL    10s
   AppiumLibrary.Click Element          accessibility_id=FoundDeviceL
   AppiumLibrary.wait until element is visible    ActivationViewActivatePODBtn     40s
#   initializing Serial
   Power click
   press ok when Device disconnected
   AppiumLibrary.wait until element is visible    accessibility_id=ActivationViewDisconnectBtn    40s
Test Case 1
   [Documentation]    Testing that the “Get version” signed command is successful, using the primary key.
   [Tags]     APPDM IOS APP
   AppiumLibrary.wait until element is visible    ActivationViewActivatePODBtn     40s
   AppiumLibrary.Click Element     accessibility_id=ActivationViewActivatePODBtn
   enter activation data
   AppiumLibrary.Click Element     accessibility_id=ActivationViewDoneBtn
   AppiumLibrary.wait until element is visible    accessibility_id=card:com.twi3.appdm:sceneID:com.twi3.appdm-default   20s
   AppiumLibrary.Input Password     xpath=(//XCUIElementTypeSecureTextField[@name="Passcode field"])[2]   134679
   AppiumLibrary.Wait Until Page Contains    Pod Activated Successfully   180s
   AppiumLibrary.wait until element is visible    accessibility_id=ActivationViewDeactivateBtn
   AppiumLibrary.Click Element   accessibility_id=ActivationViewCustomActionsBtn
   click on get Version
   AppiumLibrary.Wait Until Element Is Visible    xpath=(//XCUIElementTypeSecureTextField[@name="Passcode field"])[2]
   AppiumLibrary.Input Password     xpath=(//XCUIElementTypeSecureTextField[@name="Passcode field"])[2]   134679
   AppiumLibrary.Wait Until Page Contains    Lot Number of the pod is    60s
Test Case 2
   [Documentation]    Testing that the “Get version” signed command is not sent when the user cancels the passcode.
   [Tags]     APPDM IOS APP
   setup and open appdm app
   Run Keyword And Ignore Error    press ok when Device disconnected
   AppiumLibrary.wait until element is visible    accessibility_id=ActivationViewCustomActionsBtn    40s
   AppiumLibrary.Click Element   accessibility_id=ActivationViewCustomActionsBtn
   click on get Version
   AppiumLibrary.wait until element is visible    accessibility_id=card:com.twi3.appdm:sceneID:com.twi3.appdm-default   20s
   AppiumLibrary.Click Element   xpath=(//XCUIElementTypeButton[@name="Cancel"])[2]
   AppiumLibrary.wait until element is visible    accessibility_id=Failed to send getVersionCSDD command with status -24    20s
Test Case 3
   [Documentation]    Testing that the “Get version” signed command is not sent when the user enters a wrong passcode multiple times.
   [Tags]     APPDM IOS APP
   AppiumLibrary.wait until element is visible    accessibility_id=ActivationViewCustomActionsBtn    40s
   AppiumLibrary.Click Element   accessibility_id=ActivationViewCustomActionsBtn
   click on get Version
   AppiumLibrary.wait until element is visible    accessibility_id=card:com.twi3.appdm:sceneID:com.twi3.appdm-default   20s
   Run Keyword And Ignore Error   AppiumLibrary.Input Password     xpath=(//XCUIElementTypeSecureTextField[@name="Passcode field"])[2]   123223
   Run Keyword And Ignore Error   AppiumLibrary.Input Password     xpath=(//XCUIElementTypeSecureTextField[@name="Passcode field"])[2]   223223
   Run Keyword And Ignore Error   AppiumLibrary.Input Password     xpath=(//XCUIElementTypeSecureTextField[@name="Passcode field"])[2]   323223
   Run Keyword And Ignore Error   AppiumLibrary.Input Password     xpath=(//XCUIElementTypeSecureTextField[@name="Passcode field"])[2]   222222
   Run Keyword And Ignore Error   AppiumLibrary.Input Password     xpath=(//XCUIElementTypeSecureTextField[@name="Passcode field"])[2]   333333

   AppiumLibrary.Wait Until Page Contains    Authentication is disabled    50s
   Click Text   Cancel
   AppiumLibrary.wait until element is visible    accessibility_id=Failed to send getVersionCSDD command with status -24    20s

