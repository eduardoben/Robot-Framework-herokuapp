*** Settings ***

Library    SeleniumLibrary
Library    MoveCursor.py

*** Variables ***
${CLOSE_LOCATOR}=   xpath=  /html/body/div[2]/div/div[2]/div[2]/div[3]/p


*** Keywords ***

Mouse Out Of Page
    [Documentation]     Moves mouse out of window and calls Modal validation keybword.
    Wait Until Page Contains Element   xpath= /html/body/div[2]
    move mouse middle
    Modal Validation
    #Execute Javascript  jQuery(document).mouseleave(function(){console.log('outas')});

Modal Validation
    [Documentation]     Validates content of the page that modal is adding to the page if triggered
    Page Should Contain    This is a modal window
    Click Element    ${CLOSE_URL}

