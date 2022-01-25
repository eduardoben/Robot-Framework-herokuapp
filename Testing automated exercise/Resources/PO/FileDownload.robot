*** Settings ***
Library     SeleniumLibrary
Library     OperatingSystem
Library     CustomLibrary
Resource    ../../Data/InputData.robot
Resource    ../Common.robot
*** Variables ***
${number_files}=    1
${first_link_locator}=     xpath=  /html/body/div[2]/div/div/a[1]
${second_link_locator}=     xpath=  /html/body/div[2]/div/div/a[2]
*** Keywords ***
Download File
    [Documentation]     Downloads a file and moves it to a new directory to confirm that file is downloadedC
    # create unique folder

    File Should Not Exist    ../../../downloads/some-file.txt
    File Should Not Exist    ../../../downloads/file.txt

    ${download directory}=  Creating Directory For Downloads


    ${first_exists}     Run Keyword And Ignore Error    Page Should Contain Element    ${first_link_locator}
    ${second_exists}     Run Keyword And Ignore Error   Page Should Contain Element    ${second_link_locator}
    Wait Until Page Contains Element    ${first_link_locator}
    Click With Javascript  ${first_link_locator}   # downloads a file

    IF    "${BROWSER}" == 'ie'
        Ie Download
        sleep  1 sec
    END
    IF    "${BROWSER}" == 'firefox'
        Fx Download
    END

    IF    "${first_exists}[0]" == "PASS" and "${second_exists}[0]" == "PASS"
        ${number_files}=    Downloading Second File     ${download directory}
    END
    Wait Until Keyword Succeeds     01 min  30 sec    Move File   ../../../downloads/some-file.txt    ${download directory}
    Download should be done     ${download directory}   ${number_files}

Creating Directory For Downloads
    ${now}    Get Time    epoch
    ${download directory}    Join Path    ${OUTPUT DIR}    downloads_${now}
    Create Directory    ${download directory}
    [Return]    ${download directory}

Downloading Second File
    [Documentation]     Execute actions requeried to handle multidownloads depending of browser. Returns number of files downloaded
    [Arguments]     ${download directory}
    Wait Until Page Contains Element    ${second_link_locator}
    Click With Javascript  ${second_link_locator}   # downloads a file

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
    Wait Until Keyword Succeeds     01 min  30 sec    Move File   ../../../downloads/test.txt    ${download directory}
    [Return]    ${number_files}

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