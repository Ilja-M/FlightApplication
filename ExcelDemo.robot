*** Settings ***
Library           ExcelLibrary
Library           SeleniumLibrary

*** Variables ***
${sheet_name}     \
@{username}
@{testcase_num}
@{password}
@{execute_list}
${true_or_false}    Yes

${count}          0

*** Test Cases ***
Excel_TC01
    ExcelLibrary.Open Excel Document    C:/Users/ilja.miljuhin/Robot Ride Projects/Demo/demo_excel_2.xlsx    doc1
    Write Excel Cell    2    2    sample123    Sheet
    Save Excel Document    demo_excel_2.xlsx

    [Teardown]    Close Current Excel Document

ReadExcelDemo
    Open Excel Document    C:/Users/ilja.miljuhin/Robot Ride Projects/Demo/DemoExcel1.xlsx    1
    ${sheet_name}    ExcelLibrary.Get Sheet    Sheet2
    ${testcase_num}    ExcelLibrary.Read Excel Column    1    1    5    Sheet2
    ${execute_list}    ExcelLibrary.Read Excel Column    2    sheet_name=Sheet2    max_num=5    row_offset=1
    FOR    @{execute_list}[${count}]    IN    ${testcase_num}
        IF    "@{execute_list}[${count}]" == "Yes"
            Log To Console    Yes
            Log To Console    ${testcase_num}
        ${count}+=1
        END
    END

    [Teardown]    Close Current Excel Document
