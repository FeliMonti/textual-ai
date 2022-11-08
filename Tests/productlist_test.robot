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

*** Variables ***
${SKU}  e2e-product-1

*** Test Cases ***
User Can Search for SKU
   [Documentation]  User can search for SKU
   Search for SKU  ${SKU}

User Can Filter on Date
    [Documentation]  User can filter on date

    Filter on After Date by Product Creation Date
    Clear Filter Fields

    Filter on Before Date by Product Creation Date
    Clear Filter Fields

    Filter on After and Before Date by Product Creation Date
    Clear Filter Fields

    Filter on After Date by Latest Publication Date
    Clear Filter Fields

    Filter on Before Date by Latest Publication Date
    Clear Filter Fields

    Filter on After and Before Date by Latest Publication Date
    Clear Filter Fields

    Filter by Product Creation Date Combined SKU Search    ${SKU}
    Clear Filter Fields

    Filter by Latest Publication Date Combined SKU Search    ${SKU}
    Clear Filter Fields

User Can Filter on Product Status
    [Documentation]  User can filter on product status
    Filter on Show All in Product Status

    Filter on Importing
    Clear Filter Fields

    Filter on In Progress
    Clear Filter Fields

    Filter on Ready
    Clear Filter Fields

User Can Filter on Text Status
    [Documentation]  User can filter on text status
    Filter on Show All in Text Status
    Clear Filter Fields

    Filter on Needs Review    #flag with orange eye icon both on text status column, but actually no orange eye on it, so needs to combine with text&bullet (languange) to check the orange eye icon
    Clear Filter Fields

    Filter on Approved
    Clear Filter Fields

    Filter on Waiting to be Published
    Clear Filter Fields

    Filter on Published
    Clear Filter Fields

User Can Filter on Translation Status    #verify --complete translation
    [Documentation]  User can filter on translation status
    Filter on Show All in Translation Status
    Clear Filter Fields

    Filter on Missing Translation
    Clear Filter Fields

    #Filter on Complete Translation    ##verify,here flag should not be visible, but actually is visible on filter results
    #Clear Filter Fields

User Can Filter on Parent-Child Relations
    [Documentation]  User can filter on Parent-Child relations
    Filter on Show All in Parent-Child Relations

    Filter on Parent in Parent-Child Relations

    Filter on Child in Parent-Child Relations  #no text in parent column on testing account

User Can Check Selected Laguages On Text Columns
    [Documentation]  User can check different languages on the text column
    Check Languages On Text Column


User Can Check Group Children With Parent    # continue working on it
    #TODO: Validation
    # When off, product 1 (parent) and 3 (child) do not appear is subsequent rows in product list
    # When on, product 1 (parent) appears in row directly above and 3 (child)

#
User Can Select Different Column Combination
    [Documentation]  User can select different column
    Set a combination of options in column
    Set namespace in column
    Set group children with parent in column


User Can Create New Filter Group For Different Viewset
    [Documentation]  Once enter edit page; user can select different viewset

    ${group_name}=  Generate Random String  length=8  chars=[LETTERS][NUMBERS]
    ${filter_name}=  Generate Random String  length=8  chars=[LETTERS][NUMBERS]

    Filter on Importing
    Create A New Filter Group   ${group_name}
    Create A New Filter   ${filter_name}
    Delete A Filter Group   ${group_name}
