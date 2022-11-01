*** Settings ***
Library  AppiumLibrary
Library  BuiltIn
Variables   Devices.py
Library    WebSocketClient
Resource    ../resources/TestData.robot


*** Variables ***
${ANDROID_AUTOMATION_NAME}    UIAutomator2
${ANDROID_APP}                ${CURDIR}/../demoapp/ApiDemos-debug.apk
${ANDROID_PLATFORM_NAME}      Android
${ANDROID_DEVICE_NAME}        ${android_DN}
${ANDROID_APP_PACKAGE}        io.appium.android.apis
${androidudid}                ${android_DN}
# ${ANDROID_PLATFORM_VERSION}   %{ANDROID_PLATFORM_VERSION=12}

${IOS_AUTOMATION_NAME}        XCUITest
${IOS_APP}                    ${CURDIR}/../demoapp/TestApp.app.zip
${IOS_PLATFORM_NAME}          iOS
${IOS_DEVICE_NAME}            IPHONE 11
${IOS_PLATFORM_VERSION}       %{IOS_PLATFORM_VERSION=14.0.1}
${udid}                       %{udid=7E98C906-56C7-4C4A-9BA3-7EAD7CD58C47}

*** Keywords ***
Open Android Test App
  [Arguments]    ${appActivity}=${EMPTY}
  open application  http://127.0.0.1:4723/wd/hub  
  ...  automationName=${ANDROID_AUTOMATION_NAME}
  ...  app=${ANDROID_APP}  
  ...  platformName=${ANDROID_PLATFORM_NAME}  
  # ...  platformVersion=${ANDROID_PLATFORM_VERSION}
  ...  appPackage=${ANDROID_APP_PACKAGE}  
  ...  appActivity=${appActivity}  
  ...  deviceName=${ANDROID_DEVICE_NAME}
  ...  udid=${androidudid}


Open iOS Test App
  open application  http://127.0.0.1:4723/wd/hub  
  ...  automationName=${IOS_AUTOMATION_NAME}
  ...  app=${IOS_APP}  
  ...  platformName=${IOS_PLATFORM_NAME}  
  ...  deviceName=${IOS_DEVICE_NAME}
  ...  udid=${udid}



get ios logs
    [Arguments]     ${messege}
         ${sessionId}     get appium sessionId
     #this will tell appium to start WebSocket Server

    Execute Script   mobile:startLogsBroadcast
    #Sleep    150s

    ${my_websocket}=  WebSocketClient.Connect  ws://localhost:4723/ws/session/${sessionId}/appium/device/syslog
   # WebSocketClient.Send  ${my_websocket}  Hello
   WebSocketClient.settimeout    ${my_websocket}    ${10}

   FOR     ${index}     IN RANGE    100
    ${result} =  WebSocketClient.recv    ${my_websocket}
#    Log To Console    ${result}
    ${contains}=    Run Keyword And Return Status    Should Contain    ${result}    ${messege}

    IF     ${contains}
    ${success}=    Evaluate  ${BLUE} "\\nOK OK OK"
#    Log To Console     ${success}
#    ELSE
#    ${fail}=    Evaluate  ${GREEN} "\\nthis is not ok"
#    Log To Console  ${fail}
    #should contain    ${result}    TWIs-iPhone
   # Log To Console    nil is here
    #Log To Console    ${result}
    #sleep    20s
   # ${result1}=  WebSocketClient.Recv  ${my_websocket}

    END
    END

    #Should Be Equal  Hello  ${result}
    WebSocketClient.Close  ${my_websocket}