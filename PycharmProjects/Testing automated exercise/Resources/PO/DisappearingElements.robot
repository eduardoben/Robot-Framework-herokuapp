*** Settings ***
Library     SeleniumLibrary

*** Variables ***

${DISAPPEARING_ELEMENT}=    css=#content > div > ul > li:nth-child(5) > a
${CHARGED}=     xpath=/html/body/div[2]/div/div/ul/li[1]/a
*** Keywords ***

Checking Disappearing Element
    [Documentation]     It checks for a certain Element that is randomly displayed. It validates its existence or absence
    #It checks if the element is displayed, if it is positive, validation of positive case is done, then enter to a loop until page does not displays the element.
    #If the first time, the page does not display the element, it validates its abscence and later enter a loop until element exists and validates it.
    Wait Until Page Contains Element    ${CHARGED}
    ${exists}=  Run Keyword And Ignore Error     Page Should Contain Element     ${DISAPPEARING_ELEMENT}

    IF    "${exists}[0]" == 'PASS'
        Log To Console    Element exists
        FOR     ${i}    IN RANGE    1000
            Reload Page
            Wait Until Page Contains Element    ${CHARGED}
            ${exists_element}=   Run Keyword And Ignore Error   Page Should not Contain Element     ${DISAPPEARING_ELEMENT}
            Log To Console    Element does not exist
            Run Keyword If       "${exists_element}[0]" == 'PASS'
            ...     Exit For Loop

        END
    ELSE
        Wait Until Page Contains Element    ${CHARGED}
        Log To Console    Element does not exist
        ${exists}=   Run Keyword And Ignore Error   Page Should not Contain Element     ${DISAPPEARING_ELEMENT}
        Run Keyword If       "${exists}[0]" == 'PASS'     Log To Console    Element really does not exist
         FOR     ${j}    IN RANGE    1000
            Reload Page
            Wait Until Page Contains Element    ${CHARGED}
            ${exists_element}=  Run Keyword And Ignore Error     Page Should Contain Element     ${DISAPPEARING_ELEMENT}
            Log To Console    Element exists
            Run Keyword If       "${exists_element}[0]" == 'PASS'
                ...     Exit For Loop

        END

    END

