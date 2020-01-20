*** Settings ***
Documentation  This script tests the search field expand functionality
Resource  ../../Resources/Common.robot
Resource  ../../Resources/Page_Objects/Search_Field.robot
Test Setup  Begin Web Test
Test Teardown  End Web Test

*** Variables ***

*** Test Cases ***
Search Field Expand functionality 
    [Documentation]  When the user clicks on the search field, the search field should expand and the correct placeholder text is displayed.
    [Tags]  Smoke 
    Search_Field.Verify search field is displayed on the Landing Page
    Search_Field.Verify the maginifying glass search icon is displayed in the search field
    Search_Field.Click on search field
    Search_Field.Verify the search field wrapper expands
    Search_Field.Verify the correct placeholder text is displayed in the search field 


