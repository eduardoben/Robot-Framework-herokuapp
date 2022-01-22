*** Settings ***
Library     SeleniumLibrary
Library     OperatingSystem
Resource    ../Common.robot

*** Variables ***
${LOCATOR_BUTTON}=  id= file-upload
${LOCATOR_UPLOAD}=  id= file-submit
*** Keywords ***

Uploading File
    [Documentation]     It creates a file and simulate uploading it to the page.
    Create File    ${OUTPUT DIR}/test.txt    testing
    Wait Until Page Contains Element    ${LOCATOR_BUTTON}
    ${download directory}    Join Path    ${OUTPUT DIR}     test.txt
    Choose File    ${LOCATOR_BUTTON}    ${download directory}
    Click With Javascript   ${LOCATOR_UPLOAD}
    Wait Until Keyword Succeeds    1 m    10 sec    Page Should Contain    File Uploaded!
