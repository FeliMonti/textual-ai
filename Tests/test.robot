*** Settings ***
Documentation  Testing Textual
Resource  ../Resources/keywords.robot
Resource  ../Resources/variable.robot
Library  SeleniumLibrary
#Library  robot.libraries.DateTime
Suite Setup    Begin Web Test
Suite Teardown  End Web Test

*** Test Cases ***
User Can Access Website And See Front Page
    [Documentation]  Once accessing the website; being able to see the frontpage
    [Tags]  Regression
    Go To Web Page