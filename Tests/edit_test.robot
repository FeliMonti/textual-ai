*** Settings ***
Documentation  Testing Textual
Resource  ../Resources/keywords.robot
Resource  ../Resources/edit_keywords.robot
Resource  ../Resources/variables.robot
Resource  ../Resources/edit_variables.robot
Library  SeleniumLibrary
Library  robot.libraries.String
Suite Setup   Begin Web Test Edit
Suite Teardown  End Web Test Edit

*** Variables ***
${USERNAME}  regrtestaccount

*** Test Cases ***
#User Can Access To Edit Subpage Frame
#    [Documentation]  Once user is logged in; user can navigate to product list page, access to edit subpage frame
#    [Tags]  Edit list
#    Enter Edit Subpage Frame With Edit Button 3

User Can Use Add Function In Edit Subpage Frame
    [Documentation]  Once enter edit subpage frame; user can edit product,add function
    [Tags]  Edit list

# TODO: Group these into smaller individual tests

##    Exit Edit Subpage Frame
##    Test On Setting importing Status
##    Test On Setting Ready Status
##    Test On Setting In-progress Status
#    Enter Edit Subpage Frame With Edit Button 3
#    Test On Main Category
#    Test On Label
#    Test On Name
#    Test On Original Text And Headline On the Same Page
#    Add Main Category
#    Delete Main Category
#    Add Label
#    Remove Label
#    Add Name
#    Add Original Text And Headline On the Same Page
#    Test On Attribute Column
#    Delete Attribute
#    Add Item Into Fields   ${edit_list_properties_input}
#    Delete Item From Fields   ${edit_list_properties_input}

Duplicate Product
    [Documentation]  User can duplicate a product
    Click On Edit Button    ${product_list_data_table_edit_button_3}
    ${SKU1}=   Get SKU On Subpage

    ${text1}=   Set Variable   testing 123
    Set Original Text    ${text1}

    Click Duplicate Button
    ${SKU2}=   Get SKU On Subpage

    Should Be True  "${SKU1}" != "${SKU2}"

    ${text2}=  Get Original Text
    Should Be True  "${text1}" == "${text2}"

Add New Product
    [Documentation]  User can add new product from action menu
    Click On Edit Button    ${product_list_data_table_edit_button_1}
    ${SKU1}=  Get SKU On Subpage

    Click On Action Button   ${edit_list_actions_new_button}
    ${SKU2}=  Get SKU On Subpage

    Should Be True  "${SKU1}" != "${SKU2}"
    Exit Edit Subpage Frame

Copy From Another Product
    [Documentation]  User can copy different fileds from another product
    Click On Edit Button    ${product_list_data_table_edit_button_3}
    ${SKU_EAN_Input}=  Get SKU On Subpage

    Test On Attribute Field
    Exit Edit Subpage Frame

    Click On Edit Button    ${product_list_data_table_edit_button_1}
    Copy From Function   ${SKU_EAN_Input}

    Wait Until Page Contains Element   ${edit_list_subpart_attribute_new_attribute_selected}
    ${attribute}   Get Text   ${edit_list_subpart_attribute_new_attribute_selected}
    Log   ${attribute}

    Delete Attribute
    Exit Edit Subpage Frame

    Click On Edit Button    ${product_list_data_table_edit_button_3}
    Delete Attribute
    Exit Edit Subpage Frame

Copy To Another Product
    [Documentation]  User can copy different fields to another product
    Click On Edit Button    ${product_list_data_table_edit_button_2}
    ${SKU1}=  Get SKU On Subpage

    Exit Edit Subpage Frame
    Click On Edit Button    ${product_list_data_table_edit_button_4}

    Test On Attribute Field
    Copy To Function   ${SKU1}

    Delete Attribute
    Exit Edit Subpage Frame
    Click On Edit Button    ${product_list_data_table_edit_button_2}

    Wait Until Page Contains Element   ${edit_list_subpart_attribute_new_attribute_selected}
    ${attribute}   Get Text   ${edit_list_subpart_attribute_new_attribute_selected}
    Log   ${attribute}

    Delete Attribute
    Exit Edit Subpage Frame

User Can Use Search, Request And Add Function On Edit Subpage Frame
    [Documentation]  Once enter edit page; user can search, request and add a property
    Click On Edit Button    ${product_list_data_table_edit_button_3}
    Test On Attribute Column
    Test On Field   ${edit_list_properties_input}
    Test On Field   ${edit_list_occasion_input}
    Test On Field   ${edit_list_color_input}
    Test On Field   ${edit_list_material_input}
    Test On Field   ${edit_list_made_in_input}
    Test On Field   ${edit_list_designed_in_input}
    Test On Field   ${edit_list_position_input}
    Test On Field   ${edit_list_phrase_input}
    Test On Field   ${edit_list_fixed_phrase_input}
