*** Settings ***
Library     SeleniumLibrary
Library    RequestsLibrary

*** Variables ***
${AVAILABLE}=  0
${NOTAVAILABLE}=  0

*** Keywords ***
Checking Images
    [Documentation]     It checks how many images are broken and how many are not
    FOR     ${i}    IN  @{IMAGES_LOCATORS}
        Wait Until Element Is Visible    ${i}
        ${img}=    Get Element Attribute   ${i}     src
        ${status}=  Run Keyword And Ignore Error   HEAD  ${img}    expected_status=200
        IF  "${status}[0]" == "PASS"
            ${AVAILABLE}    Evaluate    ${AVAILABLE} + 1
        ELSE
            ${NOTAVAILABLE}    Evaluate    ${NOTAVAILABLE} + 1
        END

    END
    Validation of Images    ${AVAILABLE}    ${NOTAVAILABLE}

Validation Of Images
    [Documentation]     It validate the number of available and unavailable images on page
    [Arguments]     ${AVAILABLE}    ${NOTAVAILABLE}
    IF  ${AVAILABLE} == 1 and ${NOTAVAILABLE} == 2

        Pass Execution    Expected number of broken and available images correct

    ELSE
        Fail    Unexpected number of broken and available images

    END

