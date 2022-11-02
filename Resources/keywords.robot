# Basic keywords common to all modules

*** Settings ***
#Library    ../venv/lib/python3.10/site-packages/SeleniumLibrary/__init__.py
Resource  ../Resources/variables.robot

*** Keywords ***
Begin Web Test
    ${chrome_options}=  Evaluate  sys.modules['selenium.webdriver'].ChromeOptions()  sys, selenium.webdriver
    Call Method   ${chrome_options}   add_argument   test-type
    Call Method   ${chrome_options}   add_argument   --disable-extensions
    #Call Method   ${chrome_options}   add_argument   --headless
    Call Method   ${chrome_options}   add_argument   --disable-gpu
    Call Method   ${chrome_options}   add_argument   --no-sandbox
    Call Method   ${chrome_options}   add_argument   --start-maximized
    Call Method   ${chrome_options}   add_argument   ${WINDOW}
    Create Webdriver   Chrome   chrome_options=${chrome_options}
    Set Selenium Timeout   10s      #${default_selenium_timeout} = Get Selenium Timeout
    # Set Selenium Speed   1s    #${default_selenium_speed} = Get Selenium Speed

End Web Test
    Close Browser

Go To Login Page
    Go to   ${LOGIN_URL}
    Wait Until Page Contains Element  ${login_button}

Log In User
    Input Text   ${login_username_email_input}    regrtestaccount   #textualtest
    Input Text   ${login_password_input}  test987!
    Click Button   ${login_button}
    Wait Until Page Contains    What do you want to do today?

Log Out User
    Click Element   ${product_list_menu_button}





