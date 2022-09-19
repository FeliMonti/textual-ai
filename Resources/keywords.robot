
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
    #Wait Until Page Contains  Try the new Copy Assistant from Textual
    Wait Until Page Contains Element  ${PASSWORD}
    #Sleep  2s

Log in User
    Input Text  ${MAIL}    regrtestaccount
    Input Text  ${PASSWORD}     test987!
    Click Button    ${LOGINBUTTON}
    Wait Until Page Contains    What do you want to do today?

Navigate Product List Page
    Wait Until Page Contains Element    ${EDITBUTTON}
    Sleep   2s
    Click Element    ${EDITBUTTON}
    Wait Until Page Contains    Products

Search for SKU
    Wait Until Page Contains Element    ${SEARCHMENU}
    Input Text  ${SEARCHTEXT}   dcb7b357-c8f4-4042-b73c-92718f649313
    Click Element   ${SEARCHMENU}
    Sleep  2s
    Table Cell Should Contain   ${SKU_TABLE}   2  2  dcb7b357-c8f4-4042-b73c-92718f649313
    Double Click Element   ${SEARCHTEXT}
    Press Keys  ${SEARCHTEXT}  CTRL+A+DELETE
    Click Element  ${SEARCHMENU}
    Wait Until Page Contains Element    ${SEARCHTEXT}


End Web Test
    Close Browser