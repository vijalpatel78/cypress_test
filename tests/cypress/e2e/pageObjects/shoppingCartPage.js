const itemNameList = 'div.product-item-details > strong.product-item-name';
const itemDetails = 'tbody.cart.item';
const itemPrice = 'td[data-th="Price"] span.cart-price > span.price';
const itemQty = 'td[data-th="Qty"] > div.field.qty input[data-role="cart-item-qty"]';
const itemVariant = 'dd';
const clearCartButton = 'button#empty_cart_button';
const clearCartPopupOkButton = '.action-primary.action-accept';
const orderSubtotal = 'div.cart-summary > div#cart-totals table.data.table.totals tr.totals.sub > td.amount > span.price';
const cartEmpty = 'div.cart-empty';
const itemSku = 'div.product-item-details > div.product-item-sku';
const cartPageTitle = 'Shopping Cart';
const clearCartPopupCancelButton = '.action-secondary.action-dismiss';
const itemRemoveLink = 'a[title="Remove"] > span';
const itemImage = 'td[data-th="Item"] > a img.product-image-photo';
const itemEditLink = 'a[title="Edit item parameters"] > span';
const successMsg = 'div.page.messages div[data-ui-id="message-success"] > div';
const itemNameLink = 'td[data-th="Item"] > div.product-item-details > strong.product-item-name > a';
const itemSubtotal = 'td.col.subtotal span.price';
const orderTax = 'div#cart-totals tr.totals-tax > td.amount > span.price';
const merchandiseTotal = 'div#cart-totals tr.grand.totals > td[data-th="Merchandise Total"] span.price';
const loader = 'div.loader > img';
const addItemButtonOfRequisitionListPopup = '.modal-footer > button.action.primary.add > span';
const itemAddToQuoteLink = 'Add to Quote';
const itemMoveToProjectLink = 'Move to Project';
const clearCartPopupXIconButton = '.modal-popup.confirm._show > div > header > .action-close';
const shippingCharge = 'div#cart-totals tr.totals.shipping.excl > td.amount > span.price';
const vatCharge = 'div#cart-totals tr.totals-tax > td.amount > span.price';
const addToProjectToggleButton = 'button.action.toggle.change';
const quoteName = 'li.item > span.item-name';
const itemShipByDate = 'div.product-item-details > div.stock-details';
const beginCheckoutButton = 'div.cart-summary button[title="Begin Checkout"]';
const attentionPopupTitle = 'aside.modal-popup.confirm._show header > span[data-role="title"]';
const attentionPopupCancelButton = 'aside.modal-popup.confirm._show header > button[data-role="closeBtn"]';
const attentionPopupMessage = 'aside.modal-popup.confirm._show div[data-role="content"]> div';
const attentionPopupOkButton = 'aside.modal-popup.confirm._show footer > button.action-primary.action-accept > span';
const attentionPopup = 'aside.modal-popup.confirm._show > div[data-role="focusable-scope"]';
const updateCartButton = 'button[title="Update Shopping Cart"]';
const itemFinish = 'dl[class="item-options"]';
const addSideMark = 'div[data-role="trigger"]';
const sideMarkSectionOfProduct = 'div[class="control sidemark"] > textarea';
const commentSectionOfProduct = 'div[class="control comment"] > textarea';
const addSideMarkOfBulb = ':nth-child(4) > .item-info > .item > .product-item-details > .cart-comments';
const sideMarkSectionOfBulb = ':nth-child(4) .field.sidemark >div > .input-text';
const commentSectionOfBulb = ':nth-child(4) .field.comment > .control > .input-text';
const viewShoppingCartLink = 'a[class="lightbulb-cart-link"]';
const quantityValidationMessage = 'div[class="mage-error"]';
const collapseSideMarkOfBulb = ':nth-child(4) > .item-info > .item > .product-item-details > .cart-comments > .allow > div';
const noItemValidationMessage = 'div[class="cart-empty"] > p:nth-child(1)';
const estimateShippingAndTaxSectionTitle = 'div#block-shipping strong#block-shipping-heading';
const estimateShippingAndTaxSection = 'div#block-shipping > div#block-summary';
const countryOnEstimateShippingAndTaxSection = 'div#block-shipping > div#block-summary div[name="shippingAddress.country_id"]';
const stateOnEstimateShippingAndTaxSection = 'div#block-shipping > div#block-summary div[name="shippingAddress.region_id"]';
const stateOnEstimateShippingAndTaxSectionUK_EU = 'div#block-shipping > div#block-summary div[name="shippingAddress.region"]';
const zipCodeOnEstimateShippingAndTaxSection = 'div#block-shipping > div#block-summary div[name="shippingAddress.postcode"]';
const zipOrPostalCode = 'input[name="postcode"]';
const zipCodeValidationMessage = 'div[class="message warning"] > span';
const InvalidQuantityValidationMessage = 'div[class="control qty"] > label > div';
const countryDropdown = 'select[name="country_id"]';
const stateDropdown = 'select[name="region_id"]';
const shipMethod = 'div[class="field choice item"] > label > span';

class ShoppingCartPage {

    getShoppingCartPageTitle () {
        return cy.title();
    }

    getItemNameList () {
        return cy.get(itemNameList).then((displayedItemNameList) => {
            return displayedItemNameList.text().trim().toLowerCase();
        });
    }

    getItemPrice (itemName) {
        return cy.contains(itemNameList, itemName, {matchCase: false}).parents(itemDetails).find(itemPrice)
        .then((displayedItemPrice) => {
            return displayedItemPrice.text().trim();
        });
    }

    getItemQty (itemName) {
        return cy.contains(itemNameList, itemName, {matchCase: false}).parents(itemDetails).find(itemQty)
        .invoke('attr', 'value');
    }

    getItemVariant (itemName, variant) {
        return cy.contains(itemNameList, itemName, {matchCase: false}).parents(itemDetails)
        .contains(variant, {matchCase: false}).next(itemVariant)
        .then((displayedItemVariant) => {
            return displayedItemVariant.text().trim().toLowerCase();
        });
    }

    getOrderSubtotal () {
       return cy.get(orderSubtotal);
    }

    clickOnClearCartButton () {
        this.getOrderSubtotal().should('be.visible');
        cy.get(clearCartButton).click();
    }
				
	clickOnClearCartPopupOkButton () {
        cy.get(clearCartPopupOkButton).click();
    }

    getCartEmptyMessage () {
        return cy.get(cartEmpty);
    }

    getShoppingCartPageUrl () {
        return cy.url();
    }

    getItemSKU (itemName) {
        return cy.contains(itemNameList, itemName, {matchCase: false}).parents(itemDetails).find(itemSku)
        .then((displayedItemSku) => {
            return displayedItemSku.text().trim().replace('Item #:\n','').trim();
        });
    }

    validateShoppingCartPageTitle (){
        cy.title().should('contain', cartPageTitle);
    }

    clickOnClearCartPopupCancelButton () {
        cy.get(clearCartPopupCancelButton).click();
    }

    clickRemoveLinkOfItem (itemName) {
        cy.waitForSearchBox();
        cy.contains(itemNameList, itemName, {matchCase: false}).parents(itemDetails).find(itemRemoveLink)
        .click();
    }

    clickOnItemImage (itemName) {
        cy.contains(itemNameList, itemName, {matchCase: false}).parents(itemDetails).find(itemImage).click();
    }

    clickEditLinkOfItem (itemName) {
        cy.waitForSearchBox();
        cy.contains(itemNameList, itemName, {matchCase: false}).parents(itemDetails).find(itemEditLink).click();
        cy.waitForSearchBox();
    }

    getSuccessMessage () {
        return cy.get(successMsg).then((displayedSuccessMessage) => {
            return displayedSuccessMessage.text().trim();
        });
    }

    clickOnItemName (itemName) {
        cy.contains(itemNameList, itemName, {matchCase: false}).parents(itemDetails).find(itemNameLink).click();
    }

    enterItemQty (itemName, qty) {
        cy.contains(itemNameList, itemName, {matchCase: false}).parents(itemDetails).find(itemQty).clear().type(qty + '{enter}');
    }

    getItemSubtotalAsNumber (itemName) {
        return cy.contains(itemNameList, itemName, {matchCase: false}).parents(itemDetails).find(itemSubtotal).then((displayedItemSubtotal) => {
            cy.getCountry().then((testingCountry) => {    
                if (testingCountry === 'us') {
                    return cy.convertPriceToNumber(displayedItemSubtotal.text().trim(), '$');
                } else if (testingCountry === 'uk') {
                    return cy.convertPriceToNumber(displayedItemSubtotal.text().trim(), '£');
                } else if (testingCountry === 'eu') {
                    return cy.convertPriceToNumber(displayedItemSubtotal.text().trim(), '€');
                }
            });
        });
    }

    getSumOfAllItemSubtotal () {
        let allItemSubTotal = 0;

        return cy.get(itemSubtotal).then((subtotalList) => {
            subtotalList.each((index, itemSubtotal) => {
                cy.getCountry().then((testingCountry) => {
                    if (testingCountry === 'us') {
                        return cy.convertPriceToNumber(Cypress.$(itemSubtotal).text().trim(), '$').then((itemSubtotalAsNumber) => {
                            return allItemSubTotal += itemSubtotalAsNumber;
                        });
                    } else if (testingCountry === 'uk') {
                        return cy.convertPriceToNumber(Cypress.$(itemSubtotal).text().trim(), '£').then((itemSubtotalAsNumber) => {
                            return allItemSubTotal += itemSubtotalAsNumber;
                        });
                    } else if (testingCountry === 'eu') {
                        return cy.convertPriceToNumber(Cypress.$(itemSubtotal).text().trim(), '€').then((itemSubtotalAsNumber) => {
                            return allItemSubTotal += itemSubtotalAsNumber;
                        });
                    }
                });
            });
        });
    }

    getOrderSubtotalAsNumber () {
        return cy.get(orderSubtotal).then((displayedOrderedSubtotal) => {
            cy.getCountry().then((testingCountry) => {
                if (testingCountry === 'us') {
                    return cy.convertPriceToNumber(displayedOrderedSubtotal.text().trim(), '$');
                } else if (testingCountry === 'uk') {
                    return cy.convertPriceToNumber(displayedOrderedSubtotal.text().trim(), '£');
                } else if (testingCountry === 'eu') {
                    return cy.convertPriceToNumber(displayedOrderedSubtotal.text().trim(), '€');
                }   
            });
        });
    }

    getOrderTaxAsNumber () {
        cy.waitForOrderSummaryLoad();
        return cy.getCountry().then((testingCountry) => {
            if (testingCountry === 'us') {
                return cy.get(orderTax).should('not.have.text', '$0.00').then((displayedOrderedTax) => {
                    return cy.convertPriceToNumber(displayedOrderedTax.text().trim(), '$');
                });
            } else if (testingCountry === 'uk') {
                return cy.get(orderTax).should('not.have.text', '£0.00').then((displayedOrderedTax) => {
                    return cy.convertPriceToNumber(displayedOrderedTax.text().trim(), '£');
                });
            } else if (testingCountry === 'eu') {
                return cy.get(orderTax).should('not.have.text', '€0.00').then((displayedOrderedTax) => {
                    return cy.convertPriceToNumber(displayedOrderedTax.text().trim(), '€');
                });
            }
        }); 
    }

    getMerchandiseTotalAsNumber () {
        return cy.get(merchandiseTotal).should('be.visible').then((displayedMerchandiseTotal) => {
            cy.getCountry().then((testingCountry) => {
                if (testingCountry === 'us') {
                    return cy.convertPriceToNumber(displayedMerchandiseTotal.text().trim(), '$');
                } else if (testingCountry === 'uk') {
                    return cy.convertPriceToNumber(displayedMerchandiseTotal.text().trim(), '£');
                } else if (testingCountry === 'eu') {
                    return cy.convertPriceToNumber(displayedMerchandiseTotal.text().trim(), '€');
                }   
            });
        });
    }

    waitForOrderSummaryLoad () {
        cy.get(loader).should('not.exist');
    }

    clickMoveToProjectLinkOfItem () {
        cy.waitForOrderSummaryLoad();
        cy.get(addToProjectToggleButton).should('be.visible');
        cy.contains(itemMoveToProjectLink, {matchCase: false}).click();
    }

    clickAddToQuoteLinkOfItem (itemName) {
        cy.waitForSearchBox();
        cy.contains(itemNameList, itemName, {matchCase: false}).should('be.visible').parents(itemDetails)
        .contains(itemAddToQuoteLink, {matchCase: false}).click();
    }

    clickAddItemButtonOfRequisitionListPopup () {
        cy.get(addItemButtonOfRequisitionListPopup).click();
    }

    clickOnClearCartPopupXIconButton () {
        cy.get(clearCartPopupXIconButton).click();
    }

    getShippingChargeAsNumber () {
        cy.wait(10000); //added static wait because of js load issue
        return cy.getCountry().then((testingCountry) => {
            if (testingCountry === 'us') {
                return cy.get(shippingCharge).should('be.visible').then((displayedShippingCharge) => {
                    return cy.convertPriceToNumber(displayedShippingCharge.text().trim(), '$');   
                });
            } else if (testingCountry === 'uk') {
                return cy.get(shippingCharge).should('be.visible').then((displayedShippingCharge) => {
                    return cy.convertPriceToNumber(displayedShippingCharge.text().trim(), '£');   
                });
            } else if (testingCountry === 'eu') {
                return cy.get(shippingCharge).should('be.visible').then((displayedShippingCharge) => {
                    return cy.convertPriceToNumber(displayedShippingCharge.text().trim(), '€');   
                });
            }
        }); 
    }

    getVATChargeAsNumber () {
        return cy.get(vatCharge).should('be.visible').then((displayedVATCharge) => {
            cy.getCountry().then((testingCountry) => {
                if (testingCountry === 'uk') {
                    return cy.convertPriceToNumber(displayedVATCharge.text().trim(), '£');
                } else if (testingCountry === 'eu') {
                    return cy.convertPriceToNumber(displayedVATCharge.text().trim(), '€');
                }   
            });
        });
    }

    selectQuoteFromAddToQuote (quoteNameValue) {
        cy.waitForOrderSummaryLoad();
        cy.contains(quoteName, quoteNameValue, {matchCase: false}).click({force: true});
    }

    getItemShipByDate (itemName) {
        cy.contains(itemNameList, itemName, {matchCase: false}).parents(itemDetails).find(itemShipByDate).should('be.visible')
        .should('include.text', 'ship').should('include.text', 'by').as('itemShipByDate');

        return cy.get('@itemShipByDate').then((displayedShipByDateText) => {
            const shipByDate = displayedShipByDateText.text().trim().match(/(\d{2}\.\d{2}\.\d{2})/);
            return shipByDate[0];
        });
    }

    clickBeginCheckoutButton () {
        this.getOrderSubtotal().should('be.visible');
        cy.waitForOrderSummaryLoad();
        cy.get(beginCheckoutButton).filter(':visible').should('be.visible').click({force: true});
    }

    getShippingCharge () { 
        cy.wait(10000); //added static wait because of js load issue
        return cy.get(shippingCharge).should('be.visible').then((displayedShippingCharge) => {
            return displayedShippingCharge.text().trim();
        });
    }

    getOrderTax () { 
        cy.waitForOrderSummaryLoad();
        return cy.get(orderTax).should('be.visible').then((displayedOrderTax) => {
            return displayedOrderTax.text().trim();
        });
    }

    getMerchandiseTotal () { 
        return cy.get(merchandiseTotal).should('be.visible').then((displayedMerchandiseTotal) => {
            return displayedMerchandiseTotal.text().trim();
        });
    }

    getOrderSubtotalAmt () {
        return this.getOrderSubtotal().should('be.visible').then((displayedOrderSubtotalAmt) => {  
            const price = displayedOrderSubtotalAmt.text().trim();          
            const numberValue = parseFloat(price.replace(/[$£€]/g, ''));       
            if(numberValue > 0)
            {
                return displayedOrderSubtotalAmt.text().trim();
            } 
            else {
                throw new Error(`The price is not valid`);
            }
        });
    }

    getAttentionPopupTitle () { 
        return cy.get(attentionPopupTitle).filter(':visible').should('be.visible').then((displayedPopupTitle) => {
            return displayedPopupTitle.text().trim();
        });
    }

    getAttentionPopupCancelBtn () { 
        return cy.get(attentionPopupCancelButton).filter(':visible');
    }

    getAttentionPopupOkBtn () { 
        return cy.get(attentionPopupOkButton).filter(':visible').contains('OK');
    }

    getAttentionPopupMsg () { 
        return cy.get(attentionPopupMessage).filter(':visible').should('be.visible').then((displayedPopupMsg) => {
            return displayedPopupMsg.text().trim();
        });
    }

    clickAttentionPopupOkBtn () { 
        cy.get(attentionPopupOkButton).filter(':visible').should('be.visible').click();
    }

    getAttentionPopup () { 
        return cy.get(attentionPopup);
    }

    enterItemQuantity (itemName, qty) {
        cy.waitForSearchBox();
        cy.contains(itemNameList, itemName, {matchCase: false}).parents(itemDetails).find(itemQty).clear().type(qty);
        this.clickOnUpdateCartBtn();
    }

    clickOnUpdateCartBtn () {
        this.getOrderSubtotal().should('be.visible');
        cy.get(updateCartButton).click();
    }

    clickAddSideMarkOfProduct () { 
        this.getOrderSubtotal().should('be.visible');
        cy.waitForOrderSummaryLoad();
        cy.get(itemDetails).filter(':visible').find(itemFinish).siblings('div').find(addSideMark).click();
    }

    enterTextSideMarkSectionOfProduct (text) {   
        cy.get(itemDetails).filter(':visible').find(itemFinish).siblings('div').find(sideMarkSectionOfProduct).clear().type(text);
    }

    enterTextCommentSectionOfProduct (text) {   
        cy.get(itemDetails).filter(':visible').find(itemFinish).siblings('div').find(commentSectionOfProduct).clear().type(text);
    }

    clickAddSideMarkOfBulb () {  
        cy.get(loader).should('not.exist');     
        cy.get(addSideMarkOfBulb).should('be.visible').click(); 
    }

    enterTextSideMarkSectionOfBulb (text) {     
        cy.get(sideMarkSectionOfBulb).clear().type(text);
    }

    enterTextCommentSectionOfBulb (text) { 
        cy.get(commentSectionOfBulb).clear().type(text);
    }

    getQtyValidationMessage () { 
        return cy.get(quantityValidationMessage).should('be.visible').then((validationMessage) => {
            return validationMessage.text().trim();
        });
    }

    clickViewShoppingCart () { 
        cy.get(viewShoppingCartLink).click();
    }

    clearQuantityField () { 
        cy.get(itemQty).clear();
    }

    sideMarkSectionOfProductTextBox () {   
        return cy.get(itemDetails).filter(':visible').find(itemFinish).siblings('div').find(sideMarkSectionOfProduct);
    }

    commentSectionOfProductTextBox () {   
        return cy.get(itemDetails).filter(':visible').find(itemFinish).siblings('div').find(commentSectionOfProduct);
    }

    clickToCollapseSideMarkOfProduct () { 
        cy.scrollTo('top');
        cy.get(itemDetails).filter(':visible').find(itemFinish).siblings('div').find(addSideMark).scrollIntoView().click();
    }

    sideMarkSectionOfBulbTextBox () {   
        return cy.get(sideMarkSectionOfBulb);
    }

    commentSectionOfBulbTextBox () { 
        return cy.get(commentSectionOfBulb);
    }

    clickToCollapseBulbSideMark () { 
        cy.get(collapseSideMarkOfBulb).click();
    }

    getNoItemValidationMessage () { 
        return cy.get(noItemValidationMessage).should('be.visible').then((validationMessage) => {
            return validationMessage.text().trim();
        });
    }

    getEstimateShippingAndTaxSectionTitle () { 
        this.getOrderSubtotal().should('be.visible');
        cy.waitForOrderSummaryLoad();
        return cy.get(estimateShippingAndTaxSectionTitle).should('be.visible').then((displayedLabel) => {
            return displayedLabel.text().trim();
        });
    }

    getEstimateShippingAndTaxSection () { 
        return cy.get(estimateShippingAndTaxSection);
    }

    clickEstimateShippingAndTaxSection () { 
        cy.get(estimateShippingAndTaxSectionTitle).should('be.visible').click({ force: true });
    }

    getCountryLabelOnEstimateShippingAndTaxSection () { 
        return cy.get(countryOnEstimateShippingAndTaxSection).find('span');
    }

    getCountryFieldOnEstimateShippingAndTaxSection () { 
        return cy.get(countryOnEstimateShippingAndTaxSection).find('select[name="country_id"]');
    }

    getStateLabelOnEstimateShippingAndTaxSection () { 
        return cy.getCountry().then((testingCountry) => {
            if (testingCountry === 'us') {
                return cy.get(stateOnEstimateShippingAndTaxSection).find('span');
            } else {
                return cy.get(stateOnEstimateShippingAndTaxSectionUK_EU).find('span');
            }
        });
    }

    getStateFieldOnEstimateShippingAndTaxSection () { 
        return cy.getCountry().then((testingCountry) => {
            if (testingCountry === 'us') {
                return cy.get(stateOnEstimateShippingAndTaxSection).find('select[name="region_id"]');
            } else {
                return cy.get(stateOnEstimateShippingAndTaxSectionUK_EU).find('input[name="region"]');
            }
        });
    }

    getZipCodeLabelOnEstimateShippingAndTaxSection () { 
        return cy.get(zipCodeOnEstimateShippingAndTaxSection).find('span');
    }

    getZipCodeFieldOnEstimateShippingAndTaxSection () { 
        return cy.get(zipCodeOnEstimateShippingAndTaxSection).find('input[name="postcode"]');
    }

    enterZipOrPostalCode (zipCode) { 
        cy.get(zipOrPostalCode).clear({ force: true }).type(zipCode)
    }

    getZipCodeValidationMessage () { 
        return cy.get(zipCodeValidationMessage).should('be.visible').then((validationMessage) => {
            return validationMessage.text().trim();
        });
    }

    getQuantityValidationMessage () { 
        return cy.get(InvalidQuantityValidationMessage).should('be.visible').then((validationMessage) => {
            return validationMessage.text().trim();
        });
    }

    enterProductQuantity (qty) { 
        cy.get(itemQty).clear().type(qty + '{enter}');
    }

    selectCountryFromDropdown (countryName) {
        cy.get(countryDropdown).select(countryName, { force: true });
    }

    selectStateFromDropdown (stateName) {
        cy.get(stateDropdown).select(stateName, { force: true });
    }

    enterZipOrPostalCode (zipCode) { 
        cy.get(zipOrPostalCode).clear({ force: true }).type(zipCode);
    }

    getSelectedCountryDropdownOption () {
        return cy.get(countryDropdown).invoke('find', ':selected').then((selectedCountry) => {
            return selectedCountry.text().trim();
        });
    }

    getSelectedStateDropdownOption () {
        return cy.get(stateDropdown).invoke('find', ':selected').then((selectedState) => {
            return selectedState.text().trim();
        });
    }

    getSelectedZipCode () {
        return cy.get(zipOrPostalCode).invoke('val').then((selectedZip) => {
            return selectedZip;
        });
    }

    clickOnShippingMethod (shippingMethod) {
        cy.get(shipMethod).contains(shippingMethod, {matchCase: false}).click();
    }

} export default ShoppingCartPage