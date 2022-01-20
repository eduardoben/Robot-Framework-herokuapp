*** Settings ***
Resource  ../Data/InputData.robot
Resource  ../Resources/Common.robot
Resource  ../Resources/AutomatedApp.robot

Test Setup  Begin Web Test      ${URL}

Test Teardown   End Web Test
*** Variables ***

#robot -d results tests/Automated.robot
*** Test Cases ***



#REQ    -   File Download
File Download
    [Documentation]     Click a link to trigger a download and later validates it.
    [Setup]     Begin Web Test  ${FILE_URL}
    AutomatedApp.File Download

