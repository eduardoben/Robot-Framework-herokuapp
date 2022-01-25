*** Settings ***
Library     SeleniumLibrary
Resource    ../Common.robot

*** Variables ***
${link_locator}=    xpath=//a[contains(text(),'Click Here')]
${text}=    xpath=//h3[contains(text(),'New Window')]
*** Keywords ***
Deploying New Window
    [Documentation]     Click on link to open a new window. Once opened it switches windows and verify the change by checking the content of new window
    Wait Until Page Contains Element    ${link_locator}
    Click With Javascript   ${link_locator}
    Sleep   1 sec
    Switch Window   title:New Window
    Wait Until Page Contains Element    ${text}
    Page Should Contain Element    ${text}
    