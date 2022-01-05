*** Settings ***
Library  SeleniumLibrary
Resource  ../Data/InputData.robot
*** Variables ***

*** Keywords ***
Begin Web Test
    [Arguments]     ${URL}
    Open Browser    ${URL}   ${BROWSER}
    Maximize Browser Window
    #sleep   10 s
End Web Test
    Close All Browsers
