*** Settings ***
Resource        ../resources/Insulte_ios_app_resources.robot

Suite Setup    clear everything on the device after deactivation
#Suite Setup     initializing everything before start
#Suite Setup     Run Keywords        initializing everything before start

*** Test Cases ***
Test Case 3
   [Documentation]    Testing that the App reconnects to the peer device when the App is closed and reopened.
   [Tags]     APPDM IOS APP
   setup and open appdm app
   scan for devices
   AppiumLibrary.Click Element   accessibility_id=FoundDeviceL
   AppiumLibrary.wait until element is visible    accessibility_id=ActivationViewDisconnectBtn     60s
   Background App    seconds=1
   Run Keyword And Ignore Error    press ok when Device disconnected
   AppiumLibrary.wait until element is visible    accessibility_id=ActivationViewDisconnectBtn    40s
Test Case 14
   [Documentation]         	Testing get engineering buffer data.
   [Tags]     APPDM IOS APP
   setup and open appdm app

   AppiumLibrary.wait until element is visible    accessibility_id=ActivationViewCustomActionsBtn    40s
   AppiumLibrary.Click Element   accessibility_id=ActivationViewCustomActionsBtn
   click on get engineering buffer data
   click on Elv module
   enter logs offset and logs count
   AppiumLibrary.wait until element is visible    accessibility_id=getEngineeringBufferDataCommand Command is sent successfully, response is id: getEngineeringBufferDataCommand     timeout=40s

#Test Case 9
#   [Documentation]    Testing that the app is restored after crashing in the foreground while scanning.
#   [Tags]     APPDM IOS APP
#   setup and open appdm app
##   Run Keyword And Ignore Error    press ok when Device disconnected
#   toggle bluetooth
#   AppiumLibrary.Wait Until Page Contains      Please turn on your bluetooth    40s
#   AppiumLibrary.Click Element    accessibility_id=Ok
#   Power off board
#   toggle bluetooth
#   AppiumLibrary.wait until element is visible    accessibility_id=ActivationViewCrashBtn   30s
#   AppiumLibrary.Click Element     accessibility_id=ActivationViewCrashBtn
#   Power on board
#   open notification
#   AppiumLibrary.Wait Until Page Contains    New Device Activity  10s
Test case 4
   [Documentation]    Testing that the App reconnects after Bluetooth is turned off then on.
   [Tags]     APPDM IOS APP
   setup and open appdm app
   toggle bluetooth

   AppiumLibrary.Wait Until Page Contains      Please turn on your bluetooth    40s
   AppiumLibrary.Click Element    accessibility_id=Ok
   toggle bluetooth
   AppiumLibrary.wait until element is visible    accessibility_id=ActivationViewDisconnectBtn    40s
Test Case 8
   [Documentation]    Testing that the app is restored after crashing in the foreground while connected.
   [Tags]     APPDM IOS APP
   AppiumLibrary.wait until element is visible    accessibility_id=ActivationViewPeriodicEveryOneMinBtn   20s
   AppiumLibrary.Click Element     accessibility_id=ActivationViewPeriodicEveryOneMinBtn
   AppiumLibrary.wait until element is visible    accessibility_id=ActivationViewCrashBtn   20s
   AppiumLibrary.Click Element     accessibility_id=ActivationViewCrashBtn
   open my phone
   AppiumLibrary.wait until element is visible    accessibility_id=No Thanks
   AppiumLibrary.Click Element     accessibility_id=No Thanks
   setup and open appdm app
   Run Keyword And Ignore Error    press ok when Device disconnected
   open notification
   AppiumLibrary.Wait Until Page Contains    New Device Activity  10s
   AppiumLibrary.Wait Until Page Contains    launchOptions    10s
   open settings app


Test Case 1
   [Documentation]    Testing that the App keeps connecting while the peer device disconnects if the pairing data on the peer device has been cleared.
   [Tags]     APPDM IOS APP
       ###############   granted from the previous test cases ###################
    setup and open appdm app
    Run Keyword And Ignore Error    press ok when Device disconnected
    ${message}=  Evaluate  ${BLUE} "\\nClear the pairing data of the peer device by a long press on button 2 on the peer device board"
    Log To Console  ${message}
    Set HIGH      Port Number=${Port Number}    portNum=0   pinNum=0
    sleep   2
    Set LOW      Port Number=${Port Number}    portNum=0   pinNum=0
    sleep   2
    AppiumLibrary.wait until element is visible    accessibility_id=Device disconnected     60s
    AppiumLibrary.Click Element   accessibility_id=Ok
Test case 2
   [Documentation]    Testing that the App does not reconnect again if the App layer requests ‘disconnect’ from the peer device.
   [Tags]     APPDM IOS APP
#   setup and open appdm app
#   clear everything on the device after deactivation
#   scan for devices
#   AppiumLibrary.Wait Until Page Contains         Omnipod
#   AppiumLibrary.Click Element   accessibility_id=FoundDeviceL
#   AppiumLibrary.wait until element is visible     Paring and connecting to New Omnipod    30s
   Run Keyword And Ignore Error    press ok when Device disconnected
   AppiumLibrary.wait until element is visible    accessibility_id=ActivationViewDisconnectBtn    40s
   AppiumLibrary.Click Element    accessibility_id=ActivationViewDisconnectBtn
   AppiumLibrary.wait until element is visible    accessibility_id=Device disconnected     5s
   AppiumLibrary.Click Element   accessibility_id=Ok


