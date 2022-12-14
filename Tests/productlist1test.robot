*** Settings ***
Documentation  Testing Textual
Resource  ../Resources/keywords1.robot
Resource  ../Resources/variable1.robot
Library  SeleniumLibrary
Library  robot.libraries.DateTime
Suite Setup    Begin Web Test Product List
Suite Teardown  End Web Test


*** Test Cases ***
User Can Access Website And See Front Page
    [Documentation]  Once accessing the website; being able to see the frontpage
    [Tags]   Product list
    Go To Web Page

User Can Log In
    [Documentation]  Once accessing the website; user can log in
    [Tags]   Product list
    Log in User

User Can Navigate To Product List Page
    [Documentation]  Once user is logged in; user can navigate to product list page
    [Tags]  Product list
    #Navigate Product List Page
    Access To Edit Page

User Can Search for SKU
    [Documentation]  Once user is logged in; user can navigate to product list page, search for SKU
    [Tags]  Product list
    Search for SKU

User Can Filter on Date
    [Documentation]  Once user is logged in; user can navigate to product list page, filter on date
    [Tags]  Product list
    Filter by Product Creation Date
    Filter by Latest Publication Date
    Filter by Product Creation Date Combined SKU Search
    Filter by Latest Publication Date Combined SKU Search

User Can Filter on Product Status
    [Documentation]  Once user is logged in; user can navigate to product list page, filter on product status
    [Tags]  Product list
    Filter on Show All in Product Status
    Filter on Importing
    Filter on In Progress
    Filter on Ready

User Can Filter on Text Status
    [Documentation]  Once user is logged in; user can navigate to product list page, filter on text status
    [Tags]  Product list
    Filter on Show All in Text Status
    Filter on Needs Review
    Filter on Approved
    Filter on Waiting to be Published
    Filter on Published

#User Can Log Out
    #[Documentation]  Once user is logged in; user can do with Textual; user can log out
    #[Tags] Test
    #Log Out User