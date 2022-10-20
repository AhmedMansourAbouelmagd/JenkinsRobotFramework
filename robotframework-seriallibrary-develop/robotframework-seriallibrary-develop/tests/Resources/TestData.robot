*** Settings ***




*** Variables ***
${DIR}
${Port Number}     COM5
${Buad Rate}       115200
${Encoding}        hexlify
${Time out}        5
${ExpectedList}        15021005
${ExpectedValue}       49

#List of variables every colour own his color value to be Evaluate to the console
${WHITE}       "\\033[7m"
${GREY}        "\\033[5m"
${UNDERSCORE}  "\\033[4m"
${RED}         "\\033[31m"
${REDBK}       "\\033[41m"
${BLUE}        "\\033[34m"
${GREEN}       "\\033[32m"
${YELLOW}      "\\033[33m"
${PINK}        "\\033[35m"

