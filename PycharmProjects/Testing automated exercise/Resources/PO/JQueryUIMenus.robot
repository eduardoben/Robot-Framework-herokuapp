*** Settings ***
Library     SeleniumLibrary
Library     OperatingSystem





*** Variables ***
${ENABLE_LOCATOR}=  xpath=  /html/body/div[2]/div[1]/div/div/ul/li[2]/a
${DOWNLOADS_LOCATOR}=   xpath= /html/body/div[2]/div[1]/div/div/ul/li[2]/ul/li[1]/span
${EXCEL_LOCATOR}=   xpath= /html/body/div[2]/div[1]/div/div/ul/li[2]/ul/li[1]/ul/li[3]/a
*** Keywords ***
Navigating Menu
    Click Element    ${ENABLE_LOCATOR}
    Wait Until Element Is Visible    ${DOWNLOADS_LOCATOR}
    Click Element    ${DOWNLOADS_LOCATOR}
    Wait Until Element Is Visible    ${EXCEL_LOCATOR}
    Click Element    ${EXCEL_LOCATOR}
    Validating Download

Validating Download
    ${now}    Get Time    epoch

    ${download directory}    Join Path    ${OUTPUT DIR}    downloads_${now}
    Create Directory    ${download directory}
    ${file}    Wait Until Keyword Succeeds     1 min  02 sec    Move File   ../../downloads/menu.xls   ${download directory}
    ${files}    List Files In Directory    ${download directory}
    Length Should Be    ${files}    1    Should be only one file in the download folder
    Should Not Match Regexp    ${files[0]}    (?i).*\\.tmp    still downloading a file
    ${file}    Join Path    ${download directory}    ${files[0]}
    Log    File was successfully downloaded to ${file}



    # Performs mouse move action onto the element
