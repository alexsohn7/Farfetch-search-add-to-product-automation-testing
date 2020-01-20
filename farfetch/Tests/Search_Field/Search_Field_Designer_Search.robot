*** Settings ***
Documentation  This tests the designer search functionality
Resource  ../../Resources/Common.robot
Resource  ../../Resources/Page_Objects/Search_Field.robot
Resource  ../../Resources/Page_Objects/Listing_Page.robot
Test Setup  Begin Web Test  
Test Teardown  End Web Test

*** Variables ***
${DESIGNER} =  Amiri

*** Test Cases ***
Designer Search functionality by pressing enter 
    [Documentation]  When the user conducts a search for a designer by pressing enter, the user should be taken to the listing page for the designer.
    [Tags]  Smoke 
    Search_Field.Click on search field
    Search_Field.Conduct search for designer by pressing enter
    Listing_Page.Verify user is on the listing page for searched designer

Designer Search functionality by clicking search icon 
    [Documentation]  When the user conducts a search for a designer by pressing enter, the user should be taken to the listing page for the designer.
    [Tags]  Smoke 
    Search_Field.Click on search field
    Search_Field.Conduct search for designer by clicking search icon
    Listing_Page.Verify user is on the listing page for searched designer