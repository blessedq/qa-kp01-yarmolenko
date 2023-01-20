*** Settings ***
Library    Process
Library    OperatingSystem



*** Variables ***
${cli}    /home/andrii/Documents/GitHub/qa-kp01-Yarmolenko/coursework/CLI.py



*** Test Cases ***
Dir root create
    ${result} =    Run Process    python3   ${cli}    get    directory?name\=root
    Should Contain    ${result.stdout}   Status code: 200

Dir inner create
    ${result} =    Run Process    python3   ${cli}    post    directory?parent\=root&name\=child&max_elems\=8
    Should Contain    ${result.stdout}   Status code: 201

Dir move
    ${result} =    Run Process    python3   ${cli}    patch    directory?name\=child&parent\=root
    Should Contain    ${result.stdout}   Status code: 200

Dir delete
    ${result} =    Run Process    python3   ${cli}    delete    directory?name\=child
    Should Contain    ${result.stdout}   Status code: 200



Buffer create
    ${result} =    Run Process    python3   ${cli}    post    bufferfile?parent\=root&max_size\=100&name\=bufferfile
    Should Contain    ${result.stdout}   Status code: 201

Buffer read
    ${result} =    Run Process    python3   ${cli}    get    bufferfile?name\=bufferfile
    Should Contain    ${result.stdout}   Status code: 200

Buffer move
    ${result} =    Run Process    python3   ${cli}    patch    bufferfile?parent\=root&name\=bufferfile
    Should Contain    ${result.stdout}   Status code: 200

Buffer delete
    ${result} =    Run Process    python3   ${cli}    delete    bufferfile?name\=bufferfile
    Should Contain    ${result.stdout}   Status code: 200



Bin create
    ${result} =    Run Process    python3   ${cli}    post    binaryfile?name\=binaryfile&parent\=root&info\=test
    Should Contain    ${result.stdout}   Status code: 201

Bin read
    ${result} =    Run Process    python3   ${cli}    get    binaryfile?name\=binaryfile
    Should Contain    ${result.stdout}   Status code: 200

Bin move
    ${result} =    Run Process    python3   ${cli}    patch    binaryfile?name\=binaryfile&parent\=root
    Should Contain    ${result.stdout}   Status code: 200

Bin delete
    ${result} =    Run Process    python3   ${cli}    delete    binaryfile?name\=binaryfile
    Should Contain    ${result.stdout}   Status code: 200
