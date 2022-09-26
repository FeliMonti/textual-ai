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
    Input Text  ${mail}      regrtestaccount     #textualtest
    Input Text  ${password}  test987!
    Wait Until Page Contains Element  ${log_in_button}
    Click Element  ${log_in_button}

Access To Edit Page
    Wait Until Page Contains Element  ${edit_button}
    Click Element  ${edit_button}

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
    Sleep  2s
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
    Sleep  2s
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

Create New Filter Group
    Sleep  2s
    Wait Until Page Contains Element   ${product_list_filters_default_button}
    Click Element   ${product_list_filters_default_button}
    Sleep  2s
    Wait Until Page Contains Element   ${product_list_filters_default_test}
    Click Element   ${product_list_filters_default_test}
    Sleep  2s
    Wait Until Page Contains Element   ${product_list_filters_default_testtest}
    Click Element   ${product_list_filters_default_testtest}
    Wait Until Page Contains Element   ${product_list_filters_save_as_button}
    Click Element   ${product_list_filters_save_as_button}
    Input Text   ${product_list_filters_save_as_filter_group_input}  Demo
    Click Element   ${product_list_filters_save_as_filter_group_add}
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

Edit on the product
    Sleep  2s
    Wait Until Page Contains Element   ${edit_list_edit_edit_button}
    Click Element   ${edit_list_edit_edit_button}
    Select Frame   ${edit_list_edit_frame_1}
    Sleep  2s
    Wait Until Page Contains Element   ${edit_list_action_button}
    Click Element   ${edit_list_action_button}
    Sleep  2s
    Wait Until Page Contains Element   ${edit_list_new_button}
    Click Element   ${edit_list_new_button}
    Sleep  2s
    Wait Until Page Contains Element   ${edit_list_action_button}
    Click Element   ${edit_list_action_button}
    Sleep  2s
    Wait Until Page Contains Element   ${edit_list_duplicate_button}
    Click Element   ${edit_list_duplicate_button}
    Sleep  2s
    Wait Until Page Contains Element   ${edit_list_action_button}
    Click Element   ${edit_list_action_button}
    Sleep  2s
    Wait Until Page Contains Element   ${edit_list_copy_to_button}
    Click Element   ${edit_list_copy_to_button}
    #Wait Until Page Contains Element  ${edit_list_check_radiobutton}
    #Click Element   ${edit_list_check_radiobutton}
    Select Frame   ${edit_list_edit_frame_2}
    Wait Until Page Contains Element   ${edit_list_keyin_SKU_input}
    Input Text   ${edit_list_keyin_SKU_input}  6f83a69b-ebcd-4773-b5ea-68bb727143b0
    Sleep  2s


End Web Test
    Close Browser
