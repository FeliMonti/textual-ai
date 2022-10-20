*** Settings ***
Documentation  Testing Textual
Resource  ../Resources/keywords.robot
Resource  ../Resources/variable.robot
Library  SeleniumLibrary
#Library  robot.libraries.DateTime
Library  robot.libraries.String
Suite Setup   Begin Web Test Edit List
Suite Teardown  End Web Test

*** Test Cases ***
User Can Use Edit Function In Edit Page
    [Documentation]  Once enter edit page; user can edit product
    [Tags]  Edit list
    Edit on the product

User Can Access To Edit Subpage Frame
    [Documentation]  Once user is logged in; user can navigate to product list page, access to edit subpage frame
    [Tags]  Edit list
    Access To Edit Subpage Frame

User Can Use Add Function In Edit Subpage Frame
    [Documentation]  Once enter edit subpage frame; user can edit product,add function
    [Tags]  Edit list
    Test On Action Button New Function
    Test On Deleting A Product
    Test On Action Button Duplicate Function
#     Test On Action Button Copy From Function  #---Copy-from function is not working, test is not applicable---"
#     Test On Action Button Copy To Function    #---Copy-to function is working halv way, test is not applicable---"
    Test On Setting importing Status
    Test On Setting Ready Status
    Test On Setting In-progress Status
    Add Main Category
    Add Label
    Remove Label
    Add Name
    Add Original Text And Headline On the Same Page

User Can Use Search, Request And Add Function On Edit Page
    [Documentation]  Once enter edit page; user can search, request and add a property
    [Tags]  Edit list
    Test On Attribute Column
    Test On Properties Column
    Test On Occasion Column
    Test On Color Column
    Test On Material Column
    Test On "Made in" Column
    Test On "Designed in" Column
    Test On Position Column
    Test On Phrase Column
    Test On Fixed Phrase Column

#User Can Log Out
    #[Documentation]  Once user is logged in; user can do with Textual; user can log out
    #[Tags] Test
    #Log Out User
