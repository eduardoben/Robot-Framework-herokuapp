*** Settings ***
Library     SeleniumLibrary
Library     CustomLibrary.py
*** Variables ***
${SQUARE_A}=    xpath=  /html/body/div[2]/div/div/div/div[1]
${SQUARE_B}=    xpath=  /html/body/div[2]/div/div/div/div[2]
*** Keywords ***
Dragging And Dropping Element
    [Documentation]     It drags and drop a element to a desire position and validates that content of the element is  which means that there is another element in the inital position.
    Wait Until Element Is Visible    ${SQUARE_A}
    Wait Until Element Is Visible    ${SQUARE_B}
    ${session}=     Get Library Instance    SeleniumLibrary
    ${source}=  Get WebElement    ${SQUARE_A}
    ${end}=     Get WebElement    ${SQUARE_B}
    dragging and dropping    ${session.driver}     ${source}       ${end}
    Element Should Not Contain    xpath= /html/body/div[2]/div/div/div/div[1]/header    A
    dragging and dropping    ${session.driver}     ${end}       ${source}
    Element Should Not Contain    xpath= /html/body/div[2]/div/div/div/div[2]/header    A



#It uses a JavaScript function to create a custom keyboard on python. Driver is passed to execute JS.
