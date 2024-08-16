Feature: Account Page

    The user should be able to access the account page.

    #--------------------------------------------------------------------------------------------------
    
    @all @accountPage @wholesale @us @testcase_120 
    Scenario: The wholesale user should be redirected to the order page after click on the view all link

        Given 'Wholesale' user do login into the website with session
        When user open the following url
                | url                |
                | /customer/account/ |
            And user click on the view all link of 'Orders' list
        Then 'Orders' page should get opened

    #--------------------------------------------------------------------------------------------------
    
    @all @accountPage @wholesale @us @testcase_121 
    Scenario: The wholesale user should be redirected to the invoice page after click on the view all link

        Given 'Wholesale' user do login into the website with session
        When user open the following url
                | url                |
                | /customer/account/ |
            And user click on the view all link of 'Invoices' list
        Then 'Invoices' page should get opened

    #--------------------------------------------------------------------------------------------------
    
    @all @accountPage @wholesale @us @testcase_122 
    Scenario: The wholesale user should be redirected to the credit memo page after click on the view all link

        Given 'Wholesale' user do login into the website with session
        When user open the following url
                | url                |
                | /customer/account/ |
            And user click on the view all link of 'Credit Memos' list
        Then 'Credit Memos' page should get opened

    #--------------------------------------------------------------------------------------------------
    
    @all @accountPage @wholesale @us @uk @eu @testcase_123 
    Scenario: The wholesale user should be able to see a placeholder for the search box 

        Given 'Wholesale' user do login into the website with session
        When user open the following url
                | url                |
                | /customer/account/ |
        Then user should be able to see the below placeholder for the search box 
                | placeholder                                            |
                | Search by Order Number, PO Number, Product Name or SKU |

    #--------------------------------------------------------------------------------------------------
    
    @all @accountPage @wholesale @us @uk @eu @testcase_124 
    Scenario: The wholesale user should be able to see account header as selected along with other top headers

        Given 'Wholesale' user do login into the website with session
        When user open the following url
                | url                |
                | /customer/account/ |
        Then user should be able to see below header as selected
                | country | header     |
                | US      | Account    |
                | UK      | My Account |
                | EU      | My Account |
            And user should be able to see below available headers on the page
                | country | headers                                                                                                                                          |
                | US      | ACCOUNT, ORDERS, INVOICES, CREDIT MEMOS, PROJECTS, ACCOUNT INFORMATION, STORED PAYMENT METHODS, REQUEST TO ORDER, INVENTORY, DOWNLOADS, PAYMENTS |
                | UK      | My ACCOUNT, ORDERS, INVOICES, CREDIT MEMOS, PROJECTS, My ACCOUNT INFORMATION, REQUEST TO ORDER, INVENTORY, DOWNLOADS, PAYMENTS                   |
                | EU      | My ACCOUNT, ORDERS, INVOICES, CREDIT MEMOS, PROJECTS, My ACCOUNT INFORMATION, REQUEST TO ORDER, INVENTORY, DOWNLOADS, PAYMENTS                   |

    #--------------------------------------------------------------------------------------------------
    
    @all @accountPage @wholesale @us @uk @eu @testcase_125 
    Scenario: The wholesale user should be able to see search box and account dropdown

        Given 'Wholesale' user do login into the website with session
        When user open the following url
                | url                |
                | /customer/account/ |
        Then user should be able to see search box and account dropdown

    #--------------------------------------------------------------------------------------------------

    @all @accountPage @wholesale @us @testcase_126 
    Scenario: The wholesale user should be able to open credit memo details page

        Given 'Wholesale' user do login into the website with session
        When user open the following url
                | url                |
                | /customer/account/ |
            And user enter 247216 number in search box
            And user click on the 'View Credit Memo' link of '247216' number
        Then details page of '247216' number should get opened

    #--------------------------------------------------------------------------------------------------

    @all @accountPage @wholesale @us @testcase_127 
    Scenario: The wholesale user should be able to open invoice details page

        Given 'Wholesale' user do login into the website with session
        When user open the following url
                | url                |
                | /customer/account/ |
            And user enter 3218789 number in search box
            And user click on the 'View Invoice' link of '3218789' number
        Then details page of '3218789' number should get opened
    
    #--------------------------------------------------------------------------------------------------

    @all @accountPage @wholesale @us @testcase_128 
    Scenario: The wholesale user should be able to open order details page

        Given 'Wholesale' user do login into the website with session
        When user open the following url
                | url                |
                | /customer/account/ |
            And user enter 3111610 number in search box
            And user click on the 'View Order' link of '3111610' number
        Then details page of '3111610' number should get opened

    #--------------------------------------------------------------------------------------------------
    
    @all @accountPage @wholesale @us @uk @eu @testcase_129 
    Scenario: The wholesale user should be able to see account information

        Given 'Wholesale' user do login into the website with session
        When user open the following url
                | url                |
                | /customer/account/ |
        Then user should be able to see below account Number
                | country | accountNumber       |
                | US      | GL Account #: 45046 |
            And user should be able to see below email id
                | country | email                                            |
                | US      | test-cypress-wholesale@n8ko5unu.mailosaur.net    |
                | UK      | test-cypress-wholesale-uk@n8ko5unu.mailosaur.net |
                | EU      | test-cypress-wholesale-eu@n8ko5unu.mailosaur.net |
            And user should be able to see below first name and last name
                | country | firstName  | lastName |
                | US      | Test       | Account  |
                | UK      | Test       | Account  |
                | EU      | Test       | Account  |

    #--------------------------------------------------------------------------------------------------
    
    @all @accountPage @wholesale @us @uk @eu @testcase_197 
    Scenario: The wholesale user should be able to see mega menus and its sub-options on the account page

        Given 'Wholesale' user do login into the website with session
        When user open the following url
                | url                |
                | /customer/account/ |
            And user mouseover on the 'Wall' mega menu    
        Then user should be able to see submenus of 'Wall' mega menu 
        When user mouseover on the 'Ceiling' mega menu
        Then user should be able to see submenus of 'Ceiling' mega menu
        When user mouseover on the 'Table' mega menu
        Then user should be able to see submenus of 'Table' mega menu
        When user mouseover on the 'Floor' mega menu
        Then user should be able to see submenus of 'Floor' mega menu
        When user mouseover on the 'Outdoor' mega menu
        Then user should be able to see submenus of 'Outdoor' mega menu
        When user mouseover on the 'Fans' mega menu
        Then user should be able to see submenus of 'Fans' mega menu
        When user mouseover on the 'Architectural' mega menu
        Then user should be able to see submenus of 'Architectural' mega menu
        When user mouseover on the 'Our Collections' mega menu
        Then user should be able to see submenus of 'Our Collections' mega menu
        When user mouseover on the 'Our Designers' mega menu
        Then user should be able to see submenus of 'Our Designers' mega menu
        When user mouseover on the 'Sale' mega menu
        Then user should be able to see submenus of 'Sale' mega menu

    #--------------------------------------------------------------------------------------------------
    
    @all @accountPage @retail @us @uk @eu @testcase_198 
    Scenario: The retail user should be able to see mega menus and its sub-options on the account page

        Given user is on the login page
        When 'Retail' user do login into the website
            And user open the following url
                | url                |
                | /customer/account/ |
            And user mouseover on the 'Wall' mega menu    
        Then user should be able to see submenus of 'Wall' mega menu 
        When user mouseover on the 'Ceiling' mega menu
        Then user should be able to see submenus of 'Ceiling' mega menu
        When user mouseover on the 'Table' mega menu
        Then user should be able to see submenus of 'Table' mega menu
        When user mouseover on the 'Floor' mega menu
        Then user should be able to see submenus of 'Floor' mega menu
        When user mouseover on the 'Outdoor' mega menu
        Then user should be able to see submenus of 'Outdoor' mega menu
        When user mouseover on the 'Fans' mega menu
        Then user should be able to see submenus of 'Fans' mega menu
        When user mouseover on the 'Architectural' mega menu
        Then user should be able to see submenus of 'Architectural' mega menu
        When user mouseover on the 'Our Collections' mega menu
        Then user should be able to see submenus of 'Our Collections' mega menu
        When user mouseover on the 'Our Designers' mega menu
        Then user should be able to see submenus of 'Our Designers' mega menu
        When user mouseover on the 'Sale' mega menu
        Then user should be able to see submenus of 'Sale' mega menu

    #--------------------------------------------------------------------------------------------------
    
    @all @accountPage @trade @us @uk @eu @testcase_199 
    Scenario: The trade user should be able to see mega menus and its sub-options on the account page

        Given user is on the login page
        When 'Trade' user do login into the website
            And user open the following url
                | url                |
                | /customer/account/ |
            And user mouseover on the 'Wall' mega menu    
        Then user should be able to see submenus of 'Wall' mega menu 
        When user mouseover on the 'Ceiling' mega menu
        Then user should be able to see submenus of 'Ceiling' mega menu
        When user mouseover on the 'Table' mega menu
        Then user should be able to see submenus of 'Table' mega menu
        When user mouseover on the 'Floor' mega menu
        Then user should be able to see submenus of 'Floor' mega menu
        When user mouseover on the 'Outdoor' mega menu
        Then user should be able to see submenus of 'Outdoor' mega menu
        When user mouseover on the 'Fans' mega menu
        Then user should be able to see submenus of 'Fans' mega menu
        When user mouseover on the 'Architectural' mega menu
        Then user should be able to see submenus of 'Architectural' mega menu
        When user mouseover on the 'Our Collections' mega menu
        Then user should be able to see submenus of 'Our Collections' mega menu
        When user mouseover on the 'Our Designers' mega menu
        Then user should be able to see submenus of 'Our Designers' mega menu
        When user mouseover on the 'Sale' mega menu
        Then user should be able to see submenus of 'Sale' mega menu

    #--------------------------------------------------------------------------------------------------

    @all @accountPage @trade @us @uk @eu @testcase_382 
    Scenario: The trade user should be able to display their logged-in email under the accounts section.

        Given 'Trade' user do login into the website with session
        When user open the following url
                | url                |
                | /customer/account/ |
        Then user should be able to see below email id
                | country | email                                        |
                | US      | test-cypress-trade@n8ko5unu.mailosaur.net    |
                | UK      | tradeukqa@n8ko5unu.mailosaur.net             |
                | EU      | test-cypress-trade-eu@n8ko5unu.mailosaur.net |

    #--------------------------------------------------------------------------------------------------

    @all @accountPage @trade @us @uk @eu @testcase_422 
    Scenario: The trade user should able to see options in the drop-down menu by clicking the Profile/Account Icon 

        Given 'trade' user do login into the website with session
        When user open the following url
                | url                |
                | /customer/account/ |
            And user click on profile icon
        Then the user should be able to see below available profile options   
            | country | options                                      |
            | US      | Account, Orders, Quotes, Projects, Logout    |
            | UK      | My Account, Orders, Quotes, Projects, Logout |
            | EU      | My Account, Orders, Quotes, Projects, Logout |

    #--------------------------------------------------------------------------------------------------

    @all @accountPage @trade @us @uk @eu @testcase_456 
    Scenario: The trade user should be able to navigate in account page from profile dropdown

        Given user is on the login page
        When 'trade' user do login into the website
            And user click on profile icon
            And user click on below option
                | country | option     |
                | US      | Account    |
                | UK      | My Account |
                | EU      | My Account |
        Then user should able to access account page from profile dropdown
                | country | title      |
                | US      | Account    |
                | UK      | My Account |
                | EU      | My Account |

    #--------------------------------------------------------------------------------------------------
  
    @all @accountPage @trade @us @eu @testcase_457 
    Scenario: The trade user should be able to navigate in order page from profile drop down

        Given user is on the login page
        When 'Trade' user do login into the website
            And user click on profile icon
            And user click on below option
                | country | option |
                | US      | Orders |
                | UK      | Orders |
                | EU      | Orders |
        Then 'Orders' page should get loaded

    #--------------------------------------------------------------------------------------------------

    @all @accountPage @trade @us @uk @eu @testcase_458 
    Scenario: The trade user should be able to navigate in projects page from profile drop down

        Given user is on the login page
        When 'Trade' user do login into the website
            And user click on profile icon
            And user click on below option
                | country | option   |
                | US      | Projects |
                | UK      | Projects |
                | EU      | Projects |
        Then 'Projects' page should get loaded

    #--------------------------------------------------------------------------------------------------
    
    @all @accountPage @retail @us @uk @eu @testcase_469 
    Scenario: The retail user should be able to see account header as selected along with other top headers

        Given user is on the login page
        When 'Retail' user do login into the website
            When user open the following url
                | url                |
                | /customer/account/ |
            And user should be able to see below available headers on the page
                | country | headers                                                               |
                | US      | ACCOUNT, ORDERS, PROJECTS, ADDRESS BOOK, ACCOUNT INFORMATION, WALLET  |
                | UK      | MY ACCOUNT, ORDERS, PROJECTS, MY ADDRESS BOOK, MY ACCOUNT INFORMATION |
                | EU      | MY ACCOUNT, ORDERS, PROJECTS, MY ADDRESS BOOK, MY ACCOUNT INFORMATION |