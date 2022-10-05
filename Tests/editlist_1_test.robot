*** Settings ***
Documentation  Testing Textual
Resource  ../Resources/keywords1.robot
Resource  ../Resources/variable1.robot
Library  SeleniumLibrary
Library  robot.libraries.DateTime
Suite Setup    Begin Web Test Edit List
Suite Teardown  End Web Test

*** Test Cases ***
User Can Access To Edit Subpage Frame
    [Documentation]  Once user is logged in; user can navigate to product list page, access to edit subpage frame
    [Tags]  Edit list
    Access To Edit Subpage Frame

#User Can Use Add Function In Edit Subpage Frame
    #[Documentation]  Once enter edit subpage frame; user can edit product,add function
    #[Tags]  Edit list
    #Edit on the product
    #Add Main Category
    #Add Subpart
     Add Property
     Add Occasion
     Add Color
     Add Material
     Add "Made in"
     Add "Designed in"
     Add Position
     Add Phrase
     Add Fixed Phrase
     Add Label
     Remove Label
     Add Name
     Add Original Text And Headline On the Same Page

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