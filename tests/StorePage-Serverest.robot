*** Settings ***
Suite Setup    Set Screenshot Directory    ${EXECDIR}/results/screenshots

Documentation    TestesE2E-MoutsTI
Resource    ../resources/LoginPage-Serverest.robot
Resource    ../resources/StorePage-Serverest.robot

*** Test Cases ***
#It should be ran together with LoginPage script for creation of a new user account
Case 01: Filtering by product through search bar in Serverest web application
    Given the user is at login page
    When the user click in the "Cadastre-se" button
    And the user types valid name credential
    And the user types valid new email credential
    And the user types valid password credential
    And the user click in the "Cadastrar" button
    Then the system should display a feedback message indicating that the account has been successfully created
    
    When the user types in the searchbar in Store page
    And the user clicks in the "Pesquisar" button in Store page
    Then the system must return products accordingly to the search

Case 02: Adding product to Shoplist in Serverest web application
    Given the user is at login page
    When the user click in the "Cadastre-se" button
    And the user types valid name credential
    And the user types valid new email credential
    And the user types valid password credential
    And the user click in the "Cadastrar" button
    Then the system should display a feedback message indicating that the account has been successfully created
    When the user types in the searchbar in Store page
    And the user clicks in the "Pesquisar" button in Store page
    When the user click in "Adicionar a lista" for an avaiable product in Store page
    Then the user is redirected to the Shoplist page
    