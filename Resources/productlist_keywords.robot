*** Settings ***
Library  SeleniumLibrary
Library  ../Scripts/api.py
Resource  ./keywords.robot
Resource  ./variables.robot
Resource  ./productlist_variables.robot

*** Keywords ***
Begin Web Test Product List
    api.create_products  ${APP_URL}  ${API_TOKEN}
    Sleep   2s
    Begin Web Test
    Go To Login Page
    Log In User
    Wait Until Page Contains Element   ${customer_home_edit_button}
    Click Element   ${customer_home_edit_button}
    Wait Until Page Contains   Products

End Web Test Product List
    End Web Test
    api.delete_products  ${APP_URL}  ${API_TOKEN}

Search for SKU
    [Arguments]  ${sku}
    Wait Until Page Contains Element   ${product_list_search_button}
    Input Text   ${product_list_search_text_input}   ${sku}
    Click Element   ${product_list_search_button}
    Wait Until Page Contains Element   ${product_list_data_table}

Select Earliest Date
    [Arguments]  ${datepicker_button}
    [Return]  ${date}
    Click Element   ${datepicker_button}  # xpath://div[@role="listbox"]//*[contains(text(), "After")]/../..
    Element Should Be Visible   ${datepicker_button}//*[@class="react-datepicker"]
    Click Element   ${datepicker_button}//*[@class="react-datepicker"]//div[@role="button"][1]
    Element Should Not Be Visible   ${datepicker_button}//*[@class="react-datepicker"]
    ${date}=  Get Text  ${datepicker_button}/span/b

Select Latest Date
    [Arguments]  ${datepicker_button}
    [Return]  ${date}
    Click Element   ${datepicker_button}  # xpath://div[@role="listbox"]//*[contains(text(), "After")]/../..
    Element Should Be Visible   ${datepicker_button}//*[@class="react-datepicker"]
    Click Element   ${datepicker_button}//*[@class="react-datepicker"]//div[@role="button"][last()]
    Element Should Not Be Visible   ${datepicker_button}//*[@class="react-datepicker"]
    ${date}=  Get Text  ${datepicker_button}/span/b

Clear Filter Fields
    # TODO do not fail if not found
    # TODO clear all found
    Click Element     xpath://*[@data-testid="close-btn"]

Select Product Creation Date
    Click Element   ${product_list_filter_by_date_button}
    Wait Until Page Contains Element   ${product_list_filter_by_date_menu}
    Click Element   ${product_list_filter_by_date_product_creation_date_option}
    Wait Until Page Contains Element   ${product_list_filter_by_date_product_creation_date_option}

Select Latest Publication Date
    Click Element   ${product_list_filter_by_date_button}
    Wait Until Page Contains Element   ${product_list_filter_by_date_menu}
    Click Element   ${product_list_filter_by_date_latest_publication_date_option}
    Wait Until Page Contains Element   ${product_list_filter_by_date_latest_publication_date_option}

Filter on After Date by Product Creation Date
    Select Product Creation Date
    ${date}=  Select Earliest Date    ${product_list_filter_by_date_after_button}

Filter on Before Date by Product Creation Date
    Select Product Creation Date
    Select Latest Date    ${product_list_filter_by_date_before_button}

Filter on After and Before Date by Product Creation Date
    Select Product Creation Date
    Select Earliest Date    ${product_list_filter_by_date_after_button}
    Select Latest Date    ${product_list_filter_by_date_before_button}

Filter on After Date by Latest Publication Date
    Select Latest Publication Date
    Select Earliest Date    ${product_list_filter_by_date_after_button}

Filter on Before Date by Latest Publication Date
    Select Latest Publication Date
    Select Latest Date    ${product_list_filter_by_date_before_button}

Filter on After and Before Date by Latest Publication Date
    Select Latest Publication Date
    Select Earliest Date    ${product_list_filter_by_date_after_button}
    Select Latest Date    ${product_list_filter_by_date_before_button}

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
    # TODO no check of results

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
    Wait Until Page Contains    Filter created successfully

Delete A Filter Group
    [Arguments]    ${group_name}
    Click Element   ${product_list_menu_button}
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

