*** Settings ***
Library     SeleniumLibrary
Library    Collections
Resource    ../Common.robot

*** Variables ***
${textbox_locator}=     id= target
${results_locator}=     id= result
*** Keywords ***
Entering Keys
    [Documentation]     Simulates keyboard entries and calls Validation Of Pressed Key keybword
    Wait Until Page Contains Element    ${textbox_locator}
    Click With Javascript  ${textbox_locator}
    Press Keys  ${textbox_locator}  \ue00c
    Validation Of Pressed Key
    Click With Javascript    ${textbox_locator}
    Input Text    ${textbox_locator}  \ue003
    Validation Of Pressed Key

Validation Of Pressed Key
    [Documentation]     Validates confirmation message from website.
    Wait Until Page Contains Element    ${results_locator}
    ${result}=  Get Text    ${results_locator}
    List Should Contain Value   ${KEY_MESSAGES}     ${result}
