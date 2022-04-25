*** Settings ***
Documentation  API Testing in Robot Framework
Library  SeleniumLibrary
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections

*** Variables ***

*** Test Cases ***
Do a GET Request and validate the response code and response body
    [documentation]  This test case verifies that the response code of the GET Request should be 200,
    ...  the response body contains the 'Region' key with value as 'Dorne',
    ...  and we can retreive the names of the Houses within Dorne
    [tags]  Smoke
    Create Session  mysession  https://www.anapioficeandfire.com  verify=true
    ${response}=  GET On Session  mysession  /api/houses  params=Region=Dorne
    Status Should Be  200  ${response}  #Check Status as 200

    #Retrieve Names of the Houses in th region 'Dorne'
    ${values}=	Get Value From Json	${response.json()}	$..name

    #Check the Houses names
    ${body}=  Convert To String  ${values}
    Should Be Equal As Strings  ${body}  ['House Allyrion of Godsgrace', 'House Blackmont of Blackmont', 'House Briar', 'House Brook', 'House Brownhill', 'House Dalt of Lemonwood', 'House Dayne of High Hermitage', 'House Dayne of Starfall', 'House Drinkwater', 'House Dryland']

*** Keywords ***