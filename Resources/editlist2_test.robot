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
    [Tags]  Edit list
    Go To Web Page

User Can Log In
    [Documentation]  Once accessing the website; user can log in
    [Tags]  Edit list
    Log in User

User Can Access to The Edit Page
    [Documentation]  Once logged in; user can access to edit page
    [Tags]  Edit list
    Access To Edit Page

User Can Use Edit Function In Edit Page
    [Documentation]  Once enter edit page; user can edit product
    [Tags]  Edit list
    Edit on the product