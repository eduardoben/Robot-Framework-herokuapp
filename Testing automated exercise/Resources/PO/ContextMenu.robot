*** Settings ***
Resource    ../Common.robot
Library     SeleniumLibrary
Library     CustomLibrary.py
Resource    ../../Data/InputData.robot

*** Variables ***
${box}=     xpath= //div[@id="hot-spot"]

*** Keywords ***
Validating Context Menu
    # TODO  Check why the element is not properly detected by IE. Context menu is opening outside the element
    [Documentation]     It triggers a alert, verify content and close it. At last, it validates that alert is not longer there.
    IF    "${BROWSER}" == "ie"
         Fail   When context menu is triggered. Test freezes until there is a real interaction from user.
    END
    Wait Until Page Contains Element    ${box}

    Open Context Menu    ${box}

    Alert Should Be Present     You selected a context menu
    Alert Should Not Be Present


