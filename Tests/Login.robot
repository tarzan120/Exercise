*** Settings ***
Documentation  Login Functionality
Library  SeleniumLibrary

*** Variables ***

*** Test Cases ***
Verify Successful Login and Purchaise
    [documentation]  This test case verifies that user is able to successfully Login
    [tags]  Smoke
    Open Browser  http://automationpractice.com/index.php  Chrome
    Wait Until Element Is Visible  class:login  timeout=5
    Click Element  class:login
    Wait Until Element Is Visible  id:email  timeout=5
    Input Text  id:email  davidrodrigues_123@hotmail.com
    Input Password  id:passwd  automationpractice
    Click Element  id:SubmitLogin
    Element Should Be Visible  id:my-account  timeout=5
    Click Element  xpath://*[@id="block_top_menu"]/ul/li[3]/a
    Click Element  xpath://*[@id="center_column"]/ul/li
    Element Should Be Visible  id:add_to_cart  timeout=5
    Click Element  id:add_to_cart
    Wait until Page Contains Element  xpath://*[@id="layer_cart"]/div[1]/div[2]/div[4]/a/span
    Element Should Be Visible  xpath://*[@id="header"]/div[3]/div/div/div[3]/div/a  timeout=5
    Click Element  xpath://*[@id="header"]/div[3]/div/div/div[3]/div/a
    Element Text Should Be  xpath://*[@id="cart_title"]  SHOPPING-CART SUMMARY  timeout=5
    Click Element  xpath://*[@id="header"]/div[3]/div/div/div[3]/div/a
    Element Should Be Visible  xpath://*[@id="center_column"]/p[2]/a[1]/span  timeout=5
    Click Element  xpath://*[@id="center_column"]/p[2]/a[1]/span
    Element Text Should Be  xpath://*[@id="center_column"]/form/div/div[1]/div[1]/div/label  Choose a delivery address:  timeout=5
    Click Element  xpath://*[@id="center_column"]/form/p/button/span
    Element Text Should Be  xpath://*[@id="form"]/div/p[1]  Terms of service  timeout=5
    Click Element  xpath://*[@id="cgv"]
    Click Element  xpath://*[@id="form"]/p/button/span
    #Close Browser

*** Keywords ***