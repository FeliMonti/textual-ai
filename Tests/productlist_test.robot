*** Settings ***
Documentation  Testing Textual
Resource  ../Resources/keywords.robot
Resource  ../Resources/variable.robot
Library  SeleniumLibrary
Library  robot.libraries.DateTime
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
    Log In User

User Can Access to The Edit Page
    [Documentation]  Once logged in; user can access to edit page
    [Tags]  Product list
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

#User Can Log Out
    #[Documentation]  Once user is logged in; user can do with Textual; user can log out
    #[Tags] Test
    #Log Out User