*** Settings ***
Library     SeleniumLibrary
Library     RequestsLibrary
Library     Collections
*** Variables ***
#PATHS TO ELEMENTS
#${SIGN_USER}=   CSS/XPATH TO ELEMENT
#${SIGN_PASS}=   CSS/XPATH TO ELEMENT
#${LOGIN_BUTTON}=    CSS/XPATH TO ELEMENT


*** Keywords ***
Logging
    [Documentation]     It enters the credentials passed as a dictionary given as argument.
    [Arguments]    ${Credentials}
    ${auth}=        create list     ${Credentials.User}    ${Credentials.Pass}
    Create Session      myssion     ${BASE_URL}     auth=${auth}
    ${response}=    GET On Session    myssion   ${LOGIN_URL}    expected_status     ${Credentials.ExpectedStatus}       #Creates the petition and does validation with "expected_status"



