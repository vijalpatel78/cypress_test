const { When, Then } = require ('@badeball/cypress-cucumber-preprocessor');

import CreateNewAccountPage from '../pageObjects/createNewAccountPage';
import HeaderPage from '../pageObjects/headerPage';

const signUp = new CreateNewAccountPage();
const header = new HeaderPage();

When('user click on the create an account button', () => {
    //click on the create an account button
    signUp.clickCreateAnAccountButton();

    //validate sign up page title
    signUp.validateSignUpPageTitle('Create New Customer Account');
    cy.validateBaseURL();
});

When('user enter the following new retail account details:', (dataTable) => {
    //enter the account details
    signUp.enterRetailAccountDetails(dataTable);
});

When('user click on the terms and conditions checkbox', () => {
    //click on the terms and conditions checkbox
    signUp.acceptTermsAndConditions();
})

When('user click on the create account button', () => {
    //click on the create account button
    signUp.clickCreateAccountButton();
});

Then('new retail account should get created with the following success message:', (dataTable) => {
    const successMessage = dataTable.rawTable[1];

    //validate the thank you msg
    cy.getTestingEnvironment().then((testingEnvironment) => {
        if (testingEnvironment.toLowerCase() !== 'production') { 
            signUp.getThankYouForRegisteringMsg().should('have.text', successMessage.toString());
        }
    });
});

Then('welcome message should contain the following first and last name:', (dataTable) => {
    const firstName =  dataTable.rawTable[1][1]
    const lastName = dataTable.rawTable[2][1];

    //validate the first and last name of the welcome msg
    cy.getTestingEnvironment().then((testingEnvironment) => {
        if (testingEnvironment.toLowerCase() !== 'production') {
            signUp.getWelcomeMsg().should('contain.text', firstName).should('contain.text', lastName);
        }
    });
});

Then('user should get logged into the account', () => {
    //validate the account icon to check whether it get login or not
    cy.getTestingEnvironment().then((testingEnvironment) => {
        if (testingEnvironment.toLowerCase() !== 'production') {
            header.getUserIcon().should('be.visible');
        }
    });
});

When('user click on the request an account button', () => {
    //click on the request an account button
    signUp.clickRequestAccountButton();

    //validate sign up page title
    signUp.validateSignUpPageTitle('Request Trade/Wholesale Account');
    cy.validateBaseURL();
});

When('user enter the following account details:', (dataTable) => {
    //enter the account details
    signUp.enterTradeWholesaleAccountDetails(dataTable);
});

When('user enter the following address details:', (dataTable) => {
    //enter the address details
    signUp.enterAddressDetails(dataTable);
});

When('user upload {string} file located in the fixtures folder', (proofFileName) => {
    //upload the given file
    signUp.uploadFile(proofFileName);
});

When('user click on the submit account request button', () => {
    //click on the submit account request button 
    signUp.clickSubmitAccountRequestButton();
});

Then('new wholesale or trade account should get created with the following success message', (dataTable) => {
    const successMessage = dataTable.rawTable[1].toString();

    cy.getTestingEnvironment().then((testingEnvironment) => {
        if (testingEnvironment.toLowerCase() !== 'production') {
            //validate the success message
            signUp.getSuccessMsg().should('have.text', successMessage);
        } else {
            cy.log('Skipping this step for production because of the comment given in the USER STORY 24226');
        }
    });
});

When('user click on the privacy policy link from the create new account page', () => {
    //click on the privacy policy link
    signUp.clickPrivacyPolicyLink();
});

Then('the {string} page should be opened', (expectedPage) => {
    //validate the page title
    signUp.getPrivacyPolicyPageTitle().should('have.string', expectedPage);
    cy.validateBaseURL();

    //validate the page header
    signUp.getPrivacyPolicyPageHeader().should('have.text', expectedPage);
});

Then('the page URL should end with {string}', (expectedURL) => {
    //validate the page url
    signUp.getPrivacyPolicyPageURL().then((currentURL) => {
        expect(currentURL.endsWith(expectedURL.toLowerCase()), 'Navigate to url - ' + currentURL).to.be.true;
        cy.validateBaseURL();
    }); 
});

Then('the below breadcrumb value should be displayed on the page', (dataTable) => {
    let expectedBreadcrumbValue = dataTable.raw().slice(1).map((row) => row[0].trim()).toString();

    //validate breadcrumb value 
    signUp.getBreadcrumbValue().then((actualBreadcrumbValue) => {
        expect(actualBreadcrumbValue).to.eq(expectedBreadcrumbValue);   
    });
});

Then('the following field validation message should be displayed on the {string} page', (pageName, dataTable) => {
    cy.getTestingEnvironment().then((testingEnvironment) => {
        if (testingEnvironment.toLowerCase() !== 'production') {
            dataTable.hashes().forEach((row) => {
                const field = row.field;
                const expectedValidationMessage = row.message;

                //validate the validation message of given field 
                switch (field.toLowerCase()) {
                    case 'first name':
                        signUp.getFieldValidationMessage(field).should('be.visible').should('have.text', expectedValidationMessage);
                        break;
                    case 'last name':
                        signUp.getFieldValidationMessage(field).should('be.visible').should('have.text', expectedValidationMessage);
                        break;
                    case 'email':
                        signUp.getFieldValidationMessage(field).should('be.visible').should('have.text', expectedValidationMessage);
                        break;
                    case 'password':
                        signUp.getFieldValidationMessage(field).should('be.visible').should('have.text', expectedValidationMessage);
                        break;
                    case 'confirm password':
                        signUp.getFieldValidationMessage(field).should('be.visible').should('have.text', expectedValidationMessage);
                        break;
                    case 'terms & conditions':
                        signUp.getTermsConditionValidationMsg().should('be.visible').should('have.text', expectedValidationMessage);
                        break;
                    case 'company name':
                        signUp.getFieldValidationMessage(field).should('be.visible').should('have.text', expectedValidationMessage);
                        break;
                    case 'contact email':
                        signUp.getFieldValidationMessage(field).should('be.visible').should('have.text', expectedValidationMessage);
                        break;
                    case 'confirm contact email':
                        signUp.getFieldValidationMessage(field).should('be.visible').should('have.text', expectedValidationMessage);
                        break;
                    case 'address':
                        signUp.getFieldValidationMessage(field).should('be.visible').should('have.text', expectedValidationMessage);
                        break;
                    case 'city':
                        signUp.getFieldValidationMessage(field).should('be.visible').should('have.text', expectedValidationMessage);
                        break;
                    case 'zip/postal code':
                        signUp.getFieldValidationMessage(field).should('be.visible').should('have.text', expectedValidationMessage);
                        break;
                    case 'phone':
                        signUp.getFieldValidationMessage(field).should('be.visible').should('have.text', expectedValidationMessage);
                        break;
                    case 'state':
                        cy.getCountry().then((testingCountry) => { 
                            if (testingCountry === 'us') {
                                signUp.getStateValidationMsg().should('be.visible').should('have.text', expectedValidationMessage);
                            }
                        });
                        break;
                    case 'type of business':
                        signUp.getBusinessTypeValidationMsg().should('be.visible').should('have.text', expectedValidationMessage);
                        break;
                    case 'upload document':
                        signUp.getUploadFileValidationMsg().should('be.visible').should('have.text', expectedValidationMessage);
                        break;
                    default:
                        throw new Error(`The provided '${field}' field is not valid.`);
                }
            });

            //validate sign up page title
            signUp.validateSignUpPageTitle(pageName);
            cy.validateBaseURL();
        } else {
            if (pageName.toLowerCase() === 'request trade/wholesale account') {
                dataTable.hashes().forEach((row) => {
                    const field = row.field;
                    const expectedValidationMessage = row.message;
    
                    //validate the validation message of given field 
                    switch (field.toLowerCase()) {
                        case 'first name':
                            signUp.getFieldValidationMessage(field).should('be.visible').should('have.text', expectedValidationMessage);
                            break;
                        case 'last name':
                            signUp.getFieldValidationMessage(field).should('be.visible').should('have.text', expectedValidationMessage);
                            break;
                        case 'email':
                            signUp.getFieldValidationMessage(field).should('be.visible').should('have.text', expectedValidationMessage);
                            break;
                        case 'password':
                            signUp.getFieldValidationMessage(field).should('be.visible').should('have.text', expectedValidationMessage);
                            break;
                        case 'confirm password':
                            signUp.getFieldValidationMessage(field).should('be.visible').should('have.text', expectedValidationMessage);
                            break;
                        case 'terms & conditions':
                            signUp.getTermsConditionValidationMsg().should('be.visible').should('have.text', expectedValidationMessage);
                            break;
                        case 'company name':
                            signUp.getFieldValidationMessage(field).should('be.visible').should('have.text', expectedValidationMessage);
                            break;
                        case 'contact email':
                            signUp.getFieldValidationMessage(field).should('be.visible').should('have.text', expectedValidationMessage);
                            break;
                        case 'confirm contact email':
                            signUp.getFieldValidationMessage(field).should('be.visible').should('have.text', expectedValidationMessage);
                            break;
                        case 'address':
                            signUp.getFieldValidationMessage(field).should('be.visible').should('have.text', expectedValidationMessage);
                            break;
                        case 'city':
                            signUp.getFieldValidationMessage(field).should('be.visible').should('have.text', expectedValidationMessage);
                            break;
                        case 'zip/postal code':
                            signUp.getFieldValidationMessage(field).should('be.visible').should('have.text', expectedValidationMessage);
                            break;
                        case 'phone':
                            signUp.getFieldValidationMessage(field).should('be.visible').should('have.text', expectedValidationMessage);
                            break;
                        case 'state':
                            cy.getCountry().then((testingCountry) => { 
                                if (testingCountry === 'us') {
                                    signUp.getStateValidationMsg().should('be.visible').should('have.text', expectedValidationMessage);
                                }
                            });
                            break;
                        case 'type of business':
                            signUp.getBusinessTypeValidationMsg().should('be.visible').should('have.text', expectedValidationMessage);
                            break;
                        case 'upload document':
                            signUp.getUploadFileValidationMsg().should('be.visible').should('have.text', expectedValidationMessage);
                            break;
                        default:
                            throw new Error(`The provided '${field}' field is not valid.`);
                    }
                });
    
                //validate sign up page title
                signUp.validateSignUpPageTitle(pageName);
                cy.validateBaseURL();
            } else {
                cy.log('Skipping this step because of reCaptcha on the production');
            }
        }
    });
});

When('user click on the create account button from the {string} page', () => {
    //click on the create account button
    cy.wait(3000);
    signUp.clickCreateAccountButton();
});

Then('the attention popup with the following message should be displayed on the {string} page', (pageName, dataTable) => {
    const expectedMessage = dataTable.rawTable[1].toString();

    //validate the popup title
    signUp.getAttentionPopupTitle().then((displayedTitle) => {
        expect(displayedTitle).to.equal('Attention');
    });

    //validate the popup message
    signUp.getAttentionPopupMessage().then((displayedMessage) => {
        expect(displayedMessage).to.contain(expectedMessage);
    });

    //validate sign up page title
    signUp.validateSignUpPageTitle(pageName);
});

When('user upload the wrong {string} file format located in the fixtures folder', (proofFileName) => {
    //upload the given wrong file format 
    signUp.uploadWrongFile(proofFileName);
});

When('user click on the submit account request button to create a new account', () => {
    cy.getTestingEnvironment().then((testingEnvironment) => {
        if (testingEnvironment.toLowerCase() !== 'production') {
            //click on the submit account request button 
            signUp.clickSubmitAccountRequestButton();
        } else {
            cy.log('Skipping this step for production because of the comment given in the USER STORY 24226');
        }
    });
});

When('user click on the submit account request button from the {string} page', () => {
    //click on the create account button
    cy.wait(3000);
    signUp.clickSubmitAccountRequestButton();
});