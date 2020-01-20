*** Settings ***
Library  SeleniumLibrary

*** Variables  ***
${LISTING_PAGE_HEADER} =  css:h1[data-test='header-title']
@{ALL_LISTING_BRANDS} =  css:li[data-test='productCard'] h3

*** Keywords *** 
Verify user is on the listing page for searched designer
    Wait Until Page Contains Element  ${LISTING_PAGE_HEADER}  10
    Element Should Contain  ${LISTING_PAGE_HEADER}  ${DESIGNER}  ignore_case=True 
    Element Should Contain  @{ALL_LISTING_BRANDS}  ${DESIGNER}  ignore_case=True