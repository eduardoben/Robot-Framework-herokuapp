*** Settings ***
Library     SeleniumLibrary
Resource    ../Common.robot
Resource    ../../Data/InputData.robot
*** Variables ***
${slider_locator}=  //*[@id="content"]/div/div/input
${value_locator}=   id= range
*** Keywords ***
Setting Slider Value With Keyboard
    [Documentation]     Simulates keyboard keys clicking to set slider value. It validates value.
    Wait Until Page Contains Element    ${slider_locator}
    Wait Until Page Contains Element    ${value_locator}
    Set Focus To Element    ${slider_locator}
    #Click Element    ${SLIDER_LOCATOR}
    ${value}=   Get Text   ${value_locator}
    FOR  ${i}  IN RANGE    ${value}    3.5     .5
        Press Keys   none   \ue014
    END
    Validation Of Slider Value

Setting Slider Value With Mouse
    # TODO  Check why the element is not properly detected by IE. Slider is not selected.
    [Documentation]     Simulates mouse movements to set slider value. It validates value.
    Wait Until Page Contains Element    ${slider_locator}
    Set Focus To Element    ${slider_locator}
    IF  "${BROWSER}" == "edge"
        Drag And Drop By Offset    ${slider_locator}    28    0
    END
    IF  "${BROWSER}" == "chrome"
        Drag And Drop By Offset    ${slider_locator}    28    0
    END
    IF  "${BROWSER}" == "firefox"
        Drag And Drop By Offset    ${slider_locator}    40    0
    END
    IF  "${BROWSER}" == "ie"
        Drag And Drop By Offset    ${slider_locator}    50    0
    END

    #Install a plugin to determine coordinates
    #Coordinates
    #350,170 INITIAL
    #370,170 END
    Validation Of Slider Value


Validation Of Slider Value
    [Documentation]     It validates value of slider. It takes span value and checks it.
    Element Should Contain    ${value_locator}    3.5
#Run Keyword If    "${value}" != "3.5"
#Execute Javascript  document.getElementById("range").textContent= 3.5;