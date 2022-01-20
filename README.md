# Robot-Framework-herokuapp
Automated testing of some herokuapp resources.
To achieve compliance of the test, diverses resources where implemented. Python, Selenium Library, JavaScript and Robor Framework.
For some tests, the solutions is specific to the current version of the web page.
Test only ran on firefox, internet explorer, edge and chrome browsers.

In order to run test cases, file "Automated.robot" should be run in terminal with the following command "robot -d results tests/Automated.robot".

To set browser, the file "InputData.robot" shall be modified especifically at "Browser" variable and type browser as shown: firefox, ie, edge or chrome.

Test cases pending of succesfully running on each browser are as follow:

Internet explorer: 
                    Context Menu test case - When Context menu is triggered the test freezes until user interaction is done.
                    Horizontal Slider test case - Slider controled by mouse
                    File download - Keyboard commands are randomly accepted.



All other browsers are OK.
