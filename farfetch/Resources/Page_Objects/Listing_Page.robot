*** Settings ***
Library  SeleniumLibrary  
Library  Collections
Library  String

*** Variables  ***
${LISTING_PAGE_HEADER} =  css:h1[data-test='header-title']
${LISTING_PAGE_HEADER_DESCRPTION} =  css:p[data-test='headerDescription']
${LISTING_PAGE_SORT_BY_LABEL} =  css:label[data-test= 'sortDropdownLabel']
@{LISTING_PAGE_ALL_SORT_BY_OPTIONS} =  css:ul[data-test='sortOptionList']
${LISTING_PAGE_SORT_BY_PRICE_HIGH_TO_LOW_OPTION} =  xpath:.//a[text()='Price: high to low']
${LISTING_PAGE_SELECTED_SORT_BY_OPTION} =  css:li[data-selected='true']
@{ALL_LISTINGS} =  css:li[data-test='productCard']
@{ALL_LISTING_DESIGNER_TEXT} =  css:li[data-test='productCard'] h3

*** Keywords *** 
Verify user is on the listing page for searched designer
    Wait Until Page Contains Element  ${LISTING_PAGE_HEADER}  10
    Element Should Contain  ${LISTING_PAGE_HEADER}  ${DESIGNER}  ignore_case=True
    Element Should Contain  ${LISTING_PAGE_HEADER_DESCRPTION}  ${DESIGNER}  ignore_case=True
    Element Should Contain  @{ALL_LISTING_DESIGNER_TEXT}  ${DESIGNER}  ignore_case=True

Verify the Sort by dropdown is displayed
    Wait Until Element Is Visible  ${LISTING_PAGE_SORT_BY_LABEL}
    Element Should Be Visible  ${LISTING_PAGE_SORT_BY_LABEL}

Click Price: high to low Sort by option 
    Wait Until Element Is Visible  ${LISTING_PAGE_SORT_BY_LABEL}
    Click Element  ${LISTING_PAGE_SORT_BY_LABEL}
    Wait Until Element Is Visible  ${LISTING_PAGE_SORT_BY_PRICE_HIGH_TO_LOW_OPTION}
    Click Element  ${LISTING_PAGE_SORT_BY_PRICE_HIGH_TO_LOW_OPTION}

Get all listing prices 
    Sleep  5s  Wait Until Prices Are Updated
    ${number_of_results}=  Get Element Count  @{ALL_LISTINGS}
    ${all_price_number_values}=  Create List
    FOR  ${INDEX}  IN RANGE  1  ${number_of_results}+1
       ${price}=  Get Text  css:li[data-test='productCard']:nth-child(${INDEX}) span[data-test='price']
       ${price_without_dollar_sign_and_commas}=  String.Remove String  ${price}  $  ,
       Convert To Integer  ${price_without_dollar_sign_and_commas}  
       Append To List  ${all_price_number_values}  ${price_without_dollar_sign_and_commas}
    END  
    [Return]  ${all_price_number_values}