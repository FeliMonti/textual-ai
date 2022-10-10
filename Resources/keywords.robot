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
    Press Keys   ${product_list_search_text_input}  CTRL+A+DELETE
    #Clear Element Text   ${product_list_search_text_input}
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
    #Wait Until Page Contains Element   ${product_list_filter_by_date_after_chosen_listbox}
    Click Element   ${product_list_filter_by_date_close_button}
    Wait Until Page Contains Element   ${product_list_filter_by_date_after_button}

    #---Select by before date---#
    Click Element   ${product_list_filter_by_date_before_button}
    Element Should Be Visible   ${product_list_filter_by_date_before_datepicker}
    Click Element   ${product_list_filter_by_date_before_date_button}
    #Wait Until Page Contains Element   ${product_list_filter_by_date_before_chosen_listbox}
    Click Element   ${product_list_filter_by_date_close_button}
    Wait Until Page Contains Element   ${product_list_filter_by_date_before_button}

    #---Select by both after and before date in product creation date---#
    Click Element   ${product_list_filter_by_date_after_button}
    Element Should Be Visible   ${product_list_filter_by_date_after_datepicker}
    Click Element   ${product_list_filter_by_date_after_date_button}
    #Wait Until Page Contains Element   ${product_list_filter_by_date_after_chosen_listbox}
    Click Element   ${product_list_filter_by_date_before_button}
    Element Should Be Visible   ${product_list_filter_by_date_before_datepicker}
    Click Element   ${product_list_filter_by_date_before_date_button}
    #Wait Until Page Contains Element   ${product_list_filter_by_date_before_chosen_listbox}
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
    #Wait Until Page Contains Element   ${product_list_filter_by_date_after_chosen_listbox}
    Click Element   ${product_list_filter_by_date_close_button}
    Wait Until Page Contains Element   ${product_list_filter_by_date_after_button}

    #---Select by before date---#
    Click Element   ${product_list_filter_by_date_before_button}
    Element Should Be Visible   ${product_list_filter_by_date_before_datepicker}
    Click Element   ${product_list_filter_by_date_before_date_button}
    #Wait Until Page Contains Element   ${product_list_filter_by_date_before_chosen_listbox}
    Click Element   ${product_list_filter_by_date_close_button}
    Wait Until Page Contains Element   ${product_list_filter_by_date_before_button}

    #---Select by both after and before date in latest publication date---#
    Click Element   ${product_list_filter_by_date_after_button}
    Element Should Be Visible   ${product_list_filter_by_date_after_datepicker}
    Click Element   ${product_list_filter_by_date_after_date_button}
    #Wait Until Page Contains Element   ${product_list_filter_by_date_after_chosen_listbox}
    Click Element   ${product_list_filter_by_date_before_button}
    Element Should Be Visible   ${product_list_filter_by_date_before_datepicker}
    Click Element   ${product_list_filter_by_date_before_date_button}
    #Wait Until Page Contains Element   ${product_list_filter_by_date_before_chosen_listbox}
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
    #Wait Until Page Contains Element   ${product_list_filter_by_date_after_chosen_listbox}

    #---Choose before date---#
    Click Element   ${product_list_filter_by_date_before_button}
    Element Should Be Visible   ${product_list_filter_by_date_before_datepicker}
    Click Element   ${product_list_filter_by_date_before_date_button}
    #Wait Until Page Contains Element   ${product_list_filter_by_date_before_chosen_listbox}

    #----Search for result with above options---#
    Click Element   ${product_list_search_button}
    #Clear Element Text  ${product_list_search_text_input}
    #Sleep  2s
    Double Click Element   ${product_list_search_text_input}
    Press Keys   ${product_list_search_text_input}   CTRL+A+DELETE
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
    #Wait Until Page Contains Element   ${product_list_filter_by_date_after_chosen_listbox}

    #---Choose before date---#
    Click Element   ${product_list_filter_by_date_before_button}
    Element Should Be Visible   ${product_list_filter_by_date_before_datepicker}
    Click Element   ${product_list_filter_by_date_before_date_button}
    #Wait Until Page Contains Element   ${product_list_filter_by_date_before_chosen_listbox}

    #----Search for result with above options---#
    Click Element   ${product_list_search_button}
    #Clear Element Text  ${product_list_search_text_input}
    Double Click Element   ${product_list_search_text_input}
    Press Keys   ${product_list_search_text_input}   CTRL+A+DELETE
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
    Wait Until Page Contains Element   ${product_list_edit_button}
    Click Element   ${product_list_edit_button}
    Select Frame    ${edit_list_subpage_iframe}
    Wait Until Page Contains Element   ${edit_list_edit_tab}

Navigate On Action Button
    #---new---#
    Click Element   ${edit_list_action_button}
    Element Should Be Visible   ${edit_list_action_menu}
    Click Element   ${edit_list_new_button}

    #---Error message after clicking on the new button--#

    #---duplicate---#
    Click Element   ${edit_list_action_button}
    Element Should Be Visible   ${edit_list_action_menu}
    Click Element   ${edit_list_duplicate_button}

    #---how to verify if it has duplicated?---#

    #---copy from---#
    Click Element   ${edit_list_action_button}
    Element Should Be Visible   ${edit_list_action_menu}
    Click Element   ${edit_list_action_copy_from_button}
    Wait Until Page Contains Element   ${edit_list_SKU_EAN_input}
    Input Text   ${edit_list_SKU_EAN_input}  dcb7b357-c8f4-4042-b73c-92718f649313
    Wait Until Page Contains Element   ${edit_list_action_copy_from_copy_button}
    Click Element  ${edit_list_action_copy_from_copy_button}

    #---copy to---#
    Click Element   ${edit_list_action_button}
    Element Should Be Visible   ${edit_list_action_menu}
    Wait Until Page Contains Element   ${edit_list_action_copy_to_button}
    Click Element   ${edit_list_action_copy_to_button}
    Wait Until Page Contains Element   ${edit_list_SKU_EAN_input}
    Input Text   ${edit_list_SKU_EAN_input}  52f64090-1476-4e59-ac64-bc8b3d5054e3
    Wait Until Page Contains Element   ${edit_list_action_copy_from_copy_button}
    Click Element  ${edit_list_action_copy_from_copy_button}

    #---status---#
#    Wait Until Page Contains Element  ${edit_list_check_radiobutton}
#    Click Element   ${edit_list_check_radiobutton}
#    Select Frame   ${edit_list_edit_frame_2}
#    Unselect Frame   ${edit_list_edit_frame_1}

Add Main Category
    Wait Until Page Contains Element   ${edit_list_main_catogary_input}
    Input Text  ${edit_list_main_catogary_input}

Navigate On Attribute
    Wait Until Page Contains Element   ${edit_list_edit_field_add}
    Click Element   ${edit_list_edit_field_add}
    Wait Until Page Contains   new attribute
    Wait Until Page Contains Element   ${edit_list_subpart_attribute_input}
    ${attribute_input}=  Generate Random String  length=8  chars=[LETTERS][NUMBERS]
    Input Text   ${product_list_filter_save_as_filter_group_input}  ${attribute_input}
    Wait Until Page Contains Element   ${edit_list_request_button}
    Click Element   ${edit_list_request_button}
    Wait Until Page Contains Element   ${edit_list_request_submit_button}
    Click Element   ${edit_list_request_submit_button}

#    Input Text   ${edit_list_subpart_attribute_input}   frame
#    Wait Until Page Contains Element   ${edit_list_subpart_attribute_suggestions_container}
#    Wait Until Page Contains Element   ${edit_list_subpart_attribute_menu_item_suggestion_item}
#    Click Element   ${edit_list_subpart_attribute_menu_item_suggestion_item}
#    Wait Until Page Contains
#    Click Element   ${edit_list_subpart_attribute_delete_icon}
#    Wait Until Page Contains Element  ${edit_list_subpart_attribute_input}

Navigate On Properties
    Wait Until Page Contains Element   ${edit_list_properties_input}
    ${properties_input}=  Generate Random String  length=8  chars=[LETTERS][NUMBERS]
    Input Text   ${product_list_filter_save_as_filter_group_input}  ${properties_input}
    Wait Until Page Contains Element   ${edit_list_request_button}
    Click Element   ${edit_list_request_button}
    Wait Until Page Contains Element   ${edit_list_request_submit_button}
    Click Element   ${edit_list_request_submit_button}

#    Wait Until Page Contains Element   ${edit_list_occasion_input}
#    Input Text   ${edit_list_occasion_input}  beautiful
#    Wait Until Page Contains Element   ${edit_list_properties_suggestions_container}
#    Wait Until Page Contains Element   ${edit_list_properties_menu_item_suggestion_item}
#    Click Element   ${edit_list_properties_menu_item_suggestion_item}
#    Wait Until Page Contains  beautiful
#    Click Element   ${edit_list_properties_delete_icon}
#    Wait Until Page Contains Element  ${edit_list_properties_input}

Navigate On Occasion
    Wait Until Page Contains Element   ${edit_list_properties_input}
    ${ocassion_input}=  Generate Random String  length=8  chars=[LETTERS][NUMBERS]
    Input Text   ${product_list_filter_save_as_filter_group_input}  ${occasion_input}
    Wait Until Page Contains Element   ${edit_list_request_button}
    Click Element   ${edit_list_request_button}
    Wait Until Page Contains Element   ${edit_list_request_submit_button}
    Click Element   ${edit_list_request_submit_button}

#    Wait Until Page Contains Element   ${edit_list_occasion_input}
#    Input Text   ${edit_list_occasion_input}  summer
#    Wait Until Page Contains Element   ${edit_list_occasion_suggestions_container}
#    Wait Until Page Contains Element   ${edit_list_occasion_menu_item_suggestion_item}
#    Click Element   ${edit_list_occasion_menu_item_suggestion_item}
#    Wait Until Page Contains  for the summer party
#    Click Element   ${edit_list_occasion_delete_icon}
#    Wait Until Page Contains Element  ${edit_list_occasion_input}

Navigate On Color
    Wait Until Page Contains Element   ${edit_list_properties_input}
    ${color_input}=  Generate Random String  length=8  chars=[LETTERS][NUMBERS]
    Input Text   ${product_list_filter_save_as_filter_group_input}  ${color_input}
    Wait Until Page Contains Element   ${edit_list_request_button}
    Click Element   ${edit_list_request_button}
    Wait Until Page Contains Element   ${edit_list_request_submit_button}
    Click Element   ${edit_list_request_submit_button}

#    Wait Until Page Contains Element   ${edit_list_color_input}
#    Input Text   ${edit_list_color_input}  orange
#    Wait Until Page Contains Element   ${edit_list_color_suggestions_container}
#    Wait Until Page Contains Element   ${edit_list_color_menu_item_suggestion_item}
#    Click Element   ${edit_list_color_menu_item_suggestion_item}
#    Wait Until Page Contains  orange
#    Wait Until Page Contains Element   ${edit_list_color_delete_icon}
#    Click Element   ${edit_list_color_delete_icon}
#    Wait Until Page Contains Element  ${edit_list_color_input}

Navigate On Material
    Wait Until Page Contains Element   ${edit_list_properties_input}
    ${material_input}=  Generate Random String  length=8  chars=[LETTERS][NUMBERS]
    Input Text   ${product_list_filter_save_as_filter_group_input}  ${material_input}
    Wait Until Page Contains Element   ${edit_list_request_button}
    Click Element   ${edit_list_request_button}
    Wait Until Page Contains Element   ${edit_list_request_submit_button}
    Click Element   ${edit_list_request_submit_button}

#    Wait Until Page Contains Element   ${edit_list_material_input}
#    Input Text   ${edit_list_material_input}  metal
#    Wait Until Page Contains Element   ${edit_list_material_suggestions_container}
#    Wait Until Page Contains Element   ${edit_list_material_menu_item_suggestion_item}
#    Click Element   ${edit_list_material_menu_item_suggestion_item}
#    Wait Until Page Contains  metal
#    Click Element   ${edit_list_material_delete_icon}
#    Wait Until Page Contains Element  ${edit_list_material_input}

Navigate On "Made in"
    Wait Until Page Contains Element   ${edit_list_properties_input}
    ${made_in_input}=  Generate Random String  length=8  chars=[LETTERS][NUMBERS]
    Input Text   ${product_list_filter_save_as_filter_group_input}  ${made_in_input}
    Wait Until Page Contains Element   ${edit_list_request_button}
    Click Element   ${edit_list_request_button}
    Wait Until Page Contains Element   ${edit_list_request_submit_button}
    Click Element   ${edit_list_request_submit_button}

#    Wait Until Page Contains Element   ${edit_list_made_in_input}
#    Input Text   ${edit_list_made_in_input}  in Sweden
#    Wait Until Page Contains Element   ${edit_list_made_in_suggestions_container}
#    Wait Until Page Contains Element   ${edit_list_made_in_menu_item_suggestion_item}
#    Click Element   ${edit_list_made_in_menu_item_suggestion_item}
#    Wait Until Page Contains  in Sweden
#    Click Element   ${edit_list_made_in_delete_icon}
#    Wait Until Page Contains Element  ${edit_list_made_in_input}

Navigate On "Designed in"
    Wait Until Page Contains Element   ${edit_list_properties_input}
    ${designed_in_input}=  Generate Random String  length=8  chars=[LETTERS][NUMBERS]
    Input Text   ${product_list_filter_save_as_filter_group_input}  ${designed_in_input}
    Wait Until Page Contains Element   ${edit_list_request_button}
    Click Element   ${edit_list_request_button}
    Wait Until Page Contains Element   ${edit_list_request_submit_button}
    Click Element   ${edit_list_request_submit_button}

#    Wait Until Page Contains Element   ${edit_list_designed_in_input}
#    Input Text   ${edit_list_designed_in_input}  in Italy
#    Wait Until Page Contains Element   ${edit_list_designed_in_suggestions_container}
#    Wait Until Page Contains Element   ${edit_list_designed_in_menu_item_suggestion_item}
#    Click Element   ${edit_list_designed_in_menu_item_suggestion_item}
#    Wait Until Page Contains  in Italy
#    Click Element   ${edit_list_designed_in_delete_icon}
#    Wait Until Page Contains Element  ${edit_list_designed_in_input}

Navigate On Position
    Wait Until Page Contains Element   ${edit_list_properties_input}
    ${position_input}=  Generate Random String  length=8  chars=[LETTERS][NUMBERS]
    Input Text   ${product_list_filter_save_as_filter_group_input}  ${position_input}
    Wait Until Page Contains Element   ${edit_list_request_button}
    Click Element   ${edit_list_request_button}
    Wait Until Page Contains Element   ${edit_list_request_submit_button}
    Click Element   ${edit_list_request_submit_button}

#    Wait Until Page Contains Element   ${edit_list_position_input}
#    Input Text   ${edit_list_position_input}    in front
#    Wait Until Page Contains Element   ${edit_list_position_suggestions_container}
#    Wait Until Page Contains Element   ${edit_list_position_menu_item_suggestion_item}
#    Click Element   ${edit_list_position_menu_item_suggestion_item}
#    Wait Until Page Contains   in front
#    Click Element   ${edit_list_position_delete_icon}
#    Wait Until Page Contains Element  ${edit_list_position_input}

Navigate On Phrase
    Wait Until Page Contains Element   ${edit_list_properties_input}
    ${phrase_input}=  Generate Random String  length=8  chars=[LETTERS][NUMBERS]
    Input Text   ${product_list_filter_save_as_filter_group_input}  ${phrase_input}
    Wait Until Page Contains Element   ${edit_list_request_button}
    Click Element   ${edit_list_request_button}
    Wait Until Page Contains Element   ${edit_list_request_submit_button}
    Click Element   ${edit_list_request_submit_button}

#    Wait Until Page Contains Element   ${edit_list_phrase_input}
#    Input Text   ${edit_list_phrase_input}    for
#    Wait Until Page Contains Element   ${edit_list_phrase_suggestions_container}
#    Wait Until Page Contains Element   ${edit_list_phrase_menu_item_suggestion_item}
#    Click Element   ${edit_list_phrase_menu_item_suggestion_item}
#    Wait Until Page Contains   for elegance
#    Click Element   ${edit_list_phrase_delete_icon}
#    Wait Until Page Contains Element  ${edit_list_phrase_input}

Navigate On Fixed Phrase
    Wait Until Page Contains Element   ${edit_list_properties_input}
    ${fixed_phrase_input}=  Generate Random String  length=8  chars=[LETTERS][NUMBERS]
    Input Text   ${product_list_filter_save_as_filter_group_input}  ${fixed_phrase_input}
    Wait Until Page Contains Element   ${edit_list_request_button}
    Click Element   ${edit_list_request_button}
    Wait Until Page Contains Element   ${edit_list_request_submit_button}
    Click Element   ${edit_list_request_submit_button}

#    Wait Until Page Contains Element   ${edit_list_fixed_phrases_input}
#    Input Text   ${edit_list_fixed_phrases_input}  easy   #Easy on and off.
#    Wait Until Page Contains Element   ${edit_list_fixed_phrases_suggestions_container}
#    Wait Until Page Contains Element   ${edit_list_fixed_phrases_menu_item_suggestion_item}
#    Click Element   ${edit_list_fixed_phrases_menu_item_suggestion_item}
#    Wait Until Page Contains   Easy on and off.
#    Click Element   ${edit_list_fixed_phrases_delete_icon}
#    Wait Until Page Contains Element  ${edit_list_fixed_phrases_input}

Add Label
    Wait Until Page Contains Element   ${edit_list_labels_input}
    Input Text   ${edit_list_labels_input}  add_labels
    Wait Until Page Contains Element    ${edit_list_labels_add}
    Click Element   ${edit_list_labels_add}
    Wait Until Page Contains   add_labels
    #Wait Until Page Contains Element   ${edit_list_labels_input}
    #Textarea Should Contain   ${edit_list_labels_combobox}  add_labels

Remove Label
    Click Element   ${edit_list_labels_delete_icon}
    Wait Until Page Contains Element   ${edit_list_labels_default_text}
    #Element Text Should Not Be   ${edit_list_labels_combobox}  add_labels

Add Name
    Wait Until Page Contains Element   ${edit_list_name_input}
    Input Text   ${edit_list_name_input}   editlist1_test
    Unselect Frame
    Click Element   ${edit_list_subpage_back_button}
    Sleep  2s
    Wait Until Page Contains Element   ${product_list_edit_button}
    Click Element   ${product_list_edit_button}
    Select Frame    ${edit_list_subpage_iframe}
    Wait Until Page Contains Element   ${edit_list_name_field_input}
    Textfield Should Contain  ${edit_list_name_field_input}  editlist1_test
    #Clear Element Text  ${edit_list_name_input}
    Double Click Element   ${edit_list_name_input}
    Press Keys   ${edit_list_name_input}  CTRL+A+DELETE

Add Original Text And Headline On the Same Page
    Wait Until Page Contains Element   ${edit_list_additional_information_column}
    Click Element   ${edit_list_additional_information_column}
    Wait Until Page Contains Element   ${edit_list_original_headline_input}
    Input Text   ${edit_list_original_headline_input}   headline_test
    Double Click Element   ${edit_list_original_headline_input}
    Press Keys   ${edit_list_original_headline_input}   CTRL+A+DELETE
    Wait Until Page Contains Element   ${edit_list_original_text_textarea}
    Input Text   ${edit_list_original_text_textarea}   text_test
    Double Click Element  ${edit_list_original_text_textarea}
    Press Keys   ${edit_list_original_text_textarea}   CTRL+A+DELETE


End Web Test
    Close Browser
