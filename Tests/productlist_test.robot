*** Settings ***
Documentation  Testing Textual
Resource  ../Resources/keywords.robot
Resource  ../Resources/variable.robot
Library  SeleniumLibrary
#Library  robot.libraries.DateTime
Suite Setup    Begin Web Test
Suite Teardown  End Web Test

*** Test Cases ***
