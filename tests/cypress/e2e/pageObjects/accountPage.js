const viewAllLink = 'span.view-all > a[title="View All"]';
const listLabel = 'h4.label';
const list = 'div.table-wrapper.orders-history.data-grid-wrap';
const pageHeader = '[class="page-title"] span';
const viewLink = 'a.view-action';
const numbersList = 'td.col.id';
const action = 'td.col.actions.data-grid-actions-cell';
const accountNumber = 'div.account-information-box-content > ul > li:nth-child(3)';
const emailID = 'div.account-information-box-content > ul > li:last-child';
const name = 'div.account-information-box-content > ul > li.text-light';
const accountDropdown = 'span#select2-accountfilter-container';

class AccountPage {

    clickViewAllLink (name) {
        cy.waitForSearchBox();
        cy.contains(listLabel, name, {matchCase: false}).siblings(list).find(viewAllLink).should('be.visible').click({force: true});
    } 

    getPageHeader () {
        cy.waitForSearchBox();
        return cy.get(pageHeader);
    }

    clickViewLinkOfNumber (linkName, number) {
        cy.waitForSearchBox();
        cy.contains(numbersList, number).siblings(action).find(viewLink).contains(linkName, {matchCase: false})
        .invoke('removeAttr','target').click();
    }

    getAccountNumber () {
        cy.waitForSearchBox();
        return cy.get(accountNumber).then((displayedAccountNumber) => {
            return displayedAccountNumber.text().trim().toLowerCase();
        });
    }

    getEmailID () {
        cy.waitForSearchBox();
        return cy.get(emailID).then((displayedEmailID) => {
            return displayedEmailID.text().trim().toLowerCase();
        });
    }

    getFirstNameLastName () {
        cy.waitForSearchBox();
        return cy.get(name).first();
    }

    openSelfServicePageUrl (url) {
        cy.getBaseUrl().then((baseUrl) => {
            const selfServicePageUrl = baseUrl + url;
            cy.visit(selfServicePageUrl);
            cy.waitForSearchBox();
        });
    }

    getAccountDropdown () {
        return cy.get(accountDropdown);
    }
    
} export default AccountPage