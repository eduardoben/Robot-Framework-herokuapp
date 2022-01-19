*** Variables ***
# Configuration
# When selecting a browser type as shown:   firefox, ie, edge, chrome
${BROWSER} =    ie
${BASE_URL}=    https://ss-testing-automated-exercise.herokuapp.com/
${BLANK} =      about:blank

# DATA - BASIC AUTH

${LOGIN_URL}=               basic_auth
&{VALIDCREDENTIALS}=        User=admin      Pass=admin      ExpectedStatus=200              #Includes expected status of a succesful petition
&{INVALIDCREDENTIALS}=      User=admin1     Pass=admin1     ExpectedStatus=401              #Includes expected status of not succesful petition

#DATA - ADDING/DELETING ELEMENTS
${APP_URL}=     https://ss-testing-automated-exercise.herokuapp.com/add_remove_elements/

#DATA - SELECTING AND VALIDATING CHECKBOXES
${CHECKBOX_URL}=        https://ss-testing-automated-exercise.herokuapp.com/checkboxes

#DATA - SELECTING AND VALIDATING CHECKBOXES
${CONTEXT_URL}=     https://ss-testing-automated-exercise.herokuapp.com/context_menu

#DATA - DISAPPEARING ELEMENTS
${DISAPPEAR_URL}=   https://ss-testing-automated-exercise.herokuapp.com/disappearing_elements

#DATA - DRAG AND DROP
${DRAG_URL}=    https://ss-testing-automated-exercise.herokuapp.com/drag_and_drop

#DATA - DYNAMIC CONTENT
${DYNAMIC_URL}=    https://ss-testing-automated-exercise.herokuapp.com/dynamic_content

#DATA - DYNAMIC CONTROLS
${CONTROLS_URL}=    https://ss-testing-automated-exercise.herokuapp.com/dynamic_controls

#DATA - EXIT INTENT
${EXIT_URL}=    https://ss-testing-automated-exercise.herokuapp.com/exit_intent

#DATA - FILE DOWNLOAD
${FILE_URL}=    https://ss-testing-automated-exercise.herokuapp.com/download

#DATA - FILE DOWNLOAD
${UPLOAD_URL}=  https://ss-testing-automated-exercise.herokuapp.com/upload

#DATA - FLOATING MENU
${FLOATING_URL}=    https://ss-testing-automated-exercise.herokuapp.com/floating_menu

#DATA - FORM AUTHENTENTICATION
${FORM_URL}=    https://ss-testing-automated-exercise.herokuapp.com/login
&{VALIDUSER}=       User=tomsmith    Pass=SuperSecretPassword!     ExpectedMessage=You logged into a secure area!
&{INVALIDUSER}=     User=tomsmith1   Pass=SuperSecretPassword!     ExpectedMessage=Your username is invalid!
&{INVALIDPASS}=     User=tomsmith    Pass=SuperS1ecretPassword!    ExpectedMessage=Your password is invalid!

#DATA - HORIZONTAL SLIDER
${SLIDER_URL}=  https://ss-testing-automated-exercise.herokuapp.com/horizontal_slider

#DATA - JQuery UI Menus
${JQUERY_URL}=      https://ss-testing-automated-exercise.herokuapp.com/jqueryui/menu

#DATA - JavaScript Alerts
${ALERT_URL}=   https://ss-testing-automated-exercise.herokuapp.com/javascript_alerts
@{ALERT_MESSAGES}=    You successfuly clicked an alert    You entered: testing

#DATA - Key Presses
${KEY_URL}=     https://ss-testing-automated-exercise.herokuapp.com/key_presses
@{KEY_MESSAGES}=    You entered: ESCAPE     You entered: BACK_SPACE

#DATA - Multiple Windows
${WINDOWS_URL}=     https://ss-testing-automated-exercise.herokuapp.com/windows

#DATA - Broken Images
@{IMAGES_LOCATORS}=     xpath= /html/body/div[2]/div/div/img[1]     xpath= /html/body/div[2]/div/div/img[2]     xpath= /html/body/div[2]/div/div/img[3]
${BROKEN_URL}=      https://ss-testing-automated-exercise.herokuapp.com/broken_images