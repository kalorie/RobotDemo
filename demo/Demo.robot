*** Settings ***
Test Setup        ${SETUP}
Test Teardown     ${TEARDOWN}
Force Tags        req-42
Default Tags      owner-john    smoke
Resource          common.resource
Library           DateTime
Library           Utils.py
Variables         MyObject.py

*** Variables ***
${HOST}           10.0.1.42
@{USER}           robot secret

*** Test Cases ***
Now own tags
    [Documentation]    This test has tags owner-john, smoke and req-42
    No Operation

With own tags
    [Documentation]    This test has tags not_ready, owner-mrx and req-42
    [Tags]    owner-mrx    not_ready
    No Operation

Own tags with variables
    [Documentation]    This test has tags host-10.0.1.42 and req-42
    [Tags]    host-${HOST}
    No Operation

Empty own tags
    [Documentation]    This test has only tag req-42
    [Tags]
    No Operation

Set Tags and Remove Tags Keywords
    [Documentation]    This test has tags mytag and owner-john
    Set Tags    mytag
    Remove Tags    smoke req-*

List Variables
    Echo    @{USER}

Example
    Echo    ${MY_OBJECT.name}
    Echo    ${MY_OBJECT.eat('Cucumber')}
    Echo    ${MY_DICT[2]}

Example2
    Two Arguments with Defaults    arg2=new value

Example3
    Loops    one two three four five

Positional and Free Named Example
    Positional and Free Named    say    a=1    b=2    c=3

Embedded Keywords
    I type ${1} + ${2}
    I type 3 + 4

*** Keywords ***
Two Arguments with Defaults
    [Arguments]    ${arg1}=default 1    ${arg2}=${VARIABLE}
    [Documentation]    This keyword takes 0-2 arguments
    Echo    1st argument ${arg1}
    Echo    2nd argument ${arg2}

Loops
    [Arguments]    @{items}
    FOR    ${item}    IN    ${items}
        Echo    ${item}
    END

Positional and Free Named
    [Arguments]    ${required}    &{extra}
    Log Many    ${required}    &{extra}

I type ${a:\d+} ${operator:[+-]} ${b:\d+}
    Echo    ${a} ${operator} ${b}
