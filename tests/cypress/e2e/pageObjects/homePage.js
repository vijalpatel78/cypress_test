const homePageTitleUS = 'Signature Designer Light Fixtures | Experience Visual Comfort & Co.';
const homePageTitleUK = 'Signature Designer Lighting | Experience Visual Comfort & Co.';
const homePageTitleEU = 'Signature Designer Lighting | Experience Visual Comfort & Co.';
const countryFlag = 'div.locations-dropdown > span.action.toggle > div';
const usFlagIcon = 'header.page-header div.locations-dropdown > span[data-toggle="dropdown"] > div.flag.flagUS';
const ukFlagIcon = 'header.page-header div.locations-dropdown > span[data-toggle="dropdown"] > div.flag.flagUK';
const euFlagIcon = 'header.page-header div.locations-dropdown > span[data-toggle="dropdown"] > div.flag.flagEU';
const countryDropdownOptions = '.locations-dropdown.active > ul[data-target="dropdown"] span';
const designerColumns = 'div.mega-menu.fullmenu.visible div.sub-category.vscol-4';
const exploreOurProductSection = 'div[class="homepage-explore-products-container"]';
const exploreOurProductSectionHeader = 'div[class="homepage-explore-products-container"] > h2';
const exploreOurProductSectionImages = 'img[src]:not([src=""])';
const exploreOurProductSectionLinks = 'div[class="explore-products-button-link"] > a > span';
const newIntroductionSectionHeader = 'h2[class="homepage-designer-2__heading"]';
const newIntroductionSectionWallImage = 'div[class="pagebuilder-column homepage-new-in-col2"] > figure > a > img[src]:not([src=""])';
const newIntroductionSectionImage = 'div[class="pagebuilder-column homepage-new-in-col-full-width"] > figure > a > img[src]:not([src=""])';
const newIntroductionSection = 'div[class="homepage-new-in-container"]';
const newIntroductionSectionLink = 'span[data-element="link_text"]';
const theSpotlightSectionHeader = 'div[class="homepage-content-tile-container"] > div > h2';
const theSpotlightSectionImages = 'div[class="pagebuilder-column-group"] > div > div > figure';
const theSpotlightReadMoreLink = ':nth-child(4) > p > a > strong';
const theSpotlightContentHeading = 'h2[class="homepage-content-tile__heading"]';
const theSpotlightSection = 'div[class="pagebuilder-column"]';
const theSpotlightAndInspirationGallerySectionHeader = 'div[class="homepage-content-tile-container"] > div > h2';
const inspirationGalleryNameText = 'h2.homepage-content-tile__heading';
const inspirationGalleryImages = 'div[class="pagebuilder-column-line"] > div > figure';
const inspirationGallerySection = 'div.pagebuilder-column';
const inspirationGalleryViewMoreLink = 'div[class="homepage-content-tile__content"] > p > a';

class HomePage {

    getHomePageTitle () {
        return cy.title();
    }

    openHomePageUrl () {
        cy.getBaseUrl().then((baseUrl) => {
            cy.visit(baseUrl);
            cy.waitForSearchBox();
        });
    }

    validateHomePageTitle () {
        cy.getCountry().then((country) => {
            if (country === 'us') {
                this.getHomePageTitle().should('contain', homePageTitleUS);
            } else if (country === 'uk') {
                this.getHomePageTitle().should('contain', homePageTitleUK);
            } else if (country === 'eu') {
                this.getHomePageTitle().should('contain', homePageTitleEU);
            }
        });
    }

    clickCountryFlag () {
        cy.waitForSearchBox();
        cy.get(countryFlag).click();
    }

    getCountryDropdownOptions () {
        return cy.getListElement(countryDropdownOptions, ",");    
    }

    getUSFlagIcon () {
        return cy.get(usFlagIcon);
    }

    getUKFlagIcon () {
        return cy.get(ukFlagIcon);
    }

    getEUFlagIcon () {
        return cy.get(euFlagIcon);
    }

    clickCountryDropdownOption (option) {
        cy.contains(countryDropdownOptions, option, { matchCase: false }).siblings('div.flag').should('be.visible');
        cy.contains(countryDropdownOptions, option, { matchCase: false }).should('be.visible').click();    
    }

    getPageUrl () {
        return cy.url();
    }

    getDesignerColumns () {
        return cy.get(designerColumns);    
    }

    getExploreOurProductSectionHeader () {
        return cy.get(exploreOurProductSectionHeader).filter(':visible').scrollIntoView().then((displayedHeader) => {
            return displayedHeader.text().trim();
        });
    }

    getExploreOurProductSeriesImages () {
        return cy.get(exploreOurProductSectionHeader).parent(exploreOurProductSection).find(exploreOurProductSectionImages).filter(':visible');
    }

    getExploreOurProductSectionLinks () {
        return cy.getListElement(exploreOurProductSectionLinks, ",");    
    }

    clickExploreOurProductsLink (linkName) {
        cy.get(exploreOurProductSectionLinks).contains(linkName, { matchCase: false }).click();
    }

    getNewIntroductionSectionHeader () {
        return cy.get(newIntroductionSectionHeader).should('be.visible').scrollIntoView().then((displayedHeader)  => {
            return displayedHeader.text().trim();
        });
    }

    getNewIntroductionsWallImage () {
        return cy.get(newIntroductionSectionWallImage);
    }

    getNewIntroductionsImages () {
        return cy.get(newIntroductionSectionImage);
    }

    getNewIntroductionLink () {
        return cy.get(newIntroductionSection).find(newIntroductionSectionLink).then((displayedHeader)  => {
            return displayedHeader.text().trim();
        });
    }

    clickNewIntroductionsLink (linkName) {
        cy.get(newIntroductionSection).find(newIntroductionSectionLink).contains(linkName, { matchCase: false }).click();
    }

    getSpotlightAndGallerySectionHeader (sectionName) {
        return cy.get(theSpotlightSectionHeader).contains(sectionName, { matchCase: false }).should('be.visible').scrollIntoView().then((displayedHeader) => {
            return displayedHeader.text().trim();
        });
    }

    getSpotlightSeriesImages () {
        cy.get(theSpotlightSectionHeader).contains('the spotlight', { matchCase: false }).scrollIntoView();
        return cy.get(theSpotlightSectionImages);
    }

    clickSpotlightReadMoreLink (sectionName) {
       cy.get(theSpotlightContentHeading).contains(sectionName, { matchCase: false }).parent(theSpotlightSection).find(theSpotlightReadMoreLink).click();
    }

    getInspirationGalleryImages () {
        cy.get(theSpotlightAndInspirationGallerySectionHeader).contains('inspiration galleries', { matchCase: false }).scrollIntoView();
        return cy.get(inspirationGalleryImages);
    }

    clickViewLinkGallery (name) {
        return cy.get(inspirationGalleryNameText).contains(name, { matchCase: false }).parents(inspirationGallerySection).find(inspirationGalleryViewMoreLink).click();
    }

} export default HomePage