*** Settings ***
Library     SeleniumLibrary
Resource    ../Common.robot

*** Variables ***
${REMOVE_BUTTON}=   xpath=  /html/body/div[2]/div/div[1]/form[1]/button
${CHECKBOX}=    xpath=  /html/body/div[2]/div/div[1]/form[1]/div/input
${ENABLE_BUTTON}=   xpath=  /html/body/div[2]/div/div[1]/form[2]/button
${TEXT_INPUT}=      xpath=  /html/body/div[2]/div/div[1]/form[2]/input

*** Keywords ***

Removing Checkbox
    [Documentation]     Clicks on remove button and later trigger validation keyword. Always waiting for elements in page.
    Wait Until Page Contains Element    ${REMOVE_BUTTON}
    Click With Javascript    ${REMOVE_BUTTON}
    Wait Until Page Contains Element    ${CHECKBOX}
    Validating actions  ${CHECKBOX}

Enabling Input
    [Documentation]     Clicks on enable button and later trigger validation keyword. Always waiting for elements in page.
    Wait Until Page Contains Element    ${ENABLE_BUTTON}
    Click With Javascript   ${ENABLE_BUTTON}
    Wait Until Page Contains Element    ${TEXT_INPUT}
    Validating actions  ${TEXT_INPUT}

Validating actions
    [Documentation]     Validates action of Removing Checkbox and Enabling Input keywords . It receives the element to validate as an argument.
    [Arguments]     ${locator}
    ${type}=    Get Element Attribute    ${locator}    type

    IF  "${type}" == "checkbox"
        Wait Until Element Contains    ${REMOVE_BUTTON}    Add
        Page Should Not Contain Checkbox    ${locator}
    ELSE
        Wait Until Element Contains    ${ENABLE_BUTTON}    Disable
        Element Should Be Enabled    ${locator}

    END
