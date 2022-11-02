*** Settings ***
Documentation  Testing Textual
Resource  ../Resources/keywords.robot
Resource  ../Resources/edit_keywords.robot
Resource  ../Resources/variables.robot
Resource  ../Resources/edit_variables.robot
Library  SeleniumLibrary
Library  robot.libraries.String
Suite Setup   Begin Web Test Edit
Suite Teardown  End Web Test

*** Test Cases ***
#User Can Access To Edit Subpage Frame
#    [Documentation]  Once user is logged in; user can navigate to product list page, access to edit subpage frame
#    [Tags]  Edit list
#    Enter Edit Subpage Frame With Edit Button 3

User Can Use Add Function In Edit Subpage Frame
    [Documentation]  Once enter edit subpage frame; user can edit product,add function
    [Tags]  Edit list

    #${input}=  Generate Random String  length=8  chars=[LETTERS][NUMBERS]

#    Enter Edit Subpage Frame With Edit Button 3
#    Test On Action Button New Function
#    Test On Deleting A Product
#    Test On Action Button Duplicate Function
     Test On Action Button Copy From Function
#     Test On Action Button Copy To Function    #---Copy-to function is working halv way, test is not applicable---"
#     Test On Setting importing Status
#     Test On Setting Ready Status
#     Test On Setting In-progress Status
#    Add Main Category                                    # Delete
#    Add Label                                            # Delete
#    Remove Label                                         # Delete
#    Add Name                                             # Delete
#    Add Original Text And Headline On the Same Page      # Delete

#    Test On Action Button New Function                   # Delete
#    Test On Deleting A Product                           # Delete
#    Test On Action Button Duplicate Function             # Delete
#    Test On Action Button Copy From Function             # Delete      #---Copy-from function is not working, test is not applicable---"
#    Test On Action Button Copy To Function               # Delete      #---Copy-to function is working halv way, test is not applicable---"
#    Test On Setting importing Status                     # Delete
#    Test On Setting Ready Status                         # Delete
#    Test On Setting In-progress Status                   # Delete
#    Access To Edit Subpage Frame
#     Test On Main Category
#     Test On Label
#     Test On Name
#     Test On Original Text And Headline On the Same Page

User Can Use Search, Request And Add Function On Edit Subpage Frame
    [Documentation]  Once enter edit page; user can search, request and add a property
    [Tags]  Edit list
    #Access To Edit Subpage Frame
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
#User Can Use Search, Request And Add Function On Edit Subpage Frame
#    [Documentation]  Once enter edit page; user can search, request and add a property
#    [Tags]  Edit list
#    #Access To Edit Subpage Frame
#    Test On Attribute Column
#    Test On Field   ${edit_list_properties_input}
#    Test On Field   ${edit_list_occasion_input}
#    Test On Field   ${edit_list_color_input}
#    Test On Field   ${edit_list_material_input}
#    Test On Field   ${edit_list_made_in_input}
#    Test On Field   ${edit_list_designed_in_input}
#    Test On Field   ${edit_list_position_input}
#    Test On Field   ${edit_list_phrase_input}
#    Test On Field   ${edit_list_fixed_phrase_input}