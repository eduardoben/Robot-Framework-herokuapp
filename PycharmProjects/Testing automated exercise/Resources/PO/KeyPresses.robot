*** Settings ***
Library     SeleniumLibrary
Library    Collections
Resource    ../Common.robot

*** Variables ***
${TEXTBOX_LOCATOR}=     xpath=  /html/body/div[2]/div/div/form/input
${RESULTS_LOCATOR}=     xpath=  /html/body/div[2]/div/div/p[2]
*** Keywords ***
Entering Keys
    [Documentation]     Simulates keyboard entries and calls Validation Of Pressed Key keybword
    Wait Until Page Contains Element    ${TEXTBOX_LOCATOR}
    Click With Javascript  ${TEXTBOX_LOCATOR}
    Press Keys  ${TEXTBOX_LOCATOR}  \ue00c
    Validation Of Pressed Key
    Click With Javascript    ${TEXTBOX_LOCATOR}
    Input Text    ${TEXTBOX_LOCATOR}  \ue003
    Validation Of Pressed Key

Validation Of Pressed Key
    [Documentation]     Validates confirmation message from website.
    Wait Until Page Contains Element    ${RESULTS_LOCATOR}
    ${result}=  Get Text    ${RESULTS_LOCATOR}
    List Should Contain Value   ${KEY_MESSAGES}     ${result}
