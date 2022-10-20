*** Settings ***
Resource   Resources/TWI_Serial_library.robot
Resource    Resources/TestData.robot
Test Setup
Test Teardown



*** Test Cases ***
Test initializing
    ${message}=  Evaluate  ${BLUE} "\\n-> Initializing Serial communication"
    Log To Console   ${message}
    TWI_Open_Port   Port Number=${Port Number}   Buad Rate=${Buad Rate}    Encoding=hexlify   timeout=${Time out}
    sleep   2
Red led should be turned on at first button press
    TWI_Write_Byte      Data=54 53 00 16 54 57 11 20 01 00 00 C0 00 00 00 00 FF FF FF FD 53 30 2E 34 3D 30    Port Number=${Port Number}
    sleep   50ms
    TWI_Write_Byte      Data=54 53 00 16 54 57 11 20 02 00 00 C0 00 00 00 00 FF FF FF FD 53 30 2E 34 3D 31    Port Number=${Port Number}
    ${message}=  Evaluate  ${BLUE} "\\n-> FIRST BUTTON PRESS"
    Log To Console  ${message}
    sleep   2
    TWI_Write_Byte      Data=54 53 00 14 54 57 11 20 03 00 00 80 00 00 00 00 FF FF FF FD 47 30 2E 30    Port Number=${Port Number}
    Evaluate  ${WHITE}
    ${message}=  Evaluate  ${BLUE} "\\n-> GET RED LED STATUS"
    Log To Console  ${message}
    sleep   2
    Read Until    terminator=3D
    ${RecievedByte} =   TWI_read_Bytes    Port Number=${Port Number}    size=1
    ${message}=  Evaluate  ${BLUE} "\\n-> RECIEVING RESPONSE MESSAGE FROM THE BOARD"
    Log To Console  ${message}
    TWI_Write_Byte      Data=54 53 00 10 54 57 10 A0 04 04 00 00 00 00 00 00 FF FF FF FD  Port Number=${Port Number}
    ${message}=  Evaluate  ${BLUE} "\\n-> SENDING ACK MESSAGE TO THE BOARD"
    Log To Console  ${message}
    Should Be Equal As Strings    ${RecievedByte}    36
    sleep   2
Green LED should be turned on at second button press
    TWI_Write_Byte      Data=54 53 00 16 54 57 11 20 05 00 00 C0 00 00 00 00 FF FF FF FD 53 30 2E 34 3D 30    Port Number=${Port Number}
    sleep   50ms
    TWI_Write_Byte      Data=54 53 00 16 54 57 11 20 06 00 00 C0 00 00 00 00 FF FF FF FD 53 30 2E 34 3D 31    Port Number=${Port Number}
    ${message}=  Evaluate  ${BLUE} "\\n-> SECOND BUTTON PRESS"
    Log To Console  ${message}
    sleep   2
    TWI_Write_Byte      Data=54 53 00 14 54 57 11 20 07 00 00 80 00 00 00 00 FF FF FF FD 47 30 2E 35    Port Number=${Port Number}
    Evaluate  ${WHITE}
    ${message}=  Evaluate  ${BLUE} "\\n-> GET GREEN LED STATUS"
    Log To Console  ${message}
    sleep   2
    Read Until    terminator=3D
    ${RecievedByte} =   TWI_read_Bytes    Port Number=${Port Number}    size=1
    ${message}=  Evaluate  ${BLUE} "\\n-> RECIEVING RESPONSE MESSAGE FROM THE BOARD"
    Log To Console  ${message}
    TWI_Write_Byte      Data=54 53 00 10 54 57 10 A0 08 07 00 00 00 00 00 00 FF FF FF FD  Port Number=${Port Number}
    ${message}=  Evaluate  ${BLUE} "\\n-> SENDING ACK MESSAGE TO THE BOARD"
    Log To Console  ${message}
    Should Be Equal As Strings    ${RecievedByte}    36
    sleep   2
Blue LED should turn on at third button press
    TWI_Write_Byte      Data=54 53 00 16 54 57 11 20 09 00 00 C0 00 00 00 00 FF FF FF FD 53 30 2E 34 3D 30    Port Number=${Port Number}
    sleep   50ms
    TWI_Write_Byte      Data=54 53 00 16 54 57 11 20 0A 00 00 C0 00 00 00 00 FF FF FF FD 53 30 2E 34 3D 31    Port Number=${Port Number}
    ${message}=  Evaluate  ${BLUE} "\\n-> THIRD BUTTON PRESS"
    Log To Console  ${message}
    sleep   2
    TWI_Write_Byte      Data=54 53 00 14 54 57 11 20 0B 00 00 80 00 00 00 00 FF FF FF FD 47 30 2E 36    Port Number=${Port Number}
    Evaluate  ${WHITE}
    ${message}=  Evaluate  ${BLUE} "\\n-> GET BLUE LED STATUS"
    Log To Console  ${message}
    sleep   2
    Read Until    terminator=3D
    ${RecievedByte} =   TWI_read_Bytes    Port Number=${Port Number}    size=1
    ${message}=  Evaluate  ${BLUE} "\\n-> RECIEVING RESPONSE MESSAGE FROM THE BOARD"
    Log To Console  ${message}
    TWI_Write_Byte      Data=54 53 00 10 54 57 10 A0 0C 0A 00 00 00 00 00 00 FF FF FF FD  Port Number=${Port Number}
    ${message}=  Evaluate  ${BLUE} "\\n-> SENDING ACK MESSAGE TO THE BOARD"
    Log To Console  ${message}
    Should Be Equal As Strings    ${RecievedByte}    36
    sleep   2
Test deinitializing
    ${message}=  Evaluate  ${BLUE} "\\n-> Closing Serial COM Port"
    Log To Console   ${message}
    sleep   2
