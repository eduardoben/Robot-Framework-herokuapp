*** Settings ***
Resource  ../Data/InputData.robot
Resource  ../Resources/Common.robot
Resource  ../Resources/AutomatedApp.robot

Test Setup  Begin Web Test      ${URL}

#Test Teardown   End Web Test
*** Variables ***

#robot -d results tests/Automated.robot
*** Test Cases ***
#REQ    -   Multiple Windows
Multiple Windows
    [Documentation]     This test case verifies that user can click on link to open a new window.
    [Setup]     Begin Web Test  ${WINDOWS_URL}
    AutomatedApp.Multiple Windows
