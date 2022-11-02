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

Enter Edit Subpage Frame With Edit Button 1
    Wait Until Page Contains Element   ${product_list_data_table_edit_button_1}
    Click Element   ${product_list_data_table_edit_button_1}
    Select Frame    ${edit_list_subpage_iframe}
    Wait Until Page Contains Element   ${edit_list_edit_tab}
    Click Element   ${edit_list_edit_tab}

Enter Edit Subpage Frame With Edit Button 2
    Wait Until Page Contains Element   ${product_list_data_table edit_button_2}
    Scroll Element Into View   ${product_list_data_table edit_button_2}
    Click Element   ${product_list_data_table edit_button_2}
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

Enter Edit Subpage Frame With Edit Button 4
    Wait Until Page Contains Element   ${product_list_data_table edit_button_4}
    Scroll Element Into View   ${product_list_data_table edit_button_4}
    Click Element   ${product_list_data_table edit_button_4}
    Select Frame    ${edit_list_subpage_iframe}
    Wait Until Page Contains Element   ${edit_list_edit_tab}
    Click Element   ${edit_list_edit_tab}

Exit Edit Subpage Frame
    Unselect Frame
    Wait Until Page Contains Element  ${edit_list_subpage_back_button}
    Click Element   ${edit_list_subpage_back_button}

Test On Action Button New Function
    Enter Edit Subpage Frame With Edit Button 1
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

Get SKU
    [Return]    ${SKU}
    Wait Until Page Contains Element   ${edit_list_SKU_number}
    ${SKU}=  Get Text  ${edit_list_SKU_number}

Click Duplicate Button
    Click Element   ${edit_list_actions_button}
    Element Should Be Visible   ${edit_list_actions_menu}
    Wait Until Page Contains Element   ${edit_list_actions_duplicate_button}
    Click Element   ${edit_list_actions_duplicate_button}

Test On Action Button Duplicate Function


    # Make sure SKUs are different

    # Get original text (from edit view)

    # Compare texts




    # Go back to product list, turn on original test column
    # Exit Edit Subpage Frame
    # Wait Until Page Contains Element  ${product_list_column_button}
    # Click Element   ${product_list_column_button}
    # Element Should Be Visible  ${product_list_column_menu}
    # Wait Until Page Contains Element   ${product_list_column_oiginal_text_checkbox}
    # Click Element   ${product_list_column_oiginal_text_checkbox}
    # Scroll Element Into View   ${product_list_column_update_button}
    # Wait Until Page Contains Element   ${product_list_column_update_button}
    # Click Element   ${product_list_column_update_button}

    # Compare text of affecting products
    # Wait Until Page Contains Element   ${edit_list_data_table_original_text_1}
    # ${original_text_column_1}    Get Text    ${edit_list_data_table_original_text_1}
    # Log    ${original_text_column_1}
    # ${original_text_column_4}    Get Text    ${edit_list_data_table_original_text_4}
    # Log    ${original_text_column_4}
    # Should Be True  "${original_text_column_1}" == "${original_text_column_4}"

Test On Action Button Copy From Function
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
    Sleep  2s
    Wait Until Page Contains Element   ${edit_list_subpart_attribute_new_attribute_selected}
    ${attribute}   Get Text   ${edit_list_subpart_attribute_new_attribute_selected}
    Log   ${attribute}
    Delete Attribute
    Exit Edit Subpage Frame
    Enter Edit Subpage Frame With Edit Button 3
    Delete Attribute
    Exit Edit Subpage Frame

Test On Action Button Copy To Function
    Enter Edit Subpage Frame With Edit Button 2
    Wait Until Page Contains Element   ${edit_list_SKU_number}
    ${get_SKU_1}=  Get Text  ${edit_list_SKU_number}
    Log   ${get_SKU_1}
    Exit Edit Subpage Frame
    Enter Edit Subpage Frame With Edit Button 4
    Test On Attribute Column
    Wait Until Page Contains Element   ${edit_list_actions_button}
    Click Element   ${edit_list_actions_button}
    Element Should Be Visible   ${edit_list_actions_menu}
    Click Element   ${edit_list_actions_copy_to_button}
    Wait Until Page Contains Element   ${edit_list_SKU_EAN_input}
    Input Text   ${edit_list_SKU_EAN_input}   ${get_SKU_1}
    Wait Until Page Contains Element   ${edit_list_actions_copy_to_copy_button}
    Click Element  ${edit_list_actions_copy_to_copy_button}
    Sleep  2s
    Delete Attribute
    Exit Edit Subpage Frame
    Enter Edit Subpage Frame With Edit Button 2
    Wait Until Page Contains Element   ${edit_list_subpart_attribute_new_attribute_selected}
    ${attribute}   Get Text   ${edit_list_subpart_attribute_new_attribute_selected}
    Log   ${attribute}
    Delete Attribute
    Exit Edit Subpage Frame

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

# Search For Item In Field
#     [Arguments]    ${input_selector}    ${text}
#     Wait Until Page Contains Element   ${input_selector}
#     # Wait Until Element Is Visible   ${input_selector}   timeout=5s
#     # Sleep   1s  # without this we get InvalidElementStateException: Message: invalid element state: Element is not currently interactable and may not be manipulated
#     Input Text   ${input_selector}  ${text}
#     Wait Until Page Contains Element   ${edit_list_suggestions_container}

Request Item In Field
    # Implicitly adds newly requested item
    [Arguments]    ${input_selector}    ${text}

    # Search
    Wait Until Page Contains Element   ${input_selector}
    Input Text   ${input_selector}  ${text}
    Wait Until Page Contains Element   ${edit_list_suggestions_container}
    
    # Request
    Wait Until Page Contains Element   ${edit_list_request_button}
    Click Element   ${edit_list_request_button}
    Wait Until Page Contains Element   ${edit_list_request_submit_button}
    Click Element   ${edit_list_request_submit_button}

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

