const currentPriceList = 'div.flex-container > div.image-container > p';
const headerText = 'div.section.section-top > h3:nth-child(1)';
const priceListSection = 'div.section.section-bottom';

class DownloadsPage {

    getHeaderText() {
        return cy.get(headerText).then((validateHeaderText) => {
            return validateHeaderText.text().trim();
        });
    }

    getCurrentPriceList() {
        return cy.contains('Price List').parents(priceListSection).find(currentPriceList);
    }

} export default DownloadsPage