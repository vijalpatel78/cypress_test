const { When, Then } = require ('@badeball/cypress-cucumber-preprocessor');

import AddressBookPage from '../pageObjects/addressBookPage';
const addressBookPage = new AddressBookPage();

When('user click on the below header name', (dataTable) => {
    cy.getCountry().then((testingCountry) => {   
        dataTable.hashes().forEach((row) => {
            const country = row.country.toLowerCase();
            const headerName = row.header;

            if (testingCountry === country) {
                //click on the given header
                addressBookPage.clickHeader(headerName);
            }
        });
    });
});

When('user click on the edit link of the {string}', (sectionName) => {
    //click on the edit link of the given address section
    addressBookPage.clickEditLink(sectionName);
});

When('user enter the {string} in the {string} field', (data, field) => {
    //enter data in the given field
    addressBookPage.enterData(field, data);
});

When('user click on the Save Address button', () => {
    //click on the Save Address button
    addressBookPage.clickSaveAddressBtn();
});

Then('the {string} should be displayed on the {string}', (address, sectionName) => {
    //validate the address
    addressBookPage.getAddress(sectionName).then((displayedAddress) => {
        expect(displayedAddress).to.contain(address);
    });
});