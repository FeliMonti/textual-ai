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

Begin Web Test Product List
    Begin Web Test
    Go To Web Page
    Log In User
    Access To Edit Page

Begin Web Test Edit List
    Begin Web Test
    Go To Web Page
    Log In User
    Access To Edit Page

Go To Web Page
    Go to   ${URL}
    Wait Until Page Contains   Try the new Copy Assistant from Textual

Log In User
    Input Text   ${login_username_email_input}    regrtestaccount   #textualtest
    Input Text   ${login_password_input}  test987!
    Click Button   ${login_button}
    Wait Until Page Contains    What do you want to do today?

Access To Edit Page
    Wait Until Page Contains Element   ${customer_home_edit_button}
    Click Element   ${customer_home_edit_button}
    Wait Until Page Contains   Products

Search for SKU
    Wait Until Page Contains Element   ${product_list_search_button}
    Input Text   ${product_list_search_text_input}   dcb7b357-c8f4-4042-b73c-92718f649313
    Click Element   ${product_list_search_button}
    Double Click Element   ${product_list_search_text_input}
    Press Keys   ${product_list_search_text_input}  CTRL+A+DELETE     # It only works for Window.
    #Clear Element Text   ${product_list_search_text_input}    #It doesn't work
    Click Element   ${product_list_search_button}
    Wait Until Page Contains Element   ${product_list_search_text_input}

Filter on After Date by Product Creation Date
    Click Element   ${product_list_filter_by_date_button}
    Wait Until Page Contains Element   ${product_list_filter_by_date_menu}
    Click Element   ${product_list_filter_by_date_product_creation_date_option}
    Wait Until Page Contains Element   ${product_list_filter_by_date_product_creation_date_option}
    Click Element   ${product_list_filter_by_date_after_button}
    Element Should Be Visible   ${product_list_filter_by_date_after_datepicker}
    Click Element   ${product_list_filter_by_date_after_date_button}
    Click Element   ${product_list_filter_by_date_close_button}
    Wait Until Page Contains Element   ${product_list_filter_by_date_after_button}

Filter on Before Date by Product Creation Date
    Click Element   ${product_list_filter_by_date_button}
    Wait Until Page Contains Element   ${product_list_filter_by_date_menu}
    Click Element   ${product_list_filter_by_date_product_creation_date_option}
    Wait Until Page Contains Element   ${product_list_filter_by_date_product_creation_date_option}
    Click Element   ${product_list_filter_by_date_before_button}
    Element Should Be Visible   ${product_list_filter_by_date_before_datepicker}
    Click Element   ${product_list_filter_by_date_before_date_button}
    Click Element   ${product_list_filter_by_date_close_button}
    Wait Until Page Contains Element   ${product_list_filter_by_date_before_button}

Filter on After and Before Date by Product Creation Date
    Click Element   ${product_list_filter_by_date_button}
    Wait Until Page Contains Element   ${product_list_filter_by_date_menu}
    Click Element   ${product_list_filter_by_date_product_creation_date_option}
    Wait Until Page Contains Element   ${product_list_filter_by_date_product_creation_date_option}
    Click Element   ${product_list_filter_by_date_after_button}
    Element Should Be Visible   ${product_list_filter_by_date_after_datepicker}
    Click Element   ${product_list_filter_by_date_after_date_button}
    Click Element   ${product_list_filter_by_date_before_button}
    Element Should Be Visible   ${product_list_filter_by_date_before_datepicker}
    Click Element   ${product_list_filter_by_date_before_date_button}
    Click Element   ${product_list_filter_by_date_close_button}
    Wait Until Page Contains Element   ${product_list_filter_by_date_after_button}
    Click Element   ${product_list_filter_by_date_close_button}
    Wait Until Page Contains Element   ${product_list_filter_by_date_before_button}

Filter on After Date by Latest Publication Date
    Click Element   ${product_list_filter_by_date_button}
    Wait Until Page Contains Element   ${product_list_filter_by_date_menu}
    Click Element   ${product_list_filter_by_date_latest_publication_date_option}
    Wait Until Page Contains Element   ${product_list_filter_by_date_latest_publication_date_option}
    Click Element   ${product_list_filter_by_date_after_button}
    Element Should Be Visible   ${product_list_filter_by_date_after_datepicker}
    Click Element   ${product_list_filter_by_date_after_date_button}
    Click Element   ${product_list_filter_by_date_close_button}
    Wait Until Page Contains Element   ${product_list_filter_by_date_after_button}

Filter on Before Date by Latest Publication Date
    Click Element   ${product_list_filter_by_date_button}
    Wait Until Page Contains Element   ${product_list_filter_by_date_menu}
    Click Element   ${product_list_filter_by_date_latest_publication_date_option}
    Wait Until Page Contains Element   ${product_list_filter_by_date_latest_publication_date_option}
    Click Element   ${product_list_filter_by_date_before_button}
    Element Should Be Visible   ${product_list_filter_by_date_before_datepicker}
    Click Element   ${product_list_filter_by_date_before_date_button}
    Click Element   ${product_list_filter_by_date_close_button}
    Wait Until Page Contains Element   ${product_list_filter_by_date_before_button}

Filter on After and Before Date by Latest Publication Date
    Click Element   ${product_list_filter_by_date_button}
    Wait Until Page Contains Element   ${product_list_filter_by_date_menu}
    Click Element   ${product_list_filter_by_date_latest_publication_date_option}
    Wait Until Page Contains Element   ${product_list_filter_by_date_latest_publication_date_option}
    Click Element   ${product_list_filter_by_date_after_button}
    Element Should Be Visible   ${product_list_filter_by_date_after_datepicker}
    Click Element   ${product_list_filter_by_date_after_date_button}
    Click Element   ${product_list_filter_by_date_before_button}
    Element Should Be Visible   ${product_list_filter_by_date_before_datepicker}
    Click Element   ${product_list_filter_by_date_before_date_button}
    Click Element   ${product_list_filter_by_date_close_button}
    Wait Until Page Contains Element   ${product_list_filter_by_date_after_button}
    Click Element   ${product_list_filter_by_date_close_button}
    Wait Until Page Contains Element   ${product_list_filter_by_date_before_button}

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
    Click Element   ${product_list_filter_by_date_after_button}
    Element Should Be Visible   ${product_list_filter_by_date_after_datepicker}
    Click Element   ${product_list_filter_by_date_after_date_button}

    #---Choose before date---#
    Click Element   ${product_list_filter_by_date_before_button}
    Element Should Be Visible   ${product_list_filter_by_date_before_datepicker}
    Click Element   ${product_list_filter_by_date_before_date_button}

    #----Search for result with above options---#
    Click Element   ${product_list_search_button}
    #Clear Element Text  ${product_list_search_text_input}    #It doesn't work
    Double Click Element   ${product_list_search_text_input}
    Press Keys   ${product_list_search_text_input}   CTRL+A+DELETE   #Only works for Window
    Click Element   ${product_list_search_button}
    Wait Until Page Contains Element   ${product_list_search_text_input}
    Click Element   ${product_list_filter_by_date_close_button}
    Wait Until Page Contains Element   ${product_list_filter_by_date_after_button}
    Click Element   ${product_list_filter_by_date_close_button}
    Wait Until Page Contains Element   ${product_list_filter_by_date_before_button}

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
    Click Element   ${product_list_filter_by_date_after_button}
    Element Should Be Visible   ${product_list_filter_by_date_after_datepicker}
    Click Element   ${product_list_filter_by_date_after_date_button}

    #---Choose before date---#
    Click Element   ${product_list_filter_by_date_before_button}
    Element Should Be Visible   ${product_list_filter_by_date_before_datepicker}
    Click Element   ${product_list_filter_by_date_before_date_button}

    #----Search for result with above options---#
    Click Element   ${product_list_search_button}
    #Clear Element Text  ${product_list_search_text_input}    #It doesn't work
    Double Click Element   ${product_list_search_text_input}
    Press Keys   ${product_list_search_text_input}   CTRL+A+DELETE   #Only works for Window
    Click Element   ${product_list_search_button}
    Wait Until Page Contains Element   ${product_list_search_text_input}

    Click Element   ${product_list_filter_by_date_close_button}
    Wait Until Page Contains Element   ${product_list_filter_by_date_after_button}
    Click Element   ${product_list_filter_by_date_close_button}
    Wait Until Page Contains Element   ${product_list_filter_by_date_before_button}
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
    Click Element   ${product_list_text_column_button}
    Element Should Be Visible   ${product_list_text_column_select_column}
    Wait Until Page Contains Element   ${product_list_text_column_text&bullet_select_all_checkbox}
    Click Element   ${product_list_text_column_text&bullet_select_all_checkbox}
    Scroll Element Into View   ${product_list_text_column_update_view_button}
    Element Should Be Visible    ${product_list_text_column_update_view_button}
    Click Element   ${product_list_text_column_update_view_button}

Set a combination of options in column
    Click Element   ${product_list_column_button}
    Element Should Be Visible  ${product_list_column_menu}
    Wait Until Page Contains Element   ${product_list_column_EAN_checkbox}
    Click Element   ${product_list_column_EAN_checkbox}
    Wait Until Page Contains Element   ${product_list_column_product_type_checkbox}
    Click Element   ${product_list_column_product_type_checkbox}
    Wait Until Page Contains Element   ${product_list_column_oiginal_text_checkbox}
    Click Element   ${product_list_column_oiginal_text_checkbox}
    Wait Until Page Contains Element   ${product_list_column_text_statuses_checkbox}
    Click Element   ${product_list_column_text_statuses_checkbox}
    Scroll Element Into View   ${product_list_column_product_checkbox}
    Wait Until Page Contains Element   ${product_list_column_product_checkbox}
    Click Element   ${product_list_column_product_checkbox}
    Scroll Element Into View   ${product_list_column_update_button}
    Wait Until Page Contains Element   ${product_list_column_update_button}
    Click Element   ${product_list_column_update_button}

Set namespace in column
    Click Element   ${textual_logo}
    Wait Until Page Contains Element   ${customer_home_edit_button}
    Click Element   ${customer_home_edit_button}
    Wait Until Page Contains Element   ${product_list_column_button}
    Click Element   ${product_list_column_button}
    Element Should Be Visible  ${product_list_column_product_type_checkbox}
    Click Element   ${product_list_column_product_type_checkbox}
    Scroll Element Into View   ${product_list_column_update_button}
    Wait Until Page Contains Element   ${product_list_column_update_button}
    Click Element   ${product_list_column_update_button}
    Page Should Contain   Namespace (Product Type)

Set group children with parent in column
    Click Element   ${textual_logo}
    Wait Until Page Contains Element   ${customer_home_edit_button}
    Click Element   ${customer_home_edit_button}
    Wait Until Page Contains Element   ${product_list_column_button}
    Click Element   ${product_list_column_button}
    Scroll Element Into View   ${product_list_column_group_children_with_parent_checkbox}
    Wait Until Page Contains Element   ${product_list_column_group_children_with_parent_checkbox}
    Click Element   ${product_list_column_group_children_with_parent_checkbox}
    Wait Until Page Contains Element   ${product_list_column_update_button}
    Click Element   ${product_list_column_update_button}

Select Existing Filter
    Wait Until Page Contains Element  ${product_list_filter_default_button}
    Click Element   ${product_list_filter_default_button}
    Wait Until Page Contains Element    ${product_list_filter_default_menu}
    Element Should Be Visible   ${product_list_filter_default_test}
    Click Element   ${product_list_filter_default_test}
    Scroll Element Into View   ${product_list_filter_default_testtest}
    Wait Until Page Contains Element   ${product_list_filter_default_testtest}
    Click Element   ${product_list_filter_default_testtest}

Create A New Filter Group
    [Arguments]    ${group_name}
    Wait Until Page Contains Element   ${product_list_filter_save_as_button}
    Click Element   ${product_list_filter_save_as_button}
    Input Text   ${product_list_filter_save_as_filter_group_input}  ${group_name}
    Click Element   ${product_list_filter_save_as_filter_group_add}

Create A New Filter
    [Arguments]   ${filter_name}
    Input Text   ${product_list_filter_save_as_filter_name_input}  ${filter_name}
    Wait Until Page Contains Element   ${product_list_filter_save_as_filter_name_create_filter_button}
    Click Element   ${product_list_filter_save_as_filter_name_create_filter_button}
    Wait Until Page Contains    View created successfully  # Filter created successfully

Delete A Filter Group
    [Arguments]    ${group_name}
    Click Element   ${product_list_menu}
    Element Should Be Visible   ${product_list_menu_dropdown}
    Wait Until Page Contains Element   ${product_list_menu_dropdown_manage}
    Click Element   ${product_list_menu_dropdown_manage}
    Select Frame   ${edit_list_subpage_iframe}
    Wait Until Page Contains Element   ${product_list_menu_dropdown_manage_filter_groups}
    Click Element   ${product_list_menu_dropdown_manage_filter_groups}
    Wait Until Page Contains Element    xpath://*[contains(text(),"${group_name}")]/../..//button[contains(text(), "Delete")]   #${product_list_menu_dropdown_manage_filter_groups_delete}
    Click Element   xpath://*[contains(text(),"${group_name}")]/../..//button[contains(text(), "Delete")]  #${product_list_menu_dropdown_manage_filter_groups_delete}
    Handle Alert
    Wait Until Page Contains    Filter group removed successfully

Enter Edit Subpage Frame With Edit Button 1
    Wait Until Page Contains Element   ${product_list_data_table edit_button_1}
    Click Element   ${product_list_data_table edit_button_1}
    Select Frame    ${edit_list_subpage_iframe}
    Wait Until Page Contains Element   ${edit_list_edit_tab}
    Click Element   ${edit_list_edit_tab}

Enter Edit Subpage Frame With Edit Button 3
    Wait Until Page Contains Element   ${product_list_data_table edit_button_3}
    Scroll Element Into View   ${product_list_data_table edit_button_3}
    Click Element   ${product_list_data_table edit_button_3}
    Select Frame    ${edit_list_subpage_iframe}
    Wait Until Page Contains Element   ${edit_list_edit_tab}
    Click Element   ${edit_list_edit_tab}

Access To Edit Subpage Frame
    Wait Until Page Contains Element   ${product_list_data_table_edit_button_3}
    Scroll Element Into View   ${product_list_data_table_edit_button_3}
    Click Element   ${product_list_data_table_edit_button_3}
    Select Frame    ${edit_list_subpage_iframe}
    Wait Until Page Contains Element   ${edit_list_edit_tab}
    Click Element   ${edit_list_edit_tab}

Exit Edit Subpage Frame
    Unselect Frame
    Wait Until Page Contains Element  ${edit_list_subpage_back_button}
    Click Element   ${edit_list_subpage_back_button}

Test On Action Button New Function
    Sleep  2s
    Wait Until Page Contains Element   ${edit_list_SKU_number}
    ${get_SKU_1}=  Get Text  ${edit_list_SKU_number}
    Wait Until Page Contains Element   ${edit_list_actions_button}
    Click Element   ${edit_list_actions_button}
    Wait Until Page Contains Element   ${edit_list_actions_menu}
    Wait Until Page Contains Element   ${edit_list_actions_new_button}
    Click Element   ${edit_list_actions_new_button}
    ${get_SKU_2}=  Get Text  ${edit_list_SKU_number}
    Log   ${get_SKU_1}
    Log   ${get_SKU_2}
    Should Be True  "${get_SKU_1}" != "${get_SKU_2}"
    Exit Edit Subpage Frame

Test On Deleting A Product
    Wait Until Page Contains Element  ${edit_list_data_table_checkbox_1}
    Scroll Element Into View   ${edit_list_data_table_checkbox_1}
    Click Element  ${edit_list_data_table_checkbox_1}
    ${SKU_number}    Get Text    ${edit_list_data_table_SKU_1}
    Log    ${SKU_number}
    Wait Until Page Contains Element  ${edit_list_bulk_actions_button}
    Click Element  ${edit_list_bulk_actions_button}
    Wait Until Page Contains Element   ${edit_list_bulk_actions_menu}
    Wait Until Page Contains Element   ${edit_list_bulk_actions_menu_product}
    Click Element   ${edit_list_bulk_actions_menu_product}
    Scroll Element Into View  ${edit_list_bulk_actions_menu_product_delete_products}
    Wait Until Page Contains Element   ${edit_list_bulk_actions_menu_product_delete_products}
    Click Element   ${edit_list_bulk_actions_menu_product_delete_products}
    Sleep  2s
    Wait Until Page Contains Element  ${edit_list_bulk_actions_menu_product_delete_products_button}
    Click Element   ${edit_list_bulk_actions_menu_product_delete_products_button}

Test On Action Button Duplicate Function
    Wait Until Page Contains Element   ${product_list_data_table_edit_button_3}
    Click Element   ${product_list_data_table_edit_button_3}
    Select Frame    ${edit_list_subpage_iframe}
    Wait Until Page Contains Element   ${edit_list_SKU_number}
    ${get_SKU_1}=  Get Text  ${edit_list_SKU_number}
    Log   ${get_SKU_1}
    Wait Until Page Contains Element   ${edit_list_additional_information_button}
    Click Element   ${edit_list_additional_information_button}
    Wait Until Page Contains Element   ${edit_list_original_text_ruta}
    Click Element   ${edit_list_original_text_ruta}
    Input Text   ${edit_list_original_text_ruta}    Testing makes perfect!
    Sleep  2s
    Click Element   ${edit_list_actions_button}
    Element Should Be Visible   ${edit_list_actions_menu}
    Wait Until Page Contains Element   ${edit_list_actions_duplicate_button}
    Click Element   ${edit_list_actions_duplicate_button}
    Wait Until Page Contains Element   ${edit_list_SKU_number}
    ${get_SKU_2}=  Get Text  ${edit_list_SKU_number}
    Log   ${get_SKU_2}
    Exit Edit Subpage Frame
    Wait Until Page Contains Element  ${product_list_column_button}
    Click Element   ${product_list_column_button}
    Element Should Be Visible  ${product_list_column_menu}
    Wait Until Page Contains Element   ${product_list_column_oiginal_text_checkbox}
    Click Element   ${product_list_column_oiginal_text_checkbox}
    Scroll Element Into View   ${product_list_column_update_button}
    Wait Until Page Contains Element   ${product_list_column_update_button}
    Click Element   ${product_list_column_update_button}
    Wait Until Page Contains Element   ${edit_list_data_table_original_text_1}
    ${original_text_column_1}    Get Text    ${edit_list_data_table_original_text_1}
    Log    ${original_text_column_1}
    ${original_text_column_4}    Get Text    ${edit_list_data_table_original_text_4}
    Log    ${original_text_column_4}
    Should Be True  "${original_text_column_1}" == "${original_text_column_4}"

Test On Action Button Copy From Function
    #[Arguments]    ${INPUT}
    Enter Edit Subpage Frame With Edit Button 3
    Wait Until Page Contains Element   ${edit_list_SKU_number}
    ${get_SKU_1}=  Get Text  ${edit_list_SKU_number}
    Log   ${get_SKU_1}
    Test On Attribute Column
    Exit Edit Subpage Frame
    Enter Edit Subpage Frame With Edit Button 1
    Wait Until Page Contains Element   ${edit_list_actions_button}
    Click Element   ${edit_list_actions_button}
    Element Should Be Visible   ${edit_list_actions_menu}
    Click Element   ${edit_list_actions_copy_from_button}
    Wait Until Page Contains Element   ${edit_list_SKU_EAN_input}
    Input Text   ${edit_list_SKU_EAN_input}   ${get_SKU_1}
    Wait Until Page Contains Element   ${edit_list_actions_copy_from_copy_button}
    Click Element  ${edit_list_actions_copy_from_copy_button}
#    Sleep  2s
#    Wait Until Page Contains Element   ${edit_list_subpart_attribute_input}
#    Log  ${edit_list_subpart_attribute_input}
    Wait Until Page Contains Element   ${edit_list_subpart_attribute_new_attribute_selected}
    ${attribute}   Get Text   ${edit_list_subpart_attribute_new_attribute_selected}
    Log   ${attribute}
    #${input}  Get Text  xpath://div[@class="vocabulary-lookup"]//*[contains(text(), "${input}")]
    #Wait Until Page Contains Element   xpath://div[@class="vocabulary-lookup"]//*[contains(text(), "${input}")]
    #Log  ${INPUT}
#    Exit Edit Subpage Frame
#    Enter Edit Subpage Frame With Edit Button 1
#    Wait Until Page Contains Element   ${edit_list_subpart_attribute_input}
#    ${attribute}   Get Value   ${edit_list_subpart_attribute_input}
#    Should Be True   "${attribute}" == "${input}"

Test On Action Button Copy To Function
    Wait Until Page Contains Element   ${edit_list_data_table_SKU_4}
    ${SKU_number_4}    Get Text    ${edit_list_data_table_SKU_4}
    Log    ${SKU_number_4}
    Wait Until Page Contains Element   ${product_list_data_table_edit_button_1}
    Click Element   ${product_list_data_table_edit_button_1}
    Select Frame    ${edit_list_subpage_iframe}
    Wait Until Page Contains Element  ${edit_list_actions_button}
    Click Element   ${edit_list_actions_button}
    Element Should Be Visible   ${edit_list_actions_menu}
    Wait Until Page Contains Element   ${edit_list_actions_copy_to_button}
    Click Element   ${edit_list_actions_copy_to_button}
    Wait Until Page Contains Element   ${edit_list_SKU_EAN_input}
    Input Text   ${edit_list_SKU_EAN_input}   ${SKU_number_4}
    Wait Until Page Contains Element   ${edit_list_actions_copy_to_copy_button}
    Click Element  ${edit_list_actions_copy_to_copy_button}
    Unselect Frame
    Click Element   ${edit_list_subpage_back_button}
    Wait Until Page Contains Element   ${edit_list_data_table_original_text_1}
    ${original_text_column_1}    Get Text    ${edit_list_data_table_original_text_1}
    Log    ${original_text_column_1}
    ${original_text_column_4}    Get Text    ${edit_list_data_table_original_text_4}
    Log    ${original_text_column_4}
    Should Be True  "${original_text_column_1}" == "${original_text_column_4}"

Test On Setting importing Status
    Wait Until Page Contains Element   ${edit_list_set_status_button}
    Click Element   ${edit_list_set_status_button}
    Wait Until Page Contains Element   ${edit_list_set_status_menu}
    Wait Until Page Contains Element   ${edit_list_set_status_importing_radiobutton}
    Click Element   ${edit_list_set_status_importing_radiobutton}
    Wait Until Page Contains   Switching status to "Importing" will result in that all tags added in Textual will be lost. This is not possible to undo. Please confirm to proceed.
    Wait Until Page Contains Element   ${edit_list_set_status_importing_cancel_button}
    Click Element   ${edit_list_set_status_importing_cancel_button}

Test On Setting Ready Status
    Wait Until Page Contains Element   ${edit_list_set_status_button}
    Click Element   ${edit_list_set_status_button}
    Wait Until Page Contains Element  ${edit_list_set_status_menu}
    Wait Until Page Contains Element   ${edit_list_set_status_ready_radiobutton}
    Click Element   ${edit_list_set_status_ready_radiobutton}
    Wait Until Page Contains   This product is marked as ready.
    Unselect Frame
    Wait Until Page Contains Element  ${edit_list_subpage_back_button}
    Click Element   ${edit_list_subpage_back_button}

Test On Setting In-progress Status
    Wait Until Page Contains Element  ${edit_list_data_table_product_status_column}
    Click Element  ${edit_list_data_table_product_status_column}
    ${product_status_column_1}  Get Text  ${edit_list_data_table_product_status_column_1}
    Run Keyword If   "${product_status_column_1}" == "Ready"   Log   ${product_status_column_1}
    Click Element   ${product_list_data_table_edit_button_1}
    Select Frame    ${edit_list_subpage_iframe}
    Wait Until Page Contains Element   ${edit_list_set_status_button}
    Click Element   ${edit_list_set_status_button}
    Wait Until Page Contains Element  ${edit_list_set_status_menu}
    Mouse Over   ${edit_list_set_status_button}
    Wait Until Page Contains Element   ${edit_list_set_status_in_progress_radiobutton}
    Click Element   ${edit_list_set_status_in_progress_radiobutton}
    Wait Until Page Contains Element   ${edit_list_set_status_in_progress_status}
    Unselect Frame
    Wait Until Page Contains Element  ${edit_list_subpage_back_button}
    Click Element   ${edit_list_subpage_back_button}

Test On Main Category
    #---search---#
    Wait Until Page Contains Element   ${edit_list_main_category_input}
    Wait Until Element Is Visible   ${edit_list_main_category_input}
    Sleep  1s
    ${main_category_input}=  Generate Random String  length=8  chars=[LETTERS][NUMBERS]
    Input Text  ${edit_list_main_category_input}  ${main_category_input}
    Wait Until Page Contains Element   ${edit_list_suggestions_container}   #${edit_list_main_category_sugestions_container}
    #---request---#
    Wait Until Page Contains Element   ${edit_list_request_button}
    Click Element   ${edit_list_request_button}
    Wait Until Page Contains Element   ${edit_list_request_submit_button}
    Click Element   ${edit_list_request_submit_button}
    #---add---#
    Wait Until Page Contains Element   ${edit_list_main_category_product_request_submit_value}
    #Sleep  1s
    Wait Until Element Contains   ${edit_list_main_category_product_request_submit_value}   ${main_category_input}
    Delete Main Category

Test On Label
    Add Label
    Remove Label

Test On Name
    Add Name

Test On Original Text And Headline On the Same Page
    Add Original Text And Headline On the Same Page


#Add Main Category      #with specified text
#    Wait Until Page Contains Element   ${edit_list_main_category_input}
#    Wait Until Element Is Visible   ${edit_list_main_category_input}
#    Sleep  1s
#    Input Text  ${edit_list_main_category_input}  shoes
#    Wait Until Page Contains Element   ${edit_list_suggestions_container}   #${edit_list_main_category_sugestions_container}
#    Wait Until Page Contains Element  ${edit_list_main_category_menu_item_suggestion_item}
#    Click Element   ${edit_list_main_category_menu_item_suggestion_item}
#    Wait Until Page Contains Element   ${edit_list_main_category_product_selected_value}

Delete Main Category
    Wait Until Element Is Visible   ${edit_list_main_category_input}
    Sleep  1s
    Input Text  ${edit_list_main_category_input}  shoes
    Wait Until Page Contains Element   ${edit_list_main_category_sugestions_container}
    Wait Until Element Is Visible  ${edit_list_main_category_menu_item_suggestion_item}
    Click Element   ${edit_list_main_category_menu_item_suggestion_item}
    Wait Until Page Contains Element   ${edit_list_main_category_product_selected_value}
    Click Element  ${edit_list_main_category_close_icon}
    Wait Until Page Contains Element   ${edit_list_main_category_input}
    Wait Until Page Contains Element   ${edit_list_main_category_edit_filed_product}

Add Properties
    Wait Until Page Contains Element   ${input_selector}
    Input Text   ${input_selector}  ${input}
    Wait Until Page Contains Element   ${edit_list_suggestions_container}
    Wait Until Page Contains Element   xpath://div[@class="vocabulary-lookup"]//*[contains(text(), "${input}")]
    Click Element   xpath://div[@class="vocabulary-lookup"]//*[contains(text(), "${input}")]
    Sleep   1s
    Wait Until Page Contains   ${input}
    Wait Until Page Contains Element   ${edit_list_delete_icon}
    Click Element   ${edit_list_delete_icon}
    Wait Until Page Contains Element  ${input_selector}

Add Label
    Wait Until Page Contains Element   ${edit_list_labels_input}
    ${label_input}=  Generate Random String  length=8  chars=[LETTERS][NUMBERS]
    Input Text   ${edit_list_labels_input}  ${label_input}
    Wait Until Page Contains Element    ${edit_list_labels_add_item}
    Click Element   ${edit_list_labels_add_item}
    Wait Until Page Contains   ${label_input}

Remove Label
    Click Element   ${edit_list_labels_delete_icon}
    Wait Until Page Contains Element   ${edit_list_labels_input}

Add Name
    Wait Until Page Contains Element   ${edit_list_name_input}
    ${name_input}=  Generate Random String  length=8  chars=[LETTERS][NUMBERS]
    Input Text   ${edit_list_name_input}  ${name_input}
    Unselect Frame
    Click Element   ${edit_list_subpage_back_button}
    Wait Until Page Contains Element   ${product_list_data_table_edit_button_3}
    Click Element   ${product_list_data_table_edit_button_3}
    Select Frame    ${edit_list_subpage_iframe}
    Wait Until Page Contains Element   ${edit_list_name_input}
    ${name_verify}   Get Value   ${edit_list_name_input}
    Should Be True   "${name_verify}" == "${name_input}"

Add Original Text And Headline On the Same Page
    Wait Until Page Contains Element   ${edit_list_additional_information_column}
    Click Element   ${edit_list_additional_information_column}
    Wait Until Page Contains Element   ${edit_list_original_headline_input}
    ${original_headline_input}=  Generate Random String  length=8  chars=[LETTERS][NUMBERS]
    Input Text   ${edit_list_original_headline_input}   ${original_headline_input}
    ${original_text_input}=  Generate Random String  length=8  chars=[LETTERS][NUMBERS]
    Wait Until Page Contains Element   ${edit_list_original_text_textarea}
    Input Text   ${edit_list_original_text_textarea}   ${original_text_input}
    Unselect Frame
    Click Element   ${edit_list_subpage_back_button}
    Wait Until Page Contains Element   ${product_list_data_table_edit_button_3}
    Click Element   ${product_list_data_table_edit_button_3}
    Select Frame    ${edit_list_subpage_iframe}
    Wait Until Page Contains Element   ${edit_list_additional_information_column}
    Click Element   ${edit_list_additional_information_column}
    Wait Until Page Contains Element  ${edit_list_original_headline_input}
    Wait Until Page Contains Element  ${edit_list_original_text_textarea}
    ${original_headline_verify}   Get Value   ${edit_list_original_headline_input}
    Should Be True   "${original_headline_verify}" == "${original_headline_input}"
    ${original_text_verify}  Get Text  ${edit_list_original_text_textarea}
    Should Be True   "${original_text_verify}" == "${original_text_input}"

Test On Attribute Column
    #---display subpart on attribute---#
    Wait Until Page Contains Element   ${edit_list_edit_field_add}
    Sleep  1s
    Click Element   ${edit_list_edit_field_add}
    Wait Until Page Contains Element   ${edit_list_subpart_attribute_input}
    #Wait Until Page Contains Element  ${edit_list_subpart_attribute_new_attribute}
    Wait Until Element Contains   ${edit_list_subpart_attribute_new_attribute}  new attribute
    #---search---#
    Wait Until Page Contains Element   ${edit_list_subpart_attribute_input}
    ${attribute_input}=  Generate Random String  length=8  chars=[LETTERS][NUMBERS]
    Input Text   ${edit_list_subpart_attribute_input}   ${attribute_input}
    Log   ${attribute_input}
    Wait Until Page Contains Element   ${edit_list_suggestions_container}
    #---request---#
    Wait Until Page Contains Element   ${edit_list_request_button}
    Click Element   ${edit_list_request_button}
    Wait Until Page Contains Element   ${edit_list_request_submit_button}
    Click Element   ${edit_list_request_submit_button}
    #---add---#
    Wait Until Page Contains Element   ${edit_list_subpart_attribute_input}
    Wait Until Page Contains Element   ${edit_list_subpart_attribute_new_attribute_selected_value}    timeout=5s
    Sleep  1s
    Wait Until Element Contains   ${edit_list_subpart_attribute_new_attribute_selected_value}   ${attribute_input}

Delete Attribute
    Click Element   ${edit_list_subpart_attribute_close_icon}
    Wait Until Page Contains Element  ${edit_list_subpart_attribute_input}

Test On Field
    [Arguments]    ${input_selector}
    #---search---#
    Wait Until Page Contains Element   ${input_selector}
    Wait Until Element Is Visible   ${input_selector}  timeout=5s
    #Sleep   1s  # without this we get InvalidElementStateException: Message: invalid element state: Element is not currently interactable and may not be manipulated
    ${input}=  Generate Random String  length=8  chars=[LETTERS][NUMBERS]
    Input Text   ${input_selector}  ${input}
    Log  ${input}
    Wait Until Page Contains Element   ${edit_list_suggestions_container}
    #---request---#
    Wait Until Page Contains Element   ${edit_list_request_button}
    Click Element   ${edit_list_request_button}
    Wait Until Page Contains Element   ${edit_list_request_submit_button}
    Click Element   ${edit_list_request_submit_button}
    Wait Until Page Contains Element   ${edit_list_delete_icon}
    Click Element   ${edit_list_delete_icon}
    #---add---#
    Wait Until Page Contains Element   ${input_selector}
    Input Text   ${input_selector}  ${input}
    Wait Until Page Contains Element   ${edit_list_suggestions_container}
    Wait Until Page Contains Element   xpath://div[@class="vocabulary-lookup"]//*[contains(text(), "${input}")]
    Wait Until Element Is Visible   xpath://div[@class="vocabulary-lookup"]//*[contains(text(), "${input}")]    #timeout=5s
    Sleep  1s   #without this sometimes we get--element is not attached to the page document
    Click Element  xpath://div[@class="vocabulary-lookup"]//*[contains(text(), "${input}")]
    Wait Until Page Contains  ${input}
    #---delete---#
    Wait Until Page Contains Element   ${edit_list_delete_icon}
    Wait Until Element Is Visible   ${edit_list_delete_icon}   timeout=5s
    #Sleep  1s   #without this sometimes we get-- Element 'xpath://*[@data-testid="tag-remove"]' did not appear in 10 seconds.
    Click Element   ${edit_list_delete_icon}
    Wait Until Page Contains Element  ${input_selector}

Add Item Into Fields
    [Arguments]     ${input_selector}
    #---search---#
    Wait Until Page Contains Element   ${input_selector}
    Sleep   1s  # without this we get InvalidElementStateException: Message: invalid element state: Element is not currently interactable and may not be manipulated
    ${INPUT}=  Generate Random String  length=8  chars=[LETTERS][NUMBERS]
    Input Text   ${input_selector}  ${INPUT}
    Log  ${INPUT}
    Wait Until Page Contains Element   ${edit_list_suggestions_container}
    #---request---#
    Wait Until Page Contains Element   ${edit_list_request_button}
    #Element Should Be Visible   ${edit_list_request_button}
    Click Element   ${edit_list_request_button}
    Wait Until Page Contains Element   ${edit_list_request_submit_button}
    Click Element   ${edit_list_request_submit_button}
    Wait Until Page Contains Element   ${edit_list_delete_icon}
    Click Element   ${edit_list_delete_icon}
    #---add---#
    Wait Until Page Contains Element   ${input_selector}
    Input Text   ${input_selector}  ${INPUT}
    Wait Until Page Contains Element   ${edit_list_suggestions_container}
    Wait Until Page Contains Element   xpath://div[@class="vocabulary-lookup"]//*[contains(text(), "${INPUT}")]
    Click Element   xpath://div[@class="vocabulary-lookup"]//*[contains(text(), "${INPUT}")]

Delete Item From Fields
    Wait Until Page Contains   ${input}
    Wait Until Page Contains Element   ${edit_list_delete_icon}
    Click Element   ${edit_list_delete_icon}
    Wait Until Page Contains Element  ${input_selector}


#Add Item Into Fields
#    [Arguments]     ${input_selector}
#    [Return]   ${input}
#    #---search---#
#    Wait Until Page Contains Element   ${input_selector}
#    Sleep   1s  # without this we get InvalidElementStateException: Message: invalid element state: Element is not currently interactable and may not be manipulated
#    ${input}=  Generate Random String  length=8  chars=[LETTERS][NUMBERS]
#    Input Text   ${input_selector}  ${input}
#    Log  ${input}
#    Wait Until Page Contains Element   ${edit_list_suggestions_container}
#    #---request---#
#    Wait Until Page Contains Element   ${edit_list_request_button}
#    #Element Should Be Visible   ${edit_list_request_button}
#    Click Element   ${edit_list_request_button}
#    Wait Until Page Contains Element   ${edit_list_request_submit_button}
#    Click Element   ${edit_list_request_submit_button}
#    Wait Until Page Contains Element   ${edit_list_delete_icon}
#    Click Element   ${edit_list_delete_icon}
#    #---add---#
#    Wait Until Page Contains Element   ${input_selector}
#    Input Text   ${input_selector}  ${input}
#    Wait Until Page Contains Element   ${edit_list_suggestions_container}
#    Wait Until Page Contains Element   xpath://div[@class="vocabulary-lookup"]//*[contains(text(), "${input}")]
#    Click Element   xpath://div[@class="vocabulary-lookup"]//*[contains(text(), "${input}")]


# Test On Properties Column
#     #---search---#
#     Wait Until Page Contains Element   ${edit_list_properties_input}
#     ${properties_input}=  Generate Random String  length=8  chars=[LETTERS][NUMBERS]
#     Input Text   ${edit_list_properties_input}  ${properties_input}
#     Wait Until Page Contains Element   ${edit_list_suggestions_container}
#     #---request---#
#     Wait Until Page Contains Element   ${edit_list_request_button}
#     #Element Should Be Visible   ${edit_list_request_button}
#     Click Element   ${edit_list_request_button}
#     Wait Until Page Contains Element   ${edit_list_request_submit_button}
#     Click Element   ${edit_list_request_submit_button}
#     #---add---#
#     Wait Until Page Contains Element   ${edit_list_delete_icon}
#     Click Element   ${edit_list_delete_icon}
#     Wait Until Page Contains Element   ${edit_list_properties_input}
#     Input Text   ${edit_list_properties_input}  ${properties_input}
#     Wait Until Page Contains Element   ${edit_list_suggestions_container}
#     Wait Until Page Contains Element   xpath://div[@class="row row-properties"]//*[contains(text(), "${properties_input}")]  #${edit_list_properties_menu_item_suggestion_item}
#     Click Element   xpath://div[@class="row row-properties"]//*[contains(text(), "${properties_input}")]  #${edit_list_properties_menu_item_suggestion_item}
#     Wait Until Page Contains   ${properties_input}
#     Click Element   ${edit_list_delete_icon}
#     Wait Until Page Contains Element  ${edit_list_properties_input}

# Test On Occasion Column
#     #---search---#
#     Wait Until Page Contains Element   ${edit_list_occasion_input}
#     ${occasion_input}=  Generate Random String  length=8  chars=[LETTERS][NUMBERS]
#     Input Text   ${edit_list_occasion_input}  ${occasion_input}
#     Wait Until Page Contains Element   ${edit_list_suggestions_container}
#     #---request---#
#     Wait Until Page Contains Element   ${edit_list_request_button}
#     Click Element   ${edit_list_request_button}
#     Wait Until Page Contains Element   ${edit_list_request_submit_button}
#     Click Element   ${edit_list_request_submit_button}
#     #---add---#
#     Wait Until Page Contains Element   ${edit_list_delete_icon}
#     Click Element   ${edit_list_delete_icon}
#     Wait Until Page Contains Element   ${edit_list_occasion_input}
#     Input Text   ${edit_list_occasion_input}  ${occasion_input}
#     Wait Until Page Contains Element   ${edit_list_suggestions_container}
#     Wait Until Page Contains Element   xpath://div[@class="row row-occasion"]//*[contains(text(), "${occasion_input}")]  #${edit_list_occasion_menu_item_suggestion_item}
#     Click Element   xpath://div[@class="row row-occasion"]//*[contains(text(), "${occasion_input}")]  #${edit_list_occasion_menu_item_suggestion_item}
#     Wait Until Page Contains   ${occasion_input}
#     Click Element   ${edit_list_delete_icon}
#     Wait Until Page Contains Element  ${edit_list_occasion_input}

# Test On Color Column
#     #---search---#
#     Wait Until Page Contains Element   ${edit_list_color_input}
#     ${color_input}=  Generate Random String  length=8  chars=[LETTERS][NUMBERS]
#     Input Text   ${edit_list_color_input}  ${color_input}
#     Wait Until Page Contains Element   ${edit_list_suggestions_container}
#     #---request---#
#     Wait Until Page Contains Element   ${edit_list_request_button}
#     Click Element   ${edit_list_request_button}
#     Wait Until Page Contains Element   ${edit_list_request_submit_button}
#     Click Element   ${edit_list_request_submit_button}
#     #---add---#
#     Wait Until Page Contains Element   ${edit_list_delete_icon}
#     Click Element   ${edit_list_delete_icon}
#     Wait Until Page Contains Element   ${edit_list_color_input}
#     Input Text   ${edit_list_color_input}  ${color_input}
#     Wait Until Page Contains Element   ${edit_list_suggestions_container}
#     Wait Until Page Contains Element   xpath://div[@class="row row-color"]//*[contains(text(), "${color_input}")]  #${edit_list_color_menu_item_suggestion_item}
#     Click Element   xpath://div[@class="row row-color"]//*[contains(text(), "${color_input}")]  #${edit_list_color_menu_item_suggestion_item}
#     Wait Until Page Contains   ${color_input}
#     Click Element   ${edit_list_delete_icon}
#     Wait Until Page Contains Element  ${edit_list_color_input}

# Test On Material Column
#     #---search---#
#     Wait Until Page Contains Element   ${edit_list_material_input}
#     ${material_input}=  Generate Random String  length=8  chars=[LETTERS][NUMBERS]
#     Input Text   ${edit_list_material_input}  ${material_input}
#     Wait Until Page Contains Element   ${edit_list_suggestions_container}
#     #---request---#
#     Wait Until Page Contains Element   ${edit_list_request_button}
#     Click Element   ${edit_list_request_button}
#     Wait Until Page Contains Element   ${edit_list_request_submit_button}
#     Click Element   ${edit_list_request_submit_button}
#     #---add---#
#     Wait Until Page Contains Element   ${edit_list_delete_icon}
#     Click Element   ${edit_list_delete_icon}
#     Wait Until Page Contains Element   ${edit_list_material_input}
#     Input Text   ${edit_list_material_input}  ${material_input}
#     Wait Until Page Contains Element   ${edit_list_suggestions_container}
#     Wait Until Page Contains Element   xpath://div[@class="row row-material"]//*[contains(text(), "${material_input}")]  #${edit_list_material_menu_item_suggestion_item}
#     Click Element   xpath://div[@class="row row-material"]//*[contains(text(), "${material_input}")]  #${edit_list_material_menu_item_suggestion_item}
#     Wait Until Page Contains   ${material_input}
#     Click Element   ${edit_list_delete_icon}
#     Wait Until Page Contains Element  ${edit_list_material_input}

# Test On "Made in" Column
#     #---search---#
#     Wait Until Page Contains Element   ${edit_list_made_in_input}
#     ${made_in_input}=  Generate Random String  length=8  chars=[LETTERS][NUMBERS]
#     Input Text   ${edit_list_made_in_input}  ${made_in_input}
#     Wait Until Page Contains Element   ${edit_list_suggestions_container}
#     #---request--#
#     Wait Until Page Contains Element   ${edit_list_request_button}
#     Click Element   ${edit_list_request_button}
#     Wait Until Page Contains Element   ${edit_list_request_submit_button}
#     Click Element   ${edit_list_request_submit_button}
#     #---add---#
#     Wait Until Page Contains Element   ${edit_list_delete_icon}
#     Click Element   ${edit_list_delete_icon}
#     Wait Until Page Contains Element   ${edit_list_made_in_input}
#     Input Text   ${edit_list_made_in_input}  ${made_in_input}
#     Wait Until Page Contains Element   ${edit_list_suggestions_container}
#     Wait Until Page Contains Element   xpath://div[@class="row row-made_in"]//*[contains(text(), "${made_in_input}")]  #${edit_list_made_in_menu_item_suggestion_item}
#     Click Element   xpath://div[@class="row row-made_in"]//*[contains(text(), "${made_in_input}")]  #${edit_list_made_in_menu_item_suggestion_item}
#     Wait Until Page Contains   ${made_in_input}
#     Click Element   ${edit_list_delete_icon}
#     Wait Until Page Contains Element  ${edit_list_made_in_input}

# Test On "Designed in" Column
#     #---search---#
#     Wait Until Page Contains Element   ${edit_list_designed_in_input}
#     ${designed_in_input}=  Generate Random String  length=8  chars=[LETTERS][NUMBERS]
#     Input Text   ${edit_list_designed_in_input}  ${designed_in_input}
#     Wait Until Page Contains Element   ${edit_list_suggestions_container}
#     #---request---#
#     Wait Until Page Contains Element   ${edit_list_request_button}
#     Click Element   ${edit_list_request_button}
#     Wait Until Page Contains Element   ${edit_list_request_submit_button}
#     Click Element   ${edit_list_request_submit_button}
#     #---add---#
#     Wait Until Page Contains Element   ${edit_list_delete_icon}
#     Click Element   ${edit_list_delete_icon}
#     Wait Until Page Contains Element   ${edit_list_designed_in_input}
#     Input Text   ${edit_list_designed_in_input}  ${designed_in_input}
#     Wait Until Page Contains Element   ${edit_list_suggestions_container}
#     Wait Until Page Contains Element   xpath://div[@class="row row-designed_in"]//*[contains(text(), "${designed_in_input}")]  #${edit_list_designed_in_menu_item_suggestion_item}
#     Click Element   xpath://div[@class="row row-designed_in"]//*[contains(text(), "${designed_in_input}")]  #${edit_list_designed_in_menu_item_suggestion_item}
#     Wait Until Page Contains   ${designed_in_input}
#     Click Element   ${edit_list_delete_icon}
#     Wait Until Page Contains Element  ${edit_list_designed_in_input}

# Test On Position Column
#     #---search---#
#     Wait Until Page Contains Element   ${edit_list_position_input}
#     ${position_input}=  Generate Random String  length=8  chars=[LETTERS][NUMBERS]
#     Input Text   ${edit_list_position_input}  ${position_input}
#     Wait Until Page Contains Element   ${edit_list_suggestions_container}
#     #---request---#
#     Wait Until Page Contains Element   ${edit_list_request_button}
#     Click Element   ${edit_list_request_button}
#     Wait Until Page Contains Element   ${edit_list_request_submit_button}
#     Click Element   ${edit_list_request_submit_button}
#     #---add---#
#     Wait Until Page Contains Element   ${edit_list_delete_icon}
#     Click Element   ${edit_list_delete_icon}
#     Wait Until Page Contains Element   ${edit_list_position_input}
#     Input Text   ${edit_list_position_input}  ${position_input}
#     Wait Until Page Contains Element   ${edit_list_suggestions_container}
#     Wait Until Page Contains Element   xpath://div[@class="row row-position"]//*[contains(text(), "${position_input}")]  #${edit_list_position_menu_item_suggestion_item}
#     Click Element   xpath://div[@class="row row-position"]//*[contains(text(), "${position_input}")]  #${edit_list_position_menu_item_suggestion_item}
#     Wait Until Page Contains   ${position_input}
#     Click Element   ${edit_list_delete_icon}
#     Wait Until Page Contains Element  ${edit_list_position_input}

# Test On Phrase Column
#     #---search---#
#     Wait Until Page Contains Element   ${edit_list_phrase_input}
#     ${phrase_input}=  Generate Random String  length=8  chars=[LETTERS][NUMBERS]
#     Input Text   ${edit_list_phrase_input}  ${phrase_input}
#     Wait Until Page Contains Element   ${edit_list_suggestions_container}
#     #---request---#
#     Wait Until Page Contains Element   ${edit_list_request_button}
#     Click Element   ${edit_list_request_button}
#     Wait Until Page Contains Element   ${edit_list_request_submit_button}
#     Click Element   ${edit_list_request_submit_button}
#     #---add---#
#     Wait Until Page Contains Element   ${edit_list_delete_icon}
#     Click Element   ${edit_list_delete_icon}
#     Wait Until Page Contains Element   ${edit_list_phrase_input}
#     Input Text   ${edit_list_phrase_input}  ${phrase_input}
#     Wait Until Page Contains Element   ${edit_list_suggestions_container}
#     Wait Until Page Contains Element   xpath://div[@class="row row-phrase"]//*[contains(text(), "${phrase_input}")]  #${edit_list_phrase_menu_item_suggestion_item}
#     Click Element   xpath://div[@class="row row-phrase"]//*[contains(text(), "${phrase_input}")]  #${edit_list_phrase_menu_item_suggestion_item}
#     Wait Until Page Contains   ${phrase_input}
#     Click Element   ${edit_list_delete_icon}
#     Wait Until Page Contains Element  ${edit_list_phrase_input}

# Test On Fixed Phrase Column
#     #---search---#
#     Wait Until Page Contains Element   ${edit_list_fixed_phrase_input}
#     ${fixed_phrase_input}=  Generate Random String  length=8  chars=[LETTERS][NUMBERS]
#     Input Text   ${edit_list_fixed_phrase_input}  ${fixed_phrase_input}
#     Wait Until Page Contains Element   ${edit_list_suggestions_container}
#     #---request---#
#     Wait Until Page Contains Element   ${edit_list_request_button}
#     Click Element   ${edit_list_request_button}
#     Wait Until Page Contains Element   ${edit_list_request_submit_button}
#     Click Element   ${edit_list_request_submit_button}
#     #---add---#
#     Wait Until Page Contains Element   ${edit_list_delete_icon}
#     Click Element   ${edit_list_delete_icon}
#     Wait Until Page Contains Element   ${edit_list_fixed_phrase_input}
#     Input Text   ${edit_list_fixed_phrase_input}  ${fixed_phrase_input}
#     Wait Until Page Contains Element   ${edit_list_suggestions_container}
#     Wait Until Page Contains Element   xpath://div[@class="row row-fixed_phrase"]//*[contains(text(), "${fixed_phrase_input}")]  #${edit_list_fixed_phrase_menu_item_suggestion_item}
#     Click Element   xpath://div[@class="row row-fixed_phrase"]//*[contains(text(), "${fixed_phrase_input}")]  #${edit_list_fixed_phrase_menu_item_suggestion_item}
#     Wait Until Page Contains   ${fixed_phrase_input}
#     Click Element   ${edit_list_delete_icon}
#     Wait Until Page Contains Element  ${edit_list_fixed_phrase_input}

End Web Test
    Close Browser


