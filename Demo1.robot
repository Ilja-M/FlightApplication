*** Settings ***
Library           SeleniumLibrary
Library           ExcelLibrary
Resource          UserDefinedKeywords.txt    # This is my first resource file

*** Variables ***
${var1}           4    # This is my first scaler variable
${var2}           4    # This is my second scalar variable
@{USER}           Ilja    Ilja
&{Credentials}    username=ilja    password=ilja

*** Test Cases ***
TC_01
    [Documentation]    This is my first test case. It is used to compare two variables.
    ...    *Testcase_01* _This will be in italic_
    ...    Link is https://www.google.com
    Should Be Equal    ${var1}    ${var2}

TC_02
    [Tags]    LOGIN
    [Setup]    SetupDemo
    Should Not Be Equal As Strings    ${USER}[0]    ${USER}[1]
    [Teardown]    TeardownDemo

TC_03
    Should Be Equal As Strings    ${Credentials}[username]    ${Credentials}[password]

TC_04
    [Tags]    LOGIN
    Should be True    4    4

TC_05
    [Template]    Should Be Equal As Integers    # This is a template
    [Timeout]    2 minutes 20 seconds    # This is my first test timeout for TestCase_05
    4    4
    6    6
    8    8
    12    12


TC_06
    CompareTwoVariables

*** Keywords ***
SetupDemo
    Log To Console    This is Setup method

TeardownDemo
    Log To Console    This is Teardown method
