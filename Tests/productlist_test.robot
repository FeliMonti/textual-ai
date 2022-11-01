# Tests which are run on the product list view

*** Settings ***
Documentation  Testing Textual
Resource  ../Resources/keywords.robot
Resource  ../Resources/variables.robot
Resource  ../Resources/productlist_keywords.robot
Resource  ../Resources/productlist_variables.robot
Library  SeleniumLibrary
Library  robot.libraries.String
Suite Setup    Begin Web Test Product List
Suite Teardown  End Web Test Product List

*** Test Cases ***
User Can Search for SKU
   [Documentation]  User can search for SKU
   Search for SKU  e2e-product-1

User Can Filter on Date
   [Documentation]  User can filter on date
   Filter on After Date by Product Creation Date
   Clear Filter Fields

   Filter on Before Date by Product Creation Date
   Clear Filter Fields

   Filter on After and Before Date by Product Creation Date
   Clear Filter Fields
   Clear Filter Fields

   Filter on After Date by Latest Publication Date
   Clear Filter Fields

   Filter on Before Date by Latest Publication Date
   Clear Filter Fields

   Filter on After and Before Date by Latest Publication Date
   Clear Filter Fields

   # Filter by Product Creation Date Combined SKU Search
   # Filter by Latest Publication Date Combined SKU Search

# User Can Filter on Product Status
#    [Documentation]  Once user is logged in; user can navigate to product list page, filter on product status
#    [Tags]  Product list
#    Filter on Show All in Product Status
#    Filter on Importing
#    Filter on In Progress
#    Filter on Ready

# User Can Filter on Text Status
#    [Documentation]  Once user is logged in; user can navigate to product list page, filter on text status
#    [Tags]  Product list
#    Filter on Show All in Text Status
#    Filter on Needs Review
#    Filter on Approved
#    Filter on Waiting to be Published
#    Filter on Published

# User Can Check Translation Status
#    [Documentation]  Once enter edit page; user can check translation status
#    [Tags]  Product list
#    Check Translation Status

# User Can Check Parent-Child Relations
#    [Documentation]  Once enter edit page; user can check Parent-Child relations
#    [Tags]  Product list
#    Check Parent-Child Relations

# User Can Check Selected Laguages On Text Columns
#    [Documentation]  Once enter edit page; user can check different languages on the text column
#    [Tags]  Product list
#    Check Languages On Text Column

# User Can Select Different Column Combination
#    [Documentation]  Once enter edit page; user can select different column
#    [Tags]  Product list
#    Set a combination of options in column
#    Set namespace in column
#    Set group children with parent in column

# User Can Create New Filter Group For Different Viewset
#     [Documentation]  Once enter edit page; user can select different viewset
#     [Tags]  Product list

#     ${group_name}=  Generate Random String  length=8  chars=[LETTERS][NUMBERS]
#     ${filter_name}=  Generate Random String  length=8  chars=[LETTERS][NUMBERS]

#     Select Existing Filter
#     Create A New Filter Group   ${group_name}
#     Create A New Filter   ${filter_name}
#     Delete A Filter Group   ${group_name}
