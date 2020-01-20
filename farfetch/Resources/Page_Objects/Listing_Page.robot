*** Settings ***
Library  SeleniumLibrary

*** Variables  ***
${LISTING_PAGE_HEADER} =  css:h1[data-test='header-title']
${LISTING_PAGE_HEADER_DESCRPTION} =  css:p[data-test='headerDescription']
${LISTING_PAGE_SORT_BY_LABEL} =  css:label[data-test= 'sortDropdownLabel']
@{LISTING_PAGE_ALL_SORT_BY_OPTIONS} =  css:ul[data-test='sortOptionList']
${LISTING_PAGE_SELECTED_SORT_BY_OPTION} =  css:li[data-selected='true']
@{ALL_LISTING_DESIGNER} =  css:li[data-test='productCard'] h3

*** Keywords *** 
Verify user is on the listing page for searched designer
    Wait Until Page Contains Element  ${LISTING_PAGE_HEADER}  10
    Element Should Contain  ${LISTING_PAGE_HEADER}  ${DESIGNER}  ignore_case=True
    Element Should Contain  ${LISTING_PAGE_HEADER_DESCRPTION}  ${DESIGNER}  ignore_case=True
    Element Should Contain  @{ALL_LISTING_DESIGNER}  ${DESIGNER}  ignore_case=True

Verify the Sort by dropdown is displayed
    Wait Until Element Is Visible  ${LISTING_PAGE_SORT_BY_LABEL}
    Element Should Be Visible  ${LISTING_PAGE_SORT_BY_LABEL}
