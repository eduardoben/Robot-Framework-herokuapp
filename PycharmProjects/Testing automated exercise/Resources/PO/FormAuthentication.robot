*** Settings ***
Library     SeleniumLibrary
Library     OperatingSystem

*** Variables ***
${USERNAME_LOCATOR}=    id= username
${PASSWORD_LOCATOR}=    id= password
${SUBMIT_LOCATOR}=  xpath=  /html/body/div[2]/div/div/form/button
${MESSAGES_LOCATOR}=    id= flash
${LOGOUT_LOCATOR}=     xpath=   /html/body/div[2]/div/div/a
*** Keywords ***

Authenticating
    [Documentation]     Enter given credentials, submit and validate the result of submit. If correct authenticaction, logging out and validate logged out
    [Arguments]     ${authentication}
    Input Text    ${USERNAME_LOCATOR}    ${authentication.User}
    Input Password    ${PASSWORD_LOCATOR}    ${authentication.Pass}
    Submit Form
    Validation Of Login State    ${authentication.ExpectedMessage}
    Run Keyword If  "${authentication.ExpectedMessage}" == "You logged into a secure area!"  Log out

Log Out
    [Documentation]     Logs out from page by clicking logout button
    Click Element   ${LOGOUT_LOCATOR}
    Validation Of Login State   You logged out of the secure area!

Validation Of Login State
    [Documentation]     Validates the result of submitted credentials. It checks for the expected message.
    [Arguments]     ${message}
    Element Should Contain    ${MESSAGES_LOCATOR}    ${message}
