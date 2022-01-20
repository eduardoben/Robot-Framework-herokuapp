*** Settings ***

Library    SeleniumLibrary
Library    CustomLibrary.py
Resource    ../Common.robot

*** Variables ***
${CLOSE_LOCATOR}=   xpath=  //div[@id="ouibounce-modal"]/div[2]/div[3]/p
${loaded_page}=     xpath=  //div[@id="content"]

*** Keywords ***

Mouse Out Of Page
    [Documentation]     Moves mouse out of window and calls Modal validation keybword.
    Wait Until Page Contains Element    ${loaded_page}
    Click With Javascript    ${loaded_page}
    Move Mouse Out
    #Modal Validation
    #Execute Javascript  jQuery(document).mouseleave(function(){console.log('outas')});

Modal Validation
    [Documentation]     Validates content of the page that modal is adding to the page if triggered
    Page Should Contain    This is a modal window
    Wait Until Page Contains Element    ${CLOSE_LOCATOR}
    Click With Javascript    ${CLOSE_LOCATOR}

