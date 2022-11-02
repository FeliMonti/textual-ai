*** Settings ***
Documentation  Basic tests
Resource  ../Resources/keywords.robot
Suite Setup  Begin Web Test
Suite Teardown  End Web Test

*** Test Cases ***
User Can Access Website And See Login Page
    [Documentation]  User can access the website
    Go To Login Page

User Can Log In
    [Documentation]  Once accessing the website; user can log in
    Go To Login Page
    Log In User

User Can Log Out
    [Documentation]  Once user is logged in; user can log out
    Log Out User
