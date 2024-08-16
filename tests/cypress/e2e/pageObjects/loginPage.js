const email = 'input#email';
const password = 'input#pass';
const login = 'button#send2';
const loginPageTitle = 'Login';
const validationText = 'div[class="message-error error message"] > div';
const validationMessageCloseBtn = 'div[class="message-error error message"] > span.action.close';
const fieldValidationMessage = 'div.mage-error';

class LoginPage {

    openLoginPageUrl () {
        cy.getBaseUrl().then((baseUrl) => {
            const loginUrl = baseUrl + '/customer/account/login/';
            cy.visit(loginUrl);
            cy.waitForSearchBox();
        });
    }

    enterEmail (value) {
        cy.get(email).should('be.visible').clear().type(value);
    } 
    
    enterPassword (value) {
        cy.get(password).should('be.visible').clear().type(value);
    } 
    
    clickLoginButton () {
        cy.get(login).should('be.visible').click();
    }

    getLoginPageTitle () {
        return cy.title();
    }

    validateLoginPageTitle () {
        this.getLoginPageTitle().should('contain', loginPageTitle);
    }

    performLogin (user) {
        cy.getLoginCredentials(user).then((credentials) => {
            this.enterEmail(credentials.email)
            this.enterPassword(credentials.password);
            this.clickLoginButton();
        });
    }

    performLoginWithSession (user) {
        cy.getLoginCredentials(user).then((credentials) => {
            cy.session([user, credentials], () => {
                this.openLoginPageUrl();
                this.enterEmail(credentials.email)
                this.enterPassword(credentials.password);
                this.clickLoginButton();
            });
            cy.getBaseUrl().then((baseUrl) => {
                cy.visit(baseUrl);
                cy.waitForSearchBox();
            });
        });
    }

    getValidationMessage () {
        return cy.get(validationText);
    }

    getValidationMessageCloseBtn () {
        return cy.get(validationMessageCloseBtn);
    }

    getFieldValidationMessage (field) {
        return cy.get('input[title="'+field+'"]').siblings(fieldValidationMessage);
    }

} export default LoginPage