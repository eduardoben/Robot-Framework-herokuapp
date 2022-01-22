*** Settings ***
Library     SeleniumLibrary
Resource    ../Common.robot
Library     Dialogs

*** Variables ***
${ADD_BUTTON} =     xpath=/html/body/div[2]/div/div/button
${DELETING_BUTTON} =    xpath=/html/body/div[2]/div/div/div/button[1]
${I}=   ${EMPTY}
${ACTUAL_ELEMENTS} =      ${EMPTY}
${EXPECTED_ELEMENTS} =   ${EMPTY}
${J}=   ${EMPTY}
*** Keywords ***
Validating number of elements
    [Documentation]    Validates that actual number of elements and expected number of elements are the same.
    [Arguments]     ${J}

    ${ACTUAL_ELEMENTS}=     get element count    xpath:/html/body/div[2]/div/div/div/button
    ${EXPECTED_ELEMENTS}    SET VARIABLE    ${J}
    #LOG TO CONSOLE  ACTUAL VALUE:${ACTUAL_ELEMENTS}
    #LOG TO CONSOLE  EXPECTED VALUE:${EXPECTED_ELEMENTS}
    IF    "${ACTUAL_ELEMENTS}" != "${EXPECTED_ELEMENTS}"
    #Compare number of element
        RETURN FROM KEYWORD    ${FALSE}
        #This return means that validation fail
    ELSE
        RETURN FROM KEYWORD     ${TRUE}
        #This return means that validation succeed
    END

Adding_Element
    [Documentation]    Adds a certain number of elements and everytime a new element is added, a validation is run. It returns number of total elements
    FOR    ${I}    IN RANGE     20

        ${J}    SET VARIABLE      ${I}
        ${x}=     Validating number of elements     ${J}
        IF    "${x}" == "${TRUE}"
            Click With Javascript    ${ADD_BUTTON}
        ELSE
            EXIT FOR LOOP
        END
    END
    RETURN FROM KEYWORD    ${I+1}

#Loop until 20 elements are added
#Validate each of adding comparing past quantity with desired quantity and if one fails, it breaks the loop and test.
Deleting Element
    [Documentation]    Adds a certain number of elements (and validate each one), then delete elements one by one
    ${o}=   Adding_Element
    FOR     ${i}  IN RANGE    ${o}    0    -1

        ${J}    SET VARIABLE      ${i}
        ${x}=     Validating number of elements     ${J}
        IF    "${x}" == "${TRUE}"
        #Ask if validation was successful
            Click With Javascript    ${DELETING_BUTTON}
            #If successful, then delete an element
        ELSE
            EXIT FOR LOOP
        END
    END


#Loop until 0 cero is reached.
#Validate each of adding comparing past quantity with desired quantity and if one fails, it breaks the loop and test.

