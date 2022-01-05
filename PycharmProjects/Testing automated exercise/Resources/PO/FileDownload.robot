*** Settings ***
Library     SeleniumLibrary
Library     OperatingSystem
*** Variables ***

${LOCATOR}=     xpath=  /html/body/div[2]/div/div/a

*** Keywords ***
Download File
    [Documentation]     Downloads a file and moves it to a new directory to confirm that file is downloadedC
    # create unique folder

    ${now}    Get Time    epoch
    ${download directory}    Join Path    ${OUTPUT DIR}    downloads_${now}
    Create Directory    ${download directory}
    Click Link   ${LOCATOR}   # downloads a file

    # wait for download to finish
    ${file}    Wait Until Keyword Succeeds     1 min  02 sec    Move File   ../../downloads/some-file.txt    ${download directory}
    #Validation
    Download should be done    ${download directory}

Download should be done
    [Documentation]    Verifies that the directory has only one folder and it is not a temp file.
    ...     Returns path to the file
    [Arguments]    ${directory}
    ${files}    List Files In Directory    ${directory}
    Length Should Be    ${files}    1    Should be only one file in the download folder
    Should Not Match Regexp    ${files[0]}    (?i).*\\.tmp    Still downloading a file
    ${file}    Join Path    ${directory}    ${files[0]}
    Log    File was successfully downloaded to ${file}
    [Return]    ${file}