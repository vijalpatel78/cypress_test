const searchResultsText = 'span[data-ui-id="page-title-wrapper"]';
const productList = 'ol[class="products list items product-items"] > li[class="item product product-item"]';
const productDetails = 'div[class="product details product-item-details"]';
const productName = 'a.product-item-link';
const designerName = 'p.designer';
const skuCode = 'span.product-sku';
const productSalePrice = 'span[data-price-type="finalPrice"] > span.price';
const productOriginalPrice = 'span[data-price-type="oldPrice"] > span.price';
const viewMoreLink = 'a.view-more';
const pagination = 'div.pagination ul.items.pages-items';
const clearAllLink = 'a[class="action clear filter-clear"] > span';
const xIcon = 'a[class="amshopby-remove"]';
const selectedFilter = 'li[class="item amshopby-item"]';
const productImageSection = 'a.product.photo.product-item-photo';
const productVariantRoot = 'div.product-item-variation-carousel-wrapper';
const productVariantLink = 'a.view-more';
const badgeName = 'div.vc-product-badge.clp-badge-label > span';
const minimumPrice = 'input#min-price';
const maximumPrice = 'input#max-price';
const applyButton = 'button#submit-range';
const recommendedSearch = 'ul[class="blm-autosuggest__suggestion-terms"]';
const recommendedSearchTerms = 'li[class="blm-autosuggest__suggestion-term"] > a';

class SearchResultsPage { 

    getSearchPageUrl () {
        return cy.url();
    }  

    getSearchResultsText () {
        return cy.get(searchResultsText);
    }

    getProductList () {
        return cy.get(productList);
    }

    getProductName (skuCodeValue) {
        cy.contains(skuCode, skuCodeValue, {matchCase: false}).parent(productDetails).scrollIntoView();
        return cy.contains(skuCode, skuCodeValue, {matchCase: false}).parent(productDetails).find(productName).scrollIntoView();
    }

    getDesignerName (skuCodeValue) {
        cy.contains(skuCode, skuCodeValue, {matchCase: false}).parent(productDetails).scrollIntoView();
        return cy.contains(skuCode, skuCodeValue, {matchCase: false}).parent(productDetails).find(designerName)
        .should('be.visible').scrollIntoView();
    }

    getProductCode (skuCodeValue) {
        cy.contains(skuCode, skuCodeValue, {matchCase: false}).parent(productDetails).scrollIntoView();
        return cy.contains(skuCode, skuCodeValue, {matchCase: false}).parent(productDetails).find(skuCode);
    }

    getProductSalePrice (skuCodeValue) {
        cy.contains(skuCode, skuCodeValue, {matchCase: false}).parent(productDetails).scrollIntoView();
        return cy.contains(skuCode, skuCodeValue, {matchCase: false}).parent(productDetails).find(productSalePrice);
    }

    getProductOriginalPrice (skuCodeValue) {
        cy.contains(skuCode, skuCodeValue, {matchCase: false}).parent(productDetails).scrollIntoView();
        return cy.contains(skuCode, skuCodeValue, {matchCase: false}).parent(productDetails).find(productOriginalPrice);
    }

    getProductViewMoreLink (skuCodeValue) {
        cy.contains(skuCode, skuCodeValue, {matchCase: false}).parent(productDetails).scrollIntoView();
        return cy.contains(skuCode, skuCodeValue, {matchCase: false}).parent(productDetails).find(viewMoreLink);
    }

    getPagination () {
        return cy.get(pagination).scrollIntoView();
    }

    clickOnClearAllLink () {
        return cy.get(clearAllLink).should('be.visible').click();
    }

    clickOnXIcon () {
        return cy.get(xIcon).should('be.visible').click();
    }

    getSelectedFilter () {
        return cy.get(selectedFilter);
    }

    mouseHoverProductImage (productNameValue) {
        cy.waitForSearchBox();
        cy.contains(productName, productNameValue, {matchCase: false}).parents(productDetails).siblings(productImageSection)
        .trigger('mouseover');
    }

    mouseHoverProductVariantSKUCode (productNameValue, variantSKUCode) {
        this.mouseHoverProductImage(productNameValue);
        cy.contains(productName, productNameValue, {matchCase: false}).parents(productDetails).siblings(productVariantRoot)
        .find('a[data-clp-finish]:is([data-clp-sku="'+variantSKUCode+'" i])').trigger('mouseover', {force: true});
        cy.wait(3000);
    }

    getProductVariantLink (productNameValue) { 
        return cy.contains(productName, productNameValue, {matchCase: false}).parents(productDetails).find(productVariantLink)
        .should('be.visible');
    }

    getProductBadgeName (skuCodeValue) {
        cy.contains(skuCode, skuCodeValue, {matchCase: false}).parents(productList).scrollIntoView();
        return cy.contains(skuCode, skuCodeValue, {matchCase: false}).parents(productList).find(badgeName);
    }

    enterMinPrice (minPrice) {
        cy.get(minimumPrice).clear().should('be.visible').type(minPrice);
    }

    enterMaxPrice (maxPrice) {
        cy.get(maximumPrice).clear().should('be.visible').type(maxPrice);
    }

    clickApplyButton () {
        cy.get(applyButton).scrollIntoView();
        cy.get(applyButton).click();
    }

    getRecommendedSearch () {
        return cy.get(recommendedSearch);
    }

    getRecommendedSearchTerms () {
        return cy.getListElement(recommendedSearchTerms, ",");
    }

    getSRPTitle () {
        cy.waitForSearchBox();
        return cy.title();
    }
    
    getCollectionProducts () {
        return cy.getListElement(productName, ",").then((displayedCollectionProducts) => {
            return displayedCollectionProducts.split(",");
        }); 
    }

    mouseHoverAndClickProductVariantSKUCode (productNameValue, variantSKUCode) {
        this.mouseHoverProductImage(productNameValue);
        cy.contains(productName, productNameValue, {matchCase: false}).parents(productDetails).siblings(productVariantRoot)
        .find('a[data-clp-finish]:is([data-clp-sku*="'+variantSKUCode+'" i])').trigger('mouseover', {force: true}).click({force: true});
        cy.wait(3000);
    }

} export default SearchResultsPage