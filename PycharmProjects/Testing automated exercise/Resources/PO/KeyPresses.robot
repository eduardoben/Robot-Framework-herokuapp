*** Settings ***
Library     SeleniumLibrary
Library    Collections



*** Variables ***
${TEXTBOX_LOCATOR}=     xpath=  /html/body/div[2]/div/div/form/input
${RESULTS_LOCATOR}=     xpath=  /html/body/div[2]/div/div/p[2]
*** Keywords ***
Entering Keys
    [Documentation]     Simulates keyboard entries and calls Validation Of Pressed Key keybword
    Wait Until Element Is Visible    ${TEXTBOX_LOCATOR}
    Press Keys  ${TEXTBOX_LOCATOR}  \ue00c
    Validation Of Pressed Key
    Press Keys  ${TEXTBOX_LOCATOR}  \ue00d
    Validation Of Pressed Key

Validation Of Pressed Key
    [Documentation]     Validates confirmation message from website.
    ${result}=  Get Text    ${RESULTS_LOCATOR}
    List Should Contain Value   ${KEY_MESSAGES}     ${result}
