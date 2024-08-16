const accountTitle ='div[class="block block-company-profile-account"] > div > strong';
const accountSection = 'div[class="block block-company-profile-account"]';
const accountBlock = 'div.block-content';
const accountNo = 'p:nth-child(1)';
const accountNameEmail ='p:nth-child(2)';
const contactsTitle ='div[class="block block-company-profile-contacts"] > div > strong';
const companyAdmin ='strong.box-title > span';
const contactInfo ='.block-company-profile-contacts > .block-content > .box > .box-content';
const legalBusinessTitle ='div[class="block block-company-profile-address"] > div > strong';
const businessAddress ='div[class="box box-address-information"] > div > address';
const shippingTitle = 'div[class="block block-company-profile-shipping-methods"] > div > strong';
const availableMethodText = 'span.shipping-methods-label';
const shippingMethodsList = 'ul[class="shipping-methods-list"] > li';

class CompanyProfilePage {

    getAccountTitle () {
        return cy.get(accountTitle).then((displayedText) => {
            return displayedText.text().trim();          
        });
    }

    getAccountNumber () {
        return cy.get(accountBlock).parent(accountSection).find(accountNo).then((displayedText) => {
            return displayedText.text().trim();          
        });
    } 

    getAccountInfo () {
        return cy.get(accountBlock).parent(accountSection).find(accountNameEmail).then((displayedText) => {
            return displayedText.text();          
        });
    }

    getContactsTitle () {
        return cy.get(contactsTitle).then((displayedText) => {
            return displayedText.text().trim();          
        });
    }

    getCompanyAdmin () {
        return cy.get(companyAdmin).then((displayedText) => {
            return displayedText.text().trim();          
        });
    }

    getContactInfo () {
        return cy.get(contactInfo).then((displayedText) => {
            return displayedText.text();          
        });
    }

    getLegalBusinessTitle () {
        return cy.get(legalBusinessTitle).then((displayedText) => {
            return displayedText.text().trim();          
        });
    }

    getLegalBusinessAddress () {
        return cy.get(businessAddress).then((displayedText) => {
            return displayedText.text().trim();          
        });
    }

    getShippingTitle () {
        return cy.get(shippingTitle).then((displayedText) => {
            return displayedText.text().trim();          
        });
    }

    getAvailableMethodText () {
        return cy.get(availableMethodText).then((displayedText) => {
            return displayedText.text();          
        });
    }

    getShippingMethodsList () {
        return cy.get(shippingMethodsList).filter(':visible').then((displayedText) => {
            return displayedText.text();          
        });
    }

} export default CompanyProfilePage