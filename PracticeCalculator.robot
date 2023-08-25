*** Settings ***
Library           SeleniumLibrary
Library           AutoItLibrary

*** Test Cases ***
openCalculator
    Run    notepad.exe    ${EMPTY}    1
    Win Wait Active    Untitled - Notepad
    Control Set Text    Untitled - Notepad    \    Edit1    This is my desktop automation test
    Sleep    1
    Control Send    Untitled - Notepad    \    Edit1    This is my 2nd text
    Sleep    1
    Send    This is my 3rd text!
    Process Close    notepad.exe
    Run    calc.exe
    Win Wait Active    Calculator
    ${abc}    Statusbar Get Text    Calculator
    LOG    ${abc}

Practice
    Run    calc.exe
    Win Wait Active    Calculator
    Control Click
