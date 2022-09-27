*** Settings ***
Documentation  Testing Textual
Resource  ../Resources/keywords2.robot
Resource  ../Resources/variable2.robot
Library  SeleniumLibrary
#Library  robot.libraries.DateTime
Suite Setup    Begin Web Test
Suite Teardown  End Web Test

*** Test Cases ***
User Can Access Website And See Front Page
    [Documentation]  Once accessing the website; being able to see the front page
    [Tags]  Product list
    Go To Web Page

User Can Log In
    [Documentation]  Once accessing the website; user can log in
    [Tags]  Product list
    Log in User

User Can Access to The Edit Page
    [Documentation]  Once logged in; user can access to edit page
    [Tags]  Product list
    Access To Edit Page

User Can Check Translation Status
    [Documentation]  Once enter edit page; user can check translation status
    [Tags]  Product list
    Check Translation Status

User Can Check Parent-Child Relations
    [Documentation]  Once enter edit page; user can check Parent-Child relations
    [Tags]  Product list
    Check Parent-Child Relations

User Can Check Selected Laguages On Text Columns
    [Documentation]  Once enter edit page; user can check different languages on the text column
    [Tags]  Product list
    Check Languages On Text Column

User Can Select Different Column Combination
    [Documentation]  Once enter edit page; user can select different column
    [Tags]  Product list
    Column Select Options

User Can Create New Filter Group For Different Viewset
    [Documentation]  Once enter edit page; user can select different viewset
    [Tags]  Product list
    Create New Filter Group

User Can Use Edit Function In Edit Page
    [Documentation]  Once enter edit page; user can edit product
    [Tags]  Product list
    Edit on the product