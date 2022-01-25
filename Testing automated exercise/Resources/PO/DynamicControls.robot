*** Settings ***
Library     SeleniumLibrary
Resource    ../Common.robot

*** Variables ***
${remove_button}=   xpath=  //*[@id="checkbox-example"]/button
${checkbox}=    xpath=  //body/div[2]/div[1]/div[1]/form[1]/div[1]/input[1]
${enable_button}=   xpath=  //*[@id="input-example"]/button
${text_input}=      xpath=  //body/div[2]/div[1]/div[1]/form[2]/input[1]

*** Keywords ***

Removing Checkbox
    [Documentation]     Clicks on remove button and later trigger validation keyword. Always waiting for elements in page.
    Wait Until Page Contains Element    ${remove_button}
    Click With Javascript    ${remove_button}
    Wait Until Page Contains Element    ${checkbox}
    Validating actions  ${checkbox}

Enabling Input
    [Documentation]     Clicks on enable button and later trigger validation keyword. Always waiting for elements in page.
    Wait Until Page Contains Element    ${enable_button}
    Click With Javascript   ${enable_button}
    Wait Until Page Contains Element    ${text_input}
    Validating actions  ${text_input}

Validating actions
    [Documentation]     Validates action of Removing Checkbox and Enabling Input keywords . It receives the element to validate as an argument.
    [Arguments]     ${locator}
    ${type}=    Get Element Attribute    ${locator}    type

    IF  "${type}" == "checkbox"
        Wait Until Element Contains    ${remove_button}    Add
        Page Should Not Contain Checkbox    ${locator}
    ELSE
        Wait Until Element Contains    ${enable_button}    Disable
        Element Should Be Enabled    ${locator}
    END
