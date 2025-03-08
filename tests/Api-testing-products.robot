*** Settings ***
Library    RequestsLibrary
Library    String

*** Variables ***
${ENDPOINT_LOGIN}    https://serverest.dev/login
${ENDPOINT_NEW_USER}    https://serverest.dev/usuarios
${ENDPOINT_PRODUTOS}    https://serverest.dev/produtos
${HEADERS}     {'accept': 'application/json', 'Content-Type': 'application/json'}
&{PRODUCT_DATA}    nome=Logitech MX Vertical    preco=470    descricao=Mouse    quantidade=381
&{LOGIN_DATA}    email=fulano@qa.com    password=teste

*** Test Cases ***

Test API Post User - code 201
    ${random_number}=    Generate Random String   5    [NUMBERS]
    ${email}=    Set Variable    testeqa${random_number}@qa.com
    &{NEW_USER_DATA}    Create Dictionary    nome=teste    email=${email}   password=teste      administrador=true

   Create Session    serverest_api    ${ENDPOINT_NEW_USER}    headers=${HEADERS}
    ${response}=    POST    ${ENDPOINT_NEW_USER}    json=${NEW_USER_DATA}
    Status Should Be    201    ${response}  # O status 201 indica sucesso em criação
    Log    ${response.json()}
    
Test API Login - code 200
    Create Session    serverest_api    ${ENDPOINT_LOGIN}
    ${RESPONSE}=    POST    ${ENDPOINT_LOGIN}    json=${LOGIN_DATA}
    Status Should Be    200    ${RESPONSE} 
    Log    ${RESPONSE.json()}

Test API Get Products - code 200
    Create Session    serverest_api    ${ENDPOINT_PRODUTOS}
    ${RESPONSE}    GET On Session    serverest_api    ${ENDPOINT_PRODUTOS}
    Status Should Be    200    ${response}
    Log    ${RESPONSE.json()}

