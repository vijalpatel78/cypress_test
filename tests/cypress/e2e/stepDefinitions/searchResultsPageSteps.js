const { When, Then } = require ('@badeball/cypress-cucumber-preprocessor');

import HeaderPage from '../pageObjects/headerPage';
import SearchResultsPage from '../pageObjects/searchResultsPage';

const header = new HeaderPage();
const search = new SearchResultsPage();

let productName, sku;

When('user press enter key', () => {
    //press enter key
    header.pressEnterKey();
});

Then('search results page of {string} should get opened', (searchText) => {
    //validate search results page url
    search.getSearchPageUrl().then((currentUrl) => {
        expect(currentUrl.endsWith(searchText), 'Navigate to url - ' + currentUrl).to.be.true;
        cy.validateBaseURL();
    });   

    //validate whether the search results contain search text or not
    search.getSearchResultsText().should('contain.text', searchText);
});

Then('search results text should contain {string}', (searchText) => {
    //validate whether the search results contain search text or not
    search.getSearchResultsText().should('contain.text', searchText);
});

Then('{int} products should be displayed on the first page of search results', (numberOfProducts) => {
    //validate 48 products on the search results page
    search.getProductList().should('have.length',numberOfProducts);
});

When('user navigate to the search results page of {string}', (searchText) => {
    //validate search results page url
    search.getSearchPageUrl().then((currentUrl) => {
        expect(currentUrl.endsWith(searchText), 'Navigate to url - ' + currentUrl).to.be.true;
        cy.validateBaseURL();
    }); 

    //validate whether the search results contain search text or not
    search.getSearchResultsText().should('contain.text', searchText);
}); 

Then('the following product details should be displayed on the product card of {string}', (skuCode, dataTable) => {
    const validLabel = ['Product Name', 'Designer Name', 'SKU Code', 'Price', 'Original Price', 'View More Link'];

    //find the given product code
    cy.findProductCode(skuCode);

    cy.getCountry().then((testingCountry) => {        
        for (let i = 1; i < dataTable.rawTable.length; i++) {
            const country = dataTable.rawTable[i][0].toLowerCase();
            const label = dataTable.rawTable[i][1].toLowerCase();
            const expectedValue = dataTable.rawTable[i][2];          
  
            //validate product details displayed on the product card
            if (testingCountry === country) {
                switch (label) {
                    case 'product name':
                        cy.validateDisplayedText(search.getProductName(skuCode), expectedValue);
                        break;
                    case 'designer name':
                        cy.validateDisplayedText(search.getDesignerName(skuCode), expectedValue);
                        break;
                    case 'sku code':
                        cy.validateDisplayedText(search.getProductCode(skuCode), expectedValue);
                        break;
                    case 'price':
                        search.getProductSalePrice(skuCode).should('be.visible');
                        break;               
                    case 'original price':
                        search.getProductOriginalPrice(skuCode).should('be.visible');
                        break;
                    case 'view more link':
                        cy.validateDisplayedText(search.getProductViewMoreLink(skuCode), expectedValue);
                        break;
                    default:
                        throw new Error(`The provided '${label}' label is not valid. Valid options are ${validLabel.join(', ')}.`);
                }
            }
        }
    });
});

Then('pagination should be available at the bottom of page', () => {
    //validate whether the pagination is available or not
    search.getPagination().should('exist').should('be.visible');
});

When('user search the following sku code', (dataTable) => {
    cy.getCountry().then((testingCountry) => {   
        dataTable.hashes().forEach((row) => {
            const country = row.country.toLowerCase();
            const skuCode = row.skuCode;

            if (testingCountry === country) {
                //enter the sku in search box
                header.enterSearchText(skuCode);
            }
        });
    });
});

When('user click on {string} link of selected filter', (linkName) => {
    //click on clear all link or x icon    
    if (linkName.toLowerCase() === 'clear all') {
        search.clickOnClearAllLink();   
    } else if (linkName.toLowerCase() === 'x icon') {
        search.clickOnXIcon();
    } else {
        throw new Error(`The provided '${linkName}' is not valid. Valid name is Clear All or X Icon.`);
    }
});

Then('selected filter should be removed', () => {
    //validate whether the selected filter name is exist or not
    search.getSelectedFilter().should('not.exist');
});

When('user mouse hover on the following variant sku of the following product name', (dataTable) => {
    productName = '';

    cy.getCountry().then((testingCountry) => {        
        for (let i = 1; i < dataTable.rawTable.length; i++) {
            const country = dataTable.rawTable[i][0].toLowerCase();
            const productNameValue = dataTable.rawTable[i][1].toLowerCase();
            const variantSKUCode = dataTable.rawTable[i][2].toLowerCase();

            if (testingCountry === country) { 
                //mouse hover on the given variant
                search.mouseHoverProductVariantSKUCode(productNameValue, variantSKUCode);
                productName = productNameValue;
            } 
        }
    });
});

Then('the {string} text should be displayed on the product card', (expectedLinkName) => {
    //validate the view link text should get changed as per the selected variant
    search.getProductVariantLink(productName).should('have.text', expectedLinkName);
});

Then('search results page of the following sku code should get opened', (dataTable) => {
    cy.getCountry().then((testingCountry) => {   
        dataTable.hashes().forEach((row) => {
            const country = row.country.toLowerCase();
            const skuCode = row.skuCode;

            if (testingCountry === country) {   
                //validate whether the page title contains the given sku or not
                search.getSRPTitle().should('contain', skuCode);
                cy.validateBaseURL();

                //validate whether the search results contain the given sku or not
                search.getSearchResultsText().should('be.visible').should('contain.text', skuCode);
                sku = skuCode;
            } 
        });
    }); 
});

Then('the {string} badge should be displayed on the given sku code', (expectedBadgeName) => {
    //validate the given badge name should be displayed on the product card
    search.getProductBadgeName(sku).should('have.text', expectedBadgeName);
});

When('user enter {string} min price and {string} max price on search results page', (minPrice, maxPrice) => {     
    // enter max and min price 
    search.enterMinPrice(minPrice);
    search.enterMaxPrice(maxPrice);
});

When('user click on apply button on search results page', () => {     
    // click on apply button
    search.clickApplyButton();
});

Then('user should be able to see list of product contain {string}', (searchKeyword) => {
    //validate the product list contain search keyword
    search.getProductList().should('contain.text', searchKeyword)
});

Then('user should be able to see {string} recommended search terms in a drop-down', (searchKeyword) => {
    //validate the recommended search terms is displayed
    search.getRecommendedSearch().should('be.visible');

    //validate the recommended search contain search keyword
    search.getRecommendedSearchTerms().then((actualListHeaders) => {
        expect(actualListHeaders.toLowerCase()).to.contain(searchKeyword);
    });
});

Then('user should be able to see list of collection product contain {string}', (searchKeyword) => {
    //validate the list of collection product
    search.getCollectionProducts().then((actualCollectionProducts) => {
        actualCollectionProducts.forEach((displayedProductName) => {
            expect(displayedProductName.toLowerCase()).to.contain(searchKeyword.toLowerCase());
        })
    });
});

When('user mouse hover also click on the following sku variant of the following product name', (dataTable) => {
    productName = '';

    cy.getCountry().then((testingCountry) => {        
        for (let i = 1; i < dataTable.rawTable.length; i++) {
            const country = dataTable.rawTable[i][0].toLowerCase();
            const productNameValue = dataTable.rawTable[i][1].toLowerCase();
            const variantSKUCode = dataTable.rawTable[i][2].toLowerCase();

            if (testingCountry === country) { 
                //mouse hover and click on the given variant
                search.mouseHoverAndClickProductVariantSKUCode(productNameValue, variantSKUCode);
                productName = productNameValue;
            } 
        }
    });
});