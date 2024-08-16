Feature: Inventory Page

    The user should be able to access the inventory page.

    #--------------------------------------------------------------------------------------------------
    
    @all @inventoryPage @wholesale @us @uk @eu @testcase_132 
    Scenario: The wholesale user should be able to see a search button and search suggestions text

        Given 'Wholesale' user do login into the website with session
        When user open the following url
                | url                |
                | /customer/account/ |
            And user click on the 'Inventory' header
        Then 'Inventory' page should get loaded
            And user should be able to see a search button
            And the following search suggestions text should be displayed
                | text                                                  |
                | Search SKUs by pressing enter or separating by comma  |

    #--------------------------------------------------------------------------------------------------
    
    @all @inventoryPage @wholesale @us @uk @eu @testcase_140 
    Scenario: The wholesale user should be able to search one SKU

        Given 'Wholesale' user do login into the website with session
        When user open the following url
                | url                   |
                | /orderview/inventory/ |
            And user navigate to the 'Inventory' page
            And user enter the 'JN 5112BSL/CG' sku in the search box
            And user click on the search button
        Then user should be able to see 1 matching search results
            And user should be able to see the following sku and image of the following sku on the search results
                | sku           |
                | JN 5112BSL/CG |

    #--------------------------------------------------------------------------------------------------
    
    @all @inventoryPage @wholesale @us @uk @eu @testcase_134 
    Scenario: The wholesale user should be able to search multiple SKU

        Given 'Wholesale' user do login into the website with session
        When user open the following url
                | url                   |
                | /orderview/inventory/ |
            And user navigate to the 'Inventory' page
            And user enter the 'JN 5112BSL/CG,KW 5074BSL' sku in the search box
            And user click on the search button
        Then user should be able to see 2 matching search results
            And user should be able to see the following sku and image of the following sku on the search results
                | sku           |
                | JN 5112BSL/CG |
                | KW 5074BSL    |
    
    #--------------------------------------------------------------------------------------------------
    
    @all @inventoryPage @wholesale @us @uk @eu @testcase_139 
    Scenario: The wholesale user should be able to see inventory header as selected along with other top headers

        Given 'Wholesale' user do login into the website with session
        When user open the following url
                | url                   |
                | /orderview/inventory/ |
        Then 'Inventory' page should get loaded
            And user should be able to see 'Inventory' header as selected 
            And user should be able to see below available headers on the page
                | country | headers                                                                                                                                          |
                | US      | ACCOUNT, ORDERS, INVOICES, CREDIT MEMOS, PROJECTS, ACCOUNT INFORMATION, STORED PAYMENT METHODS, REQUEST TO ORDER, INVENTORY, DOWNLOADS, PAYMENTS |
                | UK      | My ACCOUNT, ORDERS, INVOICES, CREDIT MEMOS, PROJECTS, My ACCOUNT INFORMATION, REQUEST TO ORDER, INVENTORY, DOWNLOADS, PAYMENTS                   |
                | EU      | My ACCOUNT, ORDERS, INVOICES, CREDIT MEMOS, PROJECTS, My ACCOUNT INFORMATION, REQUEST TO ORDER, INVENTORY, DOWNLOADS, PAYMENTS                   |

    #--------------------------------------------------------------------------------------------------
    
    @all @inventoryPage @wholesale @us @uk @eu @testcase_242 
    Scenario: The wholesale user should be able to see a request to order link as clickable along with the add to cart button as disabled

        Given 'Wholesale' user do login into the website with session
        When user open the following url
                | url                   |
                | /orderview/inventory/ |
            And user navigate to the 'Inventory' page
            And user enter the following sku in the search box
                | country | skuCode          |
                | US      | 3MAVR52RZW       |
                | UK      | TOB 5002BZ-NP-EU |
                | EU      | TOB 5002BZ-NP-EU |
            And user click on the search button
        Then user should be able to see a request to order link with underlined for the following sku
                | country | skuCode          |
                | US      | 3MAVR52RZW       |
                | UK      | TOB 5002BZ-NP-EU |
                | EU      | TOB 5002BZ-NP-EU |
            And user should be able to see the add to cart button as disabled
        When user click on the request to order link of the following sku
                | country | skuCode          |
                | US      | 3MAVR52RZW       |
                | UK      | TOB 5002BZ-NP-EU |
                | EU      | TOB 5002BZ-NP-EU |
        Then the product description page of the following sku should get opened
                | country | skuCode    |
                | US      | 3MAVR52    |
                | UK      | EU-TOB5002 |
                | EU      | EU-TOB5002 |
            And the request to order button should be displayed on the product description page

    #--------------------------------------------------------------------------------------------------
    
    @all @inventoryPage @wholesale @us @testcase_243 
    Scenario: The wholesale user should be able to add the product to cart 

        Given 'Wholesale' user do login into the website with session
        When user open the following url
                | url                   |
                | /orderview/inventory/ |
            And user navigate to the 'Inventory' page
            And user enter the 'JN 5112BSL/CG' sku in the search box
            And user click on the search button
        Then user should be able to see the add to cart button as disabled
        When user enter the 2 qty for the 'JN 5112BSL/CG' sku
        Then user should be able to see the add to cart button as enabled
        When user click on the add to cart button from the inventory page
        Then the following success message should be displayed on the 'Inventory' page
                | message                             |
                | Products added to cart successfully |
            And user should be able to see the add to cart button as disabled
    
    #--------------------------------------------------------------------------------------------------
    
    @all @inventoryPage @wholesale @us @testcase_244 
    Scenario: In a wholesale account, the product name and qty should be displayed correctly on the mini cart after adding the product to cart

        Given 'Wholesale' user do login into the website with session
        When user open the following url
                | url                |
                | /customer/account/ |
            And user clear added items from the cart
            And user open the following url
                | url                   |
                | /orderview/inventory/ |
            And user navigate to the 'Inventory' page
            And user enter the 'JN 5112BSL/CG' sku in the search box
            And user click on the search button
            And user enter the 2 qty for the 'JN 5112BSL/CG' sku
            And user collect the following details of 'JN 5112BSL/CG' sku from the inventory page
                | label          |
                | Product Name   |
                | Product Qty    |
            And user click on the add to cart button from the inventory page
        Then the following success message should be displayed on the 'Inventory' page
                | message                             |
                | Products added to cart successfully |
            And the mini cart count should be increased by 2
        When user mouse hover on the mini cart icon
            And the following product details should be displayed on the mini cart
                | label         |
                | Product Name  |
                | Product Qty   |

    #--------------------------------------------------------------------------------------------------
    
    @all @inventoryPage @wholesale @us @uk @eu @testcase_421 
    Scenario: The wholesale user should be able to see inventory tab under accounts section

        Given 'Wholesale' user do login into the website with session
        When user open the following url
                | url                   |
                | /orderview/inventory/ |
        Then user should be able to see inventory tab

    #--------------------------------------------------------------------------------------------------
    
    @all @inventoryPage @wholesale @us @uk @eu @testcase_428 
    Scenario: The wholesale user should be able to see validation message for wrong SKU search

        Given 'Wholesale' user do login into the website with session
        When user open the following url
                | url                   |
                | /orderview/inventory/ |
            And user navigate to the 'Inventory' page
            And user enter the 'JN 5112BSL/CGI' sku in the search box
            And user click on the search button
            And the following search validation text should be displayed
                | text                                                  |
                | Sorry, we are unable to find JN 5112BSL/CGI.          |

    #--------------------------------------------------------------------------------------------------
    
    @all @inventoryPage @trade @us @uk @eu @testcase_429 
    Scenario: The trade user should be able to see validation message for wrong SKU search

        Given 'trade' user do login into the website with session
        When user open the following url
                | url                   |
                | /orderview/inventory/ |
            And user navigate to the 'Inventory' page
            And user enter the 'JN 5112BSL/CGI' sku in the search box
            And user click on the search button
            And the following search validation text should be displayed
                | text                                                  |
                | Sorry, we are unable to find JN 5112BSL/CGI.          |

    #--------------------------------------------------------------------------------------------------

    @all @inventoryPage @trade @us @uk @eu @testcase_427 
    Scenario: The trade user should be able to see search button and after click display search results 

        Given 'Trade' user do login into the website with session
        When user open the following url
                | url                   |
                | /orderview/inventory/ |
            And user navigate to the 'Inventory' page
            And user enter the 'JN 5112BSL/CG' sku in the search box
            And user click on the search button
        Then user should be able to see 1 matching search results
            And user should be able to see the following sku and image of the following sku on the search results
                | sku           |
                | JN 5112BSL/CG |

    #--------------------------------------------------------------------------------------------------

    @all @inventoryPage @wholesale @us @uk @eu @testcase_445 
    Scenario: The wholesale user should be able to see headers on result grid after search SKU 

        Given 'Wholesale' user do login into the website with session
        When user open the following url
                | url                   |
                | /orderview/inventory/ |
            And user navigate to the 'Inventory' page
            And user enter the 'JN 5112BSL/CG' sku in the search box
            And user click on the search button
        Then user should be able to see below headers of list
                | headers           |
                | IMAGE             |
                | SKU               |
                | PRODUCT           |
                | IN STOCK          |
                | DUE IN 14 DAYS    |
                | DUE IN 30 DAYS    |
                | DUE IN 60 DAYS    |
                | DUE OVER 60 DAYS	|
                | QTY               |     

    #--------------------------------------------------------------------------------------------------

    @all @inventoryPage @wholesale @us @testcase_448 
    Scenario: The wholesale user should get validation message on insert quantity more than the maximum number

        Given 'Wholesale' user do login into the website with session
        When user open the following url
                | url                   |
                | /orderview/inventory/ |
            And user navigate to the 'Inventory' page
            And user get minicart count
            And user enter the 'JN 5112BSL/CG' sku in the search box
            And user click on the search button
        When user enter the 10001 qty for the 'JN 5112BSL/CG' sku
        Then user should be able to see the add to cart button as enabled
        When user click on the add to cart button from the inventory page
        Then the following error message should be displayed on the 'Inventory' page
                | message                                 |
                | The maximum you may purchase is 10,000. |
            And the minicart value should be the same as at the time of page load