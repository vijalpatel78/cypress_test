const firstName = 'input#firstname';
const lastName = 'input#lastname';
const email = 'input#email_address';
const password = 'input#password';
const confirmPassword = 'input#password-confirmation';
const createAccount = 'input[title="Create Account"]';
const successMsg = 'div.page.messages';
const thankYouLabel = 'Thank you for registering with Visual Comfort & Co..';
const createAnAccount = 'a[class="action create primary"] > span';
const createAnAccountLabel = 'Create an Account';
const welcomeMsg = 'div[class="greet welcome"] > span[class="logged-in"]';
const requestAccountButton = 'a.pagebuilder-button-primary > span';
const confirmEmail = 'input#email-confirmation';
const companyName = 'input#company_name';
const businessType = 'select#business_type';
const collections = 'div#collections_group > label';
const addressLine1 = 'input#street0';
const country = 'select#country_id';
const city = 'input#city';
const state = 'input#region';
const stateDropdown = 'select#region_id';
const zipCode = 'input#postcode';
const phone = 'input#telephone';
const uploadFileSection = 'input[name="proofOfTrade"]';
const submitAccountRequestBtn = 'button[title="Submit Account Request"]';
const waitTillFileUpload = 'div.documents-count > span';
const successMessage = 'div.page.messages div[data-ui-id="message-success"] > div';
const termsAndConditionsCheckbox = 'label[for="termsandcondition"]';
const privacyPolicyLink = 'a[title="Privacy Policy"]';
const privacyPolicyPageHeader = 'h1.page-title > span';
const breadcrumbValue = '.breadcrumbs > ul > li';
const fieldValidationMessage = 'div.mage-error';
const termsConditionValidationMsg = 'div.termsandcondition_error';
const attentionPopupMsg = 'div[data-ui-id="messages-message-error"]';
const attentionPopupTitle = 'aside[role="dialog"] span[data-role="title"]';
const stateValidationMsg = 'div#region_id-error';
const businessTypeValidationMsg = 'div#business_type-error';
const uploadDocumentValidationMsg  = 'div.mage-error';

class CreateNewAccountPage {

    openSignUpPageUrl () {
        cy.getBaseUrl().then((baseUrl) => {
            const signUpUrl = baseUrl + '/customer/account/create/'
            cy.visit(signUpUrl);
            cy.waitForSearchBox();
        });
    }

    getSignUpPageTitle () {
        return cy.title();
    }

    validateSignUpPageTitle (expectedTitle) {
        this.getSignUpPageTitle().should('contain', expectedTitle);
    }

    enterFirstName (value) {
        cy.get(firstName).should('be.visible').clear().type(value);
    }

    enterLastName (value) {
        cy.get(lastName).should('be.visible').clear().type(value);
    }

    enterEmail (value) {
        cy.createUniqueEmail(value).then((emailAddress) => {
            cy.get(email).should('be.visible').clear().type(emailAddress);
        });
    }
    
    enterPassword (value) {
        cy.get(password).should('be.visible').clear().type(value);
    }

    enterConfirmPassword (value) {
        cy.get(confirmPassword).should('be.visible').clear().type(value);
    }

    clickCreateAccountButton () {
        cy.getTestingEnvironment().then((testingEnvironment) => {
            if (testingEnvironment.toLowerCase() !== 'production') {
                cy.get(createAccount).should('be.visible').click();
            } else {
                cy.log('Skipping this step because of reCaptcha on the production');
            }
        });
    }

    getThankYouForRegisteringMsg () {
        return cy.get(successMsg).contains(thankYouLabel, {matchCase: false});
    }

    clickCreateAnAccountButton () {
        cy.get(createAnAccount).contains(createAnAccountLabel, {matchCase: false}).click();
        cy.waitForSearchBox();
    }

    enterRetailAccountDetails (dataTable) {
        for (let i = 1; i < dataTable.rawTable.length; i++) {
            const field = dataTable.rawTable[i][0].toLowerCase();
            const value = dataTable.rawTable[i][1];
  
            switch (field) {
                case 'first name':
                    this.enterFirstName(value);
                    break;
                case 'last name':
                    this.enterLastName(value);
                    break;
                case 'email':
                    this.enterEmail(value);
                    break;
                case 'password':
                    this.enterPassword(value);
                    this.enterConfirmPassword(value);
                    break;
                case 'confirm password':
                    this.enterConfirmPassword(value);
                    break;
                default:
                    throw new Error(`The provided '${field}' field is not valid.`);
            }
        }
    }

    acceptTermsAndConditions () {
        cy.get(termsAndConditionsCheckbox).filter(':visible').click();
    }

    getWelcomeMsg () {
        return cy.get(welcomeMsg);
    }

    clickRequestAccountButton () {
        cy.get(requestAccountButton).should('be.visible').click();  
        cy.waitForSearchBox();
    }

    enterTradeWholesaleAccountDetails (dataTable) {
        for (let i = 1; i < dataTable.rawTable.length; i++) {
            const field = dataTable.rawTable[i][0].toLowerCase();
            const value = dataTable.rawTable[i][1];
  
            switch (field) {
                case 'first name':
                    this.enterFirstName(value);
                    break;
                case 'last name':
                    this.enterLastName(value);
                    break;
                case 'email':
                    this.enterEmailAndConfirmEmail(value);
                    break;
                case 'password':
                    this.enterPassword(value);
                    this.enterConfirmPassword(value);
                    break;
                case 'company name':
                    cy.createUniqueName(value).then((uniqueName) => {
                        this.enterCompanyName(uniqueName);
                    });
                    break;
                case 'type of business':
                    this.selectBusinessType(value);
                    break;
                case 'interested collections':
                    this.selectCollections(value);
                    break;
                case 'confirm password':
                    this.enterConfirmPassword(value);
                    break;
                default:
                    throw new Error(`The provided '${field}' field is not valid.`);
            }
        }
    }

    enterEmailAndConfirmEmail (value) {
        cy.createUniqueEmail(value).then((emailAddress) => {
            cy.get(email).should('be.visible').clear().type(emailAddress);
            cy.get(confirmEmail).should('be.visible').clear().type(emailAddress);
        });
    }

    enterCompanyName (value) {
        cy.get(companyName).should('be.visible').clear().type(value);
    }

    selectBusinessType (value) {
        cy.get(businessType).should('be.visible').select(value);
    } 

    selectCollections (value) {
        cy.contains(collections, value, { matchCase: false }).click();
    } 

    enterAddressDetails (dataTable) {
        cy.getCountry().then((testingCountry) => {        
            for (let i = 1; i < dataTable.rawTable.length; i++) {
                const country = dataTable.rawTable[i][0].toLowerCase();
                const field = dataTable.rawTable[i][1].toLowerCase();
                const value = dataTable.rawTable[i][2];
      
                if (testingCountry === country) {
                    switch (field) {
                        case 'address line 1':
                            this.enterAddressLine1(value);
                            break;
                        case 'country':
                            this.selectCountry(value);
                            break;
                        case 'state':
                            if(testingCountry === 'us'){
                                this.selectState(value);
                            } else {
                                this.enterState(value);
                            }
                            break;
                        case 'city':
                            this.enterCity(value);
                            break;
                        case 'zip code':
                            this.enterZipCode(value);
                            break;
                        case 'phone number':
                            this.enterPhoneNumber(value);
                            break;
                        default:
                            throw new Error(`The provided '${field}' field is not valid.`);
                    }
                }
            }
        });
    }

    enterAddressLine1 (value) {
        cy.get(addressLine1).should('be.visible').clear().type(value);
    }

    selectCountry (value) {
        cy.get(country).should('be.visible').select(value);
    }

    selectState (value) {
        cy.get(stateDropdown).should('be.visible').select(value);
    }

    enterState (value) {
        cy.get(state).should('be.visible').clear().type(value);
    }

    enterCity (value) {
        cy.get(city).should('be.visible').clear().type(value);
    }

    enterZipCode (value) {
        cy.get(zipCode).should('be.visible').clear().type(value);
    }

    enterPhoneNumber (value) {
        cy.get(phone).should('be.visible').clear().type(value);
    }

    uploadFile (proofFileName) {
        cy.fixture(proofFileName, null).as('proofFile');
        cy.get(uploadFileSection).selectFile('@proofFile', { force: true });
        cy.wait(3000);
        cy.contains(waitTillFileUpload, 'Documents added (1)', { matchCase: false }).should('be.visible');
        cy.wait(3000);
    }

    clickSubmitAccountRequestButton () {
        cy.get(submitAccountRequestBtn).should('be.visible').click();  
    }

    getSuccessMsg () {
        return cy.get(successMessage);
    }

    clickPrivacyPolicyLink () {
        cy.get(privacyPolicyLink).should('be.visible').click();  
    }

    getPrivacyPolicyPageTitle () {
        return cy.title();
    }

    getPrivacyPolicyPageHeader () {
        return cy.get(privacyPolicyPageHeader).should('be.visible');
    }

    getBreadcrumbValue () {
        cy.get(breadcrumbValue).should('be.visible');
        return cy.getListElement(breadcrumbValue, " / ");       
    }

    getPrivacyPolicyPageURL () {
        return cy.url();
    }

    getFieldValidationMessage (field) {
        return cy.get('input[title="'+field+'"]').siblings(fieldValidationMessage);
    }

    getTermsConditionValidationMsg () {
        return cy.get(termsConditionValidationMsg);
    }

    getAttentionPopupMessage () {
        return cy.get(attentionPopupMsg).should('be.visible').then((displayedMsg) => {
            return displayedMsg.text().trim();
        });
    }

    uploadWrongFile (proofFileName) {
        cy.fixture(proofFileName, null).as('proofFile');
        cy.get(uploadFileSection).selectFile('@proofFile', { force: true });
    }

    getAttentionPopupTitle () {
        return cy.get(attentionPopupTitle).should('be.visible').then((displayedTitle) => {
            return displayedTitle.text().trim();
        });
    }

    getStateValidationMsg () {
        return cy.get(stateValidationMsg);
    }

    getBusinessTypeValidationMsg () {
        return cy.get(businessTypeValidationMsg);
    }

    getUploadFileValidationMsg () {
        return cy.get(uploadFileSection).siblings(uploadDocumentValidationMsg);
    }

} export default CreateNewAccountPage