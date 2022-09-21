
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
    Wait Until Page Contains Element  ${PASSWORD}

Log in User
    Input Text  ${MAIL}   regrtestaccount   #textualtest
    Input Text  ${PASSWORD}     test987!
    Click Button    ${LOGINBUTTON}
    Wait Until Page Contains    What do you want to do today?

Navigate Product List Page
    Wait Until Page Contains Element    ${EDITBUTTON}
    #Sleep   2s
    Click Element    ${EDITBUTTON}
    Wait Until Page Contains    Products

Search for SKU
    Wait Until Page Contains Element    ${SEARCHMENU}
    Input Text  ${SEARCHTEXT}   dcb7b357-c8f4-4042-b73c-92718f649313
    Click Element   ${SEARCHMENU}
    #Sleep  2s
    #Table Cell Should Contain   ${TABLE}   2  2  dcb7b357-c8f4-4042-b73c-92718f649313
    Double Click Element   ${SEARCHTEXT}
    Press Keys  ${SEARCHTEXT}  CTRL+A+DELETE
    Click Element  ${SEARCHMENU}
    Wait Until Page Contains Element    ${SEARCHTEXT}

Filter by Product Creation Date

    #---Select by after date---#
    Click Element   ${BYDATE_LIST}
    Wait Until Page Contains Element   ${BYDATE_LISTBOX}
    Click Element   ${PRODUCTCREATIONDATE}
    Wait Until Page Contains Element    ${PRODUCTCREATIONDATE}
    Click Element   ${AFTER_DROPDOWNICON}
    Element Should Be Visible   ${AFTER_DATEMENU}
    #Sleep  2s
    Click Element    ${AFTER_DATEBUTTON}
    Wait Until Page Contains Element    ${CHOSEN_AFTERDATE}
    #Sleep  2s
    Click Element   ${DELETEDATE}
    Wait Until Page Contains Element    ${AFTER_DROPDOWNICON}

    #---Select by before date---#
    Click Element   ${BEFORE_DROPDOWNICON}
    Element Should Be Visible   ${BEFORE_DATEMENU}
    #Sleep  2s
    Click Element    ${BEFORE_DATEBUTTON}
    Wait Until Page Contains Element    ${CHOSEN_BEFOREDATE}
    #Sleep  2s
    Click Element   ${DELETEDATE}
    Wait Until Page Contains Element     ${BEFORE_DROPDOWNICON}

    #---Select by both after and before date in product creation date---#
    Click Element   ${AFTER_DROPDOWNICON}
    Element Should Be Visible   ${AFTER_DATEMENU}
    #Sleep  2s
    Click Element    ${AFTER_DATEBUTTON}
    Wait Until Page Contains Element    ${CHOSEN_AFTERDATE}
    #Sleep  2s
    Click Element   ${BEFORE_DROPDOWNICON}
    Element Should Be Visible   ${BEFORE_DATEMENU}
    #Sleep  2s
    Click Element    ${BEFORE_DATEBUTTON}
    Wait Until Page Contains Element    ${CHOSEN_BEFOREDATE}
    #Sleep  2s
    Click Element   ${DELETEDATE}
    Wait Until Page Contains Element    ${AFTER_DROPDOWNICON}
    Click Element   ${DELETEDATE}
    Wait Until Page Contains Element     ${BEFORE_DROPDOWNICON}
    #Sleep  2s

Filter by Latest Publication Date

    #---Select by after date---#
    Click Element   ${BYDATE_LIST}
    Wait Until Page Contains Element   ${BYDATE_LISTBOX}
    Click Element   ${LATESTPULICATIONDATE}
    Wait Until Page Contains Element    ${LATESTPULICATIONDATE}
    Click Element   ${AFTER_DROPDOWNICON}
    Element Should Be Visible   ${AFTER_DATEMENU}
    #Sleep  2s
    Click Element    ${AFTER_DATEBUTTON}
    Wait Until Page Contains Element    ${CHOSEN_AFTERDATE}
    #Sleep  2s
    Click Element   ${DELETEDATE}
    Wait Until Page Contains Element    ${AFTER_DROPDOWNICON}

    #---Select by before date---#
    Click Element   ${BEFORE_DROPDOWNICON}
    Element Should Be Visible   ${BEFORE_DATEMENU}
    #Sleep  2s
    Click Element    ${BEFORE_DATEBUTTON}
    Wait Until Page Contains Element    ${CHOSEN_BEFOREDATE}
    #Sleep  2s
    Click Element   ${DELETEDATE}
    Wait Until Page Contains Element     ${BEFORE_DROPDOWNICON}

    #---Select by both after and before date in latest publication date---#
    Click Element   ${AFTER_DROPDOWNICON}
    Element Should Be Visible   ${AFTER_DATEMENU}
    #Sleep  2s
    Click Element    ${AFTER_DATEBUTTON}
    Wait Until Page Contains Element    ${CHOSEN_AFTERDATE}
    #Sleep  2s
    Click Element   ${BEFORE_DROPDOWNICON}
    Element Should Be Visible   ${BEFORE_DATEMENU}
    #Sleep  2s
    Click Element    ${BEFORE_DATEBUTTON}
    Wait Until Page Contains Element    ${CHOSEN_BEFOREDATE}
    #Sleep  2s
    Click Element   ${DELETEDATE}
    Wait Until Page Contains Element    ${AFTER_DROPDOWNICON}
    Click Element   ${DELETEDATE}
    Wait Until Page Contains Element     ${BEFORE_DROPDOWNICON}


Filter by Product Creation Date Combined SKU Search

    #---Input SKU---#
    Wait Until Page Contains Element    ${SEARCHMENU}
    Input Text  ${SEARCHTEXT}   dcb7b357-c8f4-4042-b73c-92718f649313

    #---Chose product creation date in listbox---#
    Click Element   ${BYDATE_LIST}
    Wait Until Page Contains Element   ${BYDATE_LISTBOX}
    Click Element   ${PRODUCTCREATIONDATE}
    Wait Until Page Contains Element    ${PRODUCTCREATIONDATE}

    #---Chose after date---#
    Wait Until Page Contains    Product creation date
    Click Element   ${AFTER_DROPDOWNICON}
    Element Should Be Visible   ${AFTER_DATEMENU}
    #Sleep  2s
    Click Element    ${AFTER_DATEBUTTON}
    Wait Until Page Contains Element    ${CHOSEN_AFTERDATE}
    #Sleep  2s

    #---Chose before date---#
    Click Element   ${BEFORE_DROPDOWNICON}
    Element Should Be Visible   ${BEFORE_DATEMENU}
    #Sleep  2s
    Click Element    ${BEFORE_DATEBUTTON}
    Wait Until Page Contains Element    ${CHOSEN_BEFOREDATE}
    #Sleep  2s

    #----Search for result with above options---#
    Click Element   ${SEARCHMENU}
    #Sleep  2s
    Double Click Element   ${SEARCHTEXT}
    Press Keys  ${SEARCHTEXT}  CTRL+A+DELETE
    Click Element  ${SEARCHMENU}
    Wait Until Page Contains Element    ${SEARCHTEXT}
    Click Element   ${DELETEDATE}
    Wait Until Page Contains Element    ${AFTER_DROPDOWNICON}
    #Sleep  2s
    Click Element   ${DELETEDATE}
    Wait Until Page Contains Element     ${BEFORE_DROPDOWNICON}
    #Sleep  2s


Filter by Latest Publication Date Combined SKU Search

    #---Input SKU---#
    Wait Until Page Contains Element    ${SEARCHMENU}
    Input Text  ${SEARCHTEXT}   202d3e9e-f4fe-47d6-8907-a1c8a755122a

    #---Chose product creation date in listbox---#
    Click Element   ${BYDATE_LIST}
    Wait Until Page Contains Element   ${BYDATE_LISTBOX}
    Click Element   ${LATESTPULICATIONDATE}
    Wait Until Page Contains Element    ${LATESTPULICATIONDATE}

    #---Chose after date---#
    Click Element   ${AFTER_DROPDOWNICON}
    Element Should Be Visible   ${AFTER_DATEMENU}
    #Sleep  2s
    Click Element    ${AFTER_DATEBUTTON}
    Wait Until Page Contains Element    ${CHOSEN_AFTERDATE}
    #Sleep  2s

    #---Chose before date---#
    Click Element   ${BEFORE_DROPDOWNICON}
    Element Should Be Visible   ${BEFORE_DATEMENU}
    #Sleep  2s
    Click Element    ${BEFORE_DATEBUTTON}
    Wait Until Page Contains Element    ${CHOSEN_BEFOREDATE}
    #Sleep  2s

    #----Search for result with above options---#
    Click Element   ${SEARCHMENU}
    #Sleep  2s
    Double Click Element   ${SEARCHTEXT}
    Press Keys  ${SEARCHTEXT}  CTRL+A+DELETE
    Click Element  ${SEARCHMENU}
    Wait Until Page Contains Element    ${SEARCHTEXT}
    Click Element   ${DELETEDATE}
    Wait Until Page Contains Element    ${AFTER_DROPDOWNICON}
    Click Element   ${DELETEDATE}
    Wait Until Page Contains Element     ${BEFORE_DROPDOWNICON}
    Click Element   ${BYDATE_LIST}
    Wait Until Page Contains Element   ${BYDATE_LISTBOX}
    Click Element   ${PRODUCTCREATIONDATE}
    Wait Until Page Contains Element    ${PRODUCTCREATIONDATE}
    #Sleep  2s

Filter on Show All in Product Status
    Click Element   ${PRODUCTSTATUS_BUTTON}
    Element Should Be Visible   ${PRODUCTSTATUS_MENU}
    Click Element  ${SHOWALLPRODUCTSTATUS_OPTION}
    #Sleep  2s

Filter on Importing
    Click Element   ${PRODUCTSTATUS_BUTTON}
    Element Should Be Visible   ${PRODUCTSTATUS_MENU}
    Click Element  ${IMPORTING_OPTION}
    #Sleep  2s

Filter on In Progress
    Click Element   ${PRODUCTSTATUS_BUTTON}
    Element Should Be Visible   ${PRODUCTSTATUS_MENU}
    Click Element  ${INPROGRESS_OPTION}
    #Sleep  2s

Filter on Ready
    Click Element   ${PRODUCTSTATUS_BUTTON}
    Element Should Be Visible   ${PRODUCTSTATUS_MENU}
    Click Element  ${READY_OPTION}
    #Sleep  2s
    Click Element   ${PRODUCTSTATUS_BUTTON}
    Element Should Be Visible   ${PRODUCTSTATUS_MENU}
    Click Element  ${SHOWALLPRODUCTSTATUS_OPTION}
    #Sleep  2s

Filter on Show All in Text Status
    Click Element   ${TEXTSTATUS_BUTTON}
    Element Should Be Visible   ${TEXTSTATUS_MENU}
    Click Element  ${SHOWALLTEXTSTATUS_OPTION}
    #Sleep  2s

Filter on Needs Review
    Click Element   ${TEXTSTATUS_BUTTON}
    Element Should Be Visible   ${TEXTSTATUS_MENU}
    Click Element  ${NEEDSREVIEW_OPTION}
    #Sleep  2s
    #Page Should Contain Element   ${ORANGEEYE_ICON}

Filter on Approved
    Click Element   ${TEXTSTATUS_BUTTON}
    Element Should Be Visible   ${TEXTSTATUS_MENU}
    Click Element  ${APPROVED_OPTION}
    #Sleep  2s
    #Page Should Contain Element   ${GREENTICK_ICON}

Filter on Waiting to be Published
    Click Element   ${TEXTSTATUS_BUTTON}
    Element Should Be Visible   ${TEXTSTATUS_MENU}
    Click Element  ${WAITINGTOBEPUBLISHED_OPTION}
    #Sleep  2s
    #Page Should Contain Element   ${ORANGEHOURGLASS_ICON}

Filter on Published
    Click Element   ${TEXTSTATUS_BUTTON}
    Element Should Be Visible   ${TEXTSTATUS_MENU}
    Click Element  ${PUBLISHED_OPTION}
    #Sleep  2s
    #Page Should Contain Element   ${BLUEPAPERAEROPLANE_ICON}

End Web Test
    Close Browser