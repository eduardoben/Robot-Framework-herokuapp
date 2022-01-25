*** Settings ***
Library     SeleniumLibrary
Library     OperatingSystem
Library    CustomLibrary
Resource    ../Common.robot

*** Variables ***
${enable_locator}=  xpath=  //a[contains(text(),'Enabled')]
${downloads_locator}=   xpath= //body/div[2]/div[1]/div[1]/div[1]/ul[1]/li[2]/ul[1]/li[1]/span[1]
${excel_locator}=   xpath= //a[contains(text(),'Excel')]
*** Keywords ***
Navigating Menu

    Click With Javascript   ${enable_locator}
    Wait Until Page Contains Element    ${downloads_locator}
    Click With Javascript    ${downloads_locator}
    Wait Until Page Contains Element    ${excel_locator}
    Click With Javascript    ${excel_locator}
    IF    "${BROWSER}" == 'ie'
         Ie Download
    END
   IF    "${BROWSER}" == 'firefox'
         Fx Download
    END
    Validating Download

Validating Download
    ${now}    Get Time    epoch
    ${download directory}    Join Path    ${OUTPUT DIR}    downloads_${now}
    Create Directory    ${download directory}
    ${file}    Wait Until Keyword Succeeds     1 min  02 sec    Move File   ../../../downloads/menu.xls   ${download directory}
    ${files}    List Files In Directory    ${download directory}
    Length Should Be    ${files}    1    Should be only one file in the download folder
    Should Not Match Regexp    ${files[0]}    (?i).*\\.tmp    still downloading a file
    ${file}    Join Path    ${download directory}    ${files[0]}
    Log    File was successfully downloaded to ${file}



    # Performs mouse move action onto the element
