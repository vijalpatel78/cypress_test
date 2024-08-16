const { When, Then } = require ('@badeball/cypress-cucumber-preprocessor');

import { productDetails } from './productDescriptionPageSteps';
import RequestToOrderPage from '../pageObjects/requestToOrderPage';

const requestToOrderPage = new RequestToOrderPage();

let expectedNumberOfItems, requestOrderNumber, name, phoneNumber, emailID;

Then('user should be able to see {int} as the default pagination on the request to order page', (expectedPaginationOption) => {
    //validate the default selected option of pagination
    requestToOrderPage.getSelectedPaginationDropdownOption().then((actualSelectedPaginationOption) => {
        expect(actualSelectedPaginationOption).to.eq(expectedPaginationOption.toString());
    });
});

Then('the item count should be the same as the added request to order', () => {
    //load all items
    requestToOrderPage.selectPaginationDropdownOption("10");

    //validate the item count
    requestToOrderPage.getItemCount().then((actualItemCount) => {
        requestToOrderPage.getRequestToOrderList().then((requestToOrderList) => {
            const expectedItemCount = requestToOrderList.length;
            expect(Number(actualItemCount)).to.eq(expectedItemCount);
        });
    }); 
});

When('user update {int} quantity of product from the request page', (quantityNumber) => {
    //enter product quantity
    requestToOrderPage.enterProductQuantity(productDetails.productName.replace('"', ""), quantityNumber);

    //click on the update button
    requestToOrderPage.clickOnUpdateButton();
});

When('user click on the view link of below request order number', (dataTable) => {
    cy.getCountry().then((testingCountry) => {
        for (let i = 1; i < dataTable.rawTable.length; i++) {
            const country = dataTable.rawTable[i][0].toLowerCase();
            const number = dataTable.rawTable[i][1].toString();

            if (testingCountry === country) {
                //click on the view link of request order number
                requestToOrderPage.clickOnViewLink(number);
                break;
            }
        }
    });
});

Then('the subtotal of product should get updated as per {int} product quantity', (quantity) => {
    //validate that the displayed item subtotal should be the multiplication of item price and updated qty
    requestToOrderPage.getItemPrice(productDetails.productName.replace('"', "")).then((displayedItemPrice) => {
        requestToOrderPage.getSubTotal(productDetails.productName.replace('"', "")).then((displayedItemSubtotal) => {
            expect(parseFloat(displayedItemSubtotal).toFixed(2)).to.eq(parseFloat(displayedItemPrice * quantity).toFixed(2));
        });
    });
});

Then('user remove added product from request to order page with below message', (dataTable) => {
    const expectedMessage = dataTable.rawTable[1].toString();

    //click on remove link
    requestToOrderPage.clickOnRemoveLink(productDetails.productName.replace('"', ""));

    //validate remove item success message
    requestToOrderPage.getItemRemoveMessage().then((displayedMessage) => {
        expect(displayedMessage).to.eq(expectedMessage);
    });
});

Then('the following item details should be displayed on the request order page', (dataTable) => {
    const validLabel = ['Product Price', 'Product Qty', 'Product SKU'];
    
    dataTable.hashes().forEach((row) => {
        const label = row.label.toLowerCase();

        //validate the product details displayed on the request to order 
        switch (label) {
            case 'product price':
                requestToOrderPage.getProductPrice(productDetails.productName.replace('"', "")).then((displayedProductPrice) => {
                    expect(displayedProductPrice).to.be.equal(productDetails.productPrice);
                });
                break;
            case 'product qty':
                requestToOrderPage.getProductQty(productDetails.productName.replace('"', "")).should('exist');
                break;
            case 'product sku':
                requestToOrderPage.getSkuCode(productDetails.productName.replace('"', "")).then((displayedProductSku) => {
                    expect(displayedProductSku).to.be.equal(productDetails.productSKU.toLowerCase());
                });
                break;
            default:
                throw new Error(`The provided '${label}' label is not valid. Valid options are ${validLabel.join(', ')}.`);
        }
    });
});

Then('user should be able to see below request to order details', (dataTable) => {
    let requestToOrderNumber;
    
    cy.getCountry().then((testingCountry) => {
        for (let i = 1; i < dataTable.rawTable.length; i++) {
            const country = dataTable.rawTable[i][0].toLowerCase();
            const label = dataTable.rawTable[i][1].toLowerCase();
            const expectedValue = dataTable.rawTable[i][2];

            //validate request to order details
            if (testingCountry === country) {
                switch (label) {
                    case 'request to order':
                        requestToOrderNumber = expectedValue;
                        cy.validateDisplayedText(requestToOrderPage.getRequestOrderNo(requestToOrderNumber), expectedValue);
                        break;
                    case 'name':
                        cy.validateDisplayedText(requestToOrderPage.getRequestName(requestToOrderNumber), expectedValue);
                        break;
                    case 'email address':
                        cy.validateDisplayedText(requestToOrderPage.getRequestEmail(requestToOrderNumber), expectedValue);
                        break;
                    case 'created':
                        cy.validateDisplayedText(requestToOrderPage.getRequestCreatedAt(requestToOrderNumber), expectedValue);
                        break;
                    case 'no of items':
                        cy.validateDisplayedText(requestToOrderPage.getRequestItemCount(requestToOrderNumber), expectedValue);
                        break;
                    case 'status':
                        cy.validateDisplayedText(requestToOrderPage.getRequestStatus(requestToOrderNumber), expectedValue);
                        break;
                    case 'link':
                        cy.validateDisplayedText(requestToOrderPage.getRequestViewLink(requestToOrderNumber), expectedValue);
                        requestToOrderPage.clickOnViewLink(requestToOrderNumber);
                        break;
                    default:
                        throw new Error(`The provided '${label}' label is not valid.`);
                }
            }
        }
    });
});

When('user collect no of items details from request to order list page for below order number', (dataTable) => {
    cy.getCountry().then((testingCountry) => {
        for (let i = 1; i < dataTable.rawTable.length; i++) {
            const country = dataTable.rawTable[i][0].toLowerCase();
            const number = dataTable.rawTable[i][1].toString();

            if (testingCountry === country) {
                //collect item no details
                requestToOrderPage.getRequestItemCount(number).then((displayedItemCount) => {
                    expectedNumberOfItems = displayedItemCount.text().trim();
                });

            }
        }
    });
});

Then('the number of added items on the request to order details page should be the same as the item count', () => {
    //validate the number of added products with item count
    requestToOrderPage.getAddedProductsList().then((productsList) => {
        const actualNumberOfItems = productsList.length;
        expect(Number(actualNumberOfItems)).to.eq(Number(expectedNumberOfItems));
    });
});

When('user click on view link of below order number', (dataTable) => {
    cy.getCountry().then((testingCountry) => {
        for (let i = 1; i < dataTable.rawTable.length; i++) {
            const country = dataTable.rawTable[i][0].toLowerCase();
            const number = dataTable.rawTable[i][1].toString();

            if (testingCountry === country) {
                //click on the view link
                requestToOrderPage.clickOnViewLink(number);
            }
        }
    });
});

Then('the product ship by date of request to order page should be the same as displayed on the product description page', () => { 
    //validate that the displayed product ship by date should be the same as on the PDP
    requestToOrderPage.getProductShipByDate(productDetails.productName.replace('"', "")).then((displayedShipByDate) => {
        expect(displayedShipByDate).to.equal(productDetails.shipByDate);
    });
});

When('user click on view all request to order link', () => {
    // click on view all request to order link
    requestToOrderPage.clickViewAllRequestOrderLink();
});


When('user click view request of {string} status', (statusName) => {
    // click on view request of open or submitted status
    if (statusName.toLowerCase() === 'open') {
        requestToOrderPage.clickViewRequestOfOpenStatus();
    } else if (statusName.toLowerCase() === 'submitted') {      
        requestToOrderPage.clickViewRequestOfSubmittedStatus();
    } 
    else {
        throw new Error(`The provided '${statusName}' status column name is not valid.`);
    }
});

When('user click on {string} link of request to order', (linkName) => {
    // click on view all request or back button link 
    if (linkName.toLowerCase() === 'view all request to orders') {
        requestToOrderPage.clickBackButtonOrViewAllRequestOrder();
    } else if (linkName.toLowerCase() === 'back button') {      
        requestToOrderPage.clickBackButtonOrViewAllRequestOrder();
    } 
    else {
        throw new Error(`The provided '${linkName}' link name is not valid.`);
    }
});

Then('user should be able to see below quantity validation message', (dataTable) => {
    const expectedMessage = dataTable.rawTable[1].toString();

    //validate quantity validation message
    requestToOrderPage.getQuantityValidationMessage().then((displayedMessage) => {
        expect(displayedMessage).to.eq(expectedMessage);
    });
});

Then('user should be able to see {int} as default pagination on request to order', (expectedPaginationOption) => { 
    //validate the default selected option of pagination
    requestToOrderPage.getSelectedPaginationDropdownOption().then((actualSelectedPaginationOption) => {
        expect(actualSelectedPaginationOption).to.eq(expectedPaginationOption.toString());  
    });     
});

Then('user should be able to see below available pagination options request to order', (dataTable) => {
    const expectedDropdownOptions = dataTable.raw().slice(1).map((row) => row[0]).toString();

    //validate available dropdown options
    requestToOrderPage.getPaginationDropdownOptions().then((actualDropdownOptions) => {
        expect(actualDropdownOptions).to.eq(expectedDropdownOptions);  
	});
});


When('user enter following mandatory details to submit request to order', (dataTable) => {
    const expectedPhoneNumber = dataTable.raw().slice(1).map((row) => row[1]).toString();
           
    //enter the mandatory details to submit request to order                             
    phoneNumber = expectedPhoneNumber;
    requestToOrderPage.enterPhoneNumber(expectedPhoneNumber);
});

When('user collect details of your name with email field', () => {
    // collect your name and stored into variable
    requestToOrderPage.collectYourName().then((displayedName) => {
        name = displayedName;                  
    });

    // collect email and stored into variable
    requestToOrderPage.collectEmail().then((displayedEmail) => {
        emailID = displayedEmail;
        cy.log(emailID);
    });
});

When('user click on submit button to submit request to order', () => {
    //click on the submit button
    requestToOrderPage.clickOnSubmitButton();
});

Then('user should be able to see below success message on request to order', (dataTable) => {
    const expectedMessage = dataTable.rawTable[1].toString();

    //validate request to order success message
    requestToOrderPage.getRequestSuccessMessage().then((displayedMessage) => {
        expect(displayedMessage).to.eq(expectedMessage);
    });
});

When('user collect request order number of open status', () => {
    requestOrderNumber = '';

    //collect the request order number
    requestToOrderPage.getRequestOrderNumber().then((displayedOrderNumber) => {
        requestOrderNumber = displayedOrderNumber;
    });
});


Then('user should be able see request order number also created date on request to order', () => {
    // validate created date is visible
    requestToOrderPage.getCreatedDate().should('be.visible');
    

     // validate request order number
    requestToOrderPage.getRequestOrderNumberOfSubmitRequest().then((displayedMessage) => {
        expect(displayedMessage).to.eq(requestOrderNumber);
    });
});


When('user should be able to see following details after submit request to order', (dataTable) => {
    const validFields = ['Email', 'Your Name', 'Phone Number'];

    cy.getCountry().then((testingCountry) => {        
        //validate request to order submitted details
        for (let i = 1; i < dataTable.rawTable.length; i++) {
            const country = dataTable.rawTable[i][0].toLowerCase();
            const field = dataTable.rawTable[i][1].toLowerCase();
            const value = dataTable.rawTable[i][2];

            if (testingCountry === country) {
                switch (field) {
                    case 'your name':                       
                        requestToOrderPage.getYourName().then((displayedName) => {
                            expect(displayedName).to.eq(name);
                        });
                        break;
                    case 'phone number':
                        requestToOrderPage.getPhoneNumber().then((displayedPhoneNumber) => {
                            expect(displayedPhoneNumber).to.eq(phoneNumber);
                        });
                        break;
                    case 'email':
                        requestToOrderPage.getEmail().then((displayedEmail) => {
                            expect(displayedEmail).to.eq(emailID);
                        });
                        break;
                    default:
                        throw new Error(`The provided '${field}' field is not valid. Valid options are ${validFields.join(', ')}.`);
                }
            }
        }
    });
});

When('keep all required fields empty to submit the request to order detail', () => { 
    // keep your name, phone number, email fields empty
    requestToOrderPage.yourName();
    requestToOrderPage.phoneNumber();
    requestToOrderPage.email();
});

When('user click on submit button to submit the request to order detail', () => { 
    // click on submit button
    requestToOrderPage.clickOnSubmitButton();
});

Then('user should be able to see your name validation message', (dataTable) => {
    const expectedMessage = dataTable.rawTable[1].toString().toLowerCase(); 

    //validate your name message
    requestToOrderPage.getYourNameValidationMessage().then((displayedMessage) => {
        expect(displayedMessage).to.equal(expectedMessage);
    });
});

Then('user should be able to see phone number validation message', (dataTable) => {
    const expectedMessage = dataTable.rawTable[1].toString().toLowerCase(); 

    //validate the phone number message
    requestToOrderPage.getPhoneNumberValidationMessage().then((displayedMessage) => {
        expect(displayedMessage).to.equal(expectedMessage);
    });
});

Then('user should be able to see email validation message', (dataTable) => {
    const expectedMessage = dataTable.rawTable[1].toString().toLowerCase(); 

    //validate the email validation message
    requestToOrderPage.getEmailValidationMessage().then((displayedMessage) => {
        expect(displayedMessage).to.equal(expectedMessage);
    });
});
