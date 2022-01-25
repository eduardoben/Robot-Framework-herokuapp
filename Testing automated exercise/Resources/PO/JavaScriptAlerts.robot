*** Settings ***
Library     SeleniumLibrary
Library    Collections

Resource    ../Common.robot

*** Variables ***
${alert_button_locator}=    xpath=  //button[contains(text(),'Click for JS Alert')]
${prompt_button_locator}=   xpath=  //button[contains(text(),'Click for JS Prompt')]
${result_locator}=  id= result

*** Keywords ***
Managing Alerts
    [Documentation]     Triggers alerts and manage them. It calls validation alerts keyword to check action.
    Click With Javascript   ${alert_button_locator}
    Handle Alert
    Validation Alerts
    Click With Javascript    ${prompt_button_locator}
    Input Text Into Alert    testing
    Validation Alerts


Validation Alerts
    [Documentation]     Validates confirmation message from website.
    ${confirmation}=    Get Text    ${result_locator}
    List Should Contain Value       ${ALERT_MESSAGES}    ${confirmation}
