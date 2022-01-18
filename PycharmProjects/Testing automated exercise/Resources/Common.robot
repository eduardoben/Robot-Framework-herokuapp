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

Click With Javascript
    [Arguments]  ${locator}     ${wait}=.25s
    ${w_element}     Get WebElement       ${locator}
    Execute Javascript    arguments[0].click();     ARGUMENTS   ${w_element}
    Sleep   ${wait}

Wait And Execute Keyword
     [Arguments]         ${keyword}     ${element}       ${timeout}=15 sec
     Wait Until Page Contains Element   ${element}       ${timeout}
     Run Keyword And Return    ${keyword}     ${element}