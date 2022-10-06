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
    Input Text  ${login_username_email_input}      regrtestaccount     #textualtest
    Input Text  ${login_password_input}  test987!
    Wait Until Page Contains Element  ${login_button}
    Click Element  ${login_button}

Access To Edit Page
    Wait Until Page Contains Element  ${customer_home_edit_button}
    Click Element  ${customer_home_edit_button}

Check Translation Status
    #---Show all option---#
    Wait Until Page Contains Element   ${product_list_filter_translation_status_button}
    Click Element   ${product_list_filter_translation_status_button}
    Element Should Be Visible   ${product_list_filter_translation_status_menu}
    Click Element   ${product_list_filter_translation_status_show_all_option}

    #---Missing translation option---#
    Click Element   ${product_list_filter_translation_status_button}
    Element Should Be Visible   ${product_list_filter_translation_status_menu}
    Click Element   ${product_list_filter_translation_status_missing_translations_option}

    #---Complete translation option---#
    Click Element   ${product_list_filter_translation_status_button}
    Element Should Be Visible   ${product_list_filter_translation_status_menu}
    Click Element   ${product_list_filter_translation_status_complete_translations_option}

Check Parent-Child Relations
    #---More options---#
    Click Element   ${product_list_filter_more_button}
    Element Should Be Visible   ${product_list_filter_more_menu}
    Click Element   ${product_list_filter_more_parent_child_option}

    #---Parent child relations show all option---#
    Click Element   ${product_list_filter_parent_child_button}
    Element Should Be Visible   ${product_list_filter_parent_child_menu}
    Click Element   ${product_list_filter_parent_child_relations_show_all_option}

    #---Parent child relations parents option---#
    Click Element   ${product_list_filter_parent_child_button}
    Element Should Be Visible   ${product_list_filter_parent_child_menu}
    Click Element   ${product_list_filter_parent_child_relations_parents_option}

    #---Parent child relations children option---#
    Click Element   ${product_list_filter_parent_child_button}
    Element Should Be Visible   ${product_list_filter_parent_child_menu}
    Click Element   ${product_list_filter_parent_child_relations_children_option}

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
    #---Set group children with parent in column---#
    Wait Until Page Contains Element   ${textual_logo}
    Click Element   ${textual_logo}
    Wait Until Page Contains Element   ${customer_home_edit_button}
    Click Element   ${customer_home_edit_button}
    Wait Until Page Contains Element   ${product_list_column_button}
    Click Element   ${product_list_column_button}
    Scroll Element Into View   ${product_list_column_group_children_with_parent_checkbox}
    Element Should Be Visible    ${product_list_column_group_children_with_parent_checkbox}
    Click Element   ${product_list_column_group_children_with_parent_checkbox}
    Wait Until Page Contains Element   ${product_list_column_update_button}
    Click Element   ${product_list_column_update_button}

    #---Set a combination of options in column---#
    Wait Until Page Contains Element   ${product_list_column_button}
    Click Element   ${product_list_column_button}
    Wait Until Page Contains Element   ${product_list_column_EAN_checkbox}
    Click Element   ${product_list_column_EAN_checkbox}
    Wait Until Page Contains Element   ${product_list_column_product_type_checkbox}
    Click Element   ${product_list_column_product_type_checkbox}
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
    Wait Until Page Contains Element   ${customer_home_edit_button}
    Click Element   ${customer_home_edit_button}
    Wait Until Page Contains Element   ${product_list_column_button}
    Click Element   ${product_list_column_button}
    Wait Until Page Contains Element   ${product_list_column_product_type_checkbox}
    Click Element   ${product_list_column_product_type_checkbox}
    Wait Until Page Contains Element   ${product_list_column_update_button}
    Scroll Element Into View   ${product_list_column_update_button}
    Click Element   ${product_list_column_update_button}
    Page Should Contain   Namespace (Product Type)

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
    Wait Until Page Contains Element   ${customer_home_edit_button}
    Click Element   ${customer_home_edit_button}
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

Edit on the product
    Sleep  2s
    Wait Until Page Contains Element   ${edit_list_edit_edit_button}
    Click Element   ${edit_list_edit_edit_button}
    Select Frame   ${edit_list_edit_frame_1}
    #Wait Until Page Contains Element   ${edit_list_action_button}
    #Click Element   ${edit_list_action_button}
    #Sleep  2s
    #Wait Until Page Contains Element   ${edit_list_new_button}
    #Click Element   ${edit_list_new_button}
    #Sleep  2s
    #Wait Until Page Contains Element   ${edit_list_action_button}
    #Click Element   ${edit_list_action_button}
    #Sleep  2s
    #Wait Until Page Contains Element   ${edit_list_duplicate_button}
    #Click Element   ${edit_list_duplicate_button}
    #Sleep  2s
    Wait Until Page Contains Element   ${edit_list_action_button}
    Click Element   ${edit_list_action_button}
    Sleep   2s
    Wait Until Page Contains Element   ${edit_list_copy_to_button}
    Click Element   ${edit_list_copy_to_button}
    #Wait Until Page Contains Element  ${edit_list_check_radiobutton}
    #Click Element   ${edit_list_check_radiobutton}
    #Select Frame   ${edit_list_edit_frame_2}
    Sleep   2s
    #Unselect Frame   ${edit_list_edit_frame_1}
    Wait Until Page Contains Element   ${edit_list_keyin_SKU_input}
    Input Text   ${edit_list_keyin_SKU_input}  dcb7b357-c8f4-4042-b73c-92718f649313
    Wait Until Page Contains Element   ${edit_list_set_status_copy_button}
    Click Element   ${edit_list_set_status_copy_button}
    Sleep   2s

End Web Test
    Close Browser


#Filter on Published
#    Click Element   ${product_list_filter_text_status_button}
#    Element Should Be Visible   ${product_list_filter_text_status_menu}
#    Click Element   ${product_list_filter_text_status_published_option}
