*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${SEARCH_FIELD} =   css:input#ff-searchfield-input
${SEARCH_ICON} =  css:button.icon-search

*** Keywords *** 
Verify search field is displayed on the Landing Page
    Wait Until Page Contains Element  ${SEARCH_FIELD}  
    Element Should Be Visible  ${SEARCH_FIELD} 

Verify the maginifying glass search icon is displayed in the search field
    Element Should Be Visible  ${SEARCH_ICON}

Click on search field 
    Click Element  ${SEARCH_FIELD}

Verify the search field wrapper expands
    ${search_field_wrapper_attribute}=  Get Element Attribute  css:div.search-container  class
    BuiltIn.Should Contain  ${search_field_wrapper_attribute}  search-active 

Verify the correct placeholder text is displayed in the search field
    ${search_field_placeholder}=  Get Element Attribute  ${SEARCH_FIELD}  placeholder 
    Should Be Equal  ${search_field_placeholder}  Search for a designer or category

Conduct search for designer by pressing enter
    Input Text  ${SEARCH_FIELD}  ${DESIGNER}
    Press Keys  ${SEARCH_FIELD}  RETURN

Conduct search for designer by clicking search icon
    Input Text  ${SEARCH_FIELD}  ${DESIGNER}
    Click Element  ${SEARCH_ICON}