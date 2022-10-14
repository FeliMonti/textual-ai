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
    #Set Selenium Speed   1s    ${default_selenium_speed} = Get Selenium Speed

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

Filter by Product Creation Date
    #---Select by after date---#
    Click Element   ${product_list_filter_by_date_button}
    Wait Until Page Contains Element   ${product_list_filter_by_date_menu}
    Click Element   ${product_list_filter_by_date_product_creation_date_option}
    Wait Until Page Contains Element   ${product_list_filter_by_date_product_creation_date_option}
    Click Element   ${product_list_filter_by_date_after_button}
    Element Should Be Visible   ${product_list_filter_by_date_after_datepicker}
    Click Element   ${product_list_filter_by_date_after_date_button}
    Click Element   ${product_list_filter_by_date_close_button}
    Wait Until Page Contains Element   ${product_list_filter_by_date_after_button}

    #---Select by before date---#
    Click Element   ${product_list_filter_by_date_before_button}
    Element Should Be Visible   ${product_list_filter_by_date_before_datepicker}
    Click Element   ${product_list_filter_by_date_before_date_button}
    Click Element   ${product_list_filter_by_date_close_button}
    Wait Until Page Contains Element   ${product_list_filter_by_date_before_button}

    #---Select by both after and before date in product creation date---#
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

Filter by Latest Publication Date
    #---Select by after date---#
    Click Element   ${product_list_filter_by_date_button}
    Wait Until Page Contains Element   ${product_list_filter_by_date_menu}
    Click Element   ${product_list_filter_by_date_latest_publication_date_option}
    Wait Until Page Contains Element   ${product_list_filter_by_date_latest_publication_date_option}
    Click Element   ${product_list_filter_by_date_after_button}
    Element Should Be Visible   ${product_list_filter_by_date_after_datepicker}
    Click Element   ${product_list_filter_by_date_after_date_button}
    Click Element   ${product_list_filter_by_date_close_button}
    Wait Until Page Contains Element   ${product_list_filter_by_date_after_button}

    #---Select by before date---#
    Click Element   ${product_list_filter_by_date_before_button}
    Element Should Be Visible   ${product_list_filter_by_date_before_datepicker}
    Click Element   ${product_list_filter_by_date_before_date_button}
    Click Element   ${product_list_filter_by_date_close_button}
    Wait Until Page Contains Element   ${product_list_filter_by_date_before_button}

    #---Select by both after and before date in latest publication date---#
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

Column Select Options
    #---Set a combination of options in column---#
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

    #---Set namespace in column---#
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

    #---Set group children with parent in column---#
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

Create New Filter Group
    #---Create New Filter Group---#
    Wait Until Page Contains Element  ${product_list_filter_default_button}
    Click Element   ${product_list_filter_default_button}
    Wait Until Page Contains Element    ${product_list_filter_default_menu}
    Element Should Be Visible   ${product_list_filter_default_test}
    Click Element   ${product_list_filter_default_test}
    Scroll Element Into View   ${product_list_filter_default_testtest}
    Wait Until Page Contains Element   ${product_list_filter_default_testtest}
    Click Element   ${product_list_filter_default_testtest}
    Wait Until Page Contains Element   ${product_list_filter_save_as_button}
    Click Element   ${product_list_filter_save_as_button}
    ${group_name}=  Generate Random String  length=8  chars=[LETTERS][NUMBERS]
    Input Text   ${product_list_filter_save_as_filter_group_input}  ${group_name}
    Click Element   ${product_list_filter_save_as_filter_group_add}

    #---Create new filter---#
    ${filter_name}=  Generate Random String  length=8  chars=[LETTERS][NUMBERS]
    Input Text   ${product_list_filter_save_as_filter_name_input}  ${filter_name}
    Wait Until Page Contains Element   ${product_list_filter_save_as_filter_name_create_filter_button}
    Click Element   ${product_list_filter_save_as_filter_name_create_filter_button}
    Wait Until Page Contains    View created successfully

    #---Delete filter group---#
    Click Element   ${product_list_menu}
    Element Should Be Visible   ${product_list_menu_dropdown}
    Wait Until Page Contains Element   ${product_list_menu_dropdown_manage}
    Click Element   ${product_list_menu_dropdown_manage}
    Select Frame   ${edit_list_subpage_iframe}
    Wait Until Page Contains Element   ${product_list_menu_dropdown_manage_filter_groups}
    Click Element   ${product_list_menu_dropdown_manage_filter_groups}
    Wait Until Page Contains Element    xpath://*[contains(text(),"${group_name}")]/../..//button[contains(text(), "Delete")]   #${product_list_menu_dropdown_manage_filter_groups_delete}
    Click Element   xpath://*[contains(text(),"${group_name}")]/../..//button[contains(text(), "Delete")]  #${product_list_menu_dropdown_manage_filter_groups_delete}
    Handle Alert   action=ACCEPT   timeout=2s

Access To Edit Subpage Frame
    Wait Until Page Contains Element   ${product_list_data_table edit_button_3}
    Scroll Element Into View   ${product_list_data_table edit_button_3}
    Click Element   ${product_list_data_table edit_button_3}
    Select Frame    ${edit_list_subpage_iframe}
    Wait Until Page Contains Element   ${edit_list_edit_tab}
    Click Element   ${edit_list_edit_tab}

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
    Unselect Frame
    Wait Until Page Contains Element  ${edit_list_subpage_back_button}
    Click Element   ${edit_list_subpage_back_button}

Test On Deleting A Product
#    Click Element   ${textual_logo}
#    Wait Until Page Contains Element   ${customer_home_edit_button}
#    Click Element   ${customer_home_edit_button}
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
#    #${delete_button}=   Get Element Attribute    ${edit_list_bulk_actions_menu_product_delete_products_button}

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
    Unselect Frame
    Click Element   ${edit_list_subpage_back_button}
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

#    #---copy from---#
#    Click Element   ${edit_list_actions_button}
#    Element Should Be Visible   ${edit_list_actions_menu}
#    Click Element   ${edit_list_actions_copy_from_button}
#    Wait Until Page Contains Element   ${edit_list_SKU_EAN_input}
#    Input Text   ${edit_list_SKU_EAN_input}  dcb7b357-c8f4-4042-b73c-92718f649313
#    Wait Until Page Contains Element   ${edit_list_actions_copy_from_copy_button}
#    Click Element  ${edit_list_actions_copy_from_copy_button}
#
#    #---copy to---#
#    Click Element   ${edit_list_actions_button}
#    Element Should Be Visible   ${edit_list_actions_menu}
#    Wait Until Page Contains Element   ${edit_list_actions_copy_to_button}
#    Click Element   ${edit_list_actions_copy_to_button}
#    Wait Until Page Contains Element   ${edit_list_SKU_EAN_input}
#    Input Text   ${edit_list_SKU_EAN_input}  52f64090-1476-4e59-ac64-bc8b3d5054e3
#    Wait Until Page Contains Element   ${edit_list_actions_copy_from_copy_button}
#    Click Element  ${edit_list_actions_copy_from_copy_button}

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

Add Main Category
    Wait Until Page Contains Element   ${edit_list_main_category_input}
    Input Text  ${edit_list_main_category_input}  shoes
    Wait Until Page Contains Element   ${edit_list_main_category_sugestions_container}
    Wait Until Page Contains Element  ${edit_list_main_category_menu_item_suggestion_item}
    Click Element   ${edit_list_main_category_menu_item_suggestion_item}
    Wait Until Page Contains Element   ${edit_list_main_category_product_selected_value}
    Click Element  ${edit_list_main_category_close_icon}
    Wait Until Page Contains Element   ${edit_list_main_category_input}
    Wait Until Page Contains Element   ${edit_list_main_category_edit_filed_product}

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
    Input Text   ${edit_list_name_input}   ${name_input}
    Unselect Frame
    Click Element   ${edit_list_subpage_back_button}
    Wait Until Page Contains Element   ${product_list_edit_button}
    Click Element   ${product_list_edit_button}
    Select Frame    ${edit_list_subpage_iframe}
    Wait Until Page Contains Element   ${edit_list_name_input}
    Click Element   ${edit_list_name_input}
    Textfield Should Contain  ${edit_list_name_input}  ${name_input}
    Double Click Element   ${edit_list_name_input}
    Press Keys   ${edit_list_name_input}  CTRL+A+DELETE   #Only works for Window

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
    Wait Until Page Contains Element   ${product_list_edit_button}
    Click Element   ${product_list_edit_button}
    Select Frame    ${edit_list_subpage_iframe}
    Wait Until Page Contains Element   ${edit_list_additional_information_column}
    Click Element   ${edit_list_additional_information_column}
    Click Element   ${edit_list_original_headline_input}
    Textfield Should Contain   ${edit_list_original_headline_input}  ${original_headline_input}
    Click Element   ${edit_list_original_text_textarea}
    Textarea Should Contain   ${edit_list_original_text_textarea}   ${original_text_input}
    Double Click Element   ${edit_list_original_headline_input}
    Press Keys   ${edit_list_original_headline_input}   CTRL+A+DELETE    #Only works for Window
    Double Click Element  ${edit_list_original_text_textarea}
    Press Keys   ${edit_list_original_text_textarea}   CTRL+A+DELETE     #Only works for Window

Navigate On Attribute
    Wait Until Page Contains Element   ${edit_list_edit_field_add}
    Click Element   ${edit_list_edit_field_add}
    Wait Until Page Contains Element   ${edit_list_subpart_attribute_input}
    Wait Until Page Contains   new attribute
    #---search---#
    Wait Until Page Contains Element   ${edit_list_subpart_attribute_input}
    ${attribute_input}=  Generate Random String  length=8  chars=[LETTERS][NUMBERS]
    Input Text   ${edit_list_subpart_attribute_input}   ${attribute_input}
    Wait Until Page Contains Element   ${edit_list_suggestions_container}
    #---request---#
    Wait Until Page Contains Element   ${edit_list_request_button}
    Click Element   ${edit_list_request_button}
    Wait Until Page Contains Element   ${edit_list_request_submit_button}
    Click Element   ${edit_list_request_submit_button}
    #---add---#
    #Comments:
    #On attribute part, because before searching for attribute, we need to click '+ADD' button to let 'new attribute' and 'attribute' edit column appear.
    #So after request new attribute, no need to add again, just verify that the 'new attribuet' field becomes the random value of ${attribute_input}?

    #Wait Until Page Contains Element   ${edit_list_subpart_attribute_close_icon}
    #Click Element   ${edit_list_subpart_attribute_close_icon}
    Wait Until Page Contains Element   ${edit_list_subpart_attribute_input}
    Wait Until Page Contains Element   ${edit_list_subpart_attribute_new_attribute_selected_value}
    Sleep  2s
    Element Text Should Be   ${edit_list_subpart_attribute_new_attribute_selected_value}   ${attribute_input}
    #Click Element   ${edit_list_edit_field_add}
    #Wait Until Page Contains   new attribute
    #Wait Until Page Contains Element   xpath://div[@class="input-container"]//input[@data-testid="single-input"]  #${edit_list_subpart_attribute_input}
    #Input Text   xpath://div[@class="input-container"]//input[@data-testid="single-input"]  ${attribute_input}
    #Wait Until Page Contains Element   ${edit_list_suggestions_container}
    #Wait Until Page Contains Element   xpath://div[@class="product-type-row"]//*[contains(text(), "${attribute_input}")]   #${edit_list_subpart_attribute_menu_item_suggestion_item}
    #Click Element   xpath://div[@class="product-type-row"]//*[contains(text(), "${attribute_input}")]  #${edit_list_subpart_attribute_menu_item_suggestion_item}
    #Wait Until Page Contains Element   ${attribute_input}
    Click Element   ${edit_list_subpart_attribute_close_icon}
    Wait Until Page Contains Element  ${edit_list_subpart_attribute_input}


Navigate On Properties
    #---search---#
    Wait Until Page Contains Element   ${edit_list_properties_input}
    ${properties_input}=  Generate Random String  length=8  chars=[LETTERS][NUMBERS]
    Input Text   ${edit_list_properties_input}  ${properties_input}
    Wait Until Page Contains Element   ${edit_list_suggestions_container}
    #---request---#
    Wait Until Page Contains Element   ${edit_list_request_button}
    #Element Should Be Visible   ${edit_list_request_button}
    Click Element   ${edit_list_request_button}
    Wait Until Page Contains Element   ${edit_list_request_submit_button}
    Click Element   ${edit_list_request_submit_button}
    #---add---#
    Wait Until Page Contains Element   ${edit_list_delete_icon}
    Click Element   ${edit_list_delete_icon}
    Wait Until Page Contains Element   ${edit_list_properties_input}
    Input Text   ${edit_list_properties_input}  ${properties_input}
    Wait Until Page Contains Element   ${edit_list_suggestions_container}
    Wait Until Page Contains Element   xpath://div[@class="row row-properties"]//*[contains(text(), "${properties_input}")]  #${edit_list_properties_menu_item_suggestion_item}
    Click Element   xpath://div[@class="row row-properties"]//*[contains(text(), "${properties_input}")]  #${edit_list_properties_menu_item_suggestion_item}
    Wait Until Page Contains   ${properties_input}
    Click Element   ${edit_list_delete_icon}
    Wait Until Page Contains Element  ${edit_list_properties_input}

Navigate On Occasion
    #---search---#
    Wait Until Page Contains Element   ${edit_list_occasion_input}
    ${occasion_input}=  Generate Random String  length=8  chars=[LETTERS][NUMBERS]
    Input Text   ${edit_list_occasion_input}  ${occasion_input}
    Wait Until Page Contains Element   ${edit_list_suggestions_container}
    #---request---#
    Wait Until Page Contains Element   ${edit_list_request_button}
    Click Element   ${edit_list_request_button}
    Wait Until Page Contains Element   ${edit_list_request_submit_button}
    Click Element   ${edit_list_request_submit_button}
    #---add---#
    Wait Until Page Contains Element   ${edit_list_delete_icon}
    Click Element   ${edit_list_delete_icon}
    Wait Until Page Contains Element   ${edit_list_occasion_input}
    Input Text   ${edit_list_occasion_input}  ${occasion_input}
    Wait Until Page Contains Element   ${edit_list_suggestions_container}
    Wait Until Page Contains Element   xpath://div[@class="row row-occasion"]//*[contains(text(), "${occasion_input}")]  #${edit_list_occasion_menu_item_suggestion_item}
    Click Element   xpath://div[@class="row row-occasion"]//*[contains(text(), "${occasion_input}")]  #${edit_list_occasion_menu_item_suggestion_item}
    Wait Until Page Contains   ${occasion_input}
    Click Element   ${edit_list_delete_icon}
    Wait Until Page Contains Element  ${edit_list_occasion_input}


Navigate On Color
    #---search---#
    Wait Until Page Contains Element   ${edit_list_color_input}
    ${color_input}=  Generate Random String  length=8  chars=[LETTERS][NUMBERS]
    Input Text   ${edit_list_color_input}  ${color_input}
    Wait Until Page Contains Element   ${edit_list_suggestions_container}
    #---request---#
    Wait Until Page Contains Element   ${edit_list_request_button}
    Click Element   ${edit_list_request_button}
    Wait Until Page Contains Element   ${edit_list_request_submit_button}
    Click Element   ${edit_list_request_submit_button}
    #---add---#
    Wait Until Page Contains Element   ${edit_list_delete_icon}
    Click Element   ${edit_list_delete_icon}
    Wait Until Page Contains Element   ${edit_list_color_input}
    Input Text   ${edit_list_color_input}  ${color_input}
    Wait Until Page Contains Element   ${edit_list_suggestions_container}
    Wait Until Page Contains Element   xpath://div[@class="row row-color"]//*[contains(text(), "${color_input}")]  #${edit_list_color_menu_item_suggestion_item}
    Click Element   xpath://div[@class="row row-color"]//*[contains(text(), "${color_input}")]  #${edit_list_color_menu_item_suggestion_item}
    Wait Until Page Contains   ${color_input}
    Click Element   ${edit_list_delete_icon}
    Wait Until Page Contains Element  ${edit_list_color_input}

Navigate On Material
    #---search---#
    Wait Until Page Contains Element   ${edit_list_material_input}
    ${material_input}=  Generate Random String  length=8  chars=[LETTERS][NUMBERS]
    Input Text   ${edit_list_material_input}  ${material_input}
    Wait Until Page Contains Element   ${edit_list_suggestions_container}
    #---request---#
    Wait Until Page Contains Element   ${edit_list_request_button}
    Click Element   ${edit_list_request_button}
    Wait Until Page Contains Element   ${edit_list_request_submit_button}
    Click Element   ${edit_list_request_submit_button}
    #---add---#
    Wait Until Page Contains Element   ${edit_list_delete_icon}
    Click Element   ${edit_list_delete_icon}
    Wait Until Page Contains Element   ${edit_list_material_input}
    Input Text   ${edit_list_material_input}  ${material_input}
    Wait Until Page Contains Element   ${edit_list_suggestions_container}
    Wait Until Page Contains Element   xpath://div[@class="row row-material"]//*[contains(text(), "${material_input}")]  #${edit_list_material_menu_item_suggestion_item}
    Click Element   xpath://div[@class="row row-material"]//*[contains(text(), "${material_input}")]  #${edit_list_material_menu_item_suggestion_item}
    Wait Until Page Contains   ${material_input}
    Click Element   ${edit_list_delete_icon}
    Wait Until Page Contains Element  ${edit_list_material_input}

Navigate On "Made in"
    #---search---#
    Wait Until Page Contains Element   ${edit_list_made_in_input}
    ${made_in_input}=  Generate Random String  length=8  chars=[LETTERS][NUMBERS]
    Input Text   ${edit_list_made_in_input}  ${made_in_input}
    Wait Until Page Contains Element   ${edit_list_suggestions_container}
    #---request--#
    Wait Until Page Contains Element   ${edit_list_request_button}
    Click Element   ${edit_list_request_button}
    Wait Until Page Contains Element   ${edit_list_request_submit_button}
    Click Element   ${edit_list_request_submit_button}
    #---add---#
    Wait Until Page Contains Element   ${edit_list_delete_icon}
    Click Element   ${edit_list_delete_icon}
    Wait Until Page Contains Element   ${edit_list_made_in_input}
    Input Text   ${edit_list_made_in_input}  ${made_in_input}
    Wait Until Page Contains Element   ${edit_list_suggestions_container}
    Wait Until Page Contains Element   xpath://div[@class="row row-made_in"]//*[contains(text(), "${made_in_input}")]  #${edit_list_made_in_menu_item_suggestion_item}
    Click Element   xpath://div[@class="row row-made_in"]//*[contains(text(), "${made_in_input}")]  #${edit_list_made_in_menu_item_suggestion_item}
    Wait Until Page Contains   ${made_in_input}
    Click Element   ${edit_list_delete_icon}
    Wait Until Page Contains Element  ${edit_list_made_in_input}


Navigate On "Designed in"
    #---search---#
    Wait Until Page Contains Element   ${edit_list_designed_in_input}
    ${designed_in_input}=  Generate Random String  length=8  chars=[LETTERS][NUMBERS]
    Input Text   ${edit_list_designed_in_input}  ${designed_in_input}
    Wait Until Page Contains Element   ${edit_list_suggestions_container}
    #---request---#
    Wait Until Page Contains Element   ${edit_list_request_button}
    Click Element   ${edit_list_request_button}
    Wait Until Page Contains Element   ${edit_list_request_submit_button}
    Click Element   ${edit_list_request_submit_button}
    #---add---#
    Wait Until Page Contains Element   ${edit_list_delete_icon}
    Click Element   ${edit_list_delete_icon}
    Wait Until Page Contains Element   ${edit_list_designed_in_input}
    Input Text   ${edit_list_designed_in_input}  ${designed_in_input}
    Wait Until Page Contains Element   ${edit_list_suggestions_container}
    Wait Until Page Contains Element   xpath://div[@class="row row-designed_in"]//*[contains(text(), "${designed_in_input}")]  #${edit_list_designed_in_menu_item_suggestion_item}
    Click Element   xpath://div[@class="row row-designed_in"]//*[contains(text(), "${designed_in_input}")]  #${edit_list_designed_in_menu_item_suggestion_item}
    Wait Until Page Contains   ${designed_in_input}
    Click Element   ${edit_list_delete_icon}
    Wait Until Page Contains Element  ${edit_list_designed_in_input}

Navigate On Position
    #---search---#
    Wait Until Page Contains Element   ${edit_list_position_input}
    ${position_input}=  Generate Random String  length=8  chars=[LETTERS][NUMBERS]
    Input Text   ${edit_list_position_input}  ${position_input}
    Wait Until Page Contains Element   ${edit_list_suggestions_container}
    #---request---#
    Wait Until Page Contains Element   ${edit_list_request_button}
    Click Element   ${edit_list_request_button}
    Wait Until Page Contains Element   ${edit_list_request_submit_button}
    Click Element   ${edit_list_request_submit_button}
    #---add---#
    Wait Until Page Contains Element   ${edit_list_delete_icon}
    Click Element   ${edit_list_delete_icon}
    Wait Until Page Contains Element   ${edit_list_position_input}
    Input Text   ${edit_list_position_input}  ${position_input}
    Wait Until Page Contains Element   ${edit_list_suggestions_container}
    Wait Until Page Contains Element   xpath://div[@class="row row-position"]//*[contains(text(), "${position_input}")]  #${edit_list_position_menu_item_suggestion_item}
    Click Element   xpath://div[@class="row row-position"]//*[contains(text(), "${position_input}")]  #${edit_list_position_menu_item_suggestion_item}
    Wait Until Page Contains   ${position_input}
    Click Element   ${edit_list_delete_icon}
    Wait Until Page Contains Element  ${edit_list_position_input}

Navigate On Phrase
    #---search---#
    Wait Until Page Contains Element   ${edit_list_phrase_input}
    ${phrase_input}=  Generate Random String  length=8  chars=[LETTERS][NUMBERS]
    Input Text   ${edit_list_phrase_input}  ${phrase_input}
    Wait Until Page Contains Element   ${edit_list_suggestions_container}
    #---request---#
    Wait Until Page Contains Element   ${edit_list_request_button}
    Click Element   ${edit_list_request_button}
    Wait Until Page Contains Element   ${edit_list_request_submit_button}
    Click Element   ${edit_list_request_submit_button}
    #---add---#
    Wait Until Page Contains Element   ${edit_list_delete_icon}
    Click Element   ${edit_list_delete_icon}
    Wait Until Page Contains Element   ${edit_list_phrase_input}
    Input Text   ${edit_list_phrase_input}  ${phrase_input}
    Wait Until Page Contains Element   ${edit_list_suggestions_container}
    Wait Until Page Contains Element   xpath://div[@class="row row-phrase"]//*[contains(text(), "${phrase_input}")]  #${edit_list_phrase_menu_item_suggestion_item}
    Click Element   xpath://div[@class="row row-phrase"]//*[contains(text(), "${phrase_input}")]  #${edit_list_phrase_menu_item_suggestion_item}
    Wait Until Page Contains   ${phrase_input}
    Click Element   ${edit_list_delete_icon}
    Wait Until Page Contains Element  ${edit_list_phrase_input}

Navigate On Fixed Phrase
    #---search---#
    Wait Until Page Contains Element   ${edit_list_fixed_phrase_input}
    ${fixed_phrase_input}=  Generate Random String  length=8  chars=[LETTERS][NUMBERS]
    Input Text   ${edit_list_fixed_phrase_input}  ${fixed_phrase_input}
    Wait Until Page Contains Element   ${edit_list_suggestions_container}
    #---request---#
    Wait Until Page Contains Element   ${edit_list_request_button}
    Click Element   ${edit_list_request_button}
    Wait Until Page Contains Element   ${edit_list_request_submit_button}
    Click Element   ${edit_list_request_submit_button}
    #---add---#
    Wait Until Page Contains Element   ${edit_list_delete_icon}
    Click Element   ${edit_list_delete_icon}
    Wait Until Page Contains Element   ${edit_list_fixed_phrase_input}
    Input Text   ${edit_list_fixed_phrase_input}  ${fixed_phrase_input}
    Wait Until Page Contains Element   ${edit_list_suggestions_container}
    Wait Until Page Contains Element   xpath://div[@class="row row-fixed_phrase"]//*[contains(text(), "${fixed_phrase_input}")]  #${edit_list_fixed_phrase_menu_item_suggestion_item}
    Click Element   xpath://div[@class="row row-fixed_phrase"]//*[contains(text(), "${fixed_phrase_input}")]  #${edit_list_fixed_phrase_menu_item_suggestion_item}
    Wait Until Page Contains   ${fixed_phrase_input}
    Click Element   ${edit_list_delete_icon}
    Wait Until Page Contains Element  ${edit_list_fixed_phrase_input}

End Web Test
    Close Browser


