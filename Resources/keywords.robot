*** Keywords ***
Begin Web Test
    ${chrome_options}=  Evaluate  sys.modules['selenium.webdriver'].ChromeOptions()  sys, selenium.webdriver
    Call Method   ${chrome_options}   add_argument   test-type
    Call Method   ${chrome_options}   add_argument   --disable-extensions
    Call Method   ${chrome_options}   add_argument   --headless
    Call Method   ${chrome_options}   add_argument   --disable-gpu
    Call Method   ${chrome_options}   add_argument   --no-sandbox
    Call Method   ${chrome_options}   add_argument   --start-maximized
    Call Method   ${chrome_options}   add_argument   ${WINDOW}
    Create Webdriver   Chrome   chrome_options=${chrome_options}
    Set Selenium Timeout   10s      #${default_selenium_timeout} = Get Selenium Timeout
    #Set Selenium Speed   1s    ${default_selenium_speed} = Get Selenium Speed

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

Check Translation Status
    Wait Until Page Contains Element   ${product_list_filters_translation_status_show_all_option}
    Click Element   ${product_list_filters_translation_status_show_all_option}
    Wait Until Page Contains Element   ${product_list_filters_translation_status_missing_translations_option}
    Click Element   ${product_list_filters_translation_status_missing_translations_option}
    Wait Until Page Contains Element   ${product_list_filters_translation_status_show_all_option}
    Click Element   ${product_list_filters_translation_status_show_all_option}
    Wait Until Page Contains Element   ${product_list_filters_translation_status_complete_translations_option}
    Click Element   ${product_list_filters_translation_status_complete_translations_option}

Check Parent-Child Relations
    Wait Until Page Contains Element   ${product_list_filters_more_option}
    Click Element   ${product_list_filters_more_option}
    Wait Until Page Contains Element   ${product_list_filters_parent_child_option}
    Click Element   ${product_list_filters_parent_child_option}
    Wait Until Page Contains Element   ${product_list_filters_parent_child_relations_show_all_option}
    Click Element   ${product_list_filters_parent_child_relations_show_all_option}
    Wait Until Page Contains Element   ${product_list_filters_parent_child_relations_parents_option}
    Click Element   ${product_list_filters_parent_child_relations_parents_option}
    Wait Until Page Contains Element   ${product_list_filters_parent_child_relations_show_all_option}
    Click Element   ${product_list_filters_parent_child_relations_show_all_option}
    Wait Until Page Contains Element   ${product_list_filters_parent_child_relations_children_option}
    Click Element   ${product_list_filters_parent_child_relations_children_option}

Check Languages On Text Column
    Wait Until Page Contains Element   ${product_list_text_column_button}
    Click Element   ${product_list_text_column_button}
    Wait Until Page Contains Element   ${product_list_text_column_update_view_button}
    Click Element  ${product_list_text_column_update_view_button}
    Wait Until Page Contains Element   ${product_list_text_column_button}
    Click Element  ${product_list_text_column_button}
    Wait Until Page Contains Element   ${product_list_text_column_text&bullet_select_all_checkbox}
    Click Element   ${product_list_text_column_text&bullet_select_all_checkbox}
    Wait Until Page Contains Element   ${product_list_text_column_update_view_button}
    Scroll Element Into View   ${product_list_text_column_update_view_button}
    Click Element   ${product_list_text_column_update_view_button}

Column Select Options
    #---Set a combination of options in column---#
    Wait Until Page Contains Element   ${product_list_column_button}
    Click Element   ${product_list_column_button}
    Wait Until Page Contains Element   ${product_list_column_EAN_checkbox}
    Click Element   ${product_list_column_EAN_checkbox}
    Wait Until Page Contains Element   ${product_list_column_namespace_checkbox}
    Click Element   ${product_list_column_namespace_checkbox}
    Wait Until Page Contains Element   ${product_list_column_oiginal_text_checkbox}
    Scroll Element Into View   ${product_list_column_oiginal_text_checkbox}
    Click Element   ${product_list_column_oiginal_text_checkbox}
    Wait Until Page Contains Element   ${product_list_column_text_statuses_checkbox}
    Scroll Element Into View   ${product_list_column_text_statuses_checkbox}
    Click Element   ${product_list_column_text_statuses_checkbox}
    Wait Until Page Contains Element   ${product_list_column_product_checkbox}
    Scroll Element Into View   ${product_list_column_product_checkbox}
    Click Element   ${product_list_column_product_checkbox}
    Wait Until Page Contains Element   ${product_list_column_update_button}
    Scroll Element Into View   ${product_list_column_update_button}
    Click Element   ${product_list_column_update_button}

    #---Set namespace in column---#
    Wait Until Page Contains Element   ${textual_logo}
    Click Element   ${textual_logo}
    Wait Until Page Contains Element   ${edit_button}
    Click Element   ${edit_button}
    Wait Until Page Contains Element   ${product_list_column_button}
    Click Element   ${product_list_column_button}
    Wait Until Page Contains Element   ${product_list_column_namespace_checkbox}
    Click Element   ${product_list_column_namespace_checkbox}
    Wait Until Page Contains Element   ${product_list_column_update_button}
    Scroll Element Into View   ${product_list_column_update_button}
    Click Element   ${product_list_column_update_button}
    Page Should Contain   Namespace (Product Type)

    #---Set group children with parent in column---#
    Wait Until Page Contains Element   ${textual_logo}
    Click Element   ${textual_logo}
    Wait Until Page Contains Element   ${edit_button}
    Click Element   ${edit_button}
    Wait Until Page Contains Element   ${product_list_column_button}
    Click Element   ${product_list_column_button}
    Wait Until Page Contains Element   ${product_list_column_group_children_with_parent_checkbox}
    Scroll Element Into View   ${product_list_column_group_children_with_parent_checkbox}
    Click Element   ${product_list_column_group_children_with_parent_checkbox}
    Wait Until Page Contains Element   ${product_list_column_update_button}
    Click Element   ${product_list_column_update_button}

Create New Filter Group
    #---Create New Filter Group---#
    Wait Until Page Contains Element   ${product_list_filters_default_button}
    Click Element   ${product_list_filters_default_button}
    Wait Until Page Contains Element   ${product_list_filters_default_test}
    Click Element   ${product_list_filters_default_test}
    Wait Until Page Contains Element   ${product_list_filters_default_testtest}
    Click Element   ${product_list_filters_default_testtest}
    Wait Until Page Contains Element   ${product_list_filters_save_as_button}
    Click Element   ${product_list_filters_save_as_button}
    Input Text   ${product_list_filters_save_as_filter_group_input}  Demo
    Click Element   ${product_list_filters_save_as_filter_group_add}

    #---Create new filter---#
    Wait Until Page Contains Element   ${textual_logo}
    Click Element   ${textual_logo}
    Wait Until Page Contains Element   ${edit_button}
    Click Element   ${edit_button}
    Wait Until Page Contains Element   ${product_list_filters_default_button}
    Click Element   ${product_list_filters_default_button}
    Wait Until Page Contains Element   ${product_list_filters_default_test}
    Click Element   ${product_list_filters_default_test}
    Wait Until Page Contains Element   ${product_list_filters_default_testtest}
    Click Element   ${product_list_filters_default_testtest}
    Wait Until Page Contains Element   ${product_list_filters_save_as_button}
    Click Element   ${product_list_filters_save_as_button}
    Wait Until Page Contains Element   ${product_list_filters_save_as_choose_group_option}
    Click Element   ${product_list_filters_save_as_choose_group_option}
    Wait Until Page Contains Element   ${product_list_filters_save_as_choose_group_demo_option}
    Click Element   ${product_list_filters_save_as_choose_group_demo_option}
    Input Text   ${product_list_filters_save_as_filter_name_input}    Demo Test
    Wait Until Page Contains Element   ${product_list_filters_save_as_filter_name_create_filter_button}
    Click Element   ${product_list_filters_save_as_filter_name_create_filter_button}
    Wait Until Page Contains    View created successfully

End Web Test
    Close Browser