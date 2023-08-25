*** Settings ***
Test Teardown     Close Browser
Library           SeleniumLibrary
Resource          CommonKeywords.txt

*** Test Cases ***
TC08-Book_A_Flight_round_trip_between_to_and_from_destinations_verify_from_cities
    LoginAndNavigateToURL
    ChangeToiFrame    id=iframe-05
    Login
    ChangeToiFrame    xpath://iframe[starts-with(@id,'iframe-undefined')]
    VerifyAfterLogin
    VerifyManageBooking
    VerifyFromCity
    Logout

TC09-Book_A_Flight_round_trip_between_to_and_from_destinations_verify_from_cities
    LoginAndNavigateToURL
    ChangeToiFrame    id=iframe-05
    Login
    ChangeToiFrame    xpath://iframe[starts-with(@id,'iframe-undefined')]
    VerifyAfterLogin
    VerifyManageBooking
    VerifyToCity
    Logout

TC10-Book_A_Flight_round_trip_between_to_and_from_destinations_verify_class
    LoginAndNavigateToURL
    ChangeToiFrame    id=iframe-05
    Login
    Wait Until Element Is Visible    xpath://iframe[starts-with(@id,'iframe-undefined')]    2
    ChangeToiFrame    xpath://iframe[starts-with(@id,'iframe-undefined')]
    VerifyAfterLogin
    VerifyManageBooking
    VerifyClass
    Logout

TC11-Book_A_Flight_verify_radio_button_should_not_be_selected_by_default
    LoginAndNavigateToURL
    ChangeToiFrame    id=iframe-05
    Login
    Wait Until Element Is Visible    xpath://iframe[starts-with(@id,'iframe-undefined')]    2
    ChangeToiFrame    xpath://iframe[starts-with(@id,'iframe-undefined')]
    VerifyAfterLogin
    VerifyManageBooking
    RadiobuttonVerification

TC12-Book_A_Flight_one_way_trip_between_to_and_from_desinations_from_toronto_to_paris_economy
    LoginAndNavigateToURL
    ChangeToiFrame    id=iframe-05
    Login
    Wait Until Element Is Visible    xpath://iframe[starts-with(@id,'iframe-undefined')]    2
    ChangeToiFrame    xpath://iframe[starts-with(@id,'iframe-undefined')]
    VerifyAfterLogin
    VerifyManageBooking
    BookEconomyFlight

TC13-Book_A_Flight_one_way_trip_between_to_and_from_destinations_from_newyork_to_mumbai_first
    LoginAndNavigateToURL
    ChangeToiFrame    id=iframe-05
    Login
    Wait Until Element Is Visible    xpath://iframe[starts-with(@id,'iframe-undefined')]    2
    ChangeToiFrame    xpath://iframe[starts-with(@id,'iframe-undefined')]
    VerifyAfterLogin
    VerifyManageBooking
    BookFirstFlight

TC14-Book_A_Flight_round_trip_business_class
    LoginAndNavigateToURL
    ChangeToiFrame    id=iframe-05
    Login
    Wait Until Element Is Visible    xpath://iframe[starts-with(@id,'iframe-undefined')]
    ChangeToiFrame    xpath://iframe[starts-with(@id,'iframe-undefined')]
    VerifyAfterLogin
    VerifyManageBooking
    BookBusinessFlight

TC15-Search_Flights
    LoginAndNavigateToURL
    ChangeToiFrame    id=iframe-05
    Login
    Wait Until Element Is Visible    xpath://iframe[starts-with(@id,'iframe-undefined')]
    ChangeToiFrame    xpath://iframe[starts-with(@id,'iframe-undefined')]
    VerifyAfterLogin
    Click Button    xpath://button[@id='defaultOpen']
    Input Text    xpath://input[@id='FlightNo']    DA935
    Click Button    xpath://div[@id='Search']/p[5]//button[@type='button']
    VerifyFlightTable
