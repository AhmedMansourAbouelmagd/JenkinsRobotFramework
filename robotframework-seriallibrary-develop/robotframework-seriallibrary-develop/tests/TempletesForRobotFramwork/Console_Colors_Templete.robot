#Resource URL  ->https://groups.google.com/g/robotframework-users/c/YyeEWai8m44/m/kEqM2DjgBwAJ?utm_medium=email&utm_source=footer



*** Variables ***
${WHITE}       "\\033[7m"
${GREY}        "\\033[5m"
${UNDERSCORE}  "\\033[4m"
${RED}         "\\033[31m"
${REDBK}       "\\033[41m"
${BLUE}        "\\033[34m"
${GREEN}       "\\033[32m"
${YELLOW}      "\\033[33m"
${PINK}        "\\033[35m"

*** Test Cases ***
Text color tests
    ${message}=  Evaluate  ${WHITE} "\\nThis is WHITE bagkground Text\\033[0m\\n"
    Log To Console  ${message}
    ${message}=  Evaluate  ${GREY} "\\nThis is GREY bagkground Text\\033[0m\\n"
    Log To Console  ${message}
    ${message}=  Evaluate  ${REDBK} "\\nThis is RED bagkground Text\\033[0m\\n"
    Log To Console  ${message}
    ${message}=  Evaluate  ${UNDERSCORE} "\\nThis is UNDERSCORE bagkground Text\\033[0m\\n"
    Log To Console  ${message}
    ${message}=  Evaluate  ${RED} "\\nThis is RED Text\\033[0m\\n"
    Log To Console  ${message}
    ${message}=  Evaluate  ${BLUE} "\\nThis is BLUE Text\\033[0m\\n"
    Log To Console  ${message}
    ${message}=  Evaluate  ${GREEN} "\\nThis is GREEN Text\\033[0m\\n"
    Log To Console  ${message}
    ${message}=  Evaluate  ${YELLOW} "\\nThis is YELLOW Text\\033[0m\\n"
    Log To Console  ${message}
    ${message}=  Evaluate  ${PINK} "\\nThis is PINK Text\\033[0m\\n"
    Log To Console  ${message}

