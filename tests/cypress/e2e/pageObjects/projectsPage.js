const projectGridLoader = 'div.admin__data-grid-loading-mask';
const projectListRow = 'table.data-grid.table > tbody > tr';
const yesDeleteProjectBtn = 'button.action-primary.action-accept';
const projectName = 'td[data-th="Project Name"] span';
const deleteProjectLink = 'td[data-th="Action"] li > a[data-action="item-delete"]';
const successMsg = 'div [class="page messages"] div[class="messages"]';
const projectDeletedMsg = 'Selected projects has been deleted.';
const projectNameList = 'table.data-grid.table > tbody > tr > td[data-th="Project Name"] a[title="Rename Project"] > span';
const createNewProjectButton = 'a#wishlist-create-button > span';
const projectNameTextBox = 'input#wishlist-name';
const createNewProject = 'button[title="Save"]';
const projectCheckbox = 'td.data-grid-checkbox-cell > label.data-grid-checkbox-cell-inner';
const deleteSelectedButton = 'button.btn.btn-secondary.action-menu-item.wishlist-delete';
const projectDetailsPageHeader = 'form#wishlist-view-form div.wishlist-title > strong';
const viewProjectLink = 'td[data-th="Action"] li > a[data-action="item-view"]';
const projectRenameTextBox = 'form#edit-wishlist-form input[name="name"]';
const saveProjectPopupBtn = 'button.btn.btn-primary.rename-popup > span';
const topHeaders = 'div#block-collapsible-nav > ul > li';
const paginationDropdown = 'select[data-role="limiter"]';
const itemCount = 'span.toolbar-number > span';
const productRemoveLink = 'div.itemaction > a[title="Remove"] > span';
const emptyList = 'div.message.info.empty > span:nth-child(1)';
const emptyMsg = 'You have no items in your project.';
const addToCart = 'button[title="Add to Cart"]';
const productEditLink = 'div.itemaction > a.action.edit > span';
const finish = 'div[title="Finish"] > span';
const productQty = 'input[data-role="qty"]';
const newProjectNameTextBox = 'form#create-wishlist-form input[name="name"]';
const productShipByDate = 'div[title="Availability"] > span';
const productCheckbox = 'td[data-row="product-item"] > input[data-role="select-product"]';
const moveToProjectLink = 'div.wishlist-share-action > div.wishlist-dropdown.move > span';
const moveToProjectLinkOptions = 'div.wishlist-dropdown.move.active > ul > li > span';
const moveToProjectButton = 'span.move-project > span';
const moveToProjectButtonOptions = '#wishlists-move > .items > li';
const productNameList = 'div.itemdescriptionright > strong.product-item-name > a';
const copyToProjectButton = 'span.copy-project > span';
const copyToProjectButtonOptions = '#wishlists-copy > .items > li';
const copyToProjectLink = 'div.wishlist-share-action > div.wishlist-dropdown.copy > span';
const copyToProjectLinkOptions = 'div.wishlist-dropdown.copy.active > ul > li > span';

class ProjectsPage {

    waitForProjectListLoad () {
        cy.get(projectGridLoader).should('not.be.visible');
    }

    clickDeleteProjectLink (projectNameValue) {
        cy.contains(projectName, projectNameValue).parents(projectListRow).find(deleteProjectLink).click();
    }

    clickYesDeleteProjectButton () {
        cy.get(yesDeleteProjectBtn).click();
    }

    getSuccessMsg () {
        return cy.get(successMsg);
    }

    deleteSpecificProject (projectNameValue) {
        let list = [];

        this.waitForProjectListLoad();

        cy.get(projectNameList).then((nameList) => {
            list = nameList.text().trim().toLowerCase();

            if (list.includes(projectNameValue.toLowerCase())) {
                this.clickDeleteProjectLink(projectNameValue);
                this.clickYesDeleteProjectButton();
                this.getSuccessMsg().should('be.visible').then((msg) => {
                    expect(msg.text().trim().toLowerCase()).to.be.contain(projectDeletedMsg.toLowerCase());
                });
            } else {
                cy.log('The provided ' + projectNameValue + ' project name is not found.');
            }
        });
    }

    getProjectsPageTitle () {
        cy.waitForSearchBox();
        return cy.title();
    }

    clickCreateNewProjectButton () {
        cy.get(createNewProjectButton).click();
    }

    enterProjectName (name) {
        cy.get(projectNameTextBox).clear().type(name);
    }

    clickCreateNewProject () {
        cy.get(createNewProject).click();
    }

    addNewProject (projectNameValue) {
        let list = [];

        this.waitForProjectListLoad();

        cy.get(projectNameList).then((nameList) => {
            list = nameList.text().trim().toLowerCase();

            if (list.includes(projectNameValue.toLowerCase())) {
                cy.log('The provided ' + projectNameValue + ' project name is found.');
            } else {
                this.clickCreateNewProjectButton();
                this.enterProjectName(projectNameValue);
                this.clickCreateNewProject();
                this.getSuccessMsg().should('contain.text', 'Project \"' + projectNameValue + '\" was saved.');
                cy.go('back');
            }
        });
    }

    getProjectNameList () {
        return cy.get(projectNameList);
    }

    clickProjectCheckbox (projectNameValue) {
        this.waitForProjectListLoad();
        cy.contains(projectName, projectNameValue).parents(projectListRow).find(projectCheckbox).click();
    }

    clickDeleteSelectedButton () {
        cy.contains(deleteSelectedButton, 'Delete Selected', {matchCase: false}).click();
    }

    getProjectDetailsPageHeader () {
        return cy.get(projectDetailsPageHeader);
    }

    clickViewProjectLink (projectNameValue) {
        cy.contains(projectName, projectNameValue).parents(projectListRow).find(viewProjectLink).click();
    }

    clickProjectName (projectNameValue) {
        this.waitForProjectListLoad();
        cy.contains(projectName, projectNameValue).click();
    }

    enterProjectRename (name) {
        cy.get(projectRenameTextBox).should('be.visible').clear().type(name);
    }

    clickSaveProjectPopupButton () {
        cy.get(saveProjectPopupBtn).click();
    }

    getTopHeaders () {
        cy.waitForSearchBox();
        return cy.getListElement(topHeaders, ",");    
    }

    getSelectedPaginationDropdownOption () {
        cy.get(paginationDropdown).scrollIntoView();
        return cy.get(paginationDropdown).invoke('find', ':selected').then((selectedOption) => {
            return selectedOption.text().trim().toLowerCase();
        });
    }

    getItemCount () {
        this.waitForProjectListLoad();
        cy.get(itemCount).scrollIntoView();
        return cy.get(itemCount).then((count) => {
            return count.text().replace('Item(s)', '').trim();
        });   
    }

    selectPaginationDropdownOption (option) {
        cy.get(paginationDropdown).select(option);
        this.waitForProjectListLoad();
    }

    clickRemoveLinkOfProduct () {
        cy.waitForSearchBox();
        cy.wait(5000); //added static wait because of js load issue
        cy.get(productRemoveLink).should('be.visible').click();
    }

    getEmptyListMsg () {
        return cy.get(emptyList).should('have.text', emptyMsg);  
    }

    clickAddToCart () {
        cy.waitForSearchBox();
        cy.get(addToCart).should('be.visible').click();
    }

    clickEditLinkOfProduct () {
        cy.waitForSearchBox();
        cy.get(productEditLink).should('be.visible').click();
    }

    getProductFinish () {
        return cy.get(finish).then((displayedProductFinish) => {
            return displayedProductFinish.text().toLowerCase().replace('finish:','').trim();
        });
    }

    getProductQty () {
        return cy.get(productQty).invoke('attr', 'value');
    }

    getNoItemsMsg () {
        return cy.get(emptyList);  
    }    

    enterNewProjectName (name) {
        cy.get(newProjectNameTextBox).should('be.visible').clear().type(name);
    }

    getProductShipByDate () {
        cy.get(productShipByDate).should('be.visible').should('include.text', 'ship').should('include.text', 'by').as('productShipByDate');

        return cy.get('@productShipByDate').then((displayedShipByDateText) => {
            const shipByDate = displayedShipByDateText.text().trim().match(/(\d{2}\.\d{2}\.\d{2})/);
            return shipByDate[0];
        });
    }

    clickMoveToProjectLink () {
        cy.waitForSearchBox();
        cy.wait(2000); //added static wait because of js load issue
        cy.get(moveToProjectLink).should('be.visible').click();
    }

    clickProjectNameFromMoveToProjectLinkOptions (name) {
        cy.contains(moveToProjectLinkOptions, name, {matchCase: false}).click({force: true});
    }

    getProductNameList () {
        cy.get(productNameList).should('be.visible');
        return cy.getListElement(productNameList, ', ');
    }

    getProductPrice (productName) {
        return cy.contains(productNameList, productName, {matchCase: false}).parents('tr').children('td:nth-child(3)')
        .should('be.visible').scrollIntoView().then((displayedProductPrice) => { 
            return displayedProductPrice.text().trim();
        });
    }

    clickProductCheckbox () {
        cy.waitForSearchBox();
        cy.get(productCheckbox).click({ force: true });
    }

    clickMoveToProjectButton () {
        cy.waitForSearchBox();
        cy.wait(2000); //added static wait because of js load issue
        cy.get(moveToProjectButton).should('be.visible').click();
    }

    clickProjectNameFromMoveToProjectButtonOptions (name) {
        cy.contains(moveToProjectButtonOptions, name, {matchCase: false}).should('be.visible').click();
    }

    clickCopyToProjectButton () {
        cy.waitForSearchBox();
        cy.wait(2000); //added static wait because of js load issue
        cy.get(copyToProjectButton).should('be.visible').click();
    }

    clickProjectNameFromCopyToProjectButtonOptions (name) {
        cy.contains(copyToProjectButtonOptions, name, {matchCase: false}).should('be.visible').click();
    }

    clickCopyToProjectLink () {
        cy.waitForSearchBox();
        cy.wait(2000); //added static wait because of js load issue
        cy.get(copyToProjectLink).should('be.visible').click();
    }

    clickProjectNameFromCopyToProjectLinkOptions (name) {
        cy.contains(copyToProjectLinkOptions, name, {matchCase: false}).click({force: true});
    }

} export default ProjectsPage