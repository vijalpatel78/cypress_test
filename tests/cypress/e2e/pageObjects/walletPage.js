const walletEmptyMsg = 'div#my_wallet_empty_msg';
const nameOnCard = 'input#cc_nickname';
const cardHolderName = 'input#cc_holder_name';
const cardNumber = 'input#cc_number';
const cvv = 'input#cc_cvv';
const expirationMonth = 'select#cc_expiration_month';
const expirationYear = 'select#cc_expiration_year';
const billingAddress = 'select#billing_address_id';
const defaultCard = 'div.form-field.checkbox-field.field.required > label[for="is_default"] > span';
const saveCardButton = 'a#create_card';
const addNewCardButton = 'a#add-card';
const walletPageURL = '/mywallet/customer/index/';
const successMsg = 'div[data-ui-id="message-success"]';
const cardAddedMsg = 'The credit card has been created successfully';
const cardDeletedMsg = 'The credit card has been removed successfully';
const removeCardLink = 'a.removelink';
const savedCardName = 'div#saved-payment-methods div.payment-cc_nickname';
const deleteCardOKButton = 'button.action-primary.action-accept > span';

class WalletPage {

    getWalletEmptyMsg () {
       return cy.get(walletEmptyMsg);
    } 

    enterNameOnCard (value) {
        cy.get(nameOnCard).should('be.visible').clear().type(value);
    }

    enterCardHolderName (value) {
        cy.get(cardHolderName).should('be.visible').clear().type(value);
    }

    enterCardNumber (value) {
        cy.get(cardNumber).should('be.visible').clear().type(value);
    }

    selectExpirationMonth (value) {
        cy.get(expirationMonth).should('be.visible').select(value);
    }

    selectExpirationYear (value) {
        cy.get(expirationYear).should('be.visible').select(value);
    }

    enterCVV (value) {
        cy.get(cvv).should('be.visible').clear().type(value);
    }

    checkDefaultCreditCard () {
        cy.get(defaultCard).should('be.visible').click();
    }

    clickAddNewCardButton () {
        cy.get(addNewCardButton).filter(':visible').should('be.visible').click();
        cy.waitForSearchBox();
    }

    clickSaveCardButton () {
        cy.wait(3000);
        cy.get(saveCardButton).should('be.visible').click();
    }

    getCardAddedSuccessMsg () {
        return cy.contains(successMsg, cardAddedMsg, {matchCase: false});
    }

    getCardRemovedSuccessMsg () {
        return cy.contains(successMsg, cardRemovedMsg, {matchCase: false});
    }

    validateWalletPageTitle () {
        cy.title().should('equal', 'Wallet');
    }

    enterCardDetails (user, dataTable) {
        const validLabel = ['Name on Card', 'Card Holder Name', 'Card Number', 'Expiration Month', 'Expiration Year', 'CVV', 'Billing Address', 'Default Credit Card'];

        cy.getCountry().then((testingCountry) => {
            dataTable.hashes().forEach((row) => {
                const country = row.country.toLowerCase();
                const field = row.field.toLowerCase();
                const value = row.value;
    
                if (testingCountry === country) { 
                    switch (field) {
                        case 'name on card':
                            this.enterNameOnCard(value);
                            break;
                        case 'card holder name':
                            this.enterCardHolderName(value);
                            break;
                        case 'card number':
                            this.enterCardNumber(value);
                            break;
                        case 'expiration month':
                            this.selectExpirationMonth(value);
                            break;
                        case 'expiration year':
                            this.selectExpirationYear(value);
                            break;
                        case 'cvv':
                            this.enterCVV(value);
                            break;
                        case 'billing address':
                            this.selectBillingAddressByIndex();
                            break;
                        case 'default credit card':
                            if (value.toLowerCase() === 'yes') {
                                this.checkDefaultCreditCard();
                            }
                            break;
                        default:
                            throw new Error(`The provided '${label}' label is not valid. Valid options are ${validLabel.join(', ')}.`);
                    }
                }
            });
        }); 
    }

    removeCard (nameOnCard) {
        this.getWalletEmptyMsg().then(($walletEmptyMsg) => {
            if ($walletEmptyMsg.attr('style')) {
                this.getSavedCardName().then((savedCardNameList) => {   
                    if (savedCardNameList.text().includes(nameOnCard)) {
                        this.clickRemoveCardLink(nameOnCard);
                        this.clickDeleteCardOKButton();
                        this.getCardDeletedSuccessMsg().should('be.visible');
                    } else {
                        cy.log(nameOnCard + ' card is not found.')
                    }
                });
            } else {
                cy.log('You do not have any saved payment methods');
            }
        });
    }

    clickRemoveCardLink (nameOnCard) {
        cy.wait(3000);
        cy.contains(savedCardName, nameOnCard, {matchCase: false}).siblings(removeCardLink).should('be.visible').click();
    }    

    clickDeleteCardOKButton () {
        cy.get(deleteCardOKButton).should('be.visible').click();
    }

    getCardDeletedSuccessMsg () {
        return cy.contains(successMsg, cardDeletedMsg, {matchCase: false});
    }

    getSavedCardName () {
        return cy.get(savedCardName);
    }

    gotoWalletPage () {
        cy.getBaseUrl().then((baseUrl) => {
            const walletPage = baseUrl + walletPageURL;
            cy.visit(walletPage);
            cy.waitForSearchBox();
        });
    }

    selectBillingAddressByIndex () {
        cy.get(billingAddress).should('be.visible').select(1);
    }
    
} export default WalletPage