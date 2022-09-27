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
    Set Selenium Timeout   10s

Go To Web Page
    Go to   ${URL}
    Wait Until Page Contains   Try the new Copy Assistant from Textual

Log In User
    Input Text   ${mail}   regrtestaccount   #textualtest
    Input Text   ${password}   test987!
    Click Button   ${log_in_button}
    Wait Until Page Contains    What do you want to do today?

Access To Edit Page
    Wait Until Page Contains Element   ${edit_button}
    Click Element   ${edit_button}
    Wait Until Page Contains   Products

Search for SKU
    Wait Until Page Contains Element   ${product_list_search_button}
    Input Text   ${product_list_search_text_input}  dcb7b357-c8f4-4042-b73c-92718f649313
    Click Element   ${product_list_search_button}
    Double Click Element   ${product_list_search_text_input}
    Press Keys   ${product_list_search_text_input}  CTRL+A+DELETE
    Click Element   ${product_list_search_button}
    Wait Until Page Contains Element   ${product_list_search_text_input}

Filter by Product Creation Date
    #---Select by after date---#
    Click Element   ${product_list_filter_by_date_button}
    Wait Until Page Contains Element   ${product_list_filter_by_date_menu}
    Click Element   ${product_list_filter_by_date_product_creation_date_option}
    Wait Until Page Contains Element   ${product_list_filter_by_date_product_creation_date_option}
    Click Element   ${product_list_filter_by_date_after_dropdownicon_button}
    Element Should Be Visible   ${product_list_filter_by_date_after_datepicker}
    Click Element   ${product_list_filter_by_date_after_date_button}
    Wait Until Page Contains Element   ${product_list_filter_by_date_after_chosen_listbox}
    Click Element   ${product_list_filter_by_date_close_button}
    Wait Until Page Contains Element   ${product_list_filter_by_date_after_dropdownicon_button}

    #---Select by before date---#
    Click Element   ${product_list_filter_by_date_before_dropdownicon_button}
    Element Should Be Visible   ${product_list_filter_by_date_before_datepicker}
    Click Element   ${product_list_filter_by_date_before_date_button}
    Wait Until Page Contains Element   ${product_list_filter_by_date_before_chosen_listbox}
    Click Element   ${product_list_filter_by_date_close_button}
    Wait Until Page Contains Element   ${product_list_filter_by_date_before_dropdownicon_button}

    #---Select by both after and before date in product creation date---#
    Click Element   ${product_list_filter_by_date_after_dropdownicon_button}
    Element Should Be Visible   ${product_list_filter_by_date_after_datepicker}
    Click Element   ${product_list_filter_by_date_after_date_button}
    Wait Until Page Contains Element   ${product_list_filter_by_date_after_chosen_listbox}
    Click Element   ${product_list_filter_by_date_before_dropdownicon_button}
    Element Should Be Visible   ${product_list_filter_by_date_before_datepicker}
    Click Element   ${product_list_filter_by_date_before_date_button}
    Wait Until Page Contains Element   ${product_list_filter_by_date_before_chosen_listbox}
    Click Element   ${product_list_filter_by_date_close_button}
    Wait Until Page Contains Element   ${product_list_filter_by_date_after_dropdownicon_button}
    Click Element   ${product_list_filter_by_date_close_button}
    Wait Until Page Contains Element   ${product_list_filter_by_date_before_dropdownicon_button}

Filter by Latest Publication Date
    #---Select by after date---#
    Click Element   ${product_list_filter_by_date_button}
    Wait Until Page Contains Element   ${product_list_filter_by_date_menu}
    Click Element   ${product_list_filter_by_date_latest_publication_date_option}
    Wait Until Page Contains Element   ${product_list_filter_by_date_latest_publication_date_option}
    Click Element   ${product_list_filter_by_date_after_dropdownicon_button}
    Element Should Be Visible   ${product_list_filter_by_date_after_datepicker}
    Click Element   ${product_list_filter_by_date_after_date_button}
    Wait Until Page Contains Element   ${product_list_filter_by_date_after_chosen_listbox}
    Click Element   ${product_list_filter_by_date_close_button}
    Wait Until Page Contains Element   ${product_list_filter_by_date_after_dropdownicon_button}

    #---Select by before date---#
    Click Element   ${product_list_filter_by_date_before_dropdownicon_button}
    Element Should Be Visible   ${product_list_filter_by_date_before_datepicker}
    Click Element   ${product_list_filter_by_date_before_date_button}
    Wait Until Page Contains Element   ${product_list_filter_by_date_before_chosen_listbox}
    Click Element   ${product_list_filter_by_date_close_button}
    Wait Until Page Contains Element   ${product_list_filter_by_date_before_dropdownicon_button}

    #---Select by both after and before date in latest publication date---#
    Click Element   ${product_list_filter_by_date_after_dropdownicon_button}
    Element Should Be Visible   ${product_list_filter_by_date_after_datepicker}
    Click Element   ${product_list_filter_by_date_after_date_button}
    Wait Until Page Contains Element   ${product_list_filter_by_date_after_chosen_listbox}
    Click Element   ${product_list_filter_by_date_before_dropdownicon_button}
    Element Should Be Visible   ${product_list_filter_by_date_before_datepicker}
    Click Element   ${product_list_filter_by_date_before_date_button}
    Wait Until Page Contains Element   ${product_list_filter_by_date_before_chosen_listbox}
    Click Element   ${product_list_filter_by_date_close_button}
    Wait Until Page Contains Element   ${product_list_filter_by_date_after_dropdownicon_button}
    Click Element   ${product_list_filter_by_date_close_button}
    Wait Until Page Contains Element   ${product_list_filter_by_date_before_dropdownicon_button}

Filter by Product Creation Date Combined SKU Search
    #---Input SKU---#
    Wait Until Page Contains Element   ${product_list_search_button}
    Input Text   ${product_list_search_text_input}   dcb7b357-c8f4-4042-b73c-92718f649313

    #---Choose product creation date in listbox---#
    Click Element   ${product_list_filter_by_date_button}
    Wait Until Page Contains Element   ${product_list_filter_by_date_menu}
    Click Element   ${product_list_filter_by_date_product_creation_date_option}
    Wait Until Page Contains Element   ${product_list_filter_by_date_product_creation_date_option}

    #---Choose after date---#
    Wait Until Page Contains   Product creation date
    Click Element   ${product_list_filter_by_date_after_dropdownicon_button}
    Element Should Be Visible   ${product_list_filter_by_date_after_datepicker}
    Click Element   ${product_list_filter_by_date_after_date_button}
    Wait Until Page Contains Element   ${product_list_filter_by_date_after_chosen_listbox}

    #---Choose before date---#
    Click Element   ${product_list_filter_by_date_before_dropdownicon_button}
    Element Should Be Visible   ${product_list_filter_by_date_before_datepicker}
    Click Element   ${product_list_filter_by_date_before_date_button}
    Wait Until Page Contains Element   ${product_list_filter_by_date_before_chosen_listbox}

    #----Search for result with above options---#
    Click Element   ${product_list_search_button}
    Double Click Element   ${product_list_search_text_input}
    Press Keys   ${product_list_search_text_input}   CTRL+A+DELETE
    Click Element   ${product_list_search_button}
    Wait Until Page Contains Element   ${product_list_search_text_input}
    Click Element   ${product_list_filter_by_date_close_button}
    Wait Until Page Contains Element   ${product_list_filter_by_date_after_dropdownicon_button}
    Click Element   ${product_list_filter_by_date_close_button}
    Wait Until Page Contains Element   ${product_list_filter_by_date_before_dropdownicon_button}

Filter by Latest Publication Date Combined SKU Search
    #---Input SKU---#
    Wait Until Page Contains Element   ${product_list_search_button}
    Input Text   ${product_list_search_text_input}   202d3e9e-f4fe-47d6-8907-a1c8a755122a

    #---Choose latest publication date in listbox---#
    Click Element   ${product_list_filter_by_date_button}
    Wait Until Page Contains Element   ${product_list_filter_by_date_menu}
    Click Element   ${product_list_filter_by_date_latest_publication_date_option}
    Wait Until Page Contains Element   ${product_list_filter_by_date_latest_publication_date_option}

    #---Choose after date---#
    Wait Until Page Contains   Latest publication date
    Click Element   ${product_list_filter_by_date_after_dropdownicon_button}
    Element Should Be Visible   ${product_list_filter_by_date_after_datepicker}
    Click Element   ${product_list_filter_by_date_after_date_button}
    Wait Until Page Contains Element   ${product_list_filter_by_date_after_chosen_listbox}

    #---Choose before date---#
    Click Element   ${product_list_filter_by_date_before_dropdownicon_button}
    Element Should Be Visible   ${product_list_filter_by_date_before_datepicker}
    Click Element   ${product_list_filter_by_date_before_date_button}
    Wait Until Page Contains Element   ${product_list_filter_by_date_before_chosen_listbox}

    #----Search for result with above options---#
    Click Element   ${product_list_search_button}
    Double Click Element   ${product_list_search_text_input}
    Press Keys   ${product_list_search_text_input}   CTRL+A+DELETE
    Click Element   ${product_list_search_button}
    Wait Until Page Contains Element   ${product_list_search_text_input}

    Click Element   ${product_list_filter_by_date_close_button}
    Wait Until Page Contains Element   ${product_list_filter_by_date_after_dropdownicon_button}
    Click Element   ${product_list_filter_by_date_close_button}
    Wait Until Page Contains Element   ${product_list_filter_by_date_before_dropdownicon_button}
    Click Element   ${product_list_filter_by_date_button}
    Wait Until Page Contains Element   ${product_list_filter_by_date_menu}
    Click Element   ${product_list_filter_by_date_product_creation_date_option}
    Wait Until Page Contains Element   ${product_list_filter_by_date_product_creation_date_option}

Filter on Show All in Product Status
    Click Element   ${product_list_filter_product_status_button}
    Element Should Be Visible   ${product_list_filter_product_status_menu}
    Click Element   ${product_list_filter_product_status_show_all_option}


Filter on Importing
    Click Element   ${product_list_filter_product_status_button}
    Element Should Be Visible   ${product_list_filter_product_status_menu}
    Click Element   ${product_list_filter_product_status_importing_option}


Filter on In Progress
    Click Element   ${product_list_filter_product_status_button}
    Element Should Be Visible   ${product_list_filter_product_status_menu}
    Click Element   ${product_list_filter_product_status_in_progress_option}


Filter on Ready
    Click Element   ${product_list_filter_product_status_button}
    Element Should Be Visible   ${product_list_filter_product_status_menu}
    Click Element   ${product_list_filter_product_status_ready_option}
    Click Element   ${product_list_filter_product_status_button}
    Element Should Be Visible   ${product_list_filter_product_status_menu}
    Click Element   ${product_list_filter_product_status_show_all_option}


Filter on Show All in Text Status
    Click Element   ${product_list_filter_text_status_button}
    Element Should Be Visible   ${product_list_filter_text_status_menu}
    Click Element   ${product_list_filter_text_status_show_all_option}


Filter on Needs Review
    Click Element   ${product_list_filter_text_status_button}
    Element Should Be Visible   ${product_list_filter_text_status_menu}
    Click Element   ${product_list_filter_text_status_needs_review_option}


Filter on Approved
    Click Element   ${product_list_filter_text_status_button}
    Element Should Be Visible   ${product_list_filter_text_status_menu}
    Click Element   ${product_list_filter_text_status_approved_option}


Filter on Waiting to be Published
    Click Element   ${product_list_filter_text_status_button}
    Element Should Be Visible   ${product_list_filter_text_status_menu}
    Click Element   ${product_list_filter_text_status_waiting_to_be_published_option}


Filter on Published
    Click Element   ${product_list_filter_text_status_button}
    Element Should Be Visible   ${product_list_filter_text_status_menu}
    Click Element   ${product_list_filter_text_status_published_option}


End Web Test
    Close Browser