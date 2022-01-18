*** Settings ***
Resource    ../Common.robot
Library     SeleniumLibrary
*** Variables ***
${BOX}=     xpath=  //div[@id="hot-spot"]

*** Keywords ***
Validating Context Menu
    # TODO  Check why the element is not properly detected by IE. Context menu is opening outside the element
    [Documentation]     It triggers a alert, verify content and close it. At last, it validates that alert is not longer there.
    Wait Until Page Contains Element    ${BOX}
    Open Context Menu    ${BOX}
    Alert Should Be Present     You selected a context menu
    Alert Should Not Be Present