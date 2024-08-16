const addNewUserBtn = 'button[title="Add New User"]';
const jobTitle = 'input#jobtitle';
const firstName = 'input#firstname';
const lastName = 'input#lastname';
const email = 'input#email';
const phoneNumber = 'input#telephone';
const saveBtn = 'button.btn.btn-primary.rename-popup';
const successMsg = 'div.messages > div[data-ui-id="message-success"] > div';
const loader = 'div.loader > img';
const emailList = 'td[data-th="Email"] > div';
const listLoader = 'div.admin__data-grid-loading-mask';
const nameList = 'td[data-th="Name"] > div';
const deleteUserLink ='td[data-th="Actions"] > a[data-action="item-delete"]';
const deleteBtn = 'button.action.primary.delete > span';
const deleteUserMsg = 'The customer was successfully deleted.';
const editUserLink ='td[data-th="Actions"] > a[data-action="item-edit"]';
const paginationDropdown ='div.control > select.limiter-options';
const usersGridLoader = 'div.admin__data-grid-loading-mask';
const itemCount = 'span.toolbar-number > span';
const usersList = 'table.data-grid.table > tbody > tr > td[data-th="Name"]';
const status = '#status';
const inActiveUserLink = 'button.action.action-secondary:nth-child(3) > span:nth-child(1)';
const userStatus = 'td[data-th="Status"] > div';
const inActiveUsersLink = 'button.action.action-secondary:nth-child(3) > span:nth-child(1)';
const showAllUsersLink = 'div.data-grid-filters-wrap._show > button.action.action-clear:nth-child(4)';
const activeUsersLink = 'button.action.action-secondary:nth-child(2) > span:nth-child(1)';
const userListingLoader = '.admin__data-grid-loading-mask';

class CompanyUsersPage {

    clickAddNewUserBtn () {
        cy.waitForSearchBox();
        cy.get(addNewUserBtn).should('be.visible').click();
    } 

    enterFirstName (value) {
        cy.get(firstName).should('be.visible').clear().type(value);
    }

    enterLastName (value) {
        cy.get(lastName).should('be.visible').clear().type(value);
    }

    enterEmail (value) {
        return cy.createUniqueEmail(value).then((emailAddress) => {
            return cy.get(email).should('be.visible').clear().type(emailAddress).then(() => {
                return emailAddress;
            });
        });
    }

    enterJobTitle (value) {
        cy.get(jobTitle).should('be.visible').clear().type(value);
    }

    enterPhoneNumber (value) {
        cy.get(phoneNumber).should('be.visible').clear().type(value);
    }

    selectStatus () {
        cy.get(status).should('be.visible').select('Inactive');
    }

    clickInactiveUser () {
        cy.get(inActiveUserLink).should('be.visible').click();
    } 

    clickSaveBtn () {
        cy.get(saveBtn).should('be.visible').click();
        cy.get(loader).should('not.be.visible');
        cy.get(saveBtn).should('not.be.visible');
    } 

    getSuccessMsg (msgText) {
        cy.scrollTo('top');
        return cy.contains(successMsg, msgText, { matchCase: false }).then((displayedMsg) => {
            return displayedMsg.text().trim();
        });
    }

    getEmailList () {
        cy.get(listLoader).should('not.be.visible');  
        return cy.getListElement(emailList, ',');
    }

    getNameList () {
        return cy.getListElement(nameList, ',');
    }

    deleteUser (userEmail) {
        this.clickDeleteLink(userEmail);
        this.clickDeleteBtn();
        cy.get(listLoader).should('not.be.visible');  
        this.getDeletedUser(userEmail).should('not.exist');
        this.getSuccessMsg(deleteUserMsg).then((msg) => {
            expect(msg).contain(deleteUserMsg);
        });
    }

    clickEditLink (userEmail) {
        cy.contains(emailList, userEmail, { matchCase : false }).parents('tr').find(editUserLink).click();
    } 

    clickDeleteLink (userEmail) {
        cy.contains(emailList, userEmail, { matchCase : false }).parents('tr').find(deleteUserLink).click();
    } 

    clickDeleteBtn () {
        cy.get(deleteBtn).should('be.visible').click();
    } 

    getDeletedUser (userEmail) {
        return cy.contains(emailList, userEmail, { matchCase : false });
    }

    getUserEmailList () {
        return cy.get(emailList);
    }

    getPagination () {
        return cy.get(paginationDropdown).scrollIntoView();
    }

    waitForUsersListLoad () {
        cy.get(usersGridLoader).should('not.be.visible');
    }

    getItemCount () {
        this.waitForUsersListLoad();
        cy.get(itemCount).scrollIntoView();
        return cy.get(itemCount).then((count) => {
            return count.text().replace('Item(s)', '').trim();
        });
    }

    getUsersList () {
        return cy.get(usersList);
    }
    
    getUserStatus (userEmail) {
        return cy.contains(emailList, userEmail, { matchCase : false }).parents('tr').find(userStatus)
        .then((displayedStatus) => {
            return displayedStatus.text().trim();
        });
    }
    
    clickShowAllUser () {
        cy.get(showAllUsersLink).should('be.visible').click();
    } 

    getInactiveUsersLinkTxt () {
       return cy.get(inActiveUsersLink).then(($InactiveUsersLinkTxt) => {
           return $InactiveUsersLinkTxt.text(); 
        });
    }

    getActiveUsersLinkTxt () {
        return cy.get(activeUsersLink).then(($ActiveUsersLinkTxt) => {
            return $ActiveUsersLinkTxt.text(); 
        });
    }

    clickActiveUser () {
        cy.get(activeUsersLink).should('be.visible').click();
    }

    getActiveUserStatus () {
        cy.get(userListingLoader).should('not.be.visible');
        return cy.getListElement(userStatus, ',');
    }

    getInactiveUserStatus () {
        cy.get(userListingLoader).should('not.be.visible');
        return cy.getListElement(userStatus, ',');
    }
    
} export default CompanyUsersPage