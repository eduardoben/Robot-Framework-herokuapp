*** Settings ***
Resource    ../Common.robot
Library     SeleniumLibrary
*** Variables ***
${CHECKBOX1}=   xpath=  //form[@id="checkboxes"]/input[1]
${CHECKBOX2}=   xpath=  //form[@id="checkboxes"]/input[2]
*** Keywords ***

Selecting a checkbox
    [Documentation]     It unselects checkbox then select it and later checks if it is selected
    [Arguments]     ${Checkbox}
    Wait Until Page Contains Element    ${Checkbox}
    ${web}  Get WebElement    ${Checkbox}
    ${selected}=   Execute Javascript  return arguments[0].checked;     ARGUMENTS   ${web}

    IF    "${selected}" == "True"
        Click With Javascript     ${Checkbox}
        Click With Javascript     ${Checkbox}
    ELSE
        Click With Javascript     ${Checkbox}
    END
    Checkbox Should Be Selected     ${Checkbox}

# TODO Create keyword of selecting checkbox with js







