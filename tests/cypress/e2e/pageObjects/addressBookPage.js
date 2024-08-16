const topHeaders = 'div#block-collapsible-nav > ul > li';
const editLink = 'a.action.edit';
const defaultAddressLabel = 'strong.box-title';
const fieldSection = 'div.field';
const field = 'div.control > input';
const saveAddressBtn = 'button[data-action="save-address"]';

class AddressBookPage {

    clickHeader (headerName) {
        cy.get(topHeaders).contains(headerName, { matchCase: false }).should('be.visible').click();
    }

    clickEditLink (sectionName) {
        cy.contains(sectionName, { matchCase: false }).parent(defaultAddressLabel).siblings('div.box-actions')
        .find(editLink).should('be.visible').click();

        cy.waitForSearchBox();
    }

    enterData (fieldName, data) {
        cy.contains(fieldName, { matchCase: false }).parent(fieldSection).find(field).should('be.visible').clear().type(data);
    }

    clickSaveAddressBtn () {
        cy.get(saveAddressBtn).should('be.visible').click();
    }

    getAddress (sectionName) {
        return cy.contains(sectionName, { matchCase: false }).parent(defaultAddressLabel).siblings('div.box-content')
        .find('address').should('be.visible').then((displayedAddress) => {
            return displayedAddress.text().trim().replace(/\n/g, ' ');
        });
    }

} export default AddressBookPage