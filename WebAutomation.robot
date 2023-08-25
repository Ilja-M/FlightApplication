*** Settings ***
Library           SeleniumLibrary
Resource          CommonlyUsedKeywords.txt
Library           ExcelLibrary

*** Variables ***
@{cities}
${City}           0

${textfield}      0
${excel_textfield}    \

*** Test Cases ***
Open Browser
    Open Browser    https://www.facebook.com    ff
    Maximize Browser Window
    Sleep    2
    Click Button    xpath://button[starts-with(@id,'u_0_j')]
    Sleep    1
    Input Text    xpath://input[@id="email"]    test@gmail.com
    Input Text    xpath://input[@id="pass"]    12345
    Sleep    1
    Click Button    xpath://button[@name="login"]
    Close Browser

TextboxDemo
    Open Browser    https://ngendigital.com/practice    ff
    Maximize Browser Window
    Select Frame    id=iframe-05
    Sleep    2
    Page Should Contain Textfield    xpath://input[@name='FirstName']    It has failed    Debug
    [Teardown]    Close Browser

checkbox_demo
    Open Browser    https://ngendigital.com/practice    ff
    Maximize Browser Window
    Select Frame    id=iframe-05
    Sleep    2
    Page Should Contain Checkbox    //input[@value='bmw']    CheckBox not found    Info
    Sleep    2
    Select Checkbox    //input[@value='bmw']
    Sleep    2
    Checkbox Should Be Selected    //input[@value='bmw']
    Sleep    2
    Unselect Checkbox    //input[@value='bmw']
    Sleep    2
    Close Browser

listelement_demo
    Open Browser    https://ngendigital.com/practice    ff
    Maximize Browser Window
    Select Frame    id=iframe-05
    Sleep    2
    Page Should Contain List    css:#FromCity
    Sleep    2
    @{cities}    Get List Items    css:#FromCity
    FOR    ${City}    IN    @{cities}
        LOG    ${City}
    END
    Sleep    4
    List Selection Should Be    css:#FromCity    Toronto
    Sleep    2
    Select From List By Index    css:#FromCity    1
    Sleep    2
    Select From List By Label    css:#FromCity    Chicago
    Sleep    2

radiobutton_demo
    Open Browser    https://ngendigital.com/practice
    Maximize Browser Window
    Select Frame    id=iframe-05
    Page Should Contain Radio Button    xpath://input[@value='flight']
    Sleep    1
    Select Radio Button    flight    flighthotel
    Sleep    1
    Radio Button Should Be Set To    flight    flighthotel
    Sleep    1
    [Teardown]    Close Browser

image_demo
    Open Browser    https://ngendigital.com/practice    ff
    Click Image    xpath://*[@id="n-2418"]
    Sleep    2



    [Teardown]    Close Browser

table_demo
    Open Browser    https://ngendigital.com/practice
    Maximize Browser Window
    Select Frame    id=iframe-05
    Page Should Contain Element    xpath:/html/body/fieldset[7]/table    Table not found    INFO
    Table Should Contain    xpath:/html/body/fieldset[7]/table    Country
    Sleep    1
    Table Cell Should Contain    xpath:/html/body/fieldset[7]/table    2    3    Canada
    Sleep    1
    Table Column Should Contain    xpath:/html/body/fieldset[7]/table    1    Justin Trudeau
    Sleep    1
    Table Row Should Contain    xpath:/html/body/fieldset[7]/table    5    Chancellor
    ${textfield}    Get Text    xpath://tbody/tr[4]/td[1]
    Log To Console    ${textfield}
    Should Be Equal As Strings    ${textfield}    Theresa May
    [Teardown]    Close Browser

flight_application
    Open Browser    https://ngendigital.com/demo-application    ff
    Sleep    1
    Select Frame    id=iframe-05
    Wait Until Keyword Succeeds    1 min    5s    Login to flight application
    Sleep    2
    Page Should Contain Element    //div[@id='InvalidLogin']/p/label/font
    Sleep    1
    ${textfield}    Get Text    //div[@id='InvalidLogin']/p/label/font
    ${excel_textfield}    ExcelLibrary.Read Excel Cell    2    6    Sheet1
    Should Be Equal As Strings    ${textfield}    ${excel_textfield}
    Log To Console    ${excel_textfield}
    Log To Console    ${textfield}
    Close Current Excel Document
    [Teardown]    Close Browser
