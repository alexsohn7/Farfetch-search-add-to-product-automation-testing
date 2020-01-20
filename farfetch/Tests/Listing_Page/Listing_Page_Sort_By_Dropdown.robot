*** Settings ***
Documentation  This tests that the Sort by dropdown and all the dropdown options are displayed
Resource  ../../Resources/Common.robot
Resource  ../../Resources/Page_Objects/Search_Field.robot
Resource  ../../Resources/Page_Objects/Listing_Page.robot
Test Setup  Begin Web Test  
Test Teardown  End Web Test

*** Variables ***
${DESIGNER} =  Amiri

*** Test Cases ***
Sort by dropdown is displayed on Listing Page
    [Documentation]  When the user navigates to the Listing Page, the Sort by dropdown is displayed
    [Tags]  Smoke
    Search_Field.Click on search field  
    Search_Field.Conduct search for designer by pressing enter 
    Wait Until Element Is Visible  ${LISTING_PAGE_SORT_BY_LABEL}
    Listing_Page.Verify the Sort by dropdown is displayed

Our Picks is the default selected dropown option
    [Documentation]  When the user clicks the Sort by dropdown, the default selected dropdown option is Our Picks
    Search_Field.Click on search field  
    Search_Field.Conduct search for designer by pressing enter 
    Wait Until Element Is Visible  ${LISTING_PAGE_SORT_BY_LABEL}
    Click Element  ${LISTING_PAGE_SORT_BY_LABEL}
    Wait Until Element Is Visible  @{LISTING_PAGE_ALL_SORT_BY_OPTIONS}
    ${selected_dropdown}=  Get Text  ${LISTING_PAGE_SELECTED_SORT_BY_OPTION} 
    Should be Equal  ${selected_dropdown}  Our Picks
