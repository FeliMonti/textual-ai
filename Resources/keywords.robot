*** Keywords ***
Begin Web Test
    ${chrome_options}=  Evaluate  sys.modules['selenium.webdriver'].ChromeOptions()  sys, selenium.webdriver
    Call Method    ${chrome_options}    add_argument    test-type
    Call Method    ${chrome_options}    add_argument    --disable-extensions
    #Call Method    ${chrome_options}    add_argument    --headless
    Call Method    ${chrome_options}    add_argument    --disable-gpu
    Call Method    ${chrome_options}    add_argument    --no-sandbox
    Call Method    ${chrome_options}    add_argument    --start-maximized
    Call Method    ${chrome_options}    add_argument    ${WINDOW}
    Create Webdriver    Chrome    chrome_options=${chrome_options}
    Set Selenium Timeout  10s

Go To Web Page
    Go to  ${URL}
    Wait Until Page Contains   Try the new Copy Assistant from Textual

Log In User
    Input Text  ${MAIL}       regrtestaccount     #textualtest
    Input Text  ${PASSWORD}  test987!
    Wait Until Page Contains Element  ${Log_In_Button}
    Click Element  ${Log_In_Button}

Access To Edit Page
    Wait Until Page Contains Element  ${Edit_Button}
    Click Element  ${Edit_Button}