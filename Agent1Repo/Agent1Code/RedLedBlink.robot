*** Settings ***
Resource    D:/Repos/Automated-Testing/TWI_RHP_Comm/Resources/TWI_RHP_Comm.robot
Suite Setup    TWI_Open_Port    Port Number=COM5    Encoding=hexlify    Buad Rate=115200    timeout=5
Suite Teardown    TWI_Close_Port    Port Number=COM5
*** Test Cases ***
Test Case 1
    Set HIGH   Port Number=COM5    featNum=1    attrNum=6
    sleep   1
    Set LOW   Port Number=COM5    featNum=1    attrNum=6
    sleep   1
    Set HIGH   Port Number=COM5    featNum=1    attrNum=6
    sleep   1
    Set LOW   Port Number=COM5    featNum=1    attrNum=6
    sleep   1
