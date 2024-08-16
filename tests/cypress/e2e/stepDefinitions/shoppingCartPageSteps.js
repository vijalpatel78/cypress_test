const { When, Then } = require ('@badeball/cypress-cucumber-preprocessor');

import ShoppingCartPage from '../pageObjects/shoppingCartPage';
import HeaderPage from '../pageObjects/headerPage';
import { productDetails, bulbDetails } from './productDescriptionPageSteps';
import ProductDescriptionPage from '../pageObjects/productDescriptionPage';

const shoppingCart = new ShoppingCartPage();
const header = new HeaderPage();
const productDescription = new ProductDescriptionPage();

let orderDetails;

When('user click on the mini cart icon', () => {
    //click on the mini cart
    header.clickMiniCartIcon();
});

Then('the shopping cart page should get opened which should contain the following url', (dataTable) => {
    const expectedCartUrl = dataTable.rawTable[1].toString(); 

    //validate the shopping cart url
    shoppingCart.getShoppingCartPageUrl().then((currentUrl) => {
        expect(currentUrl.endsWith(expectedCartUrl.toLowerCase()), 'Navigate to url - ' + currentUrl).to.be.true;
        cy.validateBaseURL();
    }); 
});

When('user navigate to shopping cart page', () => {
    //validate the shopping cart page title
    shoppingCart.validateShoppingCartPageTitle();
    cy.validateBaseURL();
});

Then('user should be able to see below message for clear cart', (dataTable) => {
    const expectedMessage = dataTable.rawTable[1].toString(); 

    //validate the clear cart success message
    shoppingCart.getCartEmptyMessage().then((actualMessage) => {
        expect(actualMessage.text().toLowerCase()).to.contain(expectedMessage.toLowerCase());  
    }); 
});

When('user click on the clear cart button from the shopping cart page', () => {
    //click on the clear cart button       
    shoppingCart.clickOnClearCartButton();  
});

When('user click on the {string} button from the clear shopping cart pop up', (buttonName) => {
    //click on the ok, cancel or x icon button 
    if (buttonName.toLowerCase() === 'ok') {
        shoppingCart.clickOnClearCartPopupOkButton();   
    } else if (buttonName.toLowerCase() === 'cancel') {
        shoppingCart.clickOnClearCartPopupCancelButton();
    } else if (buttonName.toLowerCase() === 'x icon') {
        shoppingCart.clickOnClearCartPopupXIconButton();
    } else {
        throw new Error(`The provided '${buttonName}' button name is not valid. Valid name is Ok, Cancel or X Icon.`);
    }
});

When('user click on the {string} link of product', (linkName) => {
    //click on the remove/edit/move to project/add to quote link
    if (linkName.toLowerCase() === 'remove') {
        shoppingCart.clickRemoveLinkOfItem(productDetails.productName);
    } else if (linkName.toLowerCase() === 'edit') {
        shoppingCart.clickEditLinkOfItem(productDetails.productName);
    } else if (linkName.toLowerCase() === 'move to project') {
        shoppingCart.clickMoveToProjectLinkOfItem();
    } else if (linkName.toLowerCase() === 'add to quote') {
        shoppingCart.clickAddToQuoteLinkOfItem(productDetails.productName);
    } else {
        throw new Error(`The provided '${linkName}' link name is not valid. Valid name is Remove, Edit, Add to Quote or Move to Project.`);
    }
});

Then('the product should not be displayed on the shopping cart page', () => {
    cy.getCountry().then((testingCountry) => {    
        if (testingCountry === 'us') { 
            //validate the removed product name should not be displayed
            shoppingCart.getItemNameList().then((displayedItemNameList) => {
                expect(displayedItemNameList).not.to.be.include(productDetails.productName);
            });
        } else {
            //validate the clear cart success message
            shoppingCart.getCartEmptyMessage().should('be.visible');
        }
    });
});

When('user click on the product image from the shopping cart page', () => {
    // click on product image     
    shoppingCart.clickOnItemImage(productDetails.productName);   
});

Then('user should be redirected to the product description page which has the following page title', (dataTable) => {
    cy.getCountry().then((testingCountry) => {
        for (let i = 1; i < dataTable.rawTable.length; i++) {
            const country = dataTable.rawTable[i][0].toLowerCase();
            const expectedPageTitle = dataTable.rawTable[i][1];

            if (testingCountry === country) {
                // validate whether the user redirect to product description page or not
                productDescription.getPDPTitle().then((currentPageTitle) => {
                    expect(currentPageTitle.replace('|', '')).to.be.equal(expectedPageTitle);
                    cy.validateBaseURL();
                });
            }
        }
    });
});

When('user click on the update cart button', () => {
    //click on the update cart button from the pdp 
    productDescription.clickUpdateCart();   
});

Then('user should be able to see the below success message on shopping cart page', (dataTable) => {
    cy.getCountry().then((testingCountry) => {
        for (let i = 1; i < dataTable.rawTable.length; i++) { 
            const country = dataTable.rawTable[i][0].toLowerCase();
            const successMessage = dataTable.rawTable[i][1].toString(); 

            if (testingCountry === country) {
                //validate the displayed success message
                shoppingCart.getSuccessMessage().then((displayedMessage) => {
                    expect(displayedMessage.toLowerCase()).to.equal(successMessage.toLowerCase());  
                }); 
            }
        }
    });
});

When('user click on the product name from the shopping cart page', () => {
    // click on product name     
    shoppingCart.clickOnItemName(productDetails.productName);   
});

When('user update {int} quantity of product', (qty) => {
    //enter the product qty  
    shoppingCart.enterItemQty(productDetails.productName, qty);   
});

Then('the subtotal of product should get updated as per the entered {int} product quantity', (qty) => { 
    //validate that the displayed item subtotal should be the multiplication of item price and updated qty
    shoppingCart.getItemSubtotalAsNumber(productDetails.productName).then((displayedItemSubtotal) => {

        cy.getCountry().then((testingCountry) => {    
            if (testingCountry === 'us') {
                cy.convertPriceToNumber(productDetails.productPrice, '$').then((itemPrice) => {
                    expect(parseFloat(displayedItemSubtotal).toFixed(2)).to.be.equal(parseFloat(itemPrice * qty).toFixed(2));
                });
            } else if (testingCountry === 'uk') {
                cy.convertPriceToNumber(productDetails.productPrice, '£').then((itemPrice) => {
                    cy.log('Skipping this validation because of the reported BUG 10694');
                    //expect(parseFloat(displayedItemSubtotal).toFixed(2)).to.be.equal(parseFloat(itemPrice * qty).toFixed(2));
                });
            } else if (testingCountry === 'eu') {
                cy.convertPriceToNumber(productDetails.productPrice, '€').then((itemPrice) => {
                    cy.log('Skipping this validation because of the reported BUG 10694');
                    //expect(parseFloat(displayedItemSubtotal).toFixed(2)).to.be.equal(parseFloat(itemPrice * qty).toFixed(2));
                });
            }
        });
    });
});

Then('the order subtotal displayed in the order summary should be a sum of all products subtotal', () => { 
    //validate that the displayed order subtotal should be a sum of all products subtotal
    shoppingCart.getSumOfAllItemSubtotal().then((allItemSubtotal) => {
        shoppingCart.getOrderSubtotalAsNumber().then((displayedOrderedSubtotal) => {
            cy.getCountry().then((testingCountry) => {
                if (testingCountry === 'us') {
                    expect(parseFloat(displayedOrderedSubtotal).toFixed(2)).to.be.equal(parseFloat(allItemSubtotal).toFixed(2));
                } else {
                    shoppingCart.getVATChargeAsNumber().then((displayedVATCharge) => {
                        expect(parseFloat(displayedOrderedSubtotal).toFixed(2)).to.be.equal(parseFloat(allItemSubtotal - displayedVATCharge).toFixed(2));
                    });
                }
            });
        });
    });
});

Then('the merchandise total displayed in the order summary should be a sum of order subtotal, shipping charges and tax', () => { 
    //validate that the displayed merchandise total should be a sum of order subtotal, shipping charges and tax
    shoppingCart.getOrderSubtotalAsNumber().then((displayedOrderedSubtotal) => {
        shoppingCart.getOrderTaxAsNumber().then((displayedOrderedTax) => {
            shoppingCart.getMerchandiseTotalAsNumber().then((displayedMerchandiseTotal) => {
                shoppingCart.getShippingChargeAsNumber().then((displayedShippingCharge) => {
                    expect(parseFloat(displayedMerchandiseTotal).toFixed(2)).to.be.equal(parseFloat(displayedOrderedSubtotal + displayedOrderedTax + displayedShippingCharge).toFixed(2));
                });
            });
        });
    });
});

When('user click on the add item button from the requisition list popup', () => {
    //click on add item button
    shoppingCart.clickAddItemButtonOfRequisitionListPopup();   
});

When('user select {string} from add to quote popover', (quoteName) => {
    // select quote 
    shoppingCart.selectQuoteFromAddToQuote(quoteName);
});

Then('the subtotal of product should be the multiplication of product price and qty', () => { 
    //validate that the displayed product subtotal should be the multiplication of price and qty
    shoppingCart.getItemSubtotalAsNumber(productDetails.productName).then((displayedProductSubtotal) => {

        cy.getCountry().then((testingCountry) => {    
            if (testingCountry === 'us') {
                cy.convertPriceToNumber(productDetails.productPrice, '$').then((itemPrice) => {
                    expect(parseFloat(displayedProductSubtotal).toFixed(2)).to.be.equal(parseFloat(itemPrice * productDetails.productQty).toFixed(2));
                });
            } else if (testingCountry === 'uk') {
                cy.convertPriceToNumber(productDetails.productPrice, '£').then((itemPrice) => {
                    expect(parseFloat(displayedProductSubtotal).toFixed(2)).to.be.equal(parseFloat(itemPrice * productDetails.productQty).toFixed(2));
                });
            } else if (testingCountry === 'eu') {
                cy.convertPriceToNumber(productDetails.productPrice, '€').then((itemPrice) => {
                    expect(parseFloat(displayedProductSubtotal).toFixed(2)).to.be.equal(parseFloat(itemPrice * productDetails.productQty).toFixed(2));
                });
            }
        });
    });
});

Then('the subtotal of bulb should be the multiplication of bulb price and qty', () => { 
    //validate that the displayed bulb subtotal should be the multiplication of price and qty
    cy.getCountry().then((testingCountry) => {    
        if (testingCountry === 'us') {
            shoppingCart.getItemSubtotalAsNumber(bulbDetails.bulbName).then((displayedBulbSubtotal) => {
                cy.bulbPricePerUnit(bulbDetails.bulbPrice, bulbDetails.bulbQty).then((bulbPricePerUnit) => {
                    expect(parseFloat(displayedBulbSubtotal).toFixed(2)).to.be.equal(parseFloat(bulbPricePerUnit * bulbDetails.bulbQty).toFixed(2));
                });
            });
        } else {
            cy.log('Bulb option is not available for the ' + testingCountry.toUpperCase());
        }
    });
});

Then('the product ship by date of cart page should be the same as displayed on the product description page', () => { 
    //validate that the displayed product ship by date should be the same as on the PDP
    shoppingCart.getItemShipByDate(productDetails.productName).then((displayedShipByDate) => {
        expect(displayedShipByDate).to.equal(productDetails.shipByDate);
    });
});

When('user click on the begin checkout button from the shopping cart page', () => { 
    //click on the begin checkout button
    shoppingCart.clickBeginCheckoutButton();   
});

When('keep quantity field blank on shopping cart page', () => {
    //clear product qty  
    shoppingCart.clearQuantityField();
});

When('user click on view shopping cart link', () => {
    //enter the product qty  
    cy.getCountry().then((testingCountry) => {
        if (testingCountry === 'us') {
            //click on view shopping cart link
            shoppingCart.clickViewShoppingCart();
        } else {
            cy.log('View shopping cart link is not available for the ' + testingCountry);
        }
    });
});

When('user should see below validation message on shopping cart page', (dataTable) => {
    const expectedMessage = dataTable.rawTable[1].toString().toLowerCase();

    //validate quantity validation message
    shoppingCart.getQtyValidationMessage().then((displayedMessage) => {
        expect(displayedMessage.toLowerCase()).to.eq(expectedMessage);
    });  
    
});

When('user collect the following details from the shopping cart page', (dataTable) => {
    const validLabel = ['Cart Subtotal', 'Shipping Charges', 'Tax/Vat', 'Merchandise Total', 'Vat'];
    orderDetails = {};

    dataTable.hashes().forEach((row) => {
        const label = row.label.toLowerCase();

        //collect the details displayed on the shopping cart page
        switch (label) {
            case 'cart subtotal':
                shoppingCart.getOrderSubtotalAmt().then((displayedOrderSubtotal) => {
                    orderDetails.cartSubtotal = displayedOrderSubtotal;
                });
                break;
            case 'shipping charges':
                shoppingCart.getShippingCharge().then((displayedShippingCharge) => {
                    orderDetails.shippingCharge = displayedShippingCharge;
                });
                break;
            case 'tax/vat':
                shoppingCart.getOrderTax().then((displayedOrderTax) => {
                    orderDetails.orderTax = displayedOrderTax;
                });
                break;
            case 'merchandise total':
                shoppingCart.getMerchandiseTotal().then((displayedMerchandiseTotal) => {
                    orderDetails.merchandiseTotal = displayedMerchandiseTotal;
                });
                break;
            case 'vat':
                cy.getCountry().then((testingCountry) => {    
                    if (testingCountry !== 'us') {
                        shoppingCart.getOrderTax().then((displayedOrderTax) => {
                            orderDetails.orderTax = displayedOrderTax;
                        });
                    }
                });
                break;
            default:
                throw new Error(`The provided '${label}' label is not valid. Valid options are ${validLabel.join(', ')}.`);
        }
    });
}); export { orderDetails }

Then('the attention popup should be displayed with the below message and the ok button & x-icon should be displayed', (dataTable) => {
    dataTable.hashes().forEach((row) => {
        const expectedMessage = row.message;

        //validate the attention popup title text
        shoppingCart.getAttentionPopupTitle().should('equal', 'Attention');
        //validate the X icon of attention popup should be displayed
        shoppingCart.getAttentionPopupCancelBtn().should('be.visible');
        //validate the attention popup message text  
        shoppingCart.getAttentionPopupMsg().should('equal', expectedMessage);
        //validate the OK button of attention popup should be displayed
        shoppingCart.getAttentionPopupOkBtn().should('be.visible');
    });
});

When('user click on the ok button of attention popup', () => { 
    //click on the OK button
    shoppingCart.clickAttentionPopupOkBtn();   
});

Then('the attention popup should get closed', () => { 
    //validate the attention popup should not be displayed
    shoppingCart.getAttentionPopup().should('not.exist');   
});

When('user update {int} qty of product', (qty) => {
    //enter the product qty  
    shoppingCart.enterItemQuantity(productDetails.productName, qty);   
});

Then('the {int} quantity of product should be displayed', (expectedQty) => { 
    cy.waitForOrderSummaryLoad();

    //validate the displayed product qty
    shoppingCart.getItemQty(productDetails.productName).then((displayedQty) => {
        expect(parseInt(displayedQty)).to.equal(expectedQty)
    });
});

When('user click on add sidemark of product', () => {
    // click on add sidemark/comments of product
    shoppingCart.clickAddSideMarkOfProduct();
});

When('user enter {string} text into sidemark section of product', (text) => {
    // enter text into sideMark section of product
    shoppingCart.enterTextSideMarkSectionOfProduct(text);
});

When('user enter {string} text into comment section of product', (comment) => {
    // enter text into comments section of product
    shoppingCart.enterTextCommentSectionOfProduct(comment);
});

When('user click on add sidemark of bulb', () => {
    cy.getCountry().then((testingCountry) => {
        if (testingCountry === 'us') {
            // click on add sidemark/comments of bulb
            shoppingCart.clickAddSideMarkOfBulb();
        } else {
            cy.log('View shopping cart link is not available for the ' + testingCountry);
        }
    });
});

Then('user should see sidemark section along with comment section of product', () => {
    // validate sidemark and comment section of product is visible
    shoppingCart.sideMarkSectionOfProductTextBox().should('be.visible');
    shoppingCart.commentSectionOfProductTextBox().should('be.visible');
});

Then('user should not able see sidemark section along with comment section of product', () => {
    // validate sidemark and comment section of product is not visible
    shoppingCart.sideMarkSectionOfProductTextBox().should('not.be.visible');
    shoppingCart.commentSectionOfProductTextBox().should('not.be.visible');
});

Then('user should see sidemark section along with comment section of bulb', () => {
    cy.getCountry().then((testingCountry) => {
        if (testingCountry === 'us') {
            // validate sidemark and comment section of bulb is visible
            shoppingCart.sideMarkSectionOfBulbTextBox().should('be.visible');
            shoppingCart.commentSectionOfBulbTextBox().should('be.visible');
        } else {
            cy.log('View shopping cart link is not available for the ' + testingCountry);
        }
    });
});

Then('user should not able see sidemark section along with comment section of bulb', () => {
    cy.getCountry().then((testingCountry) => {
        if (testingCountry === 'us') {
            // validate sidemark and comment section of bulb is not visible
            shoppingCart.sideMarkSectionOfBulbTextBox().should('not.be.visible');
            shoppingCart.commentSectionOfBulbTextBox().should('not.be.visible');
        } else {
            cy.log('View shopping cart link is not available for the ' + testingCountry);
        }
    });
});

When('user click on collapse link of add sidemark of bulb', () => {
    cy.getCountry().then((testingCountry) => {
        if (testingCountry === 'us') {
            // click to collapse add sidemark/comments of bulb
            shoppingCart.clickToCollapseBulbSideMark();
        } else {
            cy.log('View shopping cart link is not available for the ' + testingCountry);
        }
    });
});

When('user should be able to see below validation message on shopping cart', (dataTable) => {
    const expectedMessage = dataTable.rawTable[1].toString().toLowerCase();

    //validate no item added validation message
    shoppingCart.getNoItemValidationMessage().then((displayedMessage) => {
        expect(displayedMessage.toLowerCase()).to.eq(expectedMessage);
    });  
});
    
When('user click on collapse link add sidemark of product', () => {
    // click on collapse link add sidemark of product
    shoppingCart.clickToCollapseSideMarkOfProduct();
});

Then('user should be able to see the {string} section as collapsed', (sectionName) => {
    // validate the 'Estimate Shipping & Tax' section should be displayed
    shoppingCart.getEstimateShippingAndTaxSectionTitle().then((displayedSectionName) => {
        expect(displayedSectionName).to.equal(sectionName);
    });

    // validate the 'Estimate Shipping & Tax' section should be collapsed
    shoppingCart.getEstimateShippingAndTaxSection().then((section) => {
        cy.wrap(section).invoke('attr','style').should('contain', 'display: none;');
    });
});

When('user click on the Estimate Shipping & Tax section', () => {
    // click on Estimate Shipping & Tax section
    shoppingCart.clickEstimateShippingAndTaxSection();
});

Then('the Estimate Shipping & Tax section should be expanded', () => {
    // validate the 'Estimate Shipping & Tax' section should be expanded
    shoppingCart.getEstimateShippingAndTaxSection().then((section) => {
        cy.wrap(section).invoke('attr','style').should('contain', 'display: block;');
    });
});

Then('user should be able to see the following options on the Estimate Shipping & Tax section', (dataTable) => {
    dataTable.hashes().forEach((row) => {
        const expectedOption = row.options;

        // validate the given option should be displayed on the Estimate Shipping & Tax section
        switch (expectedOption.toLowerCase()) {
            case 'country':
                shoppingCart.getCountryLabelOnEstimateShippingAndTaxSection().should('be.visible').should('have.text', expectedOption);
                shoppingCart.getCountryFieldOnEstimateShippingAndTaxSection().should('be.visible');
                break;
            case 'state/province':
                shoppingCart.getStateLabelOnEstimateShippingAndTaxSection().should('be.visible').should('have.text', expectedOption);
                shoppingCart.getStateFieldOnEstimateShippingAndTaxSection().should('be.visible');
                break;
            case 'zip/postal code':
                shoppingCart.getZipCodeLabelOnEstimateShippingAndTaxSection().should('be.visible').should('have.text', expectedOption);
                shoppingCart.getZipCodeFieldOnEstimateShippingAndTaxSection().should('be.visible');
                break;
            default:
                throw new Error(`The provided '${expectedOption}' option is not valid.`);
        }
    });
});

When('user enter invalid {int} zip code', (zipCode) => {
    // enter invalid zip code
    shoppingCart.enterZipOrPostalCode(zipCode);
});

Then('user should be able to see below zip code validation message', (dataTable) => {
    const expectedMessage = dataTable.rawTable[1].toString().toLowerCase();

    //validate zip code validation message
    shoppingCart.getZipCodeValidationMessage().then((displayedMessage) => {
        expect(displayedMessage.toLowerCase()).to.include(expectedMessage);
    });  
});

When('user update {int} quantity of product on shopping cart', (qty) => {
    cy.getCountry().then((testingCountry) => {
        if (testingCountry === 'us') {
            // update/enter quantity of product
            shoppingCart.enterItemQuantity(productDetails.productName, qty);
        } else {
            // update/enter quantity of product
            shoppingCart.enterProductQuantity(qty);
        }
    });
});

Then('user should be able to see below quantity validation message on shopping cart', (dataTable) => {
    const expectedMessage = dataTable.rawTable[1].toString().toLowerCase();

    //validate invalid quantity validation message
    shoppingCart.getQuantityValidationMessage().then((displayedMessage) => {
        expect(displayedMessage.toLowerCase()).to.include(expectedMessage);
    });  
});


When('user select below country from dropdown', (dataTable) => {
    cy.getCountry().then((testingCountry) => {
        for (let i = 1; i < dataTable.rawTable.length; i++) {
            const country = dataTable.rawTable[i][0].toLowerCase();
            const countryName = dataTable.rawTable[i][1].toString();

            if (testingCountry === country) {
                // select country from dropdown
                shoppingCart.selectCountryFromDropdown(countryName);
            }
        }
    });
});

When('user select below state from dropdown', (dataTable) => {
    cy.getCountry().then((testingCountry) => {
        for (let i = 1; i < dataTable.rawTable.length; i++) {
            const country = dataTable.rawTable[i][0].toLowerCase();
            const stateName = dataTable.rawTable[i][1].toString();

            if (testingCountry === country) {
                // select state from dropdown
                shoppingCart.selectStateFromDropdown(stateName);
            }
        }
    });
});

When('user enter below zip code', (dataTable) => { 
    cy.getCountry().then((testingCountry) => {
        for (let i = 1; i < dataTable.rawTable.length; i++) {
            const country = dataTable.rawTable[i][0].toLowerCase();
            const zipCode = dataTable.rawTable[i][1].toString();

            if (testingCountry === country) {
                // enter zip code
                shoppingCart.enterZipOrPostalCode(zipCode);
            }
        }
    });
});

Then('user should be able to see the selected country on the Estimate Shipping & Tax section', (dataTable) => { 
    cy.getCountry().then((testingCountry) => {
        for (let i = 1; i < dataTable.rawTable.length; i++) {
            const country = dataTable.rawTable[i][0].toLowerCase();
            const expectedCountry = dataTable.rawTable[i][1].toString();

            if (testingCountry === country) {
                // validate selected country option
                shoppingCart.getSelectedCountryDropdownOption().then((displayedCountry) => {
                    expect(displayedCountry).to.equal(expectedCountry);
                });
            }
        }
    });
});

Then('user should be able to see the selected state on the Estimate Shipping & Tax section', (dataTable) => { 
    cy.getCountry().then((testingCountry) => {
        for (let i = 1; i < dataTable.rawTable.length; i++) {
            const country = dataTable.rawTable[i][0].toLowerCase();
            const expectedState = dataTable.rawTable[i][1].toString();

            if (testingCountry === country) {
                // validate selected state option
                shoppingCart.getSelectedStateDropdownOption().then((displayedState) => {
                    expect(displayedState).to.equal(expectedState);
                });
            }
        }
    });
});

Then('user should be able to see the selected zip on the Estimate Shipping & Tax section', (dataTable) => { 
    cy.getCountry().then((testingCountry) => {
        for (let i = 1; i < dataTable.rawTable.length; i++) {
            const country = dataTable.rawTable[i][0].toLowerCase();
            const expectedZipCode = dataTable.rawTable[i][1].toString();

            if (testingCountry === country) {
                // validate zip code
                shoppingCart.getSelectedZipCode().then((displayedZip) => {
                    expect(displayedZip).to.equal(expectedZipCode);
                });
            }
        }
    });
});

When('user click on {string} shipping method on shopping cart', (shippingMethod) => {  
    cy.getCountry().then((testingCountry) => {    
        if (testingCountry === 'us') {
            // click on shipping method
            shoppingCart.clickOnShippingMethod(shippingMethod);
        } else {
            cy.log('The shipping method is not available for ' + testingCountry.toUpperCase());
        }
    });
});

Then('the merchandise total displayed in the order summary should be a sum of order subtotal, shipping charges and tax on shopping cart', () => {  
    cy.getCountry().then((testingCountry) => {    
        if (testingCountry === 'us') {
           //validate that the displayed merchandise total should be a sum of order subtotal, shipping charges and tax
            shoppingCart.getOrderSubtotalAsNumber().then((displayedOrderedSubtotal) => {
                shoppingCart.getOrderTaxAsNumber().then((displayedOrderedTax) => {
                    shoppingCart.getMerchandiseTotalAsNumber().then((displayedMerchandiseTotal) => {
                        shoppingCart.getShippingChargeAsNumber().then((displayedShippingCharge) => {
                            expect(parseFloat(displayedMerchandiseTotal).toFixed(2)).to.be.equal(parseFloat(displayedOrderedSubtotal + displayedOrderedTax + displayedShippingCharge).toFixed(2));
                        });
                    });
                });
            });
        } else {
            cy.log('The shipping method is not available for ' + testingCountry.toUpperCase());
        }
    });
});
