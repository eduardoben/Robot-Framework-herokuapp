*** Settings ***
Library     SeleniumLibrary
Resource    ../Common.robot

*** Variables ***
${LINK_LOCATOR}=    xpath=      /html/body/div[2]/div/div/a
${TEXT}=    xpath=  /html/body/div[1]/h3
*** Keywords ***
Deploying New Window
    [Documentation]     Click on link to open a new window. Once opened it switches windows and verify the change by checking the content of new window
    Wait Until Page Contains Element    ${LINK_LOCATOR}
    Click With Javascript   ${LINK_LOCATOR}

    Switch Window   title:New Window
    Wait Until Page Contains Element    ${TEXT}
    Page Should Contain Element    ${TEXT}
    