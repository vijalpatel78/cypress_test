const { When, Then, Given } = require ('@badeball/cypress-cucumber-preprocessor');

import LoginPage from '../pageObjects/loginPage';
import HeaderPage from '../pageObjects/headerPage';

const login = new LoginPage();
const header = new HeaderPage();

Given('{string} user do login into the website with session', (user) => {
    //do login
    login.performLoginWithSession(user);
});

When('user click on the login icon', () => {
    //click on the login icon
    header.clickLoginIcon();

    //validate login page title
    login.validateLoginPageTitle();
    cy.validateBaseURL();
});

When('{string} user do login', (user) => {
    //do login
    login.performLogin(user);
});

Then('user should get logged-in', () => {
    //validate the account icon to check whether it get login or not
    header.getUserIcon().should('be.visible');
});

When('user enter the {string} email', (emailAddress) => {
    //enter the given email 
    login.enterEmail(emailAddress);
});

When('user enter the {string} password', (password) => {
    //enter the given password 
    login.enterPassword(password);
});

When('user click on the login button', () => {
    //click on the login button  
    login.clickLoginButton();
});

Then('the following validation message should be displayed on the login page', (dataTable) => {
    const expectedValidationMessage = dataTable.rawTable[1].toString(); 

    //validate the validation message with close button 
    login.getValidationMessage().should('be.visible').should('have.text', expectedValidationMessage);
    login.getValidationMessageCloseBtn().should('be.visible');

    //validate the login page title
    login.validateLoginPageTitle();
    cy.validateBaseURL();
});

Then('the following field validation message should be displayed on the login page', (dataTable) => {
    dataTable.hashes().forEach((row) => {
        const field = row.field;
        const expectedValidationMessage = row.message;

        //validate the validation message of given field 
        switch (field.toLowerCase()) {
            case 'email':
                login.getFieldValidationMessage(field).should('be.visible').should('have.text', expectedValidationMessage);
                break;
            default:
                throw new Error(`The provided '${field}' label is not valid.`);
        }

        //validate the login page title
        login.validateLoginPageTitle();
        cy.validateBaseURL();
    });
});