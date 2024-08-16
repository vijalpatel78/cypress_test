const searchBox = 'form#search-filter > input[name="search"]';
const selectedHeader = 'div#block-collapsible-nav > ul.nav.items > li.nav.item.current > strong';
const pagination = 'div.pages > ul.items.pages-items';
const paginationDropdown = 'select#limiter';
const paginationDropdownOptions = 'select#limiter > option';
const listHeaders = 'table#order-list th[scope="col"]';
const action = 'td[data-th="Action"]';
const viewLink = 'a.action.view.action-menu-item';
const numbersList = 'table#order-list td.col.id';
const pageTitle = 'h1.page-title > span[data-ui-id="page-title-wrapper"]';
const topHeaders = 'div#block-collapsible-nav > ul > li';
const filterBy = 'div#click-section span';
const filterLabel = 'aside.modal-popup.filter_sidebar.modal-slide._show ul.filter-list > li > label#filter-label';
const noOrdersMessage = 'div#order-list-main > div:nth-child(1) > span';
const ordersList = 'div#order-list-main table#order-list';
const applyFilterBtn = 'aside.modal-popup.filter_sidebar.modal-slide._show div.button-container > button#applyfilter';
const resetBtn = 'aside.modal-popup.filter_sidebar.modal-slide._show div.button-container > button#resetpopup';
const sortingIcon = 'span.sort-wrap > span[data-sort$="sc"]';
const statusOptions = 'div[class="status-dropdown"][aria-hidden="false"] li[data-action="status-filter"] > span:nth-child(2)';
const accountDropdown = 'label#filter-label';
const accountSearchBox = 'input#searchInput';
const associateAccount = 'ul#customerlist > li';
const appliedAccountFilter = 'div#accountlabel';
const validationMessage = 'div.message.info.empty > span';
const filterSidebarHeaderLabel = 'aside.modal-popup.filter_sidebar.modal-slide._show header span#modal-title-1';
const filterSidebarCloseBtn = 'aside.modal-popup.filter_sidebar.modal-slide._show header button[data-role="closeBtn"]';
const recordsStatus = 'td[data-th="Status"]';
const recordsList = 'table#order-list tr.order-row.data-row';

class OrdersInvoicesCreditMemosPage {

    clickHeader (headerName) {
        cy.get(topHeaders).contains(headerName, {matchCase: false}).click();
    }

    getSearchBoxPlaceholder () {
        return cy.get(searchBox).invoke('attr', 'placeholder').then((placeholder) => {
            return placeholder.trim().toLowerCase();
        });
    }

    getSelectedHeader () {
        return cy.get(selectedHeader).then((headerName) => {
            return headerName.text().trim().toLowerCase();
        });
    } 

    getPagination () {
        return cy.get(pagination).scrollIntoView();
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

    getListHeaders () {
        return cy.getListElement(listHeaders, ",");    
    }

    clickViewLinkOfNumber (number) {
        cy.contains(numbersList, number).siblings(action).find(viewLink).click();
    }

    getPageTitle () {
        cy.waitForSearchBox();
        return cy.get(pageTitle);
    }

    getTopHeaders () {
        cy.waitForSearchBox();
        return cy.getListElement(topHeaders, ",");    
    }

    getSearchBox () {
        return cy.get(searchBox);
    }

    enterNumberInSearchBox (number) {
        cy.waitForSearchBox();
        cy.get(searchBox).should('be.visible').clear().type(number).type('{enter}');
    }

    getNumbersList () {
        return cy.get(numbersList);
    }

    clickFilterBy () {
        cy.get(filterBy).contains('Filter By', { matchCase: false }).should('be.visible').click();
    }

    getFilter (filterName) {
        return cy.get(filterLabel).contains(filterName);
    }

    getNoOrdersMessage () {
        return cy.get(noOrdersMessage).then((displayedMessage) => {
            return displayedMessage.text().trim();
        });
    }

    getOrdersList () {
        return cy.get(ordersList);
    }

    getApplyFilterBtn () {
        return cy.get(applyFilterBtn);
    }

    getResetBtn () {
        return cy.get(resetBtn);
    }

    getColumnSortingIcon (columnName) {
        return cy.contains(listHeaders, columnName, { matchCase: false }).find(sortingIcon).should('have.length', 2);
    }

    clickStatusColumn () {
        cy.waitForSearchBox();
        cy.contains(listHeaders, 'Status', { matchCase: false }).should('be.visible').click();
    }

    getStatusOptions () {
        return cy.contains(listHeaders, 'Status', { matchCase: false }).find(statusOptions).should('be.visible')
        .then((options) => {
            return cy.getListElement(options, ",");
        });
    }

    clickAccountDropdown () {
        cy.get(accountDropdown).click();
    }

    enterAccountNumberForSearch (accountNumber) {
        cy.get(accountSearchBox).type(accountNumber);
    }

    getSearchAccountNumber () {
        return cy.get(associateAccount);
    }

    getAppliedAccountFilter () {
        cy.waitForSearchBox();
        return cy.get(appliedAccountFilter).should('be.visible').then((selectedAccountName) => {
            return selectedAccountName.text().replace("Account :", "").trim();
        });
    }

    clickApplyFilterBtn () {
        return cy.get(applyFilterBtn).click();
    }

    clickResetBtn () {
        return cy.get(resetBtn).click();
    }

    clickAccountName (accountName) {
        cy.get('ul#customerlist > li:contains("' + accountName + '")').click();
    }

    getAllAssociateAccount () {
        return cy.get(associateAccount);
    }

    getValidationMessage () {
        return cy.get(validationMessage).should('be.visible').then((displayedMessage) => {
            return displayedMessage.text().trim().toString();
        });
    }

    getSelectedAccountDropdownValue () {
        return cy.get(filterLabel).should('be.visible').then((selectedName) => {
            return selectedName.text().trim();
        });
    }

    getFilterBy () {
        return cy.get(filterBy).should('have.length', 2);
    }

    getFilterSidebarHeaderLabel () {
        return cy.get(filterSidebarHeaderLabel).contains('Filter', { matchCase: false });
    }

    getFilterSidebarCloseBtn () {
        return cy.get(filterSidebarCloseBtn);
    }

    clickStatusOptions (option) {
        cy.contains(listHeaders, 'Status', { matchCase: false }).find(statusOptions).contains(option, { matchCase: false })
        .should('be.visible').click();
    }

    getRecordsStatus () {
        return cy.getListElement(recordsStatus, ',');
    }

    selectPaginationDropdownOption (optionName) {
        cy.waitForSearchBox();
        cy.get(paginationDropdown).select(optionName);  
    }

    getRecordsList () {
        return cy.get(recordsList);
    }

    filterStatusColumn () {
        return cy.contains(listHeaders, 'Status', { matchCase: false });
    }

} export default OrdersInvoicesCreditMemosPage