*** Settings ***
Library           DateTime

*** Variables ***
${integer_1}      5
${integer_2}      5
${date}           DateTime.Get Current Date

*** Test Cases ***
assignment_1
    Should Be Equal As Integers    ${integer_1}    ${integer_2}

assignment_import_library
    Get Current Date

