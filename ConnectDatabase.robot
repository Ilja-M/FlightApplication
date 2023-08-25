*** Settings ***
Library           DatabaseLibrary
Resource          CommonKeywords.txt

*** Test Cases ***
TC01-Database_Automation
    Connect To Database    pymssql    TestDB    TestSQL    test123    localhost    1434
    @{queryResults}    Description    Select * from Student
    Log Many    @{queryResults}
    @{queryResults}    Query    Select * from Student
    Log Many    @{queryResults}
    ${COUNT}    Row Count    Select * from Student
    Log    ${COUNT}
    Row Count Is Equal To X    Select * from Student    2
    Check If Exists In Database    Select FirstName from Student where LastName='Miljuhin'


TC02-Login_With_Database_Info
    Connect To Database    pymssql    TestDB    TestSQL    test123    localhost    1434
    Table Must Exist    Ngen
    @{queryUsername}    Query    Select Username from Ngen where id=1
    ${CatenatedqueryUsername}    Evaluate    [list(x) for x in @{queryUsername}]
    ${CatenatedqueryPassword}    Evaluate    [x[2] for x in @{queryUsername}]
    LoginAndNavigateToURL
    Sleep    3
    ChangeToiFrame    id=iframe-05
    Wait Until Keyword Succeeds    2    1    Input Text    xpath://input[@type='email']    ${CatenatedqueryUsername}
    Wait Until Keyword Succeeds    2    1    Input Text    xpath://input[@type='password']    ${CatenatedqueryUsername}
    Wait Until Keyword Succeeds    2    1    Click Element    xpath://div[contains(text(),'Sign In')]

