*** Settings ***
Library     SeleniumLibrary
Library     OperatingSystem
Resource    ../Common.robot

*** Variables ***
${username_locator}=    id= username
${password_locator}=    id= password

${messages_locator}=    id= flash
${logout_locator}=     xpath= //div[@id="content"]/div/a/i
*** Keywords ***

Authenticating
    [Documentation]     Enter given credentials, submit and validate the result of submit. If correct authenticaction, logging out and validate logged out
    [Arguments]     ${authentication}
    Wait Until Page Contains Element    ${username_locator}
    Wait Until Page Contains Element    ${password_locator}
    Input Text    ${username_locator}    ${authentication.User}
    Input Password    ${password_locator}    ${authentication.Pass}
    Submit Form
    Validation Of Login State    ${authentication.ExpectedMessage}
    Run Keyword If  "${authentication.ExpectedMessage}" == "You logged into a secure area!"  Log out

Log Out
    [Documentation]     Logs out from page by clicking logout button
    Wait Until Page Contains Element    ${logout_locator}
    Click With Javascript   ${logout_locator}
    Validation Of Login State   You logged out of the secure area!

Validation Of Login State
    [Documentation]     Validates the result of submitted credentials. It checks for the expected message.
    [Arguments]     ${message}
    Wait Until Page Contains Element    ${messages_locator}
    ${pass}     Element Should Contain    ${messages_locator}    ${message}
    IF    "${pass}" == "PASS"
        Pass Execution    Pass
    END
         

