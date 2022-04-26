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
    Sleep  5s
    Wait until Page Contains Element  xpath://*[@id="layer_cart"]/div[1]/div[2]/div[4]/a
    #Verify number of products on the card.
    Element Text Should Be  xpath://*[@id="layer_cart_product_quantity"]  1  timeout=5
    #Verify cost of products on the card.
    Element Text Should Be  xpath://*[@id="layer_cart_product_price"]  $16.51  timeout=5
    Click Element  xpath://*[@id="layer_cart"]/div[1]/div[2]/div[4]/a
    Sleep  3s
    Wait until Page Contains Element  xpath://*[@id="cart_title"]
    Click Element  xpath://*[@id="center_column"]/p[2]/a[1]
    Sleep  3s
    Element Text Should Be  xpath://*[@id="center_column"]/form/div/div[1]/div[1]/div/label  Choose a delivery address:  timeout=5
    Click Element  xpath://*[@id="center_column"]/form/p/button
    Sleep  3s
    Element Text Should Be  xpath://*[@id="form"]/div/p[1]  Terms of service  timeout=5
    Click Element  xpath://*[@id="cgv"]
    Click Element  xpath://*[@id="form"]/p/button
    Sleep  3s
    Wait until Page Contains Element  xpath://*[@id="HOOK_PAYMENT"]/div[1]/div/p/a
    Click Element  xpath://*[@id="HOOK_PAYMENT"]/div[1]/div/p/a
    Sleep  3s
    Wait until Page Contains Element  xpath://*[@id="cart_navigation"]/button
    Click Element  xpath://*[@id="cart_navigation"]/button
    Sleep  3s
    #Verify that the order is completed.
    Element Text Should Be  xpath://*[@id="center_column"]/div/p/strong  Your order on My Store is complete.  timeout=5
    Close Browser

*** Keywords ***