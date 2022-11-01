*** Settings ***
Library    Collections
Library    SerialLibrary

*** Keywords ***
TWI_Set_Port_Configurations
   [Documentation]      Sets configurations(Port Number,Buad Rate,Encoding) for the port
   ...                defualt values for port_locator and encding is None
   ...                and default value for buad rate is 9600
   ...                returns none
   ...
   #this keyword set configurations for specific port take arguments-> (port number ,buad rate and encoding type
   [Arguments]     ${Port Number}  ${Buad Rate}=${None}     ${Encoding}=${None}
   Set Port Parameter   param_name=baudrate     value=${Buad Rate}   port_locator=${Port Number}
   Set Encoding    encoding=${Encoding}



TWI_Open_Port
     [Documentation]     Sets configurations(Port Number,Buad Rate,Encoding and Timeout)
    ...                  And Opens passed port

    ...
    ...

    ...                returns all Configurations for opened port
    ...

    [Arguments]     ${Port Number}     ${Encoding}=${None}   ${Buad Rate}=${9600}       ${timeout}=${10}


    ${PortConfigurations}=    Add Port    port_locator=${Port Number}   timeout=${timeout}
    Port Should Be Open   ${Port Number}
    Set Port Parameter   param_name=baudrate     value=${Buad Rate}   port_locator=${Port Number}
    Set Encoding    encoding=${Encoding}

    [Return]  ${PortConfigurations}


TWI_Write_Byte
     [Documentation]
    ...         TWI KeyWord ,It writes  ONE Byte on the serial port
    ...         paramaters: Data            -> paramarter will hold the data to be sent
    ...                     Port Number     -> which port will write the data on
    ...                     Encoding        -> Encoding type (ascii,utf-8)
    ...                     Number of Bytes -> number of bytes will be send
    ...         Returns none

    [Arguments]     ${Data}      ${Port Number}        ${Encoding}=${None}
    Write Data    data=${Data}    encoding=${Encoding}   port_locator=${Port Number}


TWI_Write_Bytes
     [Documentation]
    ...         TWI KeyWord ,It writes Number of Bytes on the serial port
    ...         paramaters: Data            -> paramarter will hold the data to be sent
    ...                     Port Number     -> which port will write the data on
    ...                     Number of Bytes -> number of bytes will be send
    ...                     Encoding        -> Encoding type (ascii,utf-8)

    ...         Returns none

    [Arguments]     @{list}      ${Port Number}    ${Number of Bytes}       ${Encoding}=${None}


    FOR    ${counter}    IN RANGE    0    ${Number of Bytes}
        ${listvalue}=    Get From List    list_=@{list}    index=${counter}
        TWI_Write_Byte  Data= ${listvalue}  Port Number=${Port Number}      Encoding=${Encoding}
    END

    #FOR    ${robot}    IN    @{ROBOTS}
    #   TWI_Write_Byte  Data=${robot}    Port Number=${Port Number}      Encoding=${Encoding}
    #   Log To Console    robot=${robot}
    #END


TWI_read_Bytes
     [Documentation]    TWI KeyWord ,It reads Number of Bytes on the serial port untill detect passed terminator or passed size
    ...         paramaters: Port Number     -> which port will write the data on
    ...                     size            -> number of bytes will be recieved
    ...                     Encoding        -> Encoding type (ascii,utf-8)
    ...                     terminator      -> reading is terminated when found in recieved bytes
    ...         returns readed data

    [Arguments]    ${Port Number}   ${size}     ${Encoding}=hexlify     ${terminator}=${None}     ${terminator_encoding}=ascii
    ${Readdata} =    Read Until     terminator=${terminator}    terminator_encoding=${terminator_encoding}      port_locator=${Port Number}     size=${size}  encoding=${Encoding}
    [Return]    ${Readdata}

TWI_Close_Port
    [Documentation]   Deletes (Closes) passed port


    [Arguments]    ${Port Number}

    Delete Port   ${Port Number}


*** Variables ***
#${ReturnValue}