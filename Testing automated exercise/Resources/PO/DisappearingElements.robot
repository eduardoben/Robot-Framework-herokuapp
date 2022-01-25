*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${disappearing_element}=    css=#content > div > ul > li:nth-child(5) > a
${charged}=     xpath=/html/body/div[2]/div/div/ul/li[1]/a
*** Keywords ***

Checking Disappearing Element
    [Documentation]     It checks for a certain Element that is randomly displayed. It validates its existence or absence
    #It checks if the element is displayed, if it is positive, validation of positive case is done, then enter to a loop until page does not displays the element.
    #If the first time, the page does not display the element, it validates its abscence and later enter a loop until element exists and validates it.
    Wait Until Page Contains Element    ${charged}
    ${exists}=  Run Keyword And Ignore Error     Page Should Contain Element     ${disappearing_element}

    IF    "${exists}[0]" == 'PASS'
        Do If Element Exists At First Time
    ELSE

       Do If Element Does Not Exists At First Time

    END

Do If Element Exists At First Time
    [Documentation]    Validation of positive case is done, then enter to a loop until page does not displays the element
    Log To Console    Element exists
    FOR     ${i}    IN RANGE    1000
        Reload Page
        Wait Until Page Contains Element    ${charged}
        ${exists_element}=   Run Keyword And Ignore Error   Page Should not Contain Element     ${disappearing_element}
        Log To Console    Element does not exist
        Run Keyword If       "${exists_element}[0]" == 'PASS'
        ...     Exit For Loop

    END

Do If Element Does Not Exists At First Time
    [Documentation]     it validates element abscence and later enter a loop until element exists and validates it
    Log To Console    Element does not exist
    FOR     ${j}    IN RANGE    1000
        Reload Page
        Wait Until Page Contains Element    ${charged}
        ${exists_element}=  Run Keyword And Ignore Error     Page Should Contain Element     ${disappearing_element}
        Log To Console    Element exists
        Run Keyword If       "${exists_element}[0]" == 'PASS'
        ...     Exit For Loop

    END