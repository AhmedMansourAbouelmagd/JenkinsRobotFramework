*** Comments ***
This Test suite is testing TWI Serial Library with including serial library and robot fram wrok layer
Target is Nordic PC10040
Communication layer is USART
Target is fashed with USART Example (Nordic board USART Example)
Path for the flashed binary ->"C:\platform_sdk\nordic_sdk\nordic_sdk_12_2_0\nordic_sdk\examples\peripheral\uart\pca10040\blank\arm5_no_packs\_build"
*** Settings ***
#
Resource   Resources/TWI_Serial_library.robot
Resource    Resources/TestData.robot
Suite Setup
Suite Teardown
Test Setup
Test Teardown

*** Test Cases ***
TEST_No_Port_Opened
    #Get Library Instance Returns the currently active instance of the specified library.
    [Setup]
    ${ins} =    Get Library Instance    SerialLibrary
    #Should Be Equal keyword Fails if the given objects are unequal
    Should Be Equal    ${ins._current_port_locator}   ${NONE}
    [Teardown]


Test_Open_Port_Sucssesfully
    [Tags]  Functional      smoke
#Test case for verify that TWI_Open_Port opens right passed port number
    ${PortConfigurations}=   TWI_Open_Port       Port Number=${Port Number}
    #now variable "PortConfigurations" holds all port configeruations for the opened port
    #un comment next line to log all port handle to the console
    #Log To Console    value=${value}
    #make sure opened port is the passed port(COM1)
    ${ins} =    Get Library Instance    SerialLibrary
    ${locator} =   Get Current Port Locator
    #check if passed port is the opened port
    Should Be Equal    ${ins._current_port_locator}    ${Port Number}
    #closes the opened port to make test cases not dependency on each other
    [Teardown]  TWI_Close_Port    Port Number=${Port Number}


Test_Set_BuadRate_Sucssesfully
    [Tags]  Functional
#make sure that buad rate is set by passed buadrate(115200 for Testing on nordicpc10040 target)
    TWI_Open_Port       Port Number=${Port Number}   Buad Rate=${Buad Rate}
    ${baudrate} =   Get Port Parameter    baudrate     port_locator=${Port Number}
    Should Be Equal As Strings    ${baudrate}    ${Buad Rate}
    TWI_Close_Port    Port Number=${Port Number}



Test_Set_Encoding_Type_Sucssesfully
    [Tags]  Functional
    TWI_Open_Port       Port Number=${Port Number}   Buad Rate=${Buad Rate}    Encoding=${Encoding}   timeout=10
    ${encoding}=   Get Encoding
    Should Be Equal As Strings    ${encoding}    ${Encoding}
    TWI_Close_Port    Port Number=${Port Number}

Test_Set_Timeout_Sucssesfully
    [Tags]  Functional
    TWI_Open_Port       Port Number=${Port Number}   Buad Rate=${Buad Rate}    Encoding=${Encoding}   timeout=${Time out}
    ${timeout} =   Get Port Parameter    timeout
    Should Be Equal As Numbers    ${timeout}    ${Time out}
    TWI_Close_Port    Port Number=${Port Number}




Nordic_Board_Is_Waked_Up
    #    This test case is testing connection for the COM board is on the right COM
    [Tags]      Power on
    TWI_Open_Port       Port Number=${Port Number}   Buad Rate=${Buad Rate}    Encoding=${Encoding}   timeout=${Time out}
    ${message}=  Evaluate  ${BLUE} "\\nPlease Press on Reset Button you have 10 seconds"
    Log To Console  ${message}

    #Nordic PC10040 sends "Start:" in USART bus when board is waking up

    ${Actual} =    TWI_read_Bytes    terminator=:   Port Number=${Port Number}     Encoding=ascii    size=10  terminator_encoding=ascii
    Should Be Equal As Strings    first=${Actual}    second=Start:      strip_spaces=True

    TWI_Close_Port    ${Port Number}

Test_Send&Recieve_One_Byte
    [Tags]      Send

   ${PortConfigurations}=   TWI_Open_Port       Port Number=${Port Number}   Buad Rate=${Buad Rate}    Encoding=${Encoding}
   TWI_Write_Byte    Data=${ExpectedValue}    Port Number=${Port Number}   Encoding=${Encoding}
   ${Actual}=   TWI_read_Bytes    ${Port Number}     size=1
   Should Be Equal As Numbers        ${Actual}      ${ExpectedValue}
   TWI_Close_Port    ${Port Number}

Test_Send&Recieve_Stream_of_Bytes
   [Tags]      Send/Recieve
   #${data}   Set Variable   31
   #Set Variable  @{ROBOTS}      31    35    37    40

   #list containing 4 vairables each variable is one byte and values are -> 15(in hexa)  2(in decimal)  10(in binary)  5(in decimal)
   @{SendList}=   Create List        ${0x0F}    2   ${0B1010}   5
   TWI_Open_Port       Port Number=${Port Number}   Buad Rate=${Buad Rate}    Encoding=${Encoding}
   #sending list of variables to TWI_Write_Bytes to send them on serial byte per byte
   TWI_Write_Bytes  @{SendList}   Port Number=${Port Number}   Encoding=${Encoding}  Number of Bytes=4
   #read from serial buffer what i have sent(list of 4 variables)
   ${Actual} =    TWI_read_Bytes   Port Number=${Port Number}     Encoding=${Encoding}    size=4
   #check if readed values is identical to what i have sent
   #this test case will pass only if NORDIC USART example is flashed on the target board
   #USART example is
   Should Be Equal As Numbers    ${Actual}    ${ExpectedList}
   #Lists Should Be Equal    ${readhexa2}    @{list}
   #@{FirstList}=  Convert To List    ${Actual}
   TWI_Close_Port    ${Port Number}
   Log To Console    Dir=${DIR}