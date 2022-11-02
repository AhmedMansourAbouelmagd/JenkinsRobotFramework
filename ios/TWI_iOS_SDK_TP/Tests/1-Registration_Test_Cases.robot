*** Settings ***
Resource        ../resources/Insulte_ios_app_resources.robot

Suite Setup    initializing everything before start
#Suite Teardown
*** Test Cases ***
Test Case 1
   [Documentation]    Testing that the registration process is successful without phone number.
   [Tags]     APPDM IOS APP
   setup and open appdm app
   AppiumLibrary.Click Element   accessibility_id=RegisterMyPhoneBtn
   AppiumLibrary.page should contain element  accessibility_id=Validating your device
   AppiumLibrary.wait until element is visible    accessibility_id=ResetSDKBtn    90s
   AppiumLibrary.Click Element   accessibility_id=ResetSDKBtn
Test Case 2
   [Documentation]    Testing that the registration process will fail if there is no internet connection.
   [Tags]     APPDM IOS APP
   toggle wifi
   AppiumLibrary.wait until element is visible  accessibility_id=RegisterMyPhoneBtn       10s
   AppiumLibrary.Click Element   accessibility_id=RegisterMyPhoneBtn
   AppiumLibrary.Wait Until Element Is Visible    accessibility_id=No Internet connection.       20s
   AppiumLibrary.Click Element    accessibility_id=Ok
   toggle wifi
Test Case 3
   [Documentation]    Testing that the phone doesn’t have a passcode and the cloud app requires the primary key.
   [Tags]     APPDM IOS APP
   turn Passcode Off
   setup and open appdm app
   AppiumLibrary.wait until element is visible  accessibility_id=RegisterMyPhoneBtn
   AppiumLibrary.Click Element   accessibility_id=RegisterMyPhoneBtn
   AppiumLibrary.wait until element is visible  accessibility_id=Biometry Id Not Enabled.    30s
   AppiumLibrary.Click Element    accessibility_id=Ok
#   turn Passcode On
Test Case 4
   [Documentation]    Testing that the user is able to register if it the phone doesn’t have a passcode and the cloud app doesn’t require the primary key.
   [Tags]     APPDM IOS APP
#   The cloud app is preconfigured to disable the primary key feature.
   disable primary key from cloud app
   setup and open appdm app
   AppiumLibrary.wait until element is visible  accessibility_id=RegisterMyPhoneBtn      10s
   AppiumLibrary.Click Element   accessibility_id=RegisterMyPhoneBtn
   AppiumLibrary.wait until element is visible    accessibility_id=ResetSDKBtn    90s
   AppiumLibrary.Click Element   accessibility_id=ResetSDKBtn
   enable primary key from cloud app
   turn Passcode On

Test Case 7
    [Documentation]    Testing that PDM Id property is set after the App is registered.
   [Tags]     APPDM IOS APP
   AppiumLibrary.Launch Application
   AppiumLibrary.wait until element is visible  accessibility_id=PDMIdBtn
   AppiumLibrary.Click Element   accessibility_id=PDMIdBtn
   toggle bluetooth
#   get ios logs    PID* ID: (null)
   AppiumLibrary.wait until element is visible  accessibility_id=RegisterMyPhoneBtn
   AppiumLibrary.Click Element   accessibility_id=RegisterMyPhoneBtn
   scan for devices
   AppiumLibrary.Wait Until Page Contains        New Omnipod, RSSI
   AppiumLibrary.Click Element   accessibility_id=FoundDeviceL
   AppiumLibrary.wait until element is visible  accessibility_id=ActivationViewPDMIdBtn   60s
   AppiumLibrary.Click Element   accessibility_id=ActivationViewPDMIdBtn
#   get ios logs    PID* ID: 2

Test Case 8
   [Documentation]    Testing that registration status is reset by removing the passcode.
   [Tags]     APPDM IOS APP
   AppiumLibrary.Launch Application
   AppiumLibrary.wait until element is visible    accessibility_id=ActivationViewDisconnectBtn    40s
   AppiumLibrary.Click Element   accessibility_id=ActivationViewDisconnectBtn
   Run Keyword And Ignore Error    press ok when Device disconnected
   AppiumLibrary.wait until element is visible    accessibility_id=ScanBtn    90s
   turn Passcode Off
   setup and open appdm app
   AppiumLibrary.wait until element is visible    accessibility_id=ScanBtn    40s
   AppiumLibrary.Click Element   accessibility_id=ScanBtn
   AppiumLibrary.wait until element is visible    accessibility_id=operarion Failed With Code -28
   AppiumLibrary.Click Element   accessibility_id=Ok
#   AppiumLibrary.wait until element is visible    accessibility_id=ResetSDKBtn
#   AppiumLibrary.Click Element   accessibility_id=ResetSDKBtn
   turn Passcode On
Test Case 9
   [Documentation]    Testing that TWISDK notifies the application layer when registration status is changed.
   [Tags]     APPDM IOS APP
   setup and open appdm app
#   AppiumLibrary.wait until element is visible    accessibility_id=RegisterMyPhoneBtn    90s
#   AppiumLibrary.Click Element   accessibility_id=RegisterMyPhoneBtn
#   AppiumLibrary.page should contain element  accessibility_id=Validating your device
#   AppiumLibrary.wait until element is visible    accessibility_id=ScanBtn    90s
   turn Passcode Off
   setup and open appdm app
   open notification
   AppiumLibrary.Wait Until Page Contains      Phone is not registered    20s
   turn Passcode On
   setup and open appdm app
   AppiumLibrary.wait until element is visible    accessibility_id=ResetSDKBtn    90s
Test case 10
   [Documentation]       Testing that Attestation with Play Integrity device is working properly after registration.
   [Tags]     APPDM IOS APP
   setup and open appdm app
   AppiumLibrary.wait until element is visible    accessibility_id=AssertDataBtn    20s
   AppiumLibrary.Click Element   accessibility_id=AssertDataBtn
   Sleep    2s
   open notification
   AppiumLibrary.Wait Until Page Contains      The result of data assertion is:     30s
   sleep      1
   open settings app
Test case 11
   [Documentation]           Testing Attestation after turning wifi off.
   [Tags]     APPDM IOS APP
   setup and open appdm app
   toggle wifi
   AppiumLibrary.wait until element is visible    accessibility_id=AssertDataBtn    20s
   AppiumLibrary.Click Element   accessibility_id=AssertDataBtn
   Sleep     1s
   open notification
   AppiumLibrary.Wait Until Page Contains      The result of data assertion is:      30s
   toggle wifi
   open settings app
Test case 12
   [Documentation]          Test registration with wrong bundle id on portal.
   [Tags]     APPDM IOS APP
#   Launch Application
   setup and open appdm app
#   Run Keyword And Ignore Error    press ok when Device disconnected
   AppiumLibrary.wait until element is visible    accessibility_id=ResetSDKBtn    20s
   AppiumLibrary.Click Element   accessibility_id=ResetSDKBtn
#   for clear caches
   Run Keyword And Ignore Error    press ok when Device disconnected
   AppiumLibrary.wait until element is visible    accessibility_id=ResetSDKBtn    20s
   AppiumLibrary.Click Element   accessibility_id=ResetSDKBtn

   change the app bundle id on portal to khaled
   AppiumLibrary.wait until element is visible  accessibility_id=RegisterMyPhoneBtn       10s
   AppiumLibrary.Click Element   accessibility_id=RegisterMyPhoneBtn
   AppiumLibrary.Wait Until Element Is Visible    accessibility_id=Device Registration failed. status:2       20s
   AppiumLibrary.Click Element    accessibility_id=Ok
   change the app bundle id on portal to com.twi3.appdm
   Sleep    5s

Test Case 5
   [Documentation]    Testing that TWISDK supports client authentications.
   [Tags]     APPDM IOS APP
   setup and open appdm app
   AppiumLibrary.wait until element is visible  accessibility_id=RegisterMyPhoneBtn     20s
   AppiumLibrary.Click Element   accessibility_id=RegisterMyPhoneBtn
   AppiumLibrary.wait until element is visible    accessibility_id=ResetSDKBtn    180s
#   get ios logs    USDRC
#   AppiumLibrary.Click Element   accessibility_id=ResetSDKBtn

Test Case 6
   [Documentation]    Testing that TWISDK Clears the registration data to be able to register if updates occur.
   [Tags]     APPDM IOS APP
   AppiumLibrary.wait until element is visible    accessibility_id=ResetSDKBtn    90s
   AppiumLibrary.Click Element   accessibility_id=ResetSDKBtn
   AppiumLibrary.wait until element is visible    accessibility_id=RegisterMyPhoneBtn    30s
   AppiumLibrary.Click Element   accessibility_id=RegisterMyPhoneBtn
   AppiumLibrary.wait until element is visible    accessibility_id=ResetSDKBtn    90s
   AppiumLibrary.Click Element   accessibility_id=ResetSDKBtn

#   AppiumLibrary.wait until element is visible    accessibility_id=ResetSDKBtn    20s
#   AppiumLibrary.Click Element   accessibility_id=ResetSDKBtn



#Test case 13
#   [Documentation]          Test registration with time out fired.
#   [Tags]     APPDM IOS APP

#Test case 14
#   [Documentation]          Test registration with jailbroken device.
#   [Tags]     APPDM IOS APP

#Test case 15
#   [Documentation]          Test registration on a device that doesn’t support secure enclave.
#   [Tags]     APPDM IOS APP

#Test case 16
#   [Documentation]          Test registration on a device with version not supported in device check.
#   [Tags]     APPDM IOS APP
