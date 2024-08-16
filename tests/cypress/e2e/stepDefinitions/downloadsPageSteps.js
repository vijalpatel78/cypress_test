const { Then, When } = require('@badeball/cypress-cucumber-preprocessor');

import DownloadsPage from '../pageObjects/downloadsPage';
const downloadsPage = new DownloadsPage();

Then('the following header text should be displayed', (dataTable) => {
    const expectedText = dataTable.rawTable[1].toString();
    //validate the header text
    downloadsPage.getHeaderText().then((displayedText) => {
        expect(displayedText).to.contain(expectedText);
    });
});

Then('user should be displayed {string} text under price list section', (expectedPriceList) => {
    //validate the price list text
    downloadsPage.getCurrentPriceList().then((displayedPriceList) => {
        expect(displayedPriceList.text()).include(expectedPriceList);
    });
});