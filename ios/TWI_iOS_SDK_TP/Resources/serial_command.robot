*** Settings ***
Resource        ../resources/Insulte_ios_app_resources.robot



*** Test Cases ***
initializing Serial Port
   [Tags]     NXP
   initializing Serial
   Restart board
   Power on board
   Power click
   Clear caches
   Power reset
