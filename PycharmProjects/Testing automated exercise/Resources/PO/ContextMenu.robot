*** Settings ***
Library     SeleniumLibrary
*** Variables ***
${BOX}=     xpath=/html/body/div[2]/div/div/div

*** Keywords ***
Validating Context Menu
    [Documentation]     It triggers a alert, verify content and close it. At last, it validates that alert is not longer there.
    Open Context Menu   ${BOX}
    Sleep   3
    Alert Should Be Present     You selected a context menu
    Alert Should Not Be Present