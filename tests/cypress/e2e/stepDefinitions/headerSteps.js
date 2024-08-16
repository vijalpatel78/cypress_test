const { When, Then } = require ('@badeball/cypress-cucumber-preprocessor');

import HeaderPage from '../pageObjects/headerPage';

const header = new HeaderPage();

Then('user should be able to see showroom icon', () => {       
    //validate showroom icon
    header.getShowroomIcon().should('be.visible');
});

When('user click on showroom icon', () => {       
    //click on showroom icon
    header.clickShowroomIcon();
});

Then('user should be able to see contact us icon', () => {       
    //validate contact us icon
    header.getContactUsIcon().should('be.visible');
});

When('user click on contact us icon', () => {       
    //click on contact us icon
    header.clickContactUsIcon();
});

Then('user should be able to see the website logo in the {string} of header', (expectedAlign) => {       
    //validate the logo should be displayed in the center of header
    header.getWebsiteLogo().should('be.visible').invoke('css', 'text-align').then((actualAlign) => {
        expect(actualAlign).to.equal(expectedAlign);
    });
});

When('user click on the website logo', () => {       
    //click on logo
    header.clickWebsiteLogo();
});