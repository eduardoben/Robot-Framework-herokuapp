*** Settings ***
Library  SeleniumLibrary
Resource  ../Data/InputData.robot

*** Variables ***

*** Keywords ***
Begin Web Test
    [Documentation]  Opens a given browser with given URL.
    [Arguments]     ${URL}
    Open Browser    ${URL}   ${BROWSER}
    Maximize Browser Window
    #sleep   10 s
End Web Test
    [Documentation]  Closes all browsers opened by automated environment.
    Close All Browsers

Click With Javascript
    [Documentation]  Clicks an element with javascript code.
    [Arguments]  ${locator}     ${wait}=.25s
    ${w_element}     Get WebElement       ${locator}
    Execute Javascript    arguments[0].click();     ARGUMENTS   ${w_element}
    Sleep   ${wait}

Select Checkbox With Javascript
    [Documentation]  Selects a checkbox with javascript code.
    [Arguments]     ${locator}
    ${web}  Get WebElement    ${locator}
    ${selected}=   Execute Javascript  return arguments[0].checked;     ARGUMENTS   ${web}
    IF    "${selected}" != "True"
        Click With Javascript     ${locator}
    END


Unselect Checkbox With Javascript
    [Documentation]  Unselects a checkbox with javascript code.
    [Arguments]     ${locator}
    ${web}  Get WebElement    ${locator}
    ${selected}=   Execute Javascript  return arguments[0].checked;     ARGUMENTS   ${web}
    IF    "${selected}" == "True"
        Click With Javascript     ${locator}
    END

Click With Async Javascript
    [Documentation]  Clicks asynchronously an element with javascript code after 3 seconds.
    [Arguments]  ${locator}     ${wait}=.25s
    ${w_element}     Get WebElement       ${locator}
    Execute Async Javascript    var callback = arguments[0].click();     ARGUMENTS   ${w_element}
    ...     window.setTimeout(callback, 3000);


Wait And Execute Keyword
   [Documentation]  Executes a keyword after waiting for an element in page and has a given timeout of 15 sec.
   [Arguments]         ${keyword}     ${element}       ${timeout}=15 sec
   Wait Until Page Contains Element   ${element}       ${timeout}
   Run Keyword And Return    ${keyword}     ${element}