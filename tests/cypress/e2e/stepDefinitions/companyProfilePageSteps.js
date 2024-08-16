const { When, Then } = require ('@badeball/cypress-cucumber-preprocessor');

import OrdersInvoicesCreditMemosPage from '../pageObjects/ordersInvoicesCreditMemosPage';
import CompanyProfilePage from '../pageObjects/companyProfilePage';

const selfServicePage = new OrdersInvoicesCreditMemosPage();
const companyProfilePage = new CompanyProfilePage();

Then('user should not be able to see the {string} option on the top header', (optionName) => {
    //validate my account's top header should not contain the given option
    selfServicePage.getTopHeaders().should('not.contain', optionName);
});

Then('user should be able to see below account information on company profile page', (dataTable) => {
    cy.getCountry().then((testingCountry) => {
        //validate account information
        for (let i = 1; i < dataTable.rawTable.length; i++) {
            const country = dataTable.rawTable[i][0].toLowerCase();
            const field = dataTable.rawTable[i][1].toLowerCase();
            const expectedValue = dataTable.rawTable[i][2];

            if (testingCountry === country) { 
                switch (field) {
                    case 'title':
                        companyProfilePage.getAccountTitle().then((displayedAccountTitle) => {
                            expect(displayedAccountTitle).to.be.equal(expectedValue);
                        });
                        break;
                    case 'account number':
                        companyProfilePage.getAccountNumber().then((displayedAccountNo) => {
                            expect(displayedAccountNo).to.be.equal(expectedValue);
                        });
                        break;
                    case 'account information':
                        companyProfilePage.getAccountInfo().then((displayedAccountInfo) => {
                            expect(displayedAccountInfo.replace(/\s/g, '')).to.be.equal(expectedValue.replace(/\s/g, ''));
                        });
                        break;
                    default:
                        throw new Error(`The provided '${field}' field is not valid.`);
                }
            }
        }
    }); 
});

Then('user should be able to see below contact information on company profile page', (dataTable) => {
    cy.getCountry().then((testingCountry) => {
        //validate contact information
        for (let i = 1; i < dataTable.rawTable.length; i++) {
            const country = dataTable.rawTable[i][0].toLowerCase();
            const field = dataTable.rawTable[i][1].toLowerCase();
            const expectedValue = dataTable.rawTable[i][2];

            if (testingCountry === country) { 
                switch (field) {
                    case 'title':
                        companyProfilePage.getContactsTitle().then((displayedContactsTitle) => {
                            expect(displayedContactsTitle).to.be.equal(expectedValue);
                        });
                        break;
                    case 'company admin':
                        companyProfilePage.getCompanyAdmin().then((displayedCompanyAdmin) => {
                            expect(displayedCompanyAdmin).to.be.equal(expectedValue);
                        });
                        break;
                    case 'contact information':
                        companyProfilePage.getContactInfo().then((displayedContactInfo) => {
                            expect(displayedContactInfo.replace(/\s/g, '')).to.be.equal(expectedValue.replace(/\s/g, ''));
                        });
                        break;
                    default:
                        throw new Error(`The provided '${field}' field is not valid.`);
                }
            }
        }
    }); 
});

Then('user should be able to see below legal business address information on company profile page', (dataTable) => {
    cy.getCountry().then((testingCountry) => {
        //validate legal business address information
        for (let i = 1; i < dataTable.rawTable.length; i++) {
            const country = dataTable.rawTable[i][0].toLowerCase();
            const field = dataTable.rawTable[i][1].toLowerCase();
            const expectedValue = dataTable.rawTable[i][2];                                   
                               
            if (testingCountry === country) { 
                switch (field) {
                    case 'title':
                        companyProfilePage.getLegalBusinessTitle().then((displayedBusinessTitle) => {
                            expect(displayedBusinessTitle).to.be.equal(expectedValue);
                        });
                        break;
                    case 'address':
                        companyProfilePage.getLegalBusinessAddress().then((displayedAddress) => {
                            expect(displayedAddress.replace(/\s/g, '')).to.be.equal(expectedValue.replace(/\s/g, ''));
                        });
                        break;
                    default:
                        throw new Error(`The provided '${field}' field is not valid.`);
                }
            }
        }
    }); 
});

Then('user should be able to see below shipping information on company profile page', (dataTable) => {
    cy.getCountry().then((testingCountry) => {
        //validate shipping information
        for (let i = 1; i < dataTable.rawTable.length; i++) {
            const country = dataTable.rawTable[i][0].toLowerCase();
            const field = dataTable.rawTable[i][1].toLowerCase();
            const expectedValue = dataTable.rawTable[i][2];

            if (testingCountry === country) { 
                switch (field) {
                    case 'title':
                        companyProfilePage.getShippingTitle().then((displayedShippingTitle) => {
                            expect(displayedShippingTitle).to.be.equal(expectedValue);
                        });
                        break;
                    case 'available method text':
                        companyProfilePage.getAvailableMethodText().then((displayedMethodText) => {
                            expect(displayedMethodText.replace(/\s/g, '')).to.be.equal(expectedValue.replace(/\s/g, ''));
                        });
                        break;
                    case 'methods':
                        companyProfilePage.getShippingMethodsList().then((displayedMethodList) => {
                            expect(displayedMethodList.replace(/\s/g, '')).to.be.equal(expectedValue.replace(/,/g, '').replace(/\s/g, ''));
                        });
                        break;
                    default:
                        throw new Error(`The provided '${field}' field is not valid.`);
                }
            }
        }
    }); 
});