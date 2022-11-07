*** Settings ***
Library  SeleniumLibrary
Library  ../Scripts/api.py
Resource  ./keywords.robot
Resource  ./variables.robot
Resource  ./productlist_variables.robot

*** Keywords ***
Begin Web Test Product List
    api.delete_products  ${APP_URL}  ${API_TOKEN}
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
    Wait Until Element Contains  ${product_list_data_table}  ${sku}
    Clear Element Text   ${product_list_search_text_input}   #it works because test both search for sku and filter combined sku
    Click Element   ${product_list_search_button}  # to clear results


Select Earliest Date on After Date
    [Arguments]  ${datepicker_button}
    [Return]  ${date}
    Click Element   ${datepicker_button}  # xpath://div[@role="listbox"]//*[contains(text(), "After")]/../..
    Element Should Be Visible   ${datepicker_button}//*[@class="react-datepicker"]
    Click Element   ${datepicker_button}//*[@class="react-datepicker"]//div[@role="button"][1]
    Element Should Not Be Visible   ${datepicker_button}//*[@class="react-datepicker"]
    ${date}=  Get Text  ${datepicker_button}/span/b

Select Latest Date on After Date
    [Arguments]  ${datepicker_button}
    [Return]  ${date}
    Click Element   ${datepicker_button}
    Element Should Be Visible   ${datepicker_button}//*[@class="react-datepicker"]
    Click Element   ${datepicker_button}//*[@class="react-datepicker"]//div[@role="button"][last()]
    Element Should Not Be Visible   ${datepicker_button}//*[@class="react-datepicker"]
    ${date}=  Get Text  ${datepicker_button}/span/b

Select Earliest Date on Before Date
    [Arguments]  ${datepicker_button}
    [Return]  ${date}
    Click Element   ${datepicker_button}
    Element Should Be Visible   ${datepicker_button}//*[@class="react-datepicker"]
    Click Element   ${datepicker_button}//*[@class="react-datepicker"]//div[@role="button"][1]
    Element Should Not Be Visible   ${datepicker_button}//*[@class="react-datepicker"]
    ${date}=  Get Text  ${datepicker_button}/span/b


Select Latest Date on Before Date
    [Arguments]  ${datepicker_button}
    [Return]  ${date}
    Click Element   ${datepicker_button}  # xpath://div[@role="listbox"]//*[contains(text(), "After")]/../..
    Element Should Be Visible   ${datepicker_button}//*[@class="react-datepicker"]
    Click Element   ${datepicker_button}//*[@class="react-datepicker"]//div[@role="button"][last()]
    Element Should Not Be Visible   ${datepicker_button}//*[@class="react-datepicker"]
    ${date}=  Get Text  ${datepicker_button}/span/b

Clear Filter Fields         #not for SKU search result
    # do not fail if not found
    # clear all found
    #Click Element     xpath://*[@data-testid="close-btn"]
    Wait Until Page Contains Element  ${product_list_product_filter_clear_button}
    Click Element    ${product_list_product_filter_clear_button}
    Sleep  1s

Select Product Creation Date
    Click Element   ${product_list_filter_by_date_button}
    Wait Until Page Contains Element   ${product_list_filter_by_date_menu}
    Click Element   ${product_list_filter_by_date_product_creation_date_option}
    Wait Until Page Contains Element   ${product_list_filter_by_date_product_creation_date_option}
    Wait Until Element Contains  ${product_list_filter_by_date_button}   Product creation date

Select Latest Publication Date
    Click Element   ${product_list_filter_by_date_button}
    Wait Until Page Contains Element   ${product_list_filter_by_date_menu}
    Click Element   ${product_list_filter_by_date_latest_publication_date_option}
    Wait Until Page Contains Element   ${product_list_filter_by_date_latest_publication_date_option}
    Wait Until Element Contains  ${product_list_filter_by_date_button}   Latest publication date

Filter on After Date by Product Creation Date
    Select Product Creation Date
    #${date}=  Select Earliest Date    ${product_list_filter_by_date_after_button}
    ${date}=  Select Earliest Date on After Date   ${product_list_filter_by_date_after_button}
    Wait Until Page Contains Element   ${product_list_data_table}
    Element Should Be Visible   ${product_list_data_table}
    ${date}=  Select Latest Date on After Date    ${product_list_filter_by_date_after_button}
    Element Should Not Be Visible    ${product_list_data_table}

Filter on Before Date by Product Creation Date   # for product is created on current day
    Select Product Creation Date
    #${date}=  Select Latest Date    ${product_list_filter_by_date_before_button}
    ${date}=  Select Latest Date on Before Date   ${product_list_filter_by_date_before_button}
    Wait Until Page Contains Element   ${product_list_data_table}
    Element Should Be Visible   ${product_list_data_table}
    ${date}=  Select Earliest Date on Before Date  ${product_list_filter_by_date_before_button}
    Element Should Not Be Visible    ${product_list_data_table}


Filter on After and Before Date by Product Creation Date
    Select Product Creation Date
#    ${date}=  Select Earliest Date    ${product_list_filter_by_date_after_button}
#    ${date}=  Select Latest Date    ${product_list_filter_by_date_before_button}
    ${date}=  Select Earliest Date on After Date   ${product_list_filter_by_date_after_button}
    ${date}=  Select Latest Date on Before Date    ${product_list_filter_by_date_before_button}
    Wait Until Page Contains Element   ${product_list_data_table}
    Element Should Be Visible   ${product_list_data_table}


Filter on After Date by Latest Publication Date
    Select Latest Publication Date
#    ${date}=  Select Earliest Date    ${product_list_filter_by_date_after_button}
    ${date}=  Select Earliest Date on After Date   ${product_list_filter_by_date_after_button}
    Wait Until Page Contains Element   ${product_list_data_table}
    Element Should Be Visible   ${product_list_data_table}
    ${date}=  Select Latest Date on After Date    ${product_list_filter_by_date_after_button}
    Element Should Not Be Visible    ${product_list_data_table}


Filter on Before Date by Latest Publication Date   # for product is created on current day
    Select Latest Publication Date
#    ${date}=  Select Latest Date    ${product_list_filter_by_date_before_button}
    ${date}=  Select Latest Date on Before Date   ${product_list_filter_by_date_before_button}
    Wait Until Page Contains Element   ${product_list_data_table}
    Element Should Be Visible   ${product_list_data_table}
    ${date}=  Select Earliest Date on Before Date  ${product_list_filter_by_date_before_button}
    Element Should Not Be Visible    ${product_list_data_table}


Filter on After and Before Date by Latest Publication Date
    Select Latest Publication Date
#    ${date}=  Select Earliest Date    ${product_list_filter_by_date_after_button}
#    ${date}=  Select Latest Date    ${product_list_filter_by_date_before_button}
    ${date}=  Select Earliest Date on After Date   ${product_list_filter_by_date_after_button}
    ${date}=  Select Latest Date on Before Date    ${product_list_filter_by_date_before_button}
    Wait Until Page Contains Element   ${product_list_data_table}
    Element Should Be Visible   ${product_list_data_table}


Filter by Product Creation Date Combined SKU Search   #not use Search for SKU,because there SKU search result is verified individually
    [Arguments]  ${sku}
    Wait Until Page Contains Element   ${product_list_search_button}
    Input Text   ${product_list_search_text_input}   ${sku}
    Select Product Creation Date
#    ${date}=  Select Earliest Date   ${product_list_filter_by_date_after_button}
#    ${date}=  Select Latest Date   ${product_list_filter_by_date_before_button}
    ${date}=  Select Earliest Date on After Date   ${product_list_filter_by_date_after_button}
    ${date}=  Select Latest Date on Before Date    ${product_list_filter_by_date_before_button}
    Click Element   ${product_list_search_button}
    Wait Until Page Contains Element    ${product_list_data_table}
    Element Should Be Visible  xpath://td[@class="sku"][contains(text(),"${sku}")]



Filter by Latest Publication Date Combined SKU Search
    [Arguments]  ${sku}
    Wait Until Page Contains Element   ${product_list_search_button}
    Input Text   ${product_list_search_text_input}   ${sku}
    Select Latest Publication Date
#    ${date}=  Select Earliest Date    ${product_list_filter_by_date_after_button}
#    ${date}=  Select Latest Date    ${product_list_filter_by_date_before_button}
    ${date}=  Select Earliest Date on After Date   ${product_list_filter_by_date_after_button}
    ${date}=  Select Latest Date on Before Date    ${product_list_filter_by_date_before_button}
    Click Element   ${product_list_search_button}
    Wait Until Page Contains Element    ${product_list_data_table}
    Element Should Be Visible  xpath://td[@class="sku"][contains(text(),"${sku}")]
    Element Should Be Visible  ${product_list_data_text_status_published_blue_paper_areoplane_icon}


Filter on Show All in Product Status
    Click Element   ${product_list_filter_product_status_button}
    Element Should Be Visible   ${product_list_filter_product_status_menu}
    Click Element   ${product_list_filter_product_status_show_all_option}
    Wait Until Page Contains Element   ${product_list_filter_product_status_button}
    Element Should Contain  ${product_list_filter_product_status_button}   Show all   #verify ?
    #no check of results


Filter on Importing
    Click Element   ${product_list_filter_product_status_button}
    Element Should Be Visible   ${product_list_filter_product_status_menu}
    Click Element   ${product_list_filter_product_status_importing_option}
    Wait Until Page Contains Element   ${product_list_product_table_product_status_cell}
    ${importing}  Get Text  ${product_list_product_table_product_status_cell}
    Should Be True    "${importing}" == "Importing"


Filter on In Progress
    Click Element   ${product_list_filter_product_status_button}
    Element Should Be Visible   ${product_list_filter_product_status_menu}
    Click Element   ${product_list_filter_product_status_in_progress_option}
    Wait Until Page Contains Element   ${product_list_product_table_product_status_cell}
    ${in_progress}  Get Text  ${product_list_product_table_product_status_cell}
    Should Be True    "${in_progress}" == "In progress"

Filter on Ready
    Click Element   ${product_list_filter_product_status_button}
    Element Should Be Visible   ${product_list_filter_product_status_menu}
    Click Element   ${product_list_filter_product_status_ready_option}
    Wait Until Page Contains Element   ${product_list_product_table_product_status_cell}
    ${ready}  Get Text  ${product_list_product_table_product_status_cell}
    Should Be True    "${ready}" == "Ready"


Set Text Statuses in Column
    Click Element   ${product_list_column_button}
    Element Should Be Visible  ${product_list_column_menu}
    Wait Until Page Contains Element   ${product_list_column_text_statuses_checkbox}
    Click Element   ${product_list_column_text_statuses_checkbox}
    Scroll Element Into View   ${product_list_column_update_button}
    Wait Until Page Contains Element   ${product_list_column_update_button}
    Click Element   ${product_list_column_update_button}
    Wait Until Page Contains Element   ${product_list_text_status_column_in_products_table}
#    ${text_statuses}  Get Text  ${product_list_text_status_column_in_products_table}
#    Should Be True    "${text_statuses}" == "Text Statuses"

Filter on Show All in Text Status
    Set Text Statuses in Column
    Click Element   ${product_list_filter_text_status_button}
    Wait Until Page Contains Element   ${product_list_filter_text_status_menu}
    Sleep  2s
    Click Element   ${product_list_filter_text_status_show_all_option}
    Wait Until Page Contains Element   ${product_list_filter_text_status_button}
    Element Should Contain  ${product_list_filter_text_status_button}   Show all   #verify

Filter on Needs Review
    Set Text Statuses in Column
    Check Languages On Text Column
    Click Element   ${product_list_filter_text_status_button}
    Element Should Be Visible   ${product_list_filter_text_status_menu}
    Click Element   ${product_list_filter_text_status_needs_review_option}
    Wait Until Page Contains Element   ${product_list_product_table_text_statuses_cell}
    Wait Until Page Contains Element   ${product_list_product_table_text_column}
    Element Should Be Visible    ${product_list_data_text_status_needs_reviewed_orange_eye_icon}           #? just verify text&bullets has orange eye icon --needs review, text status only has red flag icon

Filter on Approved
    Set Text Statuses in Column
    Check Languages On Text Column
    Click Element   ${product_list_filter_text_status_button}
    Element Should Be Visible   ${product_list_filter_text_status_menu}
    Click Element   ${product_list_filter_text_status_approved_option}
    Wait Until Page Contains Element   ${product_list_product_table_text_statuses_cell}
    Wait Until Page Contains Element   ${product_list_product_table_text_column}
    Element Should Be Visible  ${product_list_data_text_status_approved_green_tick_icon}


Filter on Waiting to be Published
    Set Text Statuses in Column
    Check Languages On Text Column
    Click Element   ${product_list_filter_text_status_button}
    Element Should Be Visible   ${product_list_filter_text_status_menu}
    Click Element   ${product_list_filter_text_status_waiting_to_be_published_option}
    Wait Until Page Contains Element   ${product_list_product_table_text_statuses_cell}
    Wait Until Page Contains Element   ${product_list_product_table_text_column}
    #Sleep   1s
    Element Should Be Visible   ${product_list_data_text_status_waiting_to_be_published_orange_hour_glass_icon}


Filter on Published
    Set Text Statuses in Column
    Check Languages On Text Column
    Click Element   ${product_list_filter_text_status_button}
    Element Should Be Visible   ${product_list_filter_text_status_menu}
    Click Element   ${product_list_filter_text_status_published_option}
    Wait Until Page Contains Element   ${product_list_product_table_text_statuses_cell}
    Wait Until Page Contains Element   ${product_list_product_table_text_column}
    Element Should Be Visible   ${product_list_data_text_status_published_blue_paper_areoplane_icon}


Filter on Show All in Translation Status
    Check Languages On Text Column
    Wait Until Page Contains Element   ${product_list_filter_translation_status_button}
    Click Element   ${product_list_filter_translation_status_button}
    Element Should Be Visible   ${product_list_filter_translation_status_menu}
    Click Element   ${product_list_filter_translation_status_show_all_option}
    Element Should Contain  ${product_list_filter_product_status_button}   Show all  #verify

Filter on Missing Translation
    Check Languages On Text Column
    Click Element   ${product_list_filter_translation_status_button}
    Element Should Be Visible   ${product_list_filter_translation_status_menu}
    Click Element   ${product_list_filter_translation_status_missing_translations_option}
    Element Should Be Visible  ${product_list_data_text_column_missing_translation_flag_icon}  #verify


Filter on Complete Translation
    Check Languages On Text Column
    Click Element   ${product_list_filter_translation_status_button}
    Element Should Be Visible   ${product_list_filter_translation_status_menu}
    Click Element   ${product_list_filter_translation_status_complete_translations_option}
    Element Should Not Be Visible  ${product_list_data_text_column_missing_translation_flag_icon}   ##verify,here flag should not be visible, but actually is visible on filter results


Set Parent-Child Relations Optional Filter by More Options
    Click Element   ${product_list_filter_more_button}
    Element Should Be Visible   ${product_list_filter_more_menu}
    #Wait Until Page Contains Element  ${product_list_filter_more_parent_child_option}
    Click Element   ${product_list_filter_more_parent_child_option}
    Wait Until Page Contains Element   ${product_list_filter_parent_child_button}

Delete Parent-Child Relations Optional Filter   #it is an optional filter so add deleter keywords to let filer on parent or child on Parent-Child Relations individually
    Wait Until Page Contains Element   ${product_list_filter_parent_child_option_close_button}
    Click Element   ${product_list_filter_parent_child_option_close_button}
    Wait Until Page Does Not Contain Element  ${product_list_filter_parent_child_button}

Filter on Show All in Parent-Child Relations
    Set Parent-Child Relations Optional Filter by More Options
    Click Element   ${product_list_filter_parent_child_button}
    Element Should Be Visible   ${product_list_filter_parent_child_menu}
    Click Element   ${product_list_filter_parent_child_relations_show_all_option}
    Element Should Contain  ${product_list_filter_parent_child_button}   Show all
    Delete Parent-Child Relations Optional Filter   #

Filter on Parent in Parent-Child Relations
    Set Parent-Child Relations Optional Filter by More Options
    Click Element   ${product_list_filter_parent_child_button}
    Element Should Be Visible   ${product_list_filter_parent_child_menu}
    Click Element   ${product_list_filter_parent_child_relations_parents_option}
    Element Should Contain  ${product_list_filter_parent_child_button}  Parents
    Wait Until Page Contains Element   xpath://td[@class="parent"]
    ${parent}  Get Text  xpath://td[@class="parent"]
    Should Be Empty  ${parent}


Filter on Child in Parent-Child Relations
    Set Parent-Child Relations Optional Filter by More Options
    Click Element   ${product_list_filter_parent_child_button}
    Element Should Be Visible   ${product_list_filter_parent_child_menu}
    Click Element   ${product_list_filter_parent_child_relations_children_option}
    Element Should Contain  ${product_list_filter_parent_child_button}   Children
    Wait Until Page Contains Element   xpath://td[@class="parent"]//a
    ${child_parent}   Get Text  xpath://td[@class="parent"]//a
    Should Not Be Empty  ${child_parent}


Check Languages On Text Column
    #[Arguments]   ${number}
    Click Element   ${product_list_text_column_button}
    Sleep  2s
    Wait Until Page Contains Element   xpath://div[@data-testid="channel-language-selector-modal"]
    Element Should Be Visible   ${product_list_text_column_select_column}
    Wait Until Page Contains Element   ${product_list_text_column_text&bullet_select_all_checkbox}
    Click Element   ${product_list_text_column_text&bullet_select_all_checkbox}
    Scroll Element Into View   ${product_list_text_column_update_view_button}
    Element Should Be Visible    ${product_list_text_column_update_view_button}
    Click Element   ${product_list_text_column_update_view_button}
#    ${text_column_language}  Get Text  xpath://th[@class="three wide text-column"][1]
#    Log   ${text_column_language}
    ${list}   create list   1   2   3   4   5   6   7
    FOR  ${number}  IN  @{list}
        ${text_column_language}  Get Text  xpath://th[@class="three wide text-column"][${number}]
        Log   ${text_column_language}
    END
    #    # verify all languanges column are shown on text column ?


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
    # need to verify each option has been shown on product data table colum?

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
    Click Element   ${product_list_column_update_button}          # after click update button, no info is shown in column, verify?

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
    Wait Until Page Contains    Filter group created successfully


Create A New Filter
    [Arguments]   ${filter_name}
    Input Text   ${product_list_filter_save_as_filter_name_input}  ${filter_name}
    Wait Until Page Contains Element   ${product_list_filter_save_as_filter_name_create_filter_button}
    Click Element   ${product_list_filter_save_as_filter_name_create_filter_button}
    Wait Until Page Contains    Filter created successfully


Delete A Filter Group
    [Arguments]    ${group_name}
    Click Element   ${hamburger_menu_button}
    Element Should Be Visible   ${hamburger_menu_dropdown}
    Wait Until Page Contains Element   ${hamburger_menu_dropdown_manage}
    Click Element   ${hamburger_menu_dropdown_manage}
    Select Frame   ${subpage_iframe}
    Wait Until Page Contains Element   ${hamburger_menu_dropdown_manage_filter_groups}
    Click Element   ${hamburger_menu_dropdown_manage_filter_groups}
    Wait Until Page Contains Element    xpath://*[contains(text(),"${group_name}")]/../..//button[contains(text(), "Delete")]   #${hamburger_menu_dropdown_manage_filter_groups_delete}
    Click Element   xpath://*[contains(text(),"${group_name}")]/../..//button[contains(text(), "Delete")]  #${hamburger_menu_dropdown_manage_filter_groups_delete}
    Handle Alert
    Wait Until Page Contains    Filter group removed successfully

