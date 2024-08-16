const paginationDropdown = 'select#limiter';
const itemCount = 'span.toolbar-number';
const requestToOrderList = 'td[class="col id"]';
const requestToOrderNumber = 'td[data-th="Request To Order #"]';
const itemPrice = 'td[data-th="Price"]';
const itemSubTotal = 'td[class="col subtotal"] > span';
const productQuantity = 'td[data-th="Qty"] > input[name="qty"]';
const updateButton = 'button[class="action button update-qty"]';
const viewLink = 'td[class="col actions"] > a.action.view';
const skuCode = 'td[data-th="Attributes"] > p[class="ore-item-number"]';
const removeLink = 'p[class="mob-ore-remove-item"] > a';
const removeItemMessage = 'div.messages > div.message-success > div';
const productName = 'td[data-th="Attributes"] > p.mob-prod-name';
const productDetails = 'tr.item-info';
const loader = 'div.loader > img[alt="Loading..."]';
const requestOrderName = 'td[class="col name"]';
const requestOrderEmail = 'td[class="col email"]';
const requestOrderCreated = 'td[class="col created_at"]';
const requestOrderItemsCount = 'td[class="col count"]';
const requestOrderStatus = 'td[class="col status"]';
const addedProductsList = 'tbody.request.item > tr[class="item-info"]';
const productShipByDate = 'p.mob-p-available > span.mob-ore-availability';
const viewAllRequestOrderLink = 'a[class="action primary request-back"]';
const backButtonOrViewAllRequestOrderLink = 'a[class="action primary request-back"]';
const quantityValidationMessage = 'div[class="mage-error"]';
const paginationDropdownOptions = 'select#limiter > option';
const yourName = 'input#name';
const phoneNumber = 'input#phone';
const email = 'input#email';
const submitButton = 'button[class="action submit primary"]';
const createdDateLabel = 'td[class="col created-on"] > span';
const yourNameLabel = 'td[class="col name"] > span';
const phoneNumberLabel = 'td[class="col phone"] > span';
const emailLabel = 'td[class="col email"]';
const requestOrderLabel = 'td[class="col order"] > span';
const yourNameValidationMessage = 'div#name-error';
const phoneNumberValidationMessage = 'div#phone-error';
const emailValidationMessage = 'div#email-error';

class RequestToOrderPage {

    getSelectedPaginationDropdownOption () {
        return cy.get(paginationDropdown).invoke('find', ':selected').then((selectedOption) => {
            return selectedOption.text().trim().toLowerCase();
        });
    }

    selectPaginationDropdownOption (option) {
        cy.get(paginationDropdown).select(option);
    }

    getItemCount () {
        return cy.get(itemCount).then((count) => {          
            let newCount = count.text().split('of');
            let totalCount = newCount[0].replace('Items 1 to 10', '10');
            return totalCount;
        });
    }

    getRequestToOrderList () {
        return cy.get(requestToOrderList);
    }

    clickOnViewLink (requestNumberValue) {
        cy.contains(requestToOrderNumber, requestNumberValue, { matchCase: false }).parent('tr').find(viewLink).click();
    }

    enterProductQuantity (productNameValue, quantity) {
        cy.wait(5000); //added static wait because of js load issue
        cy.contains(productName, productNameValue, { matchCase: false }).parents(productDetails).find(productQuantity)
        .clear().type(quantity);
    }

    clickOnUpdateButton () {
        cy.get(updateButton).click();
    }

    getItemPrice (productNameValue) {
        return cy.contains(productName, productNameValue, { matchCase: false }).parents(productDetails).find(itemPrice)
        .then((displayedItemPrice) => {
            const numericString = displayedItemPrice.text().trim().replace(/[^0-9.]/g, "");
            return parseFloat(numericString);
        });
    }

    getSubTotal (productNameValue) {
        this.waitForLoader();
        cy.wait(5000); //added static wait because of js load issue
        return cy.contains(productName, productNameValue, { matchCase: false }).parents(productDetails).find(itemSubTotal)
        .then((displayedItemSubtotal) => {
            const numericString = displayedItemSubtotal.text().trim().replace(/[^0-9.]/g, "");
            return parseFloat(numericString);
        });
    }

    getProductPrice (productNameValue) {
        return cy.contains(productName, productNameValue, { matchCase: false }).parents(productDetails).find(itemPrice)
        .then((displayedItemPrice) => {
            return displayedItemPrice.text().trim();
        });
    }

    getSkuCode (productNameValue) {
        return cy.contains(productName, productNameValue, { matchCase: false }).parents(productDetails).find(skuCode)
        .then((displayedItemSKU) => {
            return displayedItemSKU.text().replace("Item # :", "").trim().toLowerCase();
        });
    }

    getProductQty (productNameValue) {
        return cy.contains(productName, productNameValue, { matchCase: false }).parents(productDetails).find(productQuantity)
        .invoke('attr', 'value');
    }

    clickOnRemoveLink (productNameValue) {
        cy.wait(5000); //added static wait because of js load issue
        cy.contains(productName, productNameValue, { matchCase: false }).parents(productDetails).find(removeLink).click();
    }

    getItemRemoveMessage () {
        return cy.get(removeItemMessage).then((displayedMessage) => {
            return displayedMessage.text().trim();
        });
    }

    waitForLoader () {
        cy.get(loader).should('not.be.visible');
    }

    getRequestOrderNo (requestNumberValue) {
        return cy.contains(requestToOrderNumber, requestNumberValue, { matchCase: false });
    }

    getRequestName (requestNumberValue) {
        return cy.contains(requestToOrderNumber, requestNumberValue, { matchCase: false }).parent('tr').find(requestOrderName);
    }

    getRequestEmail (requestNumberValue) {
        return cy.contains(requestToOrderNumber, requestNumberValue, { matchCase: false }).parent('tr').find(requestOrderEmail);
    }

    getRequestCreatedAt (requestNumberValue) {
        return cy.contains(requestToOrderNumber, requestNumberValue, { matchCase: false }).parent('tr').find(requestOrderCreated);
    }

    getRequestItemCount (requestNumberValue) {
        return cy.contains(requestToOrderNumber, requestNumberValue, { matchCase: false }).parent('tr').find(requestOrderItemsCount);
    }

    getRequestStatus (requestNumberValue) {
        return cy.contains(requestToOrderNumber, requestNumberValue, { matchCase: false }).parent('tr').find(requestOrderStatus);
    }

    getRequestViewLink (requestNumberValue) {
        return cy.contains(requestToOrderNumber, requestNumberValue, { matchCase: false }).parent('tr').find(viewLink);
    }

    getAddedProductsList () {
        return cy.get(addedProductsList);
    }

    getProductShipByDate (productNameValue) {
        cy.contains(productName, productNameValue, { matchCase: false }).parents(productDetails).find(productShipByDate)
        .should('be.visible').should('include.text', 'ship').should('include.text', 'by').as('productShipByDate');

        return cy.get('@productShipByDate').then((displayedShipByDateText) => {
            const shipByDate = displayedShipByDateText.text().trim().match(/(\d{2}\.\d{2}\.\d{2})/);
            return shipByDate[0];
        });
    }

    clickViewAllRequestOrderLink () {
        cy.get(viewAllRequestOrderLink).click();
    }

    clickViewRequestOfOpenStatus () {
        cy.get(requestOrderStatus).contains('Open', {matchCase: false}).parents('tr').find(viewLink).filter(':visible').click();
    }

    clickViewRequestOfSubmittedStatus () {
        cy.get(requestOrderStatus).contains('Submitted', {matchCase: false}).parents('tr').find(viewLink).filter(':visible').click();
    }

    clickBackButtonOrViewAllRequestOrder () {
        cy.get(backButtonOrViewAllRequestOrderLink).click();
    }

    getQuantityValidationMessage () {
        cy.scrollTo('top');
        return cy.get(quantityValidationMessage).then((displayedMessage) => {
            return displayedMessage.text().trim();
        });
    }

    getSelectedPaginationDropdownOption () {
        cy.get(paginationDropdown).scrollIntoView();
        return cy.get(paginationDropdown).invoke('find', ':selected').then((selectedOption) => {
            return selectedOption.text().trim().toLowerCase();
        });
    }

    getPaginationDropdownOptions () {
        return cy.getListElement(paginationDropdownOptions, ",");    
    }

    enterPhoneNumber (value) {
        cy.get(phoneNumber).should('be.visible').clear().type(value);
    }

    collectYourName () {
        return cy.get(yourName).invoke('attr', 'value');
    }

    collectEmail () {
        return cy.get(email).invoke('attr', 'value');
    }

    clickOnSubmitButton () {
        cy.get(submitButton).click();
    }

    getRequestSuccessMessage () {
        return cy.get(removeItemMessage).then((displayedMessage) => {
            return displayedMessage.text().trim();
        });
    }

    getCreatedDate () {
        return cy.get(createdDateLabel);
    }

    getYourName () {
        return cy.get(yourNameLabel).then((displayedName) => {
            return displayedName.text().trim();
        });
    }

    getPhoneNumber () {
        return cy.get(phoneNumberLabel).then((displayedPhoneNumber) => {
            return displayedPhoneNumber.text().trim();
        });
    }

    getEmail () {
        return cy.get(emailLabel).then((displayedEmail) => {
            return displayedEmail.text().trim();
        });
    }

    getRequestOrderNumber () {
        return  cy.get(requestOrderStatus).contains('Open', {matchCase: false}).parents('tr').find(requestToOrderNumber).then((displayedOrderNumber) => {
            return displayedOrderNumber.text().trim();
        });
    }

    getRequestOrderNumberOfSubmitRequest () {
        return  cy.get(requestOrderLabel).then((displayedOrderNumber) => {
            return displayedOrderNumber.text().trim();
        });
    }

    yourName () {
        cy.get(yourName).should('be.visible').clear();
    }

    phoneNumber () {
        cy.get(phoneNumber).should('be.visible').clear()
    }

    email () {
        cy.get(email).should('be.visible').clear();
    }

    clickOnSubmitButton () {
        cy.get(submitButton).click();
    }

    getYourNameValidationMessage () {
        return cy.get(yourNameValidationMessage).then((displayedMessage) => {
            return displayedMessage.text().trim().toLowerCase();
        });
    }

    getPhoneNumberValidationMessage () {
        return cy.get(phoneNumberValidationMessage).then((displayedMessage) => {
            return displayedMessage.text().trim().toLowerCase();
        });
    }

    getEmailValidationMessage () {
        return cy.get(emailValidationMessage).then((displayedMessage) => {
            return displayedMessage.text().trim().toLowerCase();
        });
    }

} export default RequestToOrderPage