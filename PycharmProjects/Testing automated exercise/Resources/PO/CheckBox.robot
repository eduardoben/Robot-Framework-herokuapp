*** Settings ***
Library     SeleniumLibrary
*** Variables ***
${CHECKBOX1}=   xpath=/html/body/div[2]/div/div/form/input[1]
${CHECKBOX2}=   xpath=/html/body/div[2]/div/div/form/input[2]
*** Keywords ***

Selecting a checkbox
    [Documentation]     It unselects checkbox then select it and later checks if it is selected
    [Arguments]     ${Checkbox}
        Unselect Checkbox      ${Checkbox}
        #Sleep   5
        #Uncomment to visualize changes
        Select Checkbox    ${Checkbox}
        Checkbox Should Be Selected     ${Checkbox}


