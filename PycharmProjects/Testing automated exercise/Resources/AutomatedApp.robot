*** Settings ***
Resource  ../Resources/PO/AddRemoveElement.robot
Resource  ../Resources/PO/BasicAuth.robot
Resource  ../Resources/PO/CheckBox.robot
Resource  ../Resources/PO/ContextMenu.robot
Resource  ../Resources/PO/DisappearingElements.robot
Resource  ../Resources/PO/DragDrop.robot
Resource  ../Resources/PO/DynamicContent.robot
Resource  ../Resources/PO/DynamicControls.robot
Resource  ../Resources/PO/ExitIntent.robot
Resource  ../Resources/PO/FileDownload.robot
Resource  ../Resources/PO/FileUpload.robot
Resource  ../Resources/PO/FloatingMenu.robot
Resource  ../Resources/PO/FormAuthentication.robot
Resource  ../Resources/PO/HorizontalSlider.robot
Resource  ../Resources/PO/JQueryUIMenus.robot
Resource  ../Resources/PO/JavaScriptAlerts.robot
Resource  ../Resources/PO/KeyPresses.robot
Resource  ../Resources/PO/MultipleWindows.robot
Resource  ../Resources/PO/BrokenImages.robot
*** Keywords ***
#REQ - Basic Auth
ValidLogin
    [Documentation]     Validates that user can login with valid login.
    [Arguments]     ${Credentials}

    BasicAuth.Logging      ${Credentials}

InvalidLogin
    [Documentation]     Validates that user can not log in with invalid credentials and recieves a message
    [Arguments]     ${Credentials}
    BasicAuth.Logging      ${Credentials}

#REQ    -   ADD 20 ELEMENT AND DELETE THEM

AddingElements
    [Documentation]    Adds a certain number of elements and everytime a new element is added, a validation is run. It returns number of total elements
    AddRemoveElement.Adding_Element

DeletingElements
    [Documentation]    Adds a certain number of elements (and validate each one), then delete elements one by one
    AddRemoveElement.Deleting Element

#REQ    -   SELECT CHECKBOXES
Selecting a checkbox
    [Documentation]     It unselects checkbox then select it and later checks if it is selected
    [Arguments]     ${Checkbox}
    CheckBox.Selecting a checkbox   ${Checkbox}

#REQ    -   CONTEXT MENU
Validating Context Menu
    [Documentation]     It triggers a alert, verify content and close it. At last, it validates that alert is not longer there.
    ContextMenu.Validating Context Menu

#REQ    -   DISAPPEARING ELEMENTS
Checking Disappearing Element
    [Documentation]     It checks for a certain Element that is randomly displayed. It validates its existence or absence
    DisappearingElements.Checking Disappearing Element

#REQ    -   DRAG AND DROP
Dragging And Dropping Element
    [Documentation]     Validates that user can drag a drop an element to another position.
    DragDrop.Dragging And Dropping Element

#REQ    -   DYNAMIC CONTENT
Dynamic Images
    [Documentation]     It checks for images of the page and validate images names
    DynamicContent.Looking For All Images
#REQ    -   DYNAMIC CONTROLS
Dynamic Controls
    [Documentation]     It enables and removes elements from page and it validates the actions.
    DynamicControls.Enabling Input
    DynamicControls.Removing Checkbox

#REQ    -   EXIT INTENT
Exit Intent
    [Documentation]     Verifies that a modal is triggered when user moves mouse out of page.
    ExitIntent.Mouse Out Of Page

File Download
    [Documentation]     Click a link to trigger a download and later validates it.
    FileDownload.Download File

File Upload
    [Documentation]      Verifies uploading of a file
    FileUpload.Uploading File

Floating Menu
    [Documentation]     Verify that menu is shown after scrolling down page
    FloatingMenu.Checking Floating Menu In View Port

Form Authentication With Valid Credentials
    [Documentation]     Enter valid credentials, submit and validate correct login. Later, logging out and validate logged out
    [Arguments]     ${authentication}
    FormAuthentication.Authenticating   ${authentication}

Form Authentication With Invalid Username
    [Documentation]     Enter invalid username, submit and validate incorrect login.
    [Arguments]     ${authentication}
    FormAuthentication.Authenticating   ${authentication}

Form Authentication With Invalid Password
    [Documentation]     Enter invalid password, submit and validate incorrect login.
    [Arguments]     ${authentication}
    FormAuthentication.Authenticating   ${authentication}


#REQ    -   Horizontal Slider
Keyboard Slider Manipulation
    [Documentation]     Selects slider and simulates keyboard entries to manipulate its value. It validates final value.
    HorizontalSlider.Setting Slider Value With Keyboard

Mouse Slider Manipulation
    [Documentation]     Selects slider and simulates mouse dragging slider value. It validates final value.
    HorizontalSlider.Setting Slider Value With Mouse

#REQ    -   JQuery UI Menus
JQuery Menu
    [Documentation]    Navigates through menu and download a file. Download is evaluated.
    JQueryUIMenus.Navigating Menu

#REQ    -   JavaScript Alerts
JavaScript Alerts
    [Documentation]     Trigger, manage and validates alerts.
    JavaScriptAlerts.Managing Alerts

#REQ    -   Key Presses
Key Presses
    [Documentation]     Simulates keyboard entries and validates the result.
    KeyPresses.Entering Keys

#REQ    -   Multiple Windows
Multiple Windows
    [Documentation]     This test case verifies that user can click on link to open a new window.
    MultipleWindows.Deploying New Window


#REQ    -   Broken Images
Broken Images
    [Documentation]     This test case checks how many available and unavailable images are on page and validates the numbers.
    BrokenImages.Checking Images