Feature: Company Profile Page

    The user should be able to access the company profile page.

    #--------------------------------------------------------------------------------------------------

    @all @companyProfilePage @wholesale @us @uk @eu @testcase_388
    Scenario: The wholesale user should not be able to see the company profile option

        Given user is on the login page
        When 'Wholesale' user do login into the website
            And user click on profile icon
            And user click on below option
                | country | option     |
                | US      | Account    |
                | UK      | My Account |
                | EU      | My Account |
        Then user should not be able to see the 'Company Profile' option on the top header

    #--------------------------------------------------------------------------------------------------
    
    @all @companyProfilePage @retail @us @uk @eu @testcase_389 
    Scenario: The retail user should not be able to see the company profile option

        Given user is on the login page
        When 'Retail' user do login into the website
            And user click on profile icon
            And user click on below option
                | country | option     |
                | US      | Account    |
                | UK      | My Account |
                | EU      | My Account |
        Then user should not be able to see the 'Company Profile' option on the top header

    #--------------------------------------------------------------------------------------------------
    
    @all @companyProfilePage @trade @us @uk @eu @testcase_394 
    Scenario: The trade user should be able to Verify that in the company profile Account Information, Legal Business Address, Contacts, and Shipping Information are displayed.

        Given 'Trade' user do login into the website with session
        When user open the following url
                | url               |
                | /company/profile/ |
        Then 'Company Profile' page should get loaded
            And user should be able to see below account information on company profile page
                | country | field               | value                                                                |
                | US      | Title               | Account Information                                                  |
                | US      | Account Number      | Account #: 309196                                                    |  
                | US      | Account Information | Test Trade Cypress Account test-cypress-trade@n8ko5unu.mailosaur.net |
                | UK      | Title               | Account Information                                                  |
                | UK      | Account Number      | Account #: 004421                                                    |  
                | UK      | Account Information | Trade UK tradeukqa@n8ko5unu.mailosaur.net                            |
                | EU      | Title               | Account Information                                                  |
                | EU      | Account Number      | Account #: 006134                                                    |  
                | EU      | Account Information | Test EU Trade test-cypress-trade-eu@n8ko5unu.mailosaur.net           |
            And user should be able to see below contact information on company profile page
                | country | field               | value                                                        |
                | US      | Title               | Contacts                                                     |
                | US      | Company Admin       | Company Administrator                                        |  
                | US      | Contact Information | Test Account Sales test-cypress-trade@n8ko5unu.mailosaur.net |
                | UK      | Title               | Contacts                                                     |
                | UK      | Company Admin       | Company Administrator                                        |  
                | UK      | Contact Information | Test Test tradeukqa@n8ko5unu.mailosaur.net                   |
                | EU      | Title               | Contacts                                                     |
                | EU      | Company Admin       | Company Administrator                                        |  
                | EU      | Contact Information | Test Account test-cypress-trade-eu@n8ko5unu.mailosaur.net    |
            And user should be able to see below legal business address information on company profile page
                | country | field   | value                                                                          |
                | US      | Title   | Legal Business Address                                                         |
                | US      | Address | 7814 Miramar Road San Diego, California, 92126 United States T: 8582756226     | 
                | UK      | Title   | Legal Business Address                                                         | 
                | UK      | Address | 4 design centre chelsea harbour, london, SW10 0HG United Kingdom T: 2222222222 |
                | EU      | Title   | Legal Business Address                                                         |   
                | EU      | Address | 108, De Hoper North Holland, 1511 HN Netherlands T: 07089196791                |
            And user should be able to see below shipping information on company profile page
                | country | field                  | value                                              |
                | US      | Title                  | Shipping Information                               |  
                | US      | Available Method Text  | Available Shipping Methods                         |
                | US      | Methods                | Request Delivery Date, Best Way, FedEx, Shipping   |  
                | UK      | Title                  | Shipping Information                               |  
                | UK      | Available Method Text  | Available Shipping Methods                         |
                | UK      | Methods                | Request Delivery Date, Best Way, Freight Shipping  |  
                | EU      | Title                  | Shipping Information                               |  
                | EU      | Available Method Text  | Available Shipping Methods                         |
                | EU      | Methods                | Request Delivery Date, Best Way, Flat Rate Percent |   

    #--------------------------------------------------------------------------------------------------

    @all @companyProfilePage @trade @us @uk @eu @testcase_409 
    Scenario: The trade user should be able to see the company profile option along with other top headers

        Given 'Trade' user do login into the website with session
        When user open the following url
                | url               |
                | /company/profile/ |
        Then user should be able to see below available headers on the page
                | country | headers                                                                                                                                            |
                | US      | ACCOUNT, ORDERS, QUOTES, PROJECTS, ADDRESS BOOK, ACCOUNT INFORMATION, WALLET, TRADE DOCUMENTS, COMPANY PROFILE, COMPANY USERS, INVENTORY           |
                | UK      | MY ACCOUNT, ORDERS, QUOTES, PROJECTS, MY ADDRESS BOOK, MY ACCOUNT INFORMATION, MY TRADE DOCUMENTS, MY COMPANY PROFILE, MY COMPANY USERS, INVENTORY |
                | EU      | MY ACCOUNT, ORDERS, QUOTES, PROJECTS, MY ADDRESS BOOK, MY ACCOUNT INFORMATION, MY TRADE DOCUMENTS, MY COMPANY PROFILE, MY COMPANY USERS, INVENTORY |