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
#User Can Use Edit Function In Edit Page
    #[Documentation]  Once enter edit page; user can edit product
    #[Tags]  Edit list
    #Edit on the product

User Can Access To Edit Subpage Frame
    [Documentation]  Once user is logged in; user can navigate to product list page, access to edit subpage frame
    [Tags]  Edit list
    Access To Edit Subpage Frame

User Can Use Add Function In Edit Subpage Frame
    [Documentation]  Once enter edit subpage frame; user can edit product,add function
    [Tags]  Edit list
    #Edit on the product
    #Add Main Category
#    Add Label
#    Remove Label
#    Add Name
#    Add Original Text And Headline On the Same Page
    Navigate On Action Button
    #Navigate On Set Status Button

#User Can Use Search, Request And Add Function On Edit Page
#    [Documentation]  Once enter edit page; user can search, request and add a property
#    [Tags]  Edit list
#    Navigate On Attribute
#    Navigate On Properties
#    Navigate On Occasion
#    Navigate On Color
#    Navigate On Material
#    Navigate On "Made in"
#    Navigate On "Designed in"
#    Navigate On Position
#    Navigate On Phrase
#    Navigate On Fixed Phrase

#User Can Use Search Function In Edit Subpage Frame
#    [Documentation]  Once enter edit subpage frame; user can edit product,search function
#    [Tags]  Edit list
#    Search Attribute
#    Search Property
#    Search Material
#    Search Color
#    Search Occasion
#    Search "Made in"
#    Search "Designed in"
#    Search Position
#    Search Phrase
#    Search Fixed Phrase

#User Can Log Out
    #[Documentation]  Once user is logged in; user can do with Textual; user can log out
    #[Tags] Test
    #Log Out User