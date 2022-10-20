#Resource URL ->https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#test-setup-and-teardown


*** Settings ***
Suite Setup         #Suite Setup will run once before all the suite(all test cases in the suite)
Suite Teardown      #Suite Teardown will run once after all the suite(all test cases in the suite)
Test Setup          #Test Setup will run before every test case in this suite
Test Teardown       #Test Teardown will run after every test case in this suite

*** Test Cases ***
Default values
    [Documentation]    Setup and teardown from setting table
    #Do Something

Overridden setup
    [Documentation]    Own setup, teardown from setting table
    [Setup]    #Open Application    App B
    #Do Something

No teardown
    [Documentation]    Default setup, no teardown at all
    #Do Something
    [Teardown]

No teardown 2
    [Documentation]    Setup and teardown can be disabled also with special value NONE
    #Do Something
    [Teardown]    NONE

Using variables
    [Documentation]    Setup and teardown specified using variables
    [Setup]    ${SETUP}
    #Do Something
    [Teardown]    ${TEARDOWN}


*** Variables ***
#local variable named SETUP
${SETUP}
${TEARDOWN}