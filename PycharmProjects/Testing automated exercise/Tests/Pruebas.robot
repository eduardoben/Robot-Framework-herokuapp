*** Settings ***
Resource  ../Data/InputData.robot
Resource  ../Resources/Common.robot
Resource  ../Resources/AutomatedApp.robot

Test Setup  Begin Web Test      ${URL}

Test Teardown   End Web Test
*** Variables ***

#robot -d results tests/Automated.robot
*** Test Cases ***


Mouse Slider Manipulation
    [Documentation]     Selects slider and simulates mouse dragging slider value. It validates final value.
    [Setup]     Begin Web Test  ${SLIDER_URL}
    AutomatedApp.Mouse Slider Manipulation

