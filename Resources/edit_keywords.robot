*** Settings ***
Library  SeleniumLibrary
Library  robot.libraries.String
Resource  ./keywords.robot
Resource  ./variables.robot
Resource  ./edit_variables.robot

*** Keywords ***
Begin Web Test Edit
    Begin Web Test
    Go To Login Page
    Log In User
    # Wait Until Page Contains Element   ${customer_home_create_button}
    # Click Element   ${customer_home_create_button}
    Wait Until Page Contains Element   ${customer_home_edit_button}
    Click Element   ${customer_home_edit_button}
    Wait Until Page Contains   Products

# TODO: Combine below into a single keyword, which takes row number as argument

End Web Test Edit
    End Web Test

Click On Create Button
    Wait Until Page Contains Element   ${product_list_create_button}
    Scroll Element Into View  ${product_list_create_button}
    Click Element   ${product_list_create_button}
    Sleep  1s
    Wait Until Page Contains Element   ${edit_list_edit_tab}
    Click Element   ${edit_list_edit_tab}

Click On Edit Button
    [Arguments]    ${input_selector}
    Wait Until Page Contains Element   ${input_selector}
    Scroll Element Into View  ${input_selector}
    Click Element   ${input_selector}
    Select Frame    ${subpage_iframe}
    Wait Until Page Contains Element   ${edit_list_edit_tab}
    Click Element   ${edit_list_edit_tab}

Exit Edit Subpage Frame
    Unselect Frame
    Wait Until Page Contains Element  ${edit_list_subpage_back_button}
    Click Element   ${edit_list_subpage_back_button}

Click On Action Button
    [Arguments]   ${input_selector}
    Wait Until Page Contains Element   ${edit_list_actions_button}
    Click Element   ${edit_list_actions_button}
    Wait Until Page Contains Element   ${edit_list_actions_menu}
    Wait Until Page Contains Element   ${input_selector}
    Click Element   ${input_selector}

Get Original Text
    [Return]    ${text}
    Wait Until Page Contains Element   ${edit_list_additional_information_button}
    Click Element   ${edit_list_additional_information_button}
    Wait Until Page Contains Element   ${edit_list_original_text_input}
    ${text}=    Get Text  ${edit_list_original_text_input}

Set Original Text
    [Arguments]    ${text}
    Wait Until Page Contains Element   ${edit_list_additional_information_button}
    Click Element   ${edit_list_additional_information_button}
    Wait Until Page Contains Element   ${edit_list_original_text_input}
    Input Text   ${edit_list_original_text_input}    ${text}
    Sleep  2s  # wait for autosave

Get SKU On Subpage
    [Return]    ${SKU}
    Wait Until Page Contains Element   ${edit_list_SKU_number}
    ${SKU}=  Get Text  ${edit_list_SKU_number}
    Log  ${SKU}

Get SKU On Data Table
    [Arguments]    ${input_selector}
    [Return]    ${SKU_number}
    Wait Until Page Contains Element   ${input_selector}
    ${SKU_number}    Get Text    ${input_selector}
    Log  ${SKU_number}

Click Duplicate Button
    Click Element   ${edit_list_actions_button}
    Element Should Be Visible   ${edit_list_actions_menu}
    Wait Until Page Contains Element   ${edit_list_actions_duplicate_button}
    Click Element   ${edit_list_actions_duplicate_button}

SKU_EAN Input
    [Arguments]    ${SKU_EAN_input}
    Wait Until Page Contains Element   ${edit_list_SKU_EAN_input}
    Input Text   ${edit_list_SKU_EAN_input}   ${SKU_EAN_Input}

Click On Copy From Button
    Wait Until Page Contains Element   ${edit_list_actions_copy_from_copy_button}
    Click Element  ${edit_list_actions_copy_from_copy_button}

Copy From Function
    [Arguments]    ${SKU_EAN_input}
    Click On Action Button   ${edit_list_actions_copy_from_button}
    SKU_EAN Input   ${SKU_EAN_Input}
    Click On Copy From Button

Click On Copy To Button
    Wait Until Page Contains Element   ${edit_list_actions_copy_to_copy_button}
    Click Element  ${edit_list_actions_copy_to_copy_button}

Copy To Function
    [Arguments]    ${SKU_EAN_input}
    Click On Action Button   ${edit_list_actions_copy_to_button}
    Click On Copy To Button
    SKU_EAN Input   ${SKU_EAN_Input}

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
    Select Frame    ${subpage_iframe}
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
    # TODO: Remove Name

Test On Original Text And Headline On the Same Page
    Add Original Text And Headline On the Same Page

Add Main Category      #with specified text
    Wait Until Page Contains Element   ${edit_list_main_category_input}
    Wait Until Element Is Visible   ${edit_list_main_category_input}
    Sleep  1s
    Input Text  ${edit_list_main_category_input}  shoes
    Wait Until Page Contains Element   ${edit_list_suggestions_container}   #${edit_list_main_category_sugestions_container}
    Wait Until Page Contains Element  ${edit_list_main_category_menu_item_suggestion_item}
    Click Element   ${edit_list_main_category_menu_item_suggestion_item}
    Wait Until Page Contains Element   ${edit_list_main_category_product_selected_value}

Delete Main Category
    Wait Until Page Contains Element   ${edit_list_main_category_product_selected_value}
    Click Element  ${edit_list_main_category_delete_icon}
    Wait Until Page Contains Element   ${edit_list_main_category_input}
    Wait Until Page Contains Element   ${edit_list_main_category_edit_field_product}

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
    Select Frame    ${subpage_iframe}
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
    Select Frame    ${subpage_iframe}
    Wait Until Page Contains Element   ${edit_list_additional_information_column}
    Click Element   ${edit_list_additional_information_column}
    Wait Until Page Contains Element  ${edit_list_original_headline_input}
    Wait Until Page Contains Element  ${edit_list_original_text_textarea}
    ${original_headline_verify}   Get Value   ${edit_list_original_headline_input}
    Should Be True   "${original_headline_verify}" == "${original_headline_input}"
    ${original_text_verify}  Get Text  ${edit_list_original_text_textarea}
    Should Be True   "${original_text_verify}" == "${original_text_input}"

Test On Attribute Field
    ${attribute_input}=  Generate Random String  length=8  chars=[LETTERS][NUMBERS]

    Request Attribute In Field   ${attribute_input}
    Delete Attribute   ${attribute_input}
    Add Attribute In Field   ${attribute_input}

Request Attribute In Field
    [Arguments]    ${attribute_input}
    # Search
    Wait Until Page Contains Element   ${edit_list_edit_field_add}
    Click Element   ${edit_list_edit_field_add}
    Wait Until Page Contains Element   ${edit_list_subpart_attribute_input}
    Wait Until Element Contains   ${edit_list_subpart_attribute_new_attribute}  new attribute
    Wait Until Page Contains Element   ${edit_list_subpart_attribute_input}
    Input Text   ${edit_list_subpart_attribute_input}   ${attribute_input}
    Log   ${attribute_input}

    # Request
    Wait Until Page Contains Element   ${edit_list_suggestions_container}
    Click On Request Button

Click On Request Button
    Wait Until Page Contains Element   ${edit_list_request_button}
    Click Element   ${edit_list_request_button}
    Wait Until Page Contains Element   ${edit_list_request_submit_button}
    Click Element   ${edit_list_request_submit_button}

Add Attribute In Field
    [Arguments]    ${attribute_input}
    # Search
    Wait Until Page Contains Element   ${edit_list_edit_field_add}
    Click Element   ${edit_list_edit_field_add}
    Wait Until Page Contains Element   ${edit_list_subpart_attribute_input}
    Wait Until Element Contains   ${edit_list_subpart_attribute_new_attribute}  new attribute
    Wait Until Page Contains Element   ${edit_list_subpart_attribute_input}
    Input Text   ${edit_list_subpart_attribute_input}   ${attribute_input}
    Log   ${attribute_input}

    # Add
    Wait Until Page Contains Element   ${edit_list_subpart_attribute_input}
    Wait Until Page Contains Element   ${edit_list_subpart_attribute_new_attribute_selected_value}    timeout=5s
    Sleep  1s
    Wait Until Element Contains   ${edit_list_subpart_attribute_new_attribute_selected_value}   ${attribute_input}

Delete Attribute
    Wait Until Page Contains Element  ${edit_list_subpart_attribute_close}
    Mouse Over  ${edit_list_subpart_attribute_close}
    Wait Until Page Contains Element  ${edit_list_subpart_attribute_close}
    Click Element   ${edit_list_subpart_attribute_close}
    Wait Until Page Contains Element  ${edit_list_subpart_attribute_input}

Test On Field
    [Arguments]    ${input_selector}
    ${text}=  Generate Random String  length=8  chars=[LETTERS][NUMBERS]

    Request Item In Field    ${input_selector}    ${text}
    Delete Item From Field    ${input_selector}    ${text}
    Add Item In Field    ${input_selector}    ${text}
    Delete Item From Field    ${input_selector}    ${text}

Request Item In Field
    # Implicitly adds newly requested item
    [Arguments]    ${input_selector}    ${text}

    # Search
    Wait Until Page Contains Element   ${input_selector}
    Input Text   ${input_selector}  ${text}
    Wait Until Page Contains Element   ${edit_list_suggestions_container}

    # Request
    Click On Request Button

Add Item In Field
    [Arguments]    ${input_selector}    ${text}
     # Search
    Wait Until Page Contains Element   ${input_selector}
    Input Text   ${input_selector}  ${text}
    Wait Until Page Contains Element   ${edit_list_suggestions_container}

    # Click result
    Wait Until Element Is Visible   xpath://div[@class="vocabulary-lookup"]//*[contains(text(), "${text}")]    #timeout=5s
    Click Element  xpath://div[@class="vocabulary-lookup"]//*[contains(text(), "${text}")]

    # Wait until added in field
    Wait Until Page Contains Element   ${input_selector}/..//*[contains(text(), "${text}")]

    ${read_text}=  Get Text  ${input_selector}/preceding-sibling::div
    Log  ${read_text}

Delete Item From Field
    [Arguments]    ${input_selector}    ${text}
    ${delete_icon}=   Set Variable   ${input_selector}/..//*[contains(text(), "${text}")]//i
    Wait Until Element Is Visible   ${delete_icon}   timeout=5s
    Click Element   ${delete_icon}
    Wait Until Page Does Not Contain Element    ${delete_icon}
