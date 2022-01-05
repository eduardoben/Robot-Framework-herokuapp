*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${SLIDER_LOCATOR}=   xpath=  /html/body/div[2]/div/div/div/input

*** Keywords ***
Setting Slider Value With Keyboard
    [Documentation]     Simulates keyboard keys clicking to set slider value. It validates value.
    Click Element    ${SLIDER_LOCATOR}
    ${value}=   Get Text   id= range
    FOR  ${i}  IN RANGE    ${value}    3.5     .5
        Press Keys   none   \ue014
    END
    Validation Of Slider Value
Setting Slider Value With Mouse
    [Documentation]     Simulates mouse movements to set slider value. It validates value.
    Drag And Drop By Offset    ${SLIDER_LOCATOR}    20    0
    #Install a plugin to determine coordinates
    #Coordinates
    #350,170 INITIAL
    #370,170 END
    Validation Of Slider Value


Validation Of Slider Value
    [Documentation]     It validates value of slider. It takes span value and checks it.
    Element Should Contain    id= range    3.5
#Run Keyword If    "${value}" != "3.5"
#Execute Javascript  document.getElementById("range").textContent= 3.5;