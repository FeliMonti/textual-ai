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

Check Translation Status
    Wait Until Page Contains Element  ${Translation_Status_Showall}
    Click Element  ${Translation_Status_Showall}
    Wait Until Page Contains Element  ${Translation_Status_Missing}
    Click Element  ${Translation_Status_Missing}
    Wait Until Page Contains Element  ${Translation_Status_Showall}
    Click Element  ${Translation_Status_Showall}
    Wait Until Page Contains Element  ${Translation_Status_Complete}
    Click Element  ${Translation_Status_Complete}

Check Parent-Child Relations
    Wait Until Page Contains Element  ${More_Button}
    Click Element  ${More_Button}
    Wait Until Page Contains Element  ${Parent_Child_Button}
    Click Element  ${Parent_Child_Button}
    Wait Until Page Contains Element  ${Parent-child_Relations_Showall}
    Click Element  ${Parent-child_Relations_Showall}
    Wait Until Page Contains Element  ${Parent-child_Relations_Parents}
    Click Element  ${Parent-child_Relations_Parents}
    Wait Until Page Contains Element  ${Parent-child_Relations_Showall}
    Click Element  ${Parent-child_Relations_Showall}
    Wait Until Page Contains Element  ${Parent-child_Relations_Children}
    Click Element  ${Parent-child_Relations_Children}

Check Languages On Text Column
    Sleep  2s
    Wait Until Page Contains Element  ${Text_Column_Button}
    Click Element  ${Text_Column_Button}
    Wait Until Page Contains Element  ${Update-view_Button}
    Click Element  ${Update-view_Button}
    Wait Until Page Contains Element  ${Text_Column_Button}
    Click Element  ${Text_Column_Button}
    Wait Until Page Contains Element  ${Text&Bullet_Select-all_Button}
    Click Element  ${Text&Bullet_Select-all_Button}
    Wait Until Page Contains Element  ${Update-view_Button}
    Scroll Element Into View  ${Update-view_Button}
    Click Element  ${Update-view_Button}

Column Select Options
    Sleep  2s
    Wait Until Page Contains Element  ${Column_Button}
    Click Element  ${Column_Button}
    Wait Until Page Contains Element  ${EAN_Checkbox}
    Click Element  ${EAN_Checkbox}
    Wait Until Page Contains Element  ${Namespace_Checkbox}
    Click Element  ${Namespace_Checkbox}
    Wait Until Page Contains Element  ${Oiginal-text_Checkbox}
    Scroll Element Into View  ${Oiginal-text_Checkbox}
    Click Element  ${Oiginal-text_Checkbox}
    Wait Until Page Contains Element  ${Text-statuses_Checkbox}
    Scroll Element Into View  ${Text-statuses_Checkbox}
    Click Element  ${Text-statuses_Checkbox}
    Wait Until Page Contains Element  ${Product_Checkbox}
    Scroll Element Into View  ${Product_Checkbox}
    Click Element  ${Product_Checkbox}
    Wait Until Page Contains Element  ${Update_Button}
    Scroll Element Into View  ${Update_Button}
    Click Element  ${Update_Button}

Create New Filter Group
    Sleep  2s
    Wait Until Page Contains Element  ${Default_Button}
    Click Element   ${Default_Button}
    Sleep  2s
    Wait Until Page Contains Element  ${Test_Button}
    Click Element   ${Test_Button}
    Sleep  2s
    Wait Until Page Contains Element  ${Testtest_Button}
    Click Element   ${Testtest_Button}
    Wait Until Page Contains Element  ${Save-as_Button}
    Click Element   ${Save-as_Button}
    Input Text  ${Save-as_Input}   Demo
    Click Element  ${Add_Button}
    Wait Until Page Contains Element    ${Textual_Button}
    Click Element  ${Textual_Button}
    Wait Until Page Contains Element  ${Edit_Button}
    Click Element  ${Edit_Button}
    Wait Until Page Contains Element  ${Default_Button}
    Click Element   ${Default_Button}
    Wait Until Page Contains Element  ${Test_Button}
    Click Element   ${Test_Button}
    Wait Until Page Contains Element  ${Testtest_Button}
    Click Element   ${Testtest_Button}
    Wait Until Page Contains Element  ${Save-as_Button}
    Click Element   ${Save-as_Button}
    Wait Until Page Contains Element  ${Choose-Filter-Group_Button}
    Click Element   ${Choose-Filter-Group_Button}
    Wait Until Page Contains Element  ${Demo_Button}
    Click Element   ${Demo_Button}
    Input Text  ${Filter-name_Input}    Demo Test
    Wait Until Page Contains Element  ${Create-filter_Button}
    Click Element   ${Create-filter_Button}
    Wait Until Page Contains    View created successfully

End Web Test
    Close Browser

