*** Settings ***
Resource        ../resources/Insulte_ios_app_resources.robot

#Suite Setup    clear everything on the device after deactivation
Suite Setup                initializing everything before start

#Suite Setup     Run Keywords        initializing everything before start

*** Test Cases ***
Test Case 1
   [Documentation]    Testing that the scanning process works successfully when the App is not yet paired with a peer device.
   [Tags]     APPDM IOS APP
   setup and open appdm app
   AppiumLibrary.wait until element is visible  accessibility_id=RegisterMyPhoneBtn
   AppiumLibrary.Click Element   accessibility_id=RegisterMyPhoneBtn
   AppiumLibrary.wait until element is visible    accessibility_id=ClearCacheBtn    160s
   AppiumLibrary.Click Element   accessibility_id=ClearCacheBtn
   scan for devices
   AppiumLibrary.Wait Until Page Contains        New Omnipod, RSSI
Test Case 2
   [Documentation]    Testing that the App connects successfully to an unpaired peer device that is found during scanning.
   [Tags]     APPDM IOS APP
   AppiumLibrary.Wait Until Page Contains        New Omnipod, RSSI
   AppiumLibrary.Click Element   accessibility_id=FoundDeviceL
   AppiumLibrary.wait until element is visible     Paring and connecting to New Omnipod    30s
   AppiumLibrary.wait until element is visible    accessibility_id=ActivationViewActivatePODBtn    40s
   AppiumLibrary.wait until element is visible    accessibility_id=ActivationViewDisconnectBtn    40s
Test Case 11
   [Documentation]    Testing that user commands can not have the same identifier as SDK’s reserved ones.
   [Tags]     APPDM IOS APP
#   scan for devices
#   AppiumLibrary.Wait Until Element Is Visible    accessibility_id=FoundDeviceL      30s
#   AppiumLibrary.Click Element    accessibility_id=FoundDeviceL
   AppiumLibrary.Wait Until Element Is Visible    accessibility_id=ActivationViewSendReservedCmdBtn     60s
   AppiumLibrary.Click Element    accessibility_id=ActivationViewSendReservedCmdBtn
   AppiumLibrary.Wait Until Element Is Visible    accessibility_id=Can't send reserved command     30s
Test Case 3
   [Documentation]    Testing that the scanning process works successfully while the app is paired.
   [Tags]     APPDM IOS APP
#   scan for devices
#   AppiumLibrary.Wait Until Page Contains        Omnipod
#   AppiumLibrary.Click Element   accessibility_id=FoundDeviceL
   AppiumLibrary.wait until element is visible    accessibility_id=ActivationViewDisconnectBtn    40s
   AppiumLibrary.Click Element   accessibility_id=ActivationViewDisconnectBtn
   AppiumLibrary.wait until element is visible    accessibility_id=Device disconnected     40s
   AppiumLibrary.Click Element   accessibility_id=Ok
   scan for devices
   AppiumLibrary.Wait Until Page Contains        Omnipod
Test Case 10
   [Documentation]    Testing that clearing after pairing will clear the peer device too and the App will be able to find it in the scanning again.
   [Tags]     APPDM IOS APP
   AppiumLibrary.Click Element          accessibility_id=FoundDeviceL
   AppiumLibrary.wait until element is visible  accessibility_id=ActivationViewUnpairBtn   60s
   AppiumLibrary.Click Element   accessibility_id=ActivationViewUnpairBtn
   Run Keyword And Ignore Error    press ok when Device disconnected
   scan for devices
   AppiumLibrary.Wait Until Page Contains        Omnipod   30s
Test Case 4
   [Documentation]    Testing that the peer device activation process is successful.
   [Tags]     APPDM IOS APP

   AppiumLibrary.wait until element is visible    accessibility_id=FoundDeviceL    10s
   AppiumLibrary.Click Element          accessibility_id=FoundDeviceL
   AppiumLibrary.wait until element is visible    ActivationViewActivatePODBtn     40s
   AppiumLibrary.Click Element     accessibility_id=ActivationViewActivatePODBtn
   enter activation data
   AppiumLibrary.Click Element     accessibility_id=ActivationViewDoneBtn
   AppiumLibrary.wait until element is visible    accessibility_id=card:com.twi3.appdm:sceneID:com.twi3.appdm-default   20s
   AppiumLibrary.Input Password     xpath=(//XCUIElementTypeSecureTextField[@name="Passcode field"])[2]   134679
   AppiumLibrary.Wait Until Page Contains    Pod Activated Successfully   180s
   AppiumLibrary.wait until element is visible    accessibility_id=ActivationViewDeactivateBtn
Test Case 15
   [Documentation]         	Testing background functionality to verify that AP+ PDM can connect to the cloud and send its logs every 1 Minute in the background successfully.
   [Tags]     APPDM IOS APP
#   scan for devices
#   AppiumLibrary.wait until element is visible    accessibility_id=FoundDeviceL    10s
#   AppiumLibrary.Click Element          accessibility_id=FoundDeviceL
   AppiumLibrary.wait until element is visible    accessibility_id=ActivationViewPeriodicEveryOneMinBtn     40s
   AppiumLibrary.Click Element          accessibility_id=ActivationViewPeriodicEveryOneMinBtn
   AppiumLibrary.Wait Until Page Contains    Nudge: Total Number of pulses is   timeout=65

Test Case 8
   [Documentation]    Testing the periodic event operation when the App is in foreground or background.
   [Tags]     APPDM IOS APP
   AppiumLibrary.wait until element is visible    accessibility_id=ActivationViewPeriodicEveryOneMinBtn   20s
   AppiumLibrary.Click Element     accessibility_id=ActivationViewPeriodicEveryOneMinBtn
#   Wait Until Page Contains    Periodic Commands Configured   65s
############################### Should Be in Another Thread#######################################
   ${message}=  Evaluate  ${BLUE} "\\n-----------------> the App is in Background<-----------------"
   Log To Console   ${message}
   Background App   seconds=65
   AppiumLibrary.Wait Until Page Contains   Nudge: Total Number of pulses     60S
#   open notification
#   AppiumLibrary.Wait Until Page Contains   Nudge: Total Number of pulses     60S
#   open settings app

Test Case 6

   [Documentation]    Testing that the “Get Status” command is successful.
   [Tags]     APPDM IOS APP
   setup and open appdm app
   AppiumLibrary.wait until element is visible    accessibility_id=ActivationViewCustomActionsBtn    40s
   AppiumLibrary.Click Element   accessibility_id=ActivationViewCustomActionsBtn
   click on get pod activation status
   AppiumLibrary.Wait Until Page Contains    Total Full Pulses    40s
   Sleep    1s

Test Case 5
   [Documentation]    Testing that the deactivation process is successful.
   [Tags]     APPDM IOS APP
#   Run Keyword And Ignore Error    press ok when Device disconnected
#   AppiumLibrary.Click Element          accessibility_id=FoundDeviceL
   AppiumLibrary.Reset Application
   AppiumLibrary.wait until element is visible    accessibility_id=ActivationViewDeactivateBtn    40s
   AppiumLibrary.Click Element   accessibility_id=ActivationViewDeactivateBtn
   Run Keyword And Ignore Error    press ok when Device disconnected


#   AppiumLibrary.wait until element is visible    accessibility_id=ScanBtn    40s
#   Reset Application
#Test Case 7
#   [Documentation]    Testing that pairing data is deleted after App uninstallation if the default caching type is set to “File”.
#   [Tags]     APPDM IOS APP
#Test Case 9
#   [Documentation]    Testing that the deactivation process is successful.
#   [Tags]     APPDM IOS APP


#Test Case 12
#   [Documentation]    Testing that the pairing and unpairing multiple times will make SDK cycle does cycle the ID on every pair/unpair +1,+,2,+3, and it keep PDM id + 0 to the PDM only.
#   [Tags]     APPDM IOS APP
##   initializing Serial
#
#   clear everything on the device after deactivation
#
#   setup and open appdm app
#   Reset Application
#   scan for devices
#   AppiumLibrary.wait until element is visible    accessibility_id=FoundDeviceL    10s
#   AppiumLibrary.Click Element          accessibility_id=FoundDeviceL
#   AppiumLibrary.wait until element is visible    accessibility_id=ActivationViewUnpairBtn     40s
#   AppiumLibrary.Click Element          accessibility_id=ActivationViewUnpairBtn
#   Run Keyword And Ignore Error    press ok when Device disconnected
#
#
#   scan for devices
#   AppiumLibrary.wait until element is visible    accessibility_id=FoundDeviceL    10s
#   AppiumLibrary.Click Element          accessibility_id=FoundDeviceL
#   AppiumLibrary.wait until element is visible    accessibility_id=ActivationViewUnpairBtn     40s
#   AppiumLibrary.Click Element          accessibility_id=ActivationViewUnpairBtn
#   Run Keyword And Ignore Error    press ok when Device disconnected
#
#   scan for devices
#   AppiumLibrary.wait until element is visible    accessibility_id=FoundDeviceL    10s
#   AppiumLibrary.Click Element          accessibility_id=FoundDeviceL
#   AppiumLibrary.wait until element is visible    accessibility_id=ActivationViewUnpairBtn     40s
#   AppiumLibrary.Click Element          accessibility_id=ActivationViewUnpairBtn
#   Run Keyword And Ignore Error    press ok when Device disconnected


#Test Case 16
#   [Documentation]         		Testing that reseting phone settings will keep the application data status (Certificate/CK/LTK) as is.
#   [Tags]     APPDM IOS APP

#Test Case 17
#   [Documentation]    Testing that resetoring the backup of a factory-resetted phone after successful registration and pairing to a POD, will invalidate the Certificate/CK/LTK data from the phone.
#   [Tags]     APPDM IOS APP
#Test Case 18
#   [Documentation]    Testing that the pairing and unpairing multiple times will make SDK cycle does cycle the ID on every pair/unpair +1,+,2,+3, and it keep PDM id + 0 to the PDM only.
#   [Tags]     APPDM IOS APP


