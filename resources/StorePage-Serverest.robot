*** Settings ***
Library    SeleniumLibrary 
Resource    ../resources/LoginPage-Serverest.robot


*** Variables ***


*** Keywords ***

When the user types in the searchbar in Store page
    Sleep    5
    Input Text    xpath=//input[@data-testid='pesquisar']    text=Logi

And the user clicks in the "Pesquisar" button in Store page
    Click Button    xpath=//button[@data-testid='botaoPesquisar']

Then the system must return products accordingly to the search
    Sleep    2
    Wait Until Page Contains Element    //div[contains(@class, 'card-body')]    10s
    Element Should Contain    //div[contains(@class, 'card-body')]    Logi


When the user click in "Adicionar a lista" for an avaiable product in Store page
    Sleep   3
    Click Element    xpath=//button[text()='Adicionar a lista']
    Sleep    3

Then the user is redirected to the Shoplist page
    Element Should Be Visible    xpath=//h1[text()='Lista de Compras']