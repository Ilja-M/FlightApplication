*** Settings ***
Test Teardown     Close Browser
Library           SeleniumLibrary
Library           ExcelLibrary
Resource          CommonKeywords.txt    # List of common keywords

*** Test Cases ***
TC01-Login_Screen_objects_on_page
    LoginAndNavigateToURL
    ChangeToiFrame
    ObjectsOnTheWebPage

TC02-Logic_Screen_email_password_mask
    LoginAndNavigateToURL
    ChangeToiFrame
    DefaultValueUsernamePassword

TC03-Login_Screen_user_does_not_enter_email
    LoginAndNavigateToURL
    ChangeToiFrame
    EmptyUsername

TC04-Login_screen_user_does_not_enter_email
    LoginAndNavigateToURL
    ChangeToiFrame
    EmptyPassword

TC05-Login_Screen_user_does_not_enter_email_or_password
    LoginAndNavigateToURL
    ChangeToiFrame
    EmptyUsernamePassword

TC06-Login_Screen_user_enters_invalid_email_format
    LoginAndNavigateToURL
    ChangeToiFrame
    InvalidEmailFormat

TC07-Login_Screen_user_enters_valid_info
    LoginAndNavigateToURL
    ChangeToiFrame
    Login
    Select Frame    xpath://iframe[starts-with(@id,'iframe-undefined')]
    VerifyAfterLogin
