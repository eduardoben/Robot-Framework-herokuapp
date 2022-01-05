*** Settings ***
Resource  ../Data/InputData.robot
Resource  ../Resources/Common.robot
Resource  ../Resources/AutomatedApp.robot

Test Setup  Begin Web Test      ${URL}

#Test Teardown   End Web Test
*** Variables ***

#robot -d results tests/Automated.robot
*** Test Cases ***

#REQ - Basic Auth

#Login With Valid Credentials
    #[Documentation]     Validates that user can login with valid login.
 #   [Setup]     Begin Web Test  ${BLANK}
  #  AutomatedApp.ValidLogin     ${VALIDCREDENTIALS}


#Login With Invalid Credentials
    # [Documentation]     Validates that user can not log in with invalid credentials and recieves a message.
 #   [Setup]     Begin Web Test  ${BLANK}
  #  AutomatedApp.InvalidLogin       ${INVALIDCREDENTIALS}

#REQ    -   ADD 20 ELEMENT AND DELETE THEM

#Adding Elements
 #   [Documentation]    It verifies that user can add elements correctly through adding button.
  #  [Setup]     Begin Web Test  ${APP_URL}
  #  AutomatedApp.AddingElements

#Deleting Elements
 #   [Documentation]    It verifies that user can delete elements one by one correctly. Through delete button of each element.
  #  [Setup]     Begin Web Test  ${APP_URL}
   # AutomatedApp.DeletingElements


#REQ    -   SELECT CHECKBOXES
#Selecting and verifying checkbox
#    [Documentation]     It verifies that user can select checkboxs.

#    [Setup]     Begin Web Test  ${CHECKBOX_URL}
 #   [Template]  AutomatedApp.Selecting a checkbox
  #  ${CHECKBOX1}
   # ${CHECKBOX2}

#REQ    -   CONTEXT MENU

#Validating Context Menu
#   [Documentation]     It validates that alert is triggered and shows proper message.
#   [Setup]     Begin Web Test  ${CONTEXT_URL}
#   AutomatedApp.Validating Context Menu

#REQ    -   Disappearing Element
Checking Disappearing Element
    [Documentation]     It checks for a certain Element that is randomly displayed. It validates its existence or absence
    [Setup]     Begin Web Test  ${DISAPPEAR_URL}
    AutomatedApp.Checking Disappearing Element

#REQ    -   Drag and Drop

Dragging And Dropping

    [documentation]    Validates that user can drag a drop an element to another position.
    [Setup]     Begin Web Test  ${DRAG_URL}
    AutomatedApp.Dragging And Dropping Element

#REQ    -   Dynamic Content
#Dynamic Images
 #   [Documentation]     Checks for images of the page and validate images names. Refresh the page until all the images appears at least one time
  #  [Setup]     Begin Web Test  ${DYNAMIC_URL}
   # AutomatedApp.Dynamic Images

#REQ    -   Dynamic Controls
#Dynamic Controls
 #   [Documentation]     Checks that user can use dynamic controls of page. Triggers enabling and removing element from page and validate the actions.
  #  [Setup]     Begin Web Test  ${CONTROLS_URL}
   # AutomatedApp.Dynamic Controls

#REQ    -   Exit Intent
#Exit Intent
  #  [Documentation]     Verifies that a modal is triggered when user moves mouse out of page.
   # [Setup]     Begin Web Test  ${EXIT_URL}
    #AutomatedApp.Exit Intent

#REQ    -   File Download
#File Download
    #[Documentation]     Click a link to trigger a download and later validates it.
 #   [Setup]     Begin Web Test  ${FILE_URL}
  #  AutomatedApp.File Download

#REQ    -   File Upload
#File Upload
#   [Documentation]      Verifies uploading of a file
#    [Setup]     Begin Web Test  ${UPLOAD_URL}
 #   AutomatedApp.File Upload

#REQ    -   Floating Menua
Floating Menu
    [Documentation]     Verify that menu is shown after scrolling down page

#An alternative could be use "Element should be visible" keyword but it only valides a logic visibility not visibility in viewport
    [Setup]     Begin Web Test  ${FLOATING_URL}
    AutomatedApp.Floating Menu

#REQ    -   Form Authentication
#Form Authentication With Valid Credentials
#    [Documentation]     Enter valid credentials, submit and validate correct login. Later, logging out and validate logged out
 #   [Setup]     Begin Web Test  ${FORM_URL}
  #  AutomatedApp.Form Authentication With Valid Credentials    ${VALIDUSER}

#Form Authentication With Invalid Username
 #   [Documentation]     Enter invalid username, submit and validate incorrect login.
 #   [Setup]     Begin Web Test  ${FORM_URL}
  #  AutomatedApp.Form Authentication With Invalid Username      ${INVALIDUSER}

#Form Authentication With Invalid Password
 #   [Documentation]     Enter invalid password, submit and validate incorrect login.
 #   [Setup]     Begin Web Test  ${FORM_URL}
  #  AutomatedApp.Form Authentication With Invalid Password      ${INVALIDPASS}

#REQ    -   Horizontal Slider
#Keyboard Slider Manipulation
 #   [Documentation]     Selects slider and simulates keyboard entries to manipulate its value. It validates final value.
  #  [Setup]     Begin Web Test  ${SLIDER_URL}
   # AutomatedApp.Keyboard Slider Manipulation

#Mouse Slider Manipulation
 #   [Documentation]     Selects slider and simulates mouse dragging slider value. It validates final value.
  #  [Setup]     Begin Web Test  ${SLIDER_URL}
   # AutomatedApp.Mouse Slider Manipulation

#REQ    -   JQuery UI Menus
#JQUERY
#   [Documentation]    Navigates through menu and download a file. Download is evaluated.
 #   [Setup]     Begin Web Test  ${JQUERY_URL}
  #  AutomatedApp.JQuery Menu

#REQ    -   JavaScript Alerts
#JavaScript Alerts
 #   [Documentation]     Trigger, manage and validates alerts.
  #  [Setup]     Begin Web Test  ${ALERT_URL}
   # AutomatedApp.JavaScript Alerts

#REQ    -   Key Presses
#Key Presses
 #   [Documentation]     Simulates keyboard entries and validates the result.
  #  [Setup]     Begin Web Test  ${KEY_URL}
   # AutomatedApp.Key Presses

#REQ    -   Multiple Windows
#Multiple Windows
 #   [Documentation]     This test case verifies that user can click on link to open a new window.
  #  [Setup]     Begin Web Test  ${WINDOWS_URL}
   # AutomatedApp.Multiple Windows

#REQ    -   Broken Images
#Broken Images
 #   [Documentation]     This test case checks how many available and unavailable images are on page and validates the numbers.
  #  [Setup]     Begin Web Test  ${BROKEN_URL}
   # AutomatedApp.Broken Images
