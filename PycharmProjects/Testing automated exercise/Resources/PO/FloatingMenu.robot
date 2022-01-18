*** Settings ***
Library     OperatingSystem
Library     CustomLibrary.py
Library     SeleniumLibrary
Resource    ../../Data/InputData.robot
Resource    ../Common.robot
*** Variables ***
${MENU_LOCATOR}=    xpath=/html/body/div[2]/div/div/div[1]/ul/li[1]/a

*** Keywords ***

Checking Floating Menu In View Port

    Wait Until Page Contains Element    ${MENU_LOCATOR}
    Execute Javascript      window.scrollTo(0, document.body.scrollHeight)
    Wait And Execute Keyword    Click With Javascript   ${MENU_LOCATOR}
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
#${driver}=     Get Library Instance    SeleniumLibrary
#${element}=     Get WebElement    ${MENU_LOCATOR}
 #    ${js}=      Get File    Resources/PO/Coordinates.js
 #    ${visible}=    Call Method
 #    ...                ${driver.driver}
 #    ...                execute_script    ${js} return isInViewport(arguments[0]);    ${element}