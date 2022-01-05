*** Settings ***
Library     SeleniumLibrary
Library    Collections


*** Variables ***
${ALERT_BUTTON_LOCATOR}=    xpath=  /html/body/div[2]/div/div/ul/li[1]/button
${PROMPT_BUTTON_LOCATOR}=   xpath=  /html/body/div[2]/div/div/ul/li[3]/button
${RESULT_LOCATOR}=  id= result

*** Keywords ***
Managing Alerts
    [Documentation]     Triggers alerts and manage them. It calls validation alerts keyword to check action.
    Click Button    ${ALERT_BUTTON_LOCATOR}
    Handle Alert
    Validation Alerts

    Click Button    ${PROMPT_BUTTON_LOCATOR}
    Input Text Into Alert    testing
    Validation Alerts


Validation Alerts
    [Documentation]     Validates confirmation message from website.
    ${confirmation}=    Get Text    ${RESULT_LOCATOR}
    List Should Contain Value       ${ALERT_MESSAGES}    ${confirmation}
