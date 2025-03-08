*** Settings ***
Library    SeleniumLibrary 


*** Variables ***
${BROWSER}     chrome
${URL}  https://front.serverest.dev/login


*** Keywords ***

Support: Generate random email
    ${RANDOM}    Evaluate    random.randint(1, 10000)    modules=random
    ${NEW_EMAIL}    Set Variable    testing_qa_${RANDOM}@teste.com
    Set Global Variable    ${NEW_EMAIL}    ${NEW_EMAIL}
    RETURN   ${NEW_EMAIL}

Given the user is at login page
    Open Browser    ${URL}    ${BROWSER}

And the user types valid new email credential
    ${NEW_EMAIL}    Support: Generate random email
    Input Text    locator=id:email     text=${NEW_EMAIL}

When the user types valid email credential
    Input Text    locator=id:email     text=${NEW_EMAIL}
    
    
And the user types valid password credential
    Input Text    locator=id:password     text=test@123

And the user click in the "Entrar" button
    Click Button    locator=Entrar

Then the user is redirected to the Store page
    Wait Until Page Contains    text=Serverest Store

When the user click in the "Cadastre-se" button
    Click Element    xpath=//a[@data-testid='cadastrar']

And the user types valid name credential
    Input Text    locator=id:nome     text=testing qa


And the user click in the "Cadastrar" button
    Click Element    xpath=//button[@data-testid='cadastrar']

Then the system should display a feedback message indicating that the account has been successfully created
    Wait Until Page Contains    Cadastro realizado com sucesso    timeout=5s

When the user types invalid email credential
    Input Text    locator=id:email     text=invalidemail@invalid


Then the system should display a feedback message indicating that the Email must be valid
    Wait Until Page Contains    text=Email deve ser um email válido

Then the system should display a feedback message indicating that the Email is mandatory
    Wait Until Page Contains    text=Email é obrigatório

Then the system should display a feedback message indicating that the Password is mandatory
    Wait Until Page Contains    text=Password é obrigatório
