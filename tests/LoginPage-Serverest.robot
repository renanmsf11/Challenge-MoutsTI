*** Settings ***
Suite Setup    Set Screenshot Directory    ${EXECDIR}/results/screenshots

Documentation    TestesE2E-MoutsTI
Resource    ../resources/LoginPage-Serverest.robot

*** Test Cases ***

Case 01: Creating new Account in Serverest web application
    Given the user is at login page
    When the user click in the "Cadastre-se" button
    And the user types valid name credential
    And the user types valid new email credential
    And the user types valid password credential
    And the user click in the "Cadastrar" button
    Then the system should display a feedback message indicating that the account has been successfully created

Case 02: Login with valid credentials in Serverest web application
    Given the user is at login page
    When the user types valid email credential
    And the user types valid password credential 
    And the user click in the "Entrar" button
    Then the user is redirected to the Store page

Case 03: Validate that the system does not accept user login with invalid email credential in the Serverest web application
    Given the user is at login page
    When the user types invalid email credential
    And the user click in the "Entrar" button
    Then the system should display a feedback message indicating that the Email must be valid

Case 04: Validate that the system does not accept user login with blank input credentials in the Serverest web application
    Given the user is at login page
    And the user click in the "Entrar" button
    Then the system should display a feedback message indicating that the Email is mandatory
    Then the system should display a feedback message indicating that the Password is mandatory
    






