*** Settings ***
Library     SeleniumLibrary
Library     OperatingSystem
Library     CustomLibrary.py
Resource    ../../Data/InputData.robot
Resource    ../Common.robot
*** Variables ***
${number_files}=    1
${FIRST_LINK_LOCATOR}=     xpath=  /html/body/div[2]/div/div/a[1]
${SECOND_LINK_LOCATOR}=     xpath=  /html/body/div[2]/div/div/a[2]
*** Keywords ***
Download File
    [Documentation]     Downloads a file and moves it to a new directory to confirm that file is downloadedC
    # create unique folder

    ${now}    Get Time    epoch
    ${download directory}    Join Path    ${OUTPUT DIR}    downloads_${now}
    Create Directory    ${download directory}
    ${first_exists}     Run Keyword And Ignore Error    Page Should Contain Element    ${FIRST_LINK_LOCATOR}
    ${second_exists}     Run Keyword And Ignore Error   Page Should Contain Element    ${SECOND_LINK_LOCATOR}
    Wait Until Page Contains Element    ${FIRST_LINK_LOCATOR}
    Click With Javascript  ${FIRST_LINK_LOCATOR}   # downloads a file

    IF    "${BROWSER}" == 'ie'
         Ie Download
         sleep  1 sec
    END
    IF    "${BROWSER}" == 'firefox'
         Fx Download
    END

    IF    "${first_exists}[0]" == "PASS" and "${second_exists}[0]" == "PASS"

        Wait Until Page Contains Element    ${SECOND_LINK_LOCATOR}
        Click With Javascript  ${SECOND_LINK_LOCATOR}   # downloads a file

        IF    "${BROWSER}" == 'ie'
            Ie Multidownload
        END
        IF    "${BROWSER}" == 'firefox'
             Fx Download
        END
        IF    "${BROWSER}" == 'edge'
            Edge Multidownload
        END
        IF    "${BROWSER}" == 'chrome'
            Chrome Multidownload
        END
        ${number_files}     Set Variable    2
        Wait Until Keyword Succeeds     01 min  30 sec    Move File   ../../downloads/some-file.txt    ${download directory}
    END


    Wait Until Keyword Succeeds     01 min  30 sec    Move File   ../../downloads/test.txt    ${download directory}
    Download should be done     ${download directory}   ${number_files}


Download should be done
    [Documentation]    Verifies that the directory has only one folder and it is not a temp file.
    ...     Returns path to the file
    [Arguments]    ${directory}     ${number_files}
    ${files}    List Files In Directory    ${directory}
    Length Should Be    ${files}    ${number_files}    Should be only one file in the download folder
    Should Not Match Regexp    ${files[0]}    (?i).*\\.tmp    Still downloading a file
    ${file}    Join Path    ${directory}    ${files[0]}
    Log    File was successfully downloaded to ${file}
    [Return]    ${file}