*** Settings ***
Library    SeleniumLibrary
Library    Collections
Resource    ../../Data/InputData.robot
*** Variables ***

*** Keywords ***
Looking For All Images
    [Documentation]     It scans all the images from site and register them in a list. Then the names are validated.
    FOR     ${j}    IN RANGE    20
        FOR     ${i}    IN      @{IMAGE_ELEMENTS}
            ${image}=   Get Element Attribute    ${i}    src
            ${known}=   Run Keyword And Ignore Error    List Should Contain Value    ${PAGE_IMAGES}    ${image}
            IF  "${known}[0]" == 'FAIL'
                Append To List    ${PAGE_IMAGES}    ${image}
                Name Validation    ${image}
            END
        END
        Reload Page
    END
    ${PAGE_IMAGES}=     Remove Duplicates   ${PAGE_IMAGES}



Name Validation
    [Documentation]     It receives the name of an image and compares it against a verified list.
    [Arguments]     ${Name}

    ${validation}=  Run Keyword And Ignore Error    List Should Contain Value   ${KNOWN_IMAGES}     ${Name}
    IF  "${validation}[0]" == 'PASS'
        Log To Console  Correct Name
    ELSE
        Fail    Incorrect Name
    END


    #Obtaining SRC property from each image displayed. An empty list where if a SRC property is not present then it is save in the list. To validate names,
    #The new list is compare against known names.


    #FOR     ${j}    IN RANGE    1000
     #   FOR     ${i}    IN   @{LIST_IMAGES}
      #  SET GLOBAL VARIABLE     ${IMAGE}    ${i}
      #  SET GLOBAL VARIABLE     ${IMAGE_NAME}   /img/avatars/Original-Facebook-Geek-Profile-Avatar-${IMAGE}.jpg
      #  Log To Console    ${IMAGE_NAME}
      #  Log To Console    ${IMAGE}
      #  END
   # END