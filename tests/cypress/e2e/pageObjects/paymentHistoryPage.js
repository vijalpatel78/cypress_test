const listHeaders = 'table.data-grid.table.table-order-items.history th[scope="col"]';
const accountDropdown = 'span.select2-selection.select2-selection--single';
const searchBox = 'form#search-filter > input[name="search"]';
const checkNumbersList = 'table.data-grid.table.table-order-items.history td[data-th="CheckNo/Ref No"]';
const PaymentNumbersList = 'table.data-grid.table.table-order-items.history td[data-th="Payment No"]';
const paginationLabelText = 'span.toolbar-number';
const validationText = 'div.message.info.empty > span';

class PaymentsPage { 

    getListHeaders () {
        return cy.getListElement(listHeaders, ",");    
    }

    getAccountDropdown () {
        return cy.get(accountDropdown).then((selectedValue) => {
            return selectedValue.text().trim().toLowerCase();
        });
    }

    enterNumberInSearchBox (number) {
        cy.waitForSearchBox();
        cy.get(searchBox).should('be.visible').clear().type(number).type('{enter}');
    }

    getCheckNumbersList () {
        return cy.get(checkNumbersList);
    }

    getPaymentNumbersList () {
        return cy.get(PaymentNumbersList);
    }
    
    getPaginationLabelText () {
        return cy.get(paginationLabelText).scrollIntoView();
    }

    getValidationMessage () {
        return cy.get(validationText).then(($ValidationTextMsg) => {
            return $ValidationTextMsg.text().trim(); 
        });
    } 

} export default PaymentsPage