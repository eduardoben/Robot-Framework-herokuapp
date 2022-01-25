*** Settings ***
Library     SeleniumLibrary
Resource    ../Common.robot
Library     CustomLibrary.py

*** Variables ***
${square_a}=    id= column-a
${square_b}=    id= column-b
*** Keywords ***
Dragging And Dropping Element
    [Documentation]     It drags and drop a element to a desire position and validates that content of the element is  which means that there is another element in the inital position.
    Wait Until Page Contains Element    ${square_a}
    Wait Until Page Contains Element    ${square_b}
    ${session}=     Get Library Instance    SeleniumLibrary
    ${source}=  Get WebElement    ${square_a}
    ${end}=     Get WebElement    ${square_b}
    dragging and dropping    ${session.driver}     ${source}       ${end}
    sleep   1 sec
    Element Should Contain    ${square_a}    B
    Element Should Contain    ${square_b}    A
    dragging and dropping    ${session.driver}     ${end}       ${source}
    sleep   1 sec
    Element Should Contain    ${square_a}    A
    Element Should Contain    ${square_b}    B



#It uses a JavaScript function to create a custom keyboard on python. Driver is passed to execute JS.
