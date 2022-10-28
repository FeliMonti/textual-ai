*** Settings ***
Documentation  Testing Textual
Resource  ../Resources/keywords.robot
Resource  ../Resources/variables.robot
Library  SeleniumLibrary
Suite Setup  Begin Web Test
Suite Teardown  End Web Test

*** Test Cases ***
User Can Access Website And See Login Page
    [Documentation]  Once accessing the website; being able to see the front page
    Go To Login Page

User Can Log In
    [Documentation]  Once accessing the website; user can log in
    Go To Login Page
    Log In User

User Can Log Out
    [Documentation]  Once user is logged in; user can do with Textual; user can log out
    Log Out User
