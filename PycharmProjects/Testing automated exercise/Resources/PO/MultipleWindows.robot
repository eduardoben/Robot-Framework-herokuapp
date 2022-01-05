*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${LINK_LOCATOR}=    xpath=      /html/body/div[2]/div/div/a
${TEXT}=    xpath=  /html/body/div/h3
*** Keywords ***
Deploying New Window
    [Documentation]     Click on link to open a new window. Once opened it switches windows and verify the change by checking the content of new window
    Wait Until Element Is Visible    ${LINK_LOCATOR}
    Click Link    ${LINK_LOCATOR}
    Switch Window   title:New Window
    Element Text Should Be    ${TEXT}    New Window
    