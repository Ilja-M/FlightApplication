*** Settings ***
Library           AutoItLibrary
Library           SeleniumLibrary
Resource          CommonUsedKeywords_Desktop.txt

*** Test Cases ***
TC01_Add_new_order_positive
    Login
    EnterOption    1
    CreateOrder
    VerifyConfirmation

TC02_Check_existing_order_positive
    Login
    EnterOption    2
    RetrieveOrder
    VerifyOrderer

