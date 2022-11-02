*** Settings ***
Resource    ../resources/TestData.robot
Resource    ../resources/TWI_Serial_library.robot
Library     AppiumLibrary      run_on_failure=AppiumLibrary.CapturePageScreenshot
Resource        ../resources/resource.robot
Library   WebSocketClient
Library         SeleniumLibrary     run_on_failure=SeleniumLibrary.CapturePageScreenshot



*** Variables ***
${APPIUM_SERVER}    http://127.0.0.1:4723/wd/hub
#${APPIUM_SERVER_settings}    http://127.0.0.1:4724/wd/hub
#${APPIUM_SERVER_device}    http://127.0.0.1:4725/wd/hub
${app_appdm}   com.twi3.appdm
${app_registration_TP}   TWI.APPDMRegistrationTest1
${version}    16.0.2
${platform}    iOS
${deviceName}     ${iOS_DN}
${udid}    00008101-001240C21103001E
${platformName}    iOS
${name}     My First Mobile Test
${automationName}    XCUITest
${xcodeOrgId}    8UL52W2HAZ
${xcodeSigningId}    iPhone Developer
${app_settings}   com.apple.Preferences

*** Keywords ***

setup and open appdm app
    Open Application	${APPIUM_SERVER}
#    ...    alias=${app_appdm}
    ...    platformName=iOS
    ...    platformVersion=${version}
    ...    deviceName=${deviceName}
    ...    app=${app_appdm}
    ...    udid=${udid}
    ...    xcodeOrgId=${xcodeOrgId}
    ...    automationName=${automationName}
    ...    xcodeSigningId=${xcodeSigningId}
#    ...    showXcodeLog=true
#    ...    showIOSLog =true
#    ...    autoReset =true
    ...    useNewWDA =false
    ...    waitForIdleTimeout =0
    ...    usePrebuiltWDA=false
    ...    derivedDataPath=/Users/user/Library/Developer/Xcode/DerivedData/WebDriverAgent-eefnhsnbzqkaizbywdkxfgbhslib
    ...    noReset=true
    ...    wdaLocalPort=8100
open TWI Registration TP app
    Open Application	${APPIUM_SERVER}
    ...    platformName=iOS
    ...    platformVersion=${version}
    ...    deviceName=${deviceName}
    ...    app=${app_registration_TP}
    ...    udid=${udid}
    ...    xcodeOrgId=${xcodeOrgId}
    ...    automationName=${automationName}
    ...    xcodeSigningId=${xcodeSigningId}
#    ...    showXcodeLog=true
#    ...    showIOSLog =true
#    ...    autoReset =true
#    ...    fullReset=true
    ...    useNewWDA =false
    ...    waitForIdleTimeout =0
    ...    usePrebuiltWDA=false
    ...    derivedDataPath=/Users/user/Library/Developer/Xcode/DerivedData/WebDriverAgent-eefnhsnbzqkaizbywdkxfgbhslib
#    ...    noReset=true
    ...    wdaLocalPort=8100
#    ...    disableAutomaticScreenshots=false
open settings app
    Open Application	${APPIUM_SERVER}
#    ...    alias=${app_settings}
    ...    platformName=iOS
    ...    platformVersion=${version}
    ...    deviceName=${deviceName}
    ...    app=${app_settings}
    ...    udid=${udid}
    ...    xcodeOrgId=${xcodeOrgId}
    ...    automationName=${automationName}
    ...    xcodeSigningId=${xcodeSigningId}
    ...    useNewWDA =false
    ...    usePrebuiltWDA=false
    ...    waitForIdleTimeout =0
    ...    derivedDataPath=/Users/user/Library/Developer/Xcode/DerivedData/WebDriverAgent-eefnhsnbzqkaizbywdkxfgbhslib
    ...    wdaLocalPort=8100
#    ...    noReset=true
#    ...    showXcodeLog=true
#    ...    showIOSLog =true
#    ...    autoReset =true

open my phone
    Open Application	${APPIUM_SERVER}
    ...    platformName=iOS
    ...    platformVersion=${version}
    ...    deviceName=${deviceName}
    ...    udid=${udid}
    ...    xcodeOrgId=${xcodeOrgId}
    ...    automationName=${automationName}
    ...    xcodeSigningId=${xcodeSigningId}
    ...    useNewWDA =false
    ...    usePrebuiltWDA=false
    ...    waitForIdleTimeout =0
    ...    derivedDataPath=/Users/user/Library/Developer/Xcode/DerivedData/WebDriverAgent-eefnhsnbzqkaizbywdkxfgbhslib
#    ...    noReset=true
    ...    wdaLocalPort=8100


toggle wifi
    Swipe    350    5    350    100   100
    AppiumLibrary.Click Element     accessibility_id=wifi-button
    Swipe    350    600    350    580   100

toggle air plane mode
    Swipe    350    5    350    100   100
    AppiumLibrary.Click Element     accessibility_id=airplane-mode-button
    Swipe    350    600    350    580   100
toggle bluetooth
    Swipe    350    5    350    100   100
    AppiumLibrary.Click Element     accessibility_id=bluetooth-button
    Swipe    350    600    350    580   100

turn Passcode Off
   open settings app
#   accessibility_id=Face ID & Passcode
   AppiumLibrary.Click Element          Face ID & Passcode
   AppiumLibrary.Input Password    accessibility_id=Passcode    134679
#   accessibility_id=PASSCODE_OFF
   Sleep    0.5s
   Click Text        Turn Passcode Off
   AppiumLibrary.Input Password    accessibility_id=Passcode    134679

turn Passcode On
   open settings app
#   accessibility_id=Face ID & Passcode
   AppiumLibrary.Click Element          Face ID & Passcode
#   accessibility_id=PASSCODE_OFF
   Sleep    0.5s
   Click Text        Turn Passcode On
   AppiumLibrary.Input Password    accessibility_id=Passcode    134679
#   Click Text        Verify your new passcode
   Sleep    0.5s
   AppiumLibrary.Input Password    accessibility_id=Passcode    134679



press ok when Device disconnected

   AppiumLibrary.wait until element is visible    accessibility_id=Device disconnected     10s
   AppiumLibrary.Click Element   accessibility_id=Ok
press ok
   AppiumLibrary.Click Element   accessibility_id=Ok

open notification
      Swipe    50    0    50    800   100

click on get pod activation status
    AppiumLibrary.Input Text     xpath=//XCUIElementTypeApplication[@name="APPDM"]/XCUIElementTypeWindow/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypePicker/XCUIElementTypePickerWheel   Get Pod Activation Status
    AppiumLibrary.Click Element    accessibility_id=Done

click on get engineering buffer data
    AppiumLibrary.Input Text     xpath=//XCUIElementTypeApplication[@name="APPDM"]/XCUIElementTypeWindow/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypePicker/XCUIElementTypePickerWheel   Get Engineering Buffer Data
    AppiumLibrary.Click Element    accessibility_id=Done
click on get Version
    AppiumLibrary.Input Text     xpath=//XCUIElementTypeApplication[@name="APPDM"]/XCUIElementTypeWindow/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypePicker/XCUIElementTypePickerWheel   Get Version
    AppiumLibrary.Click Element    accessibility_id=Done

click on Elv module
    AppiumLibrary.Input Text     xpath=//XCUIElementTypeAlert[@name="Please configure the engineering buffer"]/XCUIElementTypePicker/XCUIElementTypePickerWheel    Elv
    AppiumLibrary.Click Element    accessibility_id=Select
enter logs offset and logs count
    AppiumLibrary.Input Text     xpath=//XCUIElementTypeAlert[@name="Please configure the engineering buffer"]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther[2]/XCUIElementTypeScrollView[1]/XCUIElementTypeOther[1]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeCollectionView/XCUIElementTypeCell[1]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther[2]/XCUIElementTypeTextField    1
    AppiumLibrary.Input Text     xpath=//XCUIElementTypeAlert[@name="Please configure the engineering buffer"]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther[2]/XCUIElementTypeScrollView[1]/XCUIElementTypeOther[1]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeCollectionView/XCUIElementTypeCell[2]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther[2]/XCUIElementTypeTextField    1
    AppiumLibrary.Click Element    accessibility_id=OK
check if device has appeared
   AppiumLibrary.wait until element is visible    accessibility_id=ScanBtn    40s
   AppiumLibrary.Click Element   accessibility_id=ScanBtn
   AppiumLibrary.wait until element is visible    accessibility_id=FoundDeviceL    10s
order appium and selenium
   Set Library Search Order         AppiumLibrary   SeleniumLibrary

scan for devices
   Wait Until Keyword Succeeds  45x   100ms    check if device has appeared

register my phone
   Wait Until Keyword Succeeds  45x   100ms    check if scanBtn has appeared
check if scanBtn has appeared
   AppiumLibrary.wait until element is visible  accessibility_id=RegisterMyPhoneBtn     20s
   AppiumLibrary.Click Element   accessibility_id=RegisterMyPhoneBtn
   Run Keyword And Ignore Error    press ok
   AppiumLibrary.wait until element is visible    accessibility_id=ResetSDKBtn    180s
enter activation data
   Clear Text    accessibility_id=CGMTxIDTF
   Input Value    accessibility_id=CGMTxIDTF    800001
   Clear Text    accessibility_id=TotalDayInsulinTF
   Input Value    accessibility_id=TotalDayInsulinTF    120
   Clear Text    accessibility_id=TDIFlagsTF
   Input Value    accessibility_id=TDIFlagsTF    1
   Clear Text    accessibility_id=SetPointTF
   Input Value    accessibility_id=SetPointTF    120
   Clear Text    accessibility_id=InsulinTimeInHoursTF
   Input Value    accessibility_id=InsulinTimeInHoursTF    4.0
   Clear Text    accessibility_id=LowThresholdTF
   Input Value    accessibility_id=LowThresholdTF    120
   Clear Text    accessibility_id=HighThresholdTF
   Input Value    accessibility_id=HighThresholdTF    400

disable primary key from cloud app
       SeleniumLibrary.Open Browser     https://twi-services.com/twi-cloud-portal-r2/#/login       chrome
#   SeleniumLibrary.Wait Until Page Contains    thirdwayv
   SeleniumLibrary.Wait Until Element Is Visible    name=email
   SeleniumLibrary.Input Text    name=email    text=admin@thirdwayv.com
   SeleniumLibrary.Input Text    name=password    text=Admin!123
   SeleniumLibrary.Click Button  id=loginButton
   SeleniumLibrary.Wait Until Element Is Visible    id=mat-input-0
   #SeleniumLibrary.Click Element    id=mat-input-0
   SeleniumLibrary.Input Text    id=mat-input-0    text=a36ae445bfd34a52ffa2e414
   #SeleniumLibrary.Click Element    id=mat-input-0
   Sleep    1s
   SeleniumLibrary.Press Keys    id=mat-input-0    RETURN
   SeleniumLibrary.Press Keys    id=mat-input-0    RETURN
   Sleep    2s
#   SeleniumLibrary.Click Element    xpath=/html/body/app-root/app-main-container/div/div/app-apps-list/table[2]/tbody/tr/td[5]/button[1]/span/mat-icon
   SeleniumLibrary.Click Button    edit
   Sleep    2s
#   SeleniumLibrary.Click Element       id=mat-radio-3
#   SeleniumLibrary.Click Button       Edit
   SeleniumLibrary.Click Element       id=Group_1
#   xpath=//*[@id="SpecificCommandTable"]/tbody/tr[2]/td[2]
#   SeleniumLibrary.Click Element    id=SpecificCommandTable
   SeleniumLibrary.Click Element     id=mat-option-8
   Sleep    1s
#   SeleniumLibrary.Click Button     Signed by secondary key
   SeleniumLibrary.Click Button      Edit
   Sleep    1
   Close Browser
enable primary key from cloud app
   SeleniumLibrary.Open Browser     https://twi-services.com/twi-cloud-portal-r2/#/login       chrome
#   SeleniumLibrary.Wait Until Page Contains    thirdwayv
   SeleniumLibrary.Wait Until Element Is Visible    name=email
   SeleniumLibrary.Input Text    name=email    text=admin@thirdwayv.com
   SeleniumLibrary.Input Text    name=password    text=Admin!123
   SeleniumLibrary.Click Button  id=loginButton
   SeleniumLibrary.Wait Until Element Is Visible    id=mat-input-0
   #SeleniumLibrary.Click Element    id=mat-input-0
   SeleniumLibrary.Input Text    id=mat-input-0    text=a36ae445bfd34a52ffa2e414
   #SeleniumLibrary.Click Element    id=mat-input-0
   Sleep    1s
   SeleniumLibrary.Press Keys    id=mat-input-0    RETURN
   SeleniumLibrary.Press Keys    id=mat-input-0    RETURN
   Sleep    2s
#   SeleniumLibrary.Click Element    xpath=/html/body/app-root/app-main-container/div/div/app-apps-list/table[2]/tbody/tr/td[5]/button[1]/span/mat-icon
   SeleniumLibrary.Click Button    edit
   Sleep    2s
#   SeleniumLibrary.Click Element       id=mat-radio-3
#   SeleniumLibrary.Click Button       Edit
   SeleniumLibrary.Click Element       id=Group_1
#   xpath=//*[@id="SpecificCommandTable"]/tbody/tr[2]/td[2]
#   SeleniumLibrary.Click Element    id=SpecificCommandTable
   SeleniumLibrary.Click Element     id=mat-option-7
   Sleep    1s
   SeleniumLibrary.Click Button      Edit
   Sleep    1
   Close Browser
change the app bundle id on portal to khaled
   SeleniumLibrary.Open Browser     https://twi-services.com/twi-cloud-portal-r2/#/login       chrome
#   SeleniumLibrary.Wait Until Page Contains    thirdwayv
   SeleniumLibrary.Wait Until Element Is Visible    name=email
   SeleniumLibrary.Input Text    name=email    text=admin@thirdwayv.com
   SeleniumLibrary.Input Text    name=password    text=Admin!123
   SeleniumLibrary.Click Button  id=loginButton
   SeleniumLibrary.Wait Until Element Is Visible    id=mat-input-0
   #SeleniumLibrary.Click Element    id=mat-input-0
   SeleniumLibrary.Input Text    id=mat-input-0    text=a36ae445bfd34a52ffa2e414
   #SeleniumLibrary.Click Element    id=mat-input-0
   Sleep    1s
   SeleniumLibrary.Press Keys    id=mat-input-0    RETURN
   SeleniumLibrary.Press Keys    id=mat-input-0    RETURN
   Sleep    2s
   SeleniumLibrary.Click Button    edit
   Sleep    2s
   SeleniumLibrary.Input Text    id=mat-input-3    text=khaledElgazzar
   Sleep    1s
   SeleniumLibrary.Click Button      Edit
   Sleep    1
   Close Browser


change the app bundle id on portal to com.twi3.appdm
   SeleniumLibrary.Open Browser     https://twi-services.com/twi-cloud-portal-r2/#/login       chrome
   SeleniumLibrary.Wait Until Element Is Visible    name=email
   SeleniumLibrary.Input Text    name=email    text=admin@thirdwayv.com
   SeleniumLibrary.Input Text    name=password    text=Admin!123
   SeleniumLibrary.Click Button  id=loginButton
   SeleniumLibrary.Wait Until Element Is Visible    id=mat-input-0
   #SeleniumLibrary.Click Element    id=mat-input-0
   SeleniumLibrary.Input Text    id=mat-input-0    text=a36ae445bfd34a52ffa2e414
   #SeleniumLibrary.Click Element    id=mat-input-0
   Sleep    1s
   SeleniumLibrary.Press Keys    id=mat-input-0    RETURN
   SeleniumLibrary.Press Keys    id=mat-input-0    RETURN
   Sleep    2s
   SeleniumLibrary.Click Button    edit
   Sleep    2s
   SeleniumLibrary.Input Text    id=mat-input-3    text=com.twi3.appdm
   Sleep    1s
   SeleniumLibrary.Click Button      Edit
   Sleep    1
   Close Browser

Set HIGH
    [Arguments]     ${Port Number}     ${portNum}    ${pinNum}
    ${portNum} =    Evaluate    ${portNum}+30
    ${pinNum} =    Evaluate    ${pinNum}+30
    TWI_Write_Byte      Data=54 53 00 16 54 57 10 20 01 00 00 C0 00 00 00 00 FF FF FF FD 53 ${portNum} 2E ${pinNum} 3D 30   Port Number=${Port Number}
Set LOW
    [Arguments]     ${Port Number}     ${portNum}    ${pinNum}
    ${portNum} =    Evaluate    ${portNum}+30
    ${pinNum} =    Evaluate    ${pinNum}+30
    TWI_Write_Byte      Data=54 53 00 16 54 57 10 20 01 00 00 C0 00 00 00 00 FF FF FF FD 53 ${portNum} 2E ${pinNum} 3D 31   Port Number=${Port Number}
Set Floating
    [Arguments]     ${Port Number}     ${portNum}    ${pinNum}
    ${portNum} =    Evaluate    ${portNum}+30
    ${pinNum} =    Evaluate    ${pinNum}+30
    TWI_Write_Byte      Data=54 53 00 16 54 57 10 20 01 00 00 C0 00 00 00 00 FF FF FF FD 53 ${portNum} 2E ${pinNum} 3D 32   Port Number=${Port Number}





initializing Serial
    ${message}=  Evaluate  ${BLUE} "\\n-> Initializing Serial communication"
    Log To Console   ${message}
    TWI_Open_Port   Port Number=${Port Number}   Buad Rate=${Buad Rate}    Encoding=hexlify   timeout=${Time out}
    sleep   2

close Serial
    ${message}=  Evaluate  ${BLUE} "\\n-> close Serial"
    Log To Console   ${message}
    TWI_Close_Port   Port Number=${Port Number}   Buad Rate=${Buad Rate}    Encoding=hexlify   timeout=${Time out}
    sleep   2
Restart board
    ${message}=  Evaluate  ${BLUE} "\\n-> Restart board"
    Log To Console   ${message}
    Set LOW      Port Number=${Port Number}    portNum=0   pinNum=3
    sleep   5
    Set HIGH      Port Number=${Port Number}    portNum=0   pinNum=3
    sleep   8
Power off board
    ${message}=  Evaluate  ${BLUE} "\\n-> Power off board"
    Log To Console   ${message}
    Set LOW      Port Number=${Port Number}    portNum=0   pinNum=3
    sleep   5
Power on board
    ${message}=  Evaluate  ${BLUE} "\\n-> Power on board"
    Log To Console   ${message}
    Set HIGH      Port Number=${Port Number}    portNum=0   pinNum=3
    sleep   8
Power click
    ${message}=  Evaluate  ${BLUE} "\\n-> Power click"
    Log To Console   ${message}
    Set HIGH      Port Number=${Port Number}    portNum=0   pinNum=0
    sleep   2
    Set LOW      Port Number=${Port Number}    portNum=0   pinNum=0
#    change from 8 to 4
    sleep   4
Clear caches
    ${message}=  Evaluate  ${BLUE} "\\n-> Clear caches"
    Log To Console   ${message}
    Set HIGH      Port Number=${Port Number}    portNum=0   pinNum=2
    sleep   10
    Set LOW      Port Number=${Port Number}    portNum=0   pinNum=2
    sleep   5
Power reset
    ${message}=  Evaluate  ${BLUE} "\\n-> Power reset"
    Log To Console   ${message}
    Set HIGH      Port Number=${Port Number}    portNum=0   pinNum=0
    sleep   5
    Set LOW      Port Number=${Port Number}    portNum=0   pinNum=0
    sleep   8

clear everything on the device after deactivation
   ${message}=  Evaluate  ${BLUE} "\\n-> clear everything on the device after deactivation"
   Log To Console   ${message}
   Power click
   Clear caches
   Power reset

initializing everything before start
   initializing Serial
#   Restart board
   Power on board
   Power click
   Clear caches
   Power reset