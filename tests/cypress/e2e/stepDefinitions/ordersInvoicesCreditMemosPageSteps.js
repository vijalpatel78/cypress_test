const { When, Then } = require ('@badeball/cypress-cucumber-preprocessor');

import OrdersInvoicesCreditMemosPage from '../pageObjects/ordersInvoicesCreditMemosPage';
const selfServicePage = new OrdersInvoicesCreditMemosPage();

let defaultAccountFilter;

When('user click on the {string} header', (headerName) => {
    //click on the given header
    selfServicePage.clickHeader(headerName);
});

Then('user should be able to see the below placeholder for the search box', (dataTable) => {
    const expectedPlaceholder = dataTable.rawTable[1].toString();

    //validate the placeholder of search box
    selfServicePage.getSearchBoxPlaceholder().then((actualPlaceholder) => {
        expect(actualPlaceholder).to.be.equal(expectedPlaceholder.toLowerCase());
    });
});

Then('user should be able to see {string} header as selected', (expectedSelectedHeader) => {
    //validate the selected header name
    selfServicePage.getSelectedHeader().then((actualSelectedHeader) => {
        expect(actualSelectedHeader).to.be.equal(expectedSelectedHeader.toLowerCase());
    });
});

Then('the pagination should be available at the bottom of page', () => {
    cy.getCountry().then((testingCountry) => {    
        if (testingCountry === 'us') { 
            //validate whether the pagination is available or not
            selfServicePage.getPagination().should('exist').should('be.visible');
        } else {
            cy.log('The test data is not available for ' + testingCountry.toUpperCase() + ' country');
        }
    });
});

Then('user should be able to see {int} as default pagination', (expectedPaginationOption) => {
    cy.getCountry().then((testingCountry) => {    
        if (testingCountry === 'us') { 
            //validate the default selected option of pagination
            selfServicePage.getSelectedPaginationDropdownOption().then((actualSelectedPaginationOption) => {
                expect(actualSelectedPaginationOption).to.eq(expectedPaginationOption.toString());  
            });
        } else {
            cy.log('The test data is not available for ' + testingCountry.toUpperCase() + ' country');
        }
    });
});

Then('user should be able to see below available pagination options', (dataTable) => {
    const expectedDropdownOptions = dataTable.raw().slice(1).map((row) => row[0]).toString();

    cy.getCountry().then((testingCountry) => {    
        if (testingCountry === 'us') { 
            //validate available dropdown options
            selfServicePage.getPaginationDropdownOptions().then((actualDropdownOptions) => {
                expect(actualDropdownOptions).to.eq(expectedDropdownOptions);  
	        });
        } else {
            cy.log('The test data is not available for ' + testingCountry.toUpperCase() + ' country');
        }
    });
});

Then('user should be able to see below available headers of list', (dataTable) => {
    const expectedListHeaders = dataTable.raw().slice(1).map((row) => row[0]).toString().replace(/\s+/g, '');

    cy.getCountry().then((testingCountry) => {    
        if (testingCountry === 'us') { 
            //validate available headers of list  
            selfServicePage.getListHeaders().then((actualListHeaders) => {
                actualListHeaders = actualListHeaders.replace('Open', '').replace('Closed', '').replace('Partial', '').replace(/\s+/g, '');
                expect(actualListHeaders.toLowerCase()).to.eq(expectedListHeaders.toLowerCase());    
            });
        } else {
            cy.log('The test data is not available for ' + testingCountry.toUpperCase() + ' country');
        }
    });
});

When('user click on the view link of {string} number', (number) => {
    cy.getCountry().then((testingCountry) => {    
        if (testingCountry === 'us') { 
            //click on the view link of given number
            selfServicePage.clickViewLinkOfNumber(number);
        } else {
            cy.log('The test data is not available for ' + testingCountry.toUpperCase() + ' country');
        }
    });
});

Then('details page of {string} number should get opened', (number) => {
    cy.getCountry().then((testingCountry) => {    
        if (testingCountry === 'us') { 
            //validate whether the page title contains the given number or not
            selfServicePage.getPageTitle().should('be.visible').should('contain.text', number);
            cy.validateBaseURL();
        } else {
            cy.log('The test data is not available for ' + testingCountry.toUpperCase() + ' country');
        }
    });
});

Then('user should be able to see below available headers on the page', (dataTable) => {
    cy.getCountry().then((testingCountry) => {
        for (let i = 1; i < dataTable.rawTable.length; i++) {
            const country = dataTable.rawTable[i][0].toLowerCase();
            const expectedHeaders = dataTable.rawTable[i][1].toString().replace(/ /g, '');

            if (testingCountry === country) {
                //validate the headers displayed on the page
                selfServicePage.getTopHeaders().then((actualHeaders) => {
                    expect(actualHeaders.toLowerCase().replace(/\s+/g, '')).to.eq(expectedHeaders.toLowerCase());                     
                });
                break;  
            }
        }
    });
});

When('user enter {int} number in search box', (number) => {
    cy.getCountry().then((testingCountry) => {       
        if (testingCountry === 'us') { 
            //enter the number in search box
            selfServicePage.enterNumberInSearchBox(number);
        } else {
            cy.log('The test data is not available for ' + testingCountry.toUpperCase() + ' country');
        }
    });
});

Then('user should be able to see below number in search results', (dataTable) => {
    const expectedNumber = dataTable.raw().slice(1).map((row) => row[0]).toString();
    let isFound = 'no';
   
    cy.getCountry().then((testingCountry) => {       
        if (testingCountry === 'us') {
            //get all numbers from the search results
            selfServicePage.getNumbersList().then(($list) => {
                $list.each((index, $el) => {
                    let actualNumber = Cypress.$($el).text().trim();

                    //check expected number in the search results
                    if (expectedNumber === actualNumber) {
                        isFound = 'yes';
                    }
                });

                //validate whether the expected number is found or not in the search results
                if(isFound === 'yes'){
                    cy.log(expectedNumber + ' number is found in the search results');
                } else {
                    throw new Error(expectedNumber + ' number is not found in the search results');
                }
            });           
        } else {
            cy.log('The test data is not available for ' + testingCountry.toUpperCase() + ' country');
        }
    });
});

Then('user should be able to see search box', () => {
    //validate whether the search box is available or not
    selfServicePage.getSearchBox().should('exist').should('be.visible');
});

When('user click on the filter by', () => {
    //click on the filter by
    selfServicePage.clickFilterBy();
});

Then('the {string} filter should be displayed', (filterName) => {
    //validate whether the given filter is displayed or not
    selfServicePage.getFilter(filterName).should('be.visible');
});

Then('user should be able to see below message if the orders are not available', (dataTable) => {
    const expectedMessage = dataTable.rawTable[1].toString();
  
    cy.getTestingEnvironment().then((testingEnvironment) => {
        if (testingEnvironment.toLowerCase() === 'production') {
            //validate the no orders message should be displayed
            selfServicePage.getNoOrdersMessage().then((displayedMessage) => {
                expect(displayedMessage.toLowerCase()).to.eq(expectedMessage.toLowerCase());
            });
        } else {
            cy.getCountry().then((testingCountry) => {       
                if (testingCountry === 'us') {
                    //validate the orders list table should be displayed
                    selfServicePage.getOrdersList().should('be.visible');
                } else {
                    //validate the no orders message should be displayed
                    selfServicePage.getNoOrdersMessage().then((displayedMessage) => {
                        expect(displayedMessage.toLowerCase()).to.eq(expectedMessage.toLowerCase());
                    });
                }
            });
        }
    });
});

Then('user should be able to see apply filter and reset buttons on the filter box', () => {
    //validate whether the apply filter and reset buttons are displayed or not
    selfServicePage.getApplyFilterBtn().should('be.visible');
    selfServicePage.getResetBtn().should('be.visible');
});

Then('the sorting icon should be displayed on the following columns', (dataTable) => {
    cy.getCountry().then((testingCountry) => {       
        if (testingCountry === 'us') {                     
            dataTable.hashes().forEach((row) => {
                const columnName = row.column.toLowerCase();
        
                //validate the sorting icon should be displayed on the given column
                selfServicePage.getColumnSortingIcon(columnName).should('be.visible');
            });
        } else {
            cy.log('The test data is not available for ' + testingCountry.toUpperCase() + ' country');
        }
    });
});

When('user click on the status column', () => {
    cy.getCountry().then((testingCountry) => {       
        if (testingCountry === 'us') {                     
            //click on the status column
            selfServicePage.clickStatusColumn();
        } else {
            cy.log('The test data is not available for ' + testingCountry.toUpperCase() + ' country');
        }
    });
});

Then('the following options should be displayed for the status column', (dataTable) => {
    cy.getCountry().then((testingCountry) => {       
        if (testingCountry === 'us') {                     
            dataTable.hashes().forEach((row) => {
                const expectedOption = row.option;
        
                //validate the filter options of status column
                selfServicePage.getStatusOptions().then((actualOptions) => {
                    expect(actualOptions).to.include(expectedOption);
                });
            });
        } else {
            cy.log('The test data is not available for ' + testingCountry.toUpperCase() + ' country');
        }
    });
});

When('user click on account drop down', () => {
    cy.getCountry().then((testingCountry) => {       
        if (testingCountry === 'us') {                     
            //click on the account drop down
            selfServicePage.clickAccountDropdown();
        } else {
            cy.log('The test data is not available for ' + testingCountry.toUpperCase() + ' country');
        }
    });
});

When('user search {int} account number', (accountNumber) => {
    cy.getCountry().then((testingCountry) => {       
        if (testingCountry === 'us') {                    
            //enter account number for search
            selfServicePage.enterAccountNumberForSearch(accountNumber)        
        } else {
            cy.log('The test data is not available for ' + testingCountry.toUpperCase() + ' country');
        }
    });
});

Then('user should be able to see search account', () => {
    cy.getCountry().then((testingCountry) => {       
        if (testingCountry === 'us') {                      
            //validate the search account should be visible
            selfServicePage.getSearchAccountNumber().should('be.visible');
        } else {
            cy.log('The test data is not available for ' + testingCountry.toUpperCase() + ' country');
        }
    });
});

When('user select {string} account', (accountName) => {
    cy.getCountry().then((testingCountry) => {       
        if (testingCountry === 'us') {                     
            //click on the account name
            selfServicePage.clickAccountName(accountName);
        } else {
            cy.log('The test data is not available for ' + testingCountry.toUpperCase() + ' country');
        }
    });
});

When('user click on {string} button', (buttonName) => {
    cy.getCountry().then((testingCountry) => {       
        if (testingCountry === 'us') {                     
            //click on the apply filter or reset button
            if(buttonName.toLowerCase() === 'apply filter') {
                selfServicePage.clickApplyFilterBtn();
            } else if(buttonName.toLowerCase() === 'reset') {
                selfServicePage.clickResetBtn();
            } 
        } else {
            cy.log('The test data is not available for ' + testingCountry.toUpperCase() + ' country');
        }
    });
});

Then('user should be able to see filter applied for below account', (dataTable) => {
    const expectedAppliedAccountFilter = dataTable.rawTable[1].toString();

    cy.getCountry().then((testingCountry) => {       
        if (testingCountry === 'us') {                     
            //validate the applied account filter name
            selfServicePage.getAppliedAccountFilter().then((displayedAppliedAccountFilter) => {
                expect(displayedAppliedAccountFilter).to.eq(expectedAppliedAccountFilter);
            });
        } else {
            cy.log('The test data is not available for ' + testingCountry.toUpperCase() + ' country');
        }
    });
});

Then('user should be able to verify that all associated accounts are displayed', () => {  
    cy.getCountry().then((testingCountry) => {       
        if (testingCountry === 'us') {          
           //validate associated accounts should be displayed
           selfServicePage.getAllAssociateAccount().should('be.visible');
        } else {
            cy.log('The test data is not available for ' + testingCountry.toUpperCase() + ' country');
        }
    });
});

When('user collect default applied account filter', () => {  
    defaultAccountFilter = '';

    cy.getCountry().then((testingCountry) => {       
        if (testingCountry === 'us') { 
            //collect account name of default applied filter
            selfServicePage.getAppliedAccountFilter().then((displayedDefaultAccountName) => {
                defaultAccountFilter = displayedDefaultAccountName;
            });
        } else {
            cy.log('The test data is not available for ' + testingCountry.toUpperCase() + ' country');
        }
    });
});

Then('user should be able to see the default account filter as selected', () => {  
    cy.getCountry().then((testingCountry) => {       
        if (testingCountry === 'us') { 
            //validate the default account selected
            selfServicePage.getAppliedAccountFilter().then((displayedAppliedAccountFilter) => {
                expect(displayedAppliedAccountFilter).to.eq(defaultAccountFilter);
            });
        } else {
            cy.log('The test data is not available for ' + testingCountry.toUpperCase() + ' country');
        }
    });
});

Then('the following validation message should be displayed on the {string} page', (pageName, dataTable) => {
    const expectedValidationMsg = dataTable.rawTable[1].toString();

    cy.getCountry().then((testingCountry) => {       
        if (testingCountry === 'us') {                      
            //validate the validation message text
            selfServicePage.getValidationMessage().then((displayedValidationMsg) => {
                expect(displayedValidationMsg).to.equal(expectedValidationMsg);
            });
            
            //validate the page title
            selfServicePage.getPageTitle().should('have.text', pageName);
            cy.validateBaseURL();
        } else {
            cy.log('The test data is not available for ' + testingCountry.toUpperCase() + ' country');
        }
    });
});

When('user click on account dropdown', () => {
    cy.getCountry().then((testingCountry) => {       
        if (testingCountry === 'us') {                     
            //click on the account drop down
            selfServicePage.clickAccountDropdown();
            selfServicePage.clickAccountDropdown();
        } else {
            cy.log('The test data is not available for ' + testingCountry.toUpperCase() + ' country');
        }
    });
});

Then('the {string} account should be displayed as selected', (accountName) => {  
    cy.getCountry().then((testingCountry) => {       
        if (testingCountry === 'us') {          
            //validate the given account name should be displayed as selected
            selfServicePage.getSelectedAccountDropdownValue().then((selectedAccountName) => {
                expect(selectedAccountName.toLowerCase()).to.equal(accountName.toLowerCase());
            });
        } else {
            cy.log('The test data is not available for ' + testingCountry.toUpperCase() + ' country');
        }
    });
});

Then('user should be able to see below validation message on order page', (dataTable) => {
    const expectedMessage = dataTable.rawTable[1].toString();
  
    cy.getCountry().then((testingCountry) => {       
        if (testingCountry === 'us') {                      
            //validate the no orders message should be displayed
            selfServicePage.getNoOrdersMessage().then((displayedMessage) => {
                expect(displayedMessage.toLowerCase()).to.eq(expectedMessage.toLowerCase());
            });
            
            //validate the page title
            selfServicePage.getPageTitle().should('have.text', 'Orders');
            cy.validateBaseURL();
        } else {
            cy.log('The test data is not available for ' + testingCountry.toUpperCase() + ' country');
        }
    });
});

Then('user should be able to see the filter by option', () => {  
    //validate the filter by option should be displayed
    selfServicePage.getFilterBy().should('be.visible');
});

Then('the filter sidebar should be opened', () => {  
    //validate the filter label should be displayed on the filter sidebar
    selfServicePage.getFilterSidebarHeaderLabel().should('be.visible');
    //validate the close button should be displayed on the filter sidebar
    selfServicePage.getFilterSidebarCloseBtn().should('be.visible');
});

When('user click on the {string} status option', (statusOption) => {
    //click on the given status option
    selfServicePage.clickStatusOptions(statusOption);
});

When('user select {string} from the pagination dropdown', (paginationOption) => {
    //click on the given pagination option
    selfServicePage.selectPaginationDropdownOption(paginationOption);
});

Then('the orders with {string} status should be displayed and {string} status should not be displayed', (expectedStatus, notExpectedStatus) => {
    cy.getCountry().then((testingCountry) => {       
        if (testingCountry === 'us') {  
            //validate the displayed record status
            selfServicePage.getRecordsStatus().then((displayedStatus) => {
                expect(displayedStatus).include(expectedStatus).not.include(notExpectedStatus);
            });
        } else {
            cy.log('The test data is not available for ' + testingCountry.toUpperCase() + ' country');
        }
    });
});

Then('the {int} orders should be displayed on the list by default', (expectedNumberOfOrders) => {  
    cy.getCountry().then((testingCountry) => {       
        if (testingCountry === 'us') {          
            //validate the number of records/orders displayed on the list
            selfServicePage.getRecordsList().should('have.length', expectedNumberOfOrders);
        } else {
            cy.log('The test data is not available for ' + testingCountry.toUpperCase() + ' country');
        }
    });
});

Then('the filter in status column should be displayed', () => {
    cy.getCountry().then((testingCountry) => {       
        if (testingCountry === 'us') {                      
            //validate the status filter is displayed
            selfServicePage.filterStatusColumn().should('be.visible');
        } else {
            cy.log('The test data is not available for ' + testingCountry.toUpperCase() + ' country');
        }
    });
});