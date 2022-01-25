*** Settings ***
Library     SeleniumLibrary
Library     OperatingSystem
Resource    ../Common.robot

*** Variables ***
${locator_button}=  id= file-upload
${locator_upliad}=  id= file-submit
*** Keywords ***

Uploading File
    [Documentation]     It creates a file and simulate uploading it to the page.
    Create File    ${OUTPUT DIR}/test.txt    testing
    Wait Until Page Contains Element    ${locator_button}
    ${download directory}    Join Path    ${OUTPUT DIR}     test.txt
    Choose File    ${locator_button}    ${download directory}
    Click With Javascript   ${locator_upliad}
    Wait Until Keyword Succeeds    1 m    10 sec    Page Should Contain    File Uploaded!
