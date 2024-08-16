const { When } = require ('@badeball/cypress-cucumber-preprocessor');

import WalletPage from '../pageObjects/walletPage';
const walletPage = new WalletPage();

When('{string} user add the new card with the following details from the wallet page', (user, dataTable) => { 
    //validate wallet page title
    walletPage.validateWalletPageTitle();
    cy.validateBaseURL();

    //click on the add new card button
    walletPage.clickAddNewCardButton();

    //enter the card details
    walletPage.enterCardDetails(user, dataTable);

    //click on the save card button
    walletPage.clickSaveCardButton();

    //validate the card added success message
    walletPage.getCardAddedSuccessMsg().should('be.visible');
});

When('user remove the {string} card from the wallet page', (nameOnCard) => { 
    cy.getCountry().then((testingCountry) => { 
        if (testingCountry === 'us') { 
            //go to the wallet page
            walletPage.gotoWalletPage();

            //validate wallet page title
            walletPage.validateWalletPageTitle();
            cy.validateBaseURL();

            //remove the given card
            walletPage.removeCard(nameOnCard);
        }
    });
});