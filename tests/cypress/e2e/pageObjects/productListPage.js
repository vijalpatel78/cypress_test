const pageHeaderRoot = 'div.page-title-wrapper';
const pageHeader = 'span.base';
const productName = 'a.product-item-link'; 
const breadcrumbValue = '.breadcrumbs > ul > li';
const sortByDropdown = 'select#br-sort';
const filterName = '.filter-item';
const filterOption = '.form-control';
const selectedFilterNameText = '.amshopby-filter-name';
const selectedFilterValueText = '.amshopby-filter-value';
const productList = 'ol[class="products list items product-items"] > li[class="item product product-item"]';
const filterPriceRange = 'li.item.amshopby-item > div.amshopby-filter-value';
const selectedPrice = 'div[class="amshopby-filter-value"]';
const priceFilter = 'div#slider-range > span:nth-child(3)';
const skuCode = 'span.product-sku';
const designerName = 'p.designer';
const productDetails = 'div[class="product details product-item-details"]';
const productSalePrice = 'span[data-price-type="finalPrice"] > span.price';
const productOriginalPrice = 'span[data-price-type="oldPrice"] > span.price';
const nextPage = 'li.item.pages-item-next > a[title="Next"]';
const pagination = 'ul.items.pages-items';
const productImage = 'a span.product-image-wrapper img[src]:not([src=""])'; 
const productDesignerName = 'p.designer';
const productVariantRoot = 'div.product-item-variation-carousel-wrapper';
const productImageSection = 'a.product.photo.product-item-photo';
const productVariantLink = 'a.view-more';
const clearAll = 'a.action.clear.filter-clear';
const removeIcon = 'a.amshopby-remove';
const applyPriceBtn = 'button#submit-range';
const allDesignerImages = 'div.pagebuilder-column img[src][class="pagebuilder-mobile-hidden"]:not([src=""])';
const allDesignerNames = 'div.pagebuilder-column > div[data-content-type="text"] a';
const allInspirationProductImages = 'div.slick-track div.image img[src]:not([src=""])';
const allInspirationProductTitles = 'div.slick-track span.highlight';
const tradePriceLabel = 'span.special-price span.price-label';
const tradePrice = 'span.special-price span.price';
const retailPrice = 'span.old-price span.price';
const minimumPrice = 'input#min-price';
const maximumPrice = 'input#max-price';
const applyButton = 'button#submit-range';

let selectedFilterPrice, maxFilterPrice;

class ProductListPage {

    getPageHeader () {
        return cy.get(pageHeaderRoot).find(pageHeader);
    }

    clickProductName (value) {
        cy.get(productName).contains(value, {matchCase: false}).scrollIntoView().click({force: true});
        cy.waitForSearchBox();
    }

    getPLPTitle () {
        cy.waitForSearchBox();
        return cy.title();
    }

    getProductListPageUrl () {
       return cy.url();
    }

    getBreadcrumbValue () {
        cy.get(breadcrumbValue).should('be.visible');
        return cy.getListElement(breadcrumbValue, " / ");       
    }

    getSortByDropdownValue () {
        return cy.get(sortByDropdown).find(':selected').invoke('text').then((selectedText) => {      
            let selectedDropdownValue = selectedText.trim();
            return selectedDropdownValue;
        });
    }

    clickOnFilterOfProductListPage (filter) {
        cy.waitForSearchBox();
        cy.contains(filterName, filter, {matchCase: false}).click();
    }

    clickFilterOption (filterValue) {
        cy.contains(filterOption, filterValue, {matchCase: false}).click();
        cy.wait(4000);
    }

    getSelectedFilterOption () {
        cy.waitForSearchBox();
        return cy.get(selectedFilterNameText).invoke('text').then((filterName) => {
            let selectedFilterNameText = filterName.trim();    
            return cy.get(selectedFilterValueText).invoke('text').then((filterValue) => {
                let selectedFilterValueText = filterValue.trim();
                return selectedFilterNameText + " : " + selectedFilterValueText;
            });
        });       
    }
    
    getAllFilterText () {      
        cy.get(filterName).children('.filter-link').should('be.visible').as('allFilterName');
        return cy.getListElement('@allFilterName', ",");      
    }

    getProductList () {
        return cy.get(productList);
    }

    selectPriceFilterBySlider () {
        cy.get(priceFilter).invoke("attr","style","left: 41.5682%; background: rgb(255, 85, 2);")
        .trigger("mousedown", { which: 1 })
        .trigger("mousemove")
        .trigger("mouseup");
    }

    /*getFilterPriceRange () {
        return cy.get(filterPriceRange) 
        .invoke('attr', 'data-value') 
        .then((filterText) => {
            const priceText = filterText;
            const filterPriceRange = priceText;           
            return filterPriceRange;
        });
    }*/

    getFilterPriceRange () {
        return cy.get('[title="$17364.98"]') .invoke('attr', 'title') .then((filterText) => {
            return filterText.replace('$','').trim();
        });
    }

    getSelectedFilterPriceRange () {
        return cy.get('[title="$17364.98"]') .invoke('attr', 'title') .then((filterText) => {
            const priceText = filterText;
            selectedFilterPrice = priceText;           
            return selectedFilterPrice;
        });
    }

    getMaxFilterPriceRange () {
        return cy.get('[title="$44999"]') .invoke('attr', 'title') .then((filterText) => {
            const priceText = filterText;
            maxFilterPrice = priceText;           
            return maxFilterPrice;
        });
    }

    /*getPriceFilter () {
        return cy.get(selectedPrice) 
        .invoke('attr', 'value') 
        .then((price) => {
            const selectedPriceRange = price.trim();          
            return selectedPriceRange;
        });
    }*/

    getPriceFilter () {
        return cy.get(selectedPrice).then((price) => {
            const selectedPriceRange = price.text().trim();          
            return selectedPriceRange;
        });
    }

    getProductName (skuCodeValue) {
        cy.contains(skuCode, skuCodeValue, {matchCase: false}).parent(productDetails).scrollIntoView();
        return cy.contains(skuCode, skuCodeValue, {matchCase: false}).parent(productDetails).find(productName).should('be.visible')
        .scrollIntoView().then((displayedProductName) => {
            return displayedProductName.text().trim().toLowerCase();
        });
    }

    getSkuCode (skuCodeValue) {
        cy.contains(skuCode, skuCodeValue, {matchCase: false}).parent(productDetails).scrollIntoView();
        return cy.contains(skuCode, skuCodeValue, {matchCase: false}).parent(productDetails).find(skuCode).scrollIntoView()
        .then((displayedSkuCode) => {
            return displayedSkuCode.text().trim();
        });
    }

    getUKSkuCode (skuCodeValue) {
        cy.contains(skuCode, skuCodeValue, {matchCase: false}).parent(productDetails).scrollIntoView();
        return cy.contains(skuCode, skuCodeValue, {matchCase: false}).parent(productDetails).find(skuCode).scrollIntoView()
        .then((displayedSkuCode) => {
            return displayedSkuCode.text().trim().replace('EU-','');
        });
    }

    getDesignerName (skuCodeValue) {
        cy.contains(skuCode, skuCodeValue, {matchCase: false}).parent(productDetails).scrollIntoView();
        return cy.contains(skuCode, skuCodeValue, {matchCase: false}).parent(productDetails).find(designerName).scrollIntoView()
        .then((displayedDesignerName) => {
            return displayedDesignerName.text().trim();
        });
    }

    getProductSalePrice (skuCodeValue) {    
        cy.contains(skuCode, skuCodeValue, {matchCase: false}).parent(productDetails).scrollIntoView();
        return cy.contains(skuCode, skuCodeValue, {matchCase: false}).parent(productDetails).find(productSalePrice)
        .should('be.visible').then((displayedSalePrice) => {
            const price = displayedSalePrice.text().trim();          
            const numberValue = parseFloat(price.replace(/[$£€]/g, ''));       
            if(numberValue > 0)
            {
                return displayedSalePrice.text().trim();
            } 
            else {
                throw new Error(`The price is not valid`);
            }
        });
    }

    clickProductCode (skuCodeValue) {
        cy.contains(skuCode, skuCodeValue, {matchCase: false}).parent(productDetails).scrollIntoView();
        cy.contains(skuCode, skuCodeValue, {matchCase: false}).parent(productDetails).find(productName).click({force: true});
        cy.waitForSearchBox();
    }

    getProductOriginalPrice (skuCodeValue) {
        cy.contains(skuCode, skuCodeValue, {matchCase: false}).parent(productDetails).scrollIntoView();
        return cy.contains(skuCode, skuCodeValue, {matchCase: false}).parent(productDetails).find(productOriginalPrice)
        .then((displayedOriginalPrice) => {
            return displayedOriginalPrice.text().trim();
        });
    }

    getSelectedFilterName (filterName) {
        cy.waitForSearchBox();
        cy.wait(2000);
        return cy.contains(selectedFilterNameText, filterName, { matchCase: false }).should('be.visible').invoke('text')
        .then((displayedFilterName) => {
            return displayedFilterName.trim();
        });       
    }

    getSelectedFilterValue (filterName) {
        return cy.contains(selectedFilterNameText, filterName, { matchCase: false }).siblings(selectedFilterValueText)
        .should('be.visible').invoke('text').then((displayedFilterValue) => {
            return displayedFilterValue.trim();
        });       
    }

    getSelectedPriceFilterValue (filterName) {
        return cy.contains(selectedFilterNameText, filterName, { matchCase: false }).siblings(selectedFilterValueText);     
    }

    getNextPage () {
        cy.get(pagination).scrollIntoView();
        return cy.get(nextPage);
    }

    getProductCodeList () {
        return cy.get(skuCode);
    }

    getAllProductNames () {
        return cy.get(productList).find(productName);     
    }

    getAllProductImages () {
        cy.waitForSearchBox();
        return cy.get(productList).find(productImage);     
    }

    getProductDesignerName (skuCodeValue) {
        cy.contains(skuCode, skuCodeValue, {matchCase: false}).parent(productDetails).scrollIntoView();
        return cy.contains(skuCode, skuCodeValue, {matchCase: false}).parent(productDetails).find(productDesignerName)
        .should('be.visible').then((displayedDesignerName) => {
            return displayedDesignerName.text().trim();
        });
    }

    mouseHoverProductImage (baseSKUCode) {
        cy.waitForSearchBox();
        cy.contains(skuCode, baseSKUCode, {matchCase: false}).parent(productDetails).siblings(productImageSection)
        .trigger('mouseover');
    }

    mouseHoverProductVariantSKUCode (baseSKUCode, variantSKUCode) {
        this.mouseHoverProductImage(baseSKUCode);
        cy.contains(skuCode, baseSKUCode, {matchCase: false}).parent(productDetails).siblings(productVariantRoot)
        .find('a[data-clp-finish]:is([data-clp-sku*="'+variantSKUCode+'" i])').trigger('mouseover', {force: true});
        cy.wait(3000);
    }

    getBaseProductImage (productNameValue, imageName) {
        return cy.contains(productName, productNameValue, {matchCase: false}).parents(productDetails).siblings(productImageSection)
        .find('span.product-image-wrapper > img[src]:is([src*="'+imageName+'" i])');     
    }

    getProductSKUCode (productNameValue) {
        return cy.contains(productName, productNameValue, {matchCase: false}).parents(productDetails).find(skuCode)
        .should('be.visible');
    }

    getProductPrice (productNameValue) { 
        return cy.contains(productName, productNameValue, {matchCase: false}).parents(productDetails).find(productSalePrice).then((displayedProductSalePrice) => {
            const price = displayedProductSalePrice.text().trim();          
            const numberValue = parseFloat(price.replace(/[$£€]/g, ''));       
            if(numberValue > 0)
            {
                return displayedProductSalePrice;
            } 
            else {
                throw new Error(`The price is not valid`);
            };
        });
    }

    getProductVariantLink (productNameValue) { 
        return cy.contains(productName, productNameValue, {matchCase: false}).parents(productDetails).find(productVariantLink)
        .should('be.visible');
    }

    getProductOldPrice (productNameValue) {
        return cy.contains(productName, productNameValue, {matchCase: false}).parents(productDetails).find(productOriginalPrice).then((displayedProductOriginalPrice) => {
            const price = displayedProductOriginalPrice.text().trim();          
            const numberValue = parseFloat(price.replace(/[$£€]/g, ''));       
            if(numberValue > 0)
            {
                return displayedProductOriginalPrice;
            } 
            else {
                throw new Error(`The price is not valid`);
            };
        });
    }

    getClearAllOption () {
        return cy.get(clearAll);
    }

    getRemoveIcon () {
        return cy.get(removeIcon);
    }

    clickApplyPriceBtn () {
        cy.get(applyPriceBtn).click();
    }

    clickGivenFilterOption (filter, option) {
        cy.contains(filterName, filter, {matchCase: false}).find(filterOption).contains(option,{matchCase: false}).click();
        cy.wait(4000);
    }
    
    getPageUrl () {
        return cy.url();
    }

    getAllDesignerImages () {
        cy.waitForSearchBox();
        return cy.get(allDesignerImages).filter(':visible');     
    }

    getAllDesignerNames () {
        return cy.get(allDesignerNames).filter(':visible');    
    }
     
    getAllInspirationProductTitles () {
        return cy.get(allInspirationProductTitles);     
    }

    getAllInspirationProductImages () {
        cy.waitForSearchBox();
        return cy.get(allInspirationProductImages);     
    }

    clickProductImage (baseSKUCode) {
        cy.waitForSearchBox();
        cy.contains(skuCode, baseSKUCode, {matchCase: false}).parent(productDetails).siblings(productImageSection).click();
    }

    clickViewAdditionalFinishesLink (baseSKUCode) { 
        cy.waitForSearchBox();
        cy.contains(skuCode, baseSKUCode, {matchCase: false}).parents(productDetails).find(productVariantLink).click();
    }

    getTradePriceLabel () {
        cy.get(tradePriceLabel).should('be.visible');
        return cy.getListElement(tradePriceLabel, ',');
    }

    getTradePrice () {
        return cy.get(tradePrice);
    }

    getRetailPrice () {
        return cy.get(retailPrice);
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

} export default ProductListPage