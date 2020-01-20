*** Settings ***
Library  SeleniumLibrary

*** Variables  ***
${LISTING_PAGE_HEADER} =  css:h1[data-test='header-title']

*** Keywords *** 
Verify user is on the listing page for searched designer
    Wait Until Page Contains Element  ${LISTING_PAGE_HEADER}  10
    Element Should Contain  ${LISTING_PAGE_HEADER}  ${DESIGNER}  ignore_case=True   