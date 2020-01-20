*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${url}  http://www.farfetch.com
${Browser}  Google Chrome

*** Keywords *** 
Begin Web Test
  Open Browser  ${url}  ${Browser}

End Web Test
    Close Browser