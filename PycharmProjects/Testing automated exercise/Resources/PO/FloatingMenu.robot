*** Settings ***
Library     SeleniumLibrary
Library     OperatingSystem
Library     CustomLibrary.py
Library     InputData.robot
*** Variables ***
${MENU_LOCATOR}=    xpath=  /html/body/div[2]/div/div/div[1]/ul/li[1]/a
${x}=   800
${y}=   300
*** Keywords ***

Checking Floating Menu In View Port

    ${ELEMENT}=     Get WebElement    ${MENU_LOCATOR}
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Wait Until Element Is Visible    ${MENU_LOCATOR}
    move mouse and click    ${800}     ${120}
    Validation Of Floating Menu

Validation Of Floating Menu
    #[Arguments]     ${visible}
    #Should Be True    ${visible}
    ${current_url}=  Get Location
    IF    "${current_url}" != "${FLOATING_URL}"
        Pass Execution    Menu is in view
    ELSE
        fail
    END


#This code was to detect if an element was in view port, it works fine with other elements, but not with floating menu.
#${s2l}=     Get Library Instance    SeleniumLibrary
    #${js}=      Get File    IsInViewPort.js
    #${visible}=    Call Method
    #...                ${s2l.driver}
    #...                execute_script    ${js} return isInViewport(arguments[0]);    ${ELEMENT}
