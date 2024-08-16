const { When, Then } = require ('@badeball/cypress-cucumber-preprocessor');

import HomePage from '../pageObjects/homePage';
import HeaderPage from '../pageObjects/headerPage';
import ProductListPage from '../pageObjects/productListPage';

const home = new HomePage();
const header = new HeaderPage();
const productList = new ProductListPage();

When('user opens the home page url', () => {
    //open home page url
    home.openHomePageUrl();
    cy.validateBaseURL();
});

Then('home page should get opened with below title', (dataTable) => {   
    cy.getCountry().then((testingCountry) => {
        for (let i = 1; i < dataTable.rawTable.length; i++) {
            const country = dataTable.rawTable[i][0].toLowerCase();
            const title = dataTable.rawTable[i][1].toString().replace(/ /g, '');
                    
            if (testingCountry === country) {
                //validate home page title
                home.getHomePageTitle().then((actualTitle) => {
                    expect(actualTitle.toLowerCase().replace(/\|/g, '').replace(/ /g, '')).to.eq(title.toLowerCase());    
                    cy.validateBaseURL(); 
                });
            }
        }
    });
});

Then('user should be able to see the below country as default country', (dataTable) => {    
    cy.getCountry().then((testingCountry) => {
        for (let i = 1; i < dataTable.rawTable.length; i++) {
            const country = dataTable.rawTable[i][0].toLowerCase();

            if (testingCountry === country && testingCountry === 'us') {
                //validate the US flag should be displayed
                home.getUSFlagIcon().should('be.visible');
            } else if (testingCountry === country && testingCountry === 'uk') {
                //validate the UK flag should be displayed
                home.getUKFlagIcon().should('be.visible');
            } else if (testingCountry === country && testingCountry === 'eu') {
                //validate the EU flag should be displayed
                home.getEUFlagIcon().should('be.visible');
            }
        }
    });
});

When('user click on the country flag', () => {
    //click on country flag
    home.clickCountryFlag();
});

Then('user should be able to see below available countries in dropdown', (dataTable) => {
    const expectedCountryOptions = dataTable.raw().slice(1).map((row) => row[0]).toString();

    //validate available countries in dropdown
    home.getCountryDropdownOptions().then((actualCountryOptions) => {
        expect(actualCountryOptions).to.eq(expectedCountryOptions);    
    });
});

When('user mouseover on the {string} mega menu', (megaMenu) => {   
    let expectedMegaMenuList;

    cy.fixture('megaMenu.json').then((data) => {
        cy.getCountry().then((testingCountry) => { 
            //get mega menu list from the fixture     
            if (testingCountry === 'us') {    
                expectedMegaMenuList = data.US[0].megaMenu;         
            } else if (testingCountry === 'uk') {
                expectedMegaMenuList = data.UK[0].megaMenu;
            } else if (testingCountry === 'eu') {
                expectedMegaMenuList = data.EU[0].megaMenu; 
            }

            //mouseover on the mega menu if it is available
            if (expectedMegaMenuList.toLowerCase().includes(megaMenu.toLowerCase())) {
                header.mouseoverMegaMenu(megaMenu); 
            } else {
                cy.log(megaMenu + ' mega menu is not available for ' + testingCountry.toUpperCase() + ' country.');   
            }
        });
    });
});

Then('user should be able to see the search bar', () => {
    //validate the search bar visible
    header.getSearchTextbox().should('be.visible');
});

Then('user should be able to see available mega menu', () => {
    let expectedMegaMenuList;

    cy.fixture('megaMenu.json').then((data) => {
        cy.getCountry().then((testingCountry) => {      
            //get mega menu data from the fixture
            if (testingCountry === 'us') {    
                expectedMegaMenuList = data.US[0].megaMenu;         
            } else if (testingCountry === 'uk') {
                expectedMegaMenuList = data.UK[0].megaMenu;
            } else if (testingCountry === 'eu') {
                expectedMegaMenuList = data.EU[0].megaMenu; 
            }

            //validate the mega menu
            header.getMegaMenu().then((displayedMegaMenuList) => {
                expect(displayedMegaMenuList.toLowerCase().replace(/,/g, '').replace(/ /g, '')).to.eq(expectedMegaMenuList.toLowerCase().replace(/,/g, '').replace(/ /g, '')); 
            });
        });
    });
});

Then('user should be able to see all sub option of {string} mega menu', (megaMenu) => {
    let subMenuList, megaMenuList, expectedSubMenuList; 

    cy.fixture('megaMenu.json').then((menuList) => {
        cy.getCountry().then((testingCountry) => {    
            //get mega menu list from the fixture  
            if (testingCountry === 'us') {    
                megaMenuList = menuList.US[0].megaMenu;         
            } else if (testingCountry === 'uk') {
                megaMenuList = menuList.UK[0].megaMenu;
            } else if (testingCountry === 'eu') {
                megaMenuList = menuList.EU[0].megaMenu; 
            }

            //check whether the given mega menu exists in the mega menu list or not
            if (megaMenuList.toLowerCase().includes(megaMenu.toLowerCase())) {
                //get all submenu options of specific country from the fixture
                cy.fixture('subMegaMenu.json').then((list) => {
                    if (testingCountry === 'us') {    
                        subMenuList = list.US[0];         
                    } else if (testingCountry === 'uk') {
                        subMenuList = list.UK[0];
                    } else if (testingCountry === 'eu') {
                        subMenuList = list.EU[0]; 
                    }

                    //get submenu options of given mega menu
                    switch (megaMenu.toLowerCase()) {
                        case 'wall':
                            expectedSubMenuList = subMenuList.wall;
                            break;
                        case 'ceiling':
                            expectedSubMenuList = subMenuList.ceiling;
                            break;
                        case 'table':
                            expectedSubMenuList = subMenuList.table;
                            break;
                        case 'floor':
                            expectedSubMenuList = subMenuList.floor;
                            break;
                        case 'outdoor':
                            expectedSubMenuList = subMenuList.outdoor;
                            break;
                        case 'fans':
                            expectedSubMenuList = subMenuList.fans;
                            break;
                        case 'architectural':
                            expectedSubMenuList = subMenuList.architectural;
                            break;
                        case 'our collections':
                            expectedSubMenuList = subMenuList.ourCollections;
                            break;
                        case 'our designers':
                            expectedSubMenuList = subMenuList.ourDesigners;
                            break;
                        case 'sale':
                            expectedSubMenuList = subMenuList.sale;
                            break;
                        default:
                            throw new Error(`The provided '${megaMenu}' mega menu is not valid.`);
                    }

                    //validate the submenu options of given mega menu
                    if (megaMenu.toLowerCase() === 'sale') {
                        if (testingCountry === 'us') {
                            //get all level submenu options of sale mega menu
                            header.getSubmenuHeader('Sale').then((actualSubmenuHeadersList) => {
                                header.getSubmenuList('Sale').then((actualSubmenusList) => {                   
                                    const actualSubmenuList = actualSubmenuHeadersList.concat(actualSubmenusList);

                                    //validate all level submenu options of sale mega menu
                                    expect(actualSubmenuList.toLowerCase().replace(/,/g, '').replace(/ /g, '')).to.eq(expectedSubMenuList.toLowerCase().replace(/,/g, '').replace(/ /g, ''));                     
                                });
                            });
                        } else {
                            //validate the submenu options of sale mega menu
                            header.getSubmenuList(megaMenu).then((actualSubmenuList) => {
                                expect(actualSubmenuList.toLowerCase().replace(/,/g, '').replace(/ /g, '')).to.eq(expectedSubMenuList.toLowerCase().replace(/,/g, '').replace(/ /g, ''));                     
                            });
                        }
                    } else if (megaMenu.toLowerCase() === 'our collections') {
                        if (testingCountry === 'us') { 
                            //validate the submenu options of our collections mega menu
                            header.getSubmenuList(megaMenu).then((actualSubmenuList) => {
                                expect(actualSubmenuList.toLowerCase().replace(/,/g, '').replace(/ /g, '')).to.eq(expectedSubMenuList.toLowerCase().replace(/,/g, '').replace(/ /g, ''));                     
                            });
                        } else {
                            cy.log('Skipping the validation due to Bug 10647.');
                        }
                    } else {
                        //validate the submenu options of given mega menu
                        header.getSubmenuList(megaMenu).then((actualSubmenuList) => {
                            expect(actualSubmenuList.toLowerCase().replace(/,/g, '').replace(/ /g, '')).to.eq(expectedSubMenuList.toLowerCase().replace(/,/g, '').replace(/ /g, ''));                     
                        });
                    }
                });
            } else {
                cy.log(megaMenu + ' mega menu is not available for ' + testingCountry.toUpperCase() + ' country.');   
            }
        });
    });
});

When('user click on the below option of country dropdown', (dataTable) => {   
    cy.getCountry().then((testingCountry) => {
        for (let i = 1; i < dataTable.rawTable.length; i++) {
            const country = dataTable.rawTable[i][0].toLowerCase();
            const dropdownOption = dataTable.rawTable[i][1];

            if (testingCountry === country) {     
                //click on the given country from the dropdown         
                home.clickCountryDropdownOption(dropdownOption);
                break;
            } 
        }
    });
});

Then('the website of respective country should be opened', (dataTable) => {   
    cy.getCountry().then((testingCountry) => {
        for (let i = 1; i < dataTable.rawTable.length; i++) {
            const country = dataTable.rawTable[i][0].toLowerCase();
            const expectedCountryURL = dataTable.rawTable[i][1].toString();

            if (testingCountry === country) {              
                //validate the current page URL should be of the respective country
                home.getPageUrl().should('contain', expectedCountryURL);
                cy.validateBaseURL();
                break;
            } 
        }
    });
});

When('user go back to the previous page', () => {   
    //go back to the previous page
    cy.go('back');
});

Then('user should be able to see submenus of {string} mega menu', (megaMenu) => {
    cy.getCountry().then((testingCountry) => {
        //validate the submenus of given mega menu is visible or not
        switch (megaMenu.toLowerCase()) {
            case 'wall':
                header.getSubmenu(megaMenu).should('be.visible');
                break;
            case 'ceiling':
                header.getSubmenu(megaMenu).should('be.visible');
                break;
            case 'table':
                header.getSubmenu(megaMenu).should('be.visible');
                break;
            case 'floor':
                header.getSubmenu(megaMenu).should('be.visible');
                break;
            case 'outdoor':
                header.getSubmenu(megaMenu).should('be.visible');
                break;
            case 'fans':
                if (testingCountry === 'us') { 
                    header.getSubmenu(megaMenu).should('be.visible');
                } else {
                    cy.log(megaMenu + ' mega menu is not available for ' + testingCountry.toUpperCase() + ' country');
                }
                break;
            case 'architectural':
                if (testingCountry === 'us') { 
                    header.getSubmenu(megaMenu).should('be.visible');
                } else {
                    cy.log(megaMenu + ' mega menu is not available for ' + testingCountry.toUpperCase() + ' country');
                }
                break;
            case 'our collections':
                if (testingCountry === 'us') { 
                    header.getSubmenu(megaMenu).should('be.visible');
                } else {
                    cy.log('Skipping the validation due to Bug 10647.');
                }
                break;
            case 'our designers':
                header.getSubmenu(megaMenu).should('be.visible');
                break;
            case 'sale':
                header.getSubmenu(megaMenu).should('be.visible');
                break;
            default:
                throw new Error(`The provided '${megaMenu}' mega menu is not valid.`);         
        }
    });
});

When('user click on below mega menu', (dataTable) => {   
    cy.getCountry().then((testingCountry) => {
        for (let i = 1; i < dataTable.rawTable.length; i++) {
            const country = dataTable.rawTable[i][0].toLowerCase();
            const expectedMegaMenu = dataTable.rawTable[i][1].toString();

            if (testingCountry === country) {              
                // click on mega menu of home page
                header.clickOnMegaMenu(expectedMegaMenu);
            } 
        }
    });
});

Then('the {int} columns of designer names should be displayed on our designers mega menu', (expectedColumns) => {   
    //validate the number of designer columns
    home.getDesignerColumns().should('have.length', expectedColumns);
});

Then('user should see {string} section of home page', (sectionName) => {       
    if (sectionName.toLowerCase() === 'explore our products') {
        //validate the explore our products section name     
        home.getExploreOurProductSectionHeader().then((displayedHeader) => {
            expect(displayedHeader.toLowerCase()).to.eq(sectionName.toLowerCase());
        });
    } else if (sectionName.toLowerCase() === 'new introductions') {      
        //validate the explore our products section image
        home.getNewIntroductionSectionHeader().then((displayedHeader) => {
            expect(displayedHeader.toLowerCase()).to.eq(sectionName.toLowerCase());
        });
    } else if (sectionName.toLowerCase() === 'the spotlight') {
        //validate the spotlight section name     
        home.getSpotlightAndGallerySectionHeader(sectionName).then((displayedHeader) => {
            expect(displayedHeader.toLowerCase()).to.eq(sectionName.toLowerCase());
        });
    } else if (sectionName.toLowerCase() === 'inspiration galleries') {
        //validate the inspiration galleries section name     
        home.getSpotlightAndGallerySectionHeader(sectionName).then((displayedHeader) => {
            expect(displayedHeader.toLowerCase()).to.eq(sectionName.toLowerCase());
        });
    } else {
        throw new Error(`The provided '${sectionName}' section name is not valid.`);
    }
});

Then('user should see {string} section images', (sectionName) => {       
    if (sectionName.toLowerCase() === 'explore our products') {       
        //validate the explore our products section image
        home.getExploreOurProductSeriesImages().should('be.visible');
    } else if (sectionName.toLowerCase() === 'new introductions') {      
        //validate the new introductions section image
        home.getNewIntroductionsImages().should('be.visible');
        home.getNewIntroductionsWallImage().should('be.visible');
    } else if (sectionName.toLowerCase() === 'the spotlight') {       
        //validate the spotlight section images
        home.getSpotlightSeriesImages().should('be.visible');
    } else if (sectionName.toLowerCase() === 'inspiration galleries') {       
        //validate the inspiration galleries section images
        home.getInspirationGalleryImages().should('be.visible');
    }
    else {
        throw new Error(`The provided '${sectionName}' section name is not valid.`);
    }
});

Then('user should be able to see below links on explore our products section', (dataTable) => {
    cy.getCountry().then((testingCountry) => {
        for (let i = 1; i < dataTable.rawTable.length; i++) {
            const country = dataTable.rawTable[i][0].toLowerCase();
            const expectedLinks = dataTable.rawTable[i][1].toString().replace(/\s/g, '');

            if (testingCountry === country) {              
                //validate available links on explore our products section 
                home.getExploreOurProductSectionLinks().then((actualLinks) => {
                    expect(actualLinks.replace(/\s/g, '')).to.eq(expectedLinks);    
                });
            } 
        }
    });
});

Then('user click on {string} link from explore our products section', (linkName) => {       
    //click on link on explore our products section
    home.clickExploreOurProductsLink(linkName);
});

Then('user should be able to see below links on new introductions section', (dataTable) => {
    const expectedLinks = dataTable.raw().slice(1).map((row) => row[0]).toString().replace(/\s+/g, '').replace(/,/g, '');

    cy.getCountry().then((testingCountry) => {       
        if (testingCountry === 'us') {              
            //validate available links on new introduction section 
            home.getNewIntroductionLink().then((actualLinks) => {
                expect(actualLinks.toLowerCase().replace(/\s+/g, '')).to.eq(expectedLinks.toLowerCase());    
            });
        } else {
            cy.log('The test data is not available for ' + testingCountry.toUpperCase() + ' country');
        }       
    });
});

Then('user click on {string} link from new introductions section', (linkName) => {       
    //click on link on explore our products section
    home.clickNewIntroductionsLink(linkName);
});


Then('user click on the read more link of {string} spotlight section', (sectionName) => {   
    //click read more link
    home.clickSpotlightReadMoreLink(sectionName);
});

Then('below breadcrumb value should be displayed', (dataTable) => {
    let expectedBreadcrumbValue = dataTable.raw().slice(1).map((row) => row[0].trim()).toString();

    // validate breadcrumb value 
    productList.getBreadcrumbValue().then((actualBreadcrumbValue) => {
        expect(actualBreadcrumbValue).to.eq(expectedBreadcrumbValue);   
    });
});

When('user click on view more link of {string}', (galleryName) => {   
    //click on view more link of inspiration galleries
    home.clickViewLinkGallery(galleryName);
});