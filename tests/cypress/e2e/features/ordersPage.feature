Feature: Orders Page

    The user should be able to access the orders page.

    #--------------------------------------------------------------------------------------------------
    
    @all @ordersPage @wholesale @us @uk @eu @testcase_98 
    Scenario: The wholesale user should be able to see orders header as selected along with other top headers

        Given 'Wholesale' user do login into the website with session
        When user open the following url
                | url                        |
                | /orderview/orders/history/ |
        Then 'Orders' page should get loaded
            And user should be able to see 'Orders' header as selected 
            And user should be able to see below available headers on the page
                | country | headers                                                                                                                                          |
                | US      | ACCOUNT, ORDERS, INVOICES, CREDIT MEMOS, PROJECTS, ACCOUNT INFORMATION, STORED PAYMENT METHODS, REQUEST TO ORDER, INVENTORY, DOWNLOADS, PAYMENTS |
                | UK      | My ACCOUNT, ORDERS, INVOICES, CREDIT MEMOS, PROJECTS, My ACCOUNT INFORMATION, REQUEST TO ORDER, INVENTORY, DOWNLOADS, PAYMENTS                   |
                | EU      | My ACCOUNT, ORDERS, INVOICES, CREDIT MEMOS, PROJECTS, My ACCOUNT INFORMATION, REQUEST TO ORDER, INVENTORY, DOWNLOADS, PAYMENTS                   |

    #--------------------------------------------------------------------------------------------------

    @all @ordersPage @wholesale @us @uk @eu @testcase_99 
    Scenario: The wholesale user should be able to see a placeholder for the search box 

        Given 'Wholesale' user do login into the website with session
        When user open the following url
                | url                        |
                | /orderview/orders/history/ |
        Then 'Orders' page should get loaded
            And user should be able to see the below placeholder for the search box 
                | placeholder                                            |
                | search by order number, po number, product name or sku |

    #--------------------------------------------------------------------------------------------------
    
    @all @ordersPage @wholesale @us @testcase_103 
    Scenario: The wholesale user should be able to see headers of orders list

        Given 'Wholesale' user do login into the website with session
        When user open the following url
                | url                        |
                | /orderview/orders/history/ |
        Then 'Orders' page should get loaded
            And user should be able to see below available headers of list
                | headers        |
                | ORDER          |
                | PURCHASE ORDER |
                | DATE           |
                | SHIP TO        |
                | STATUS         |
                | ACTION         |

    #--------------------------------------------------------------------------------------------------
    
    @all @ordersPage @wholesale @us @uk @eu @testcase_104 
    Scenario: The wholesale user should be able to see search box and account filter

        Given 'Wholesale' user do login into the website with session
        When user open the following url
                | url                        |
                | /orderview/orders/history/ |
        Then 'Orders' page should get loaded
            And user should be able to see search box
        When user click on the filter by
        Then the 'Account' filter should be displayed

    #--------------------------------------------------------------------------------------------------
    
    @all @ordersPage @wholesale @us @testcase_106 
    Scenario: The wholesale user should be able to see pagination at the bottom of orders page

        Given 'Wholesale' user do login into the website with session
        When user open the following url
                | url                        |
                | /orderview/orders/history/ |
        Then 'Orders' page should get loaded
            And the pagination should be available at the bottom of page

    #--------------------------------------------------------------------------------------------------

    @all @ordersPage @wholesale @us @testcase_107 
    Scenario: The wholesale user should be able to see 20 as default pagination along with other pagination options

        Given 'Wholesale' user do login into the website with session
        When user open the following url
                | url                        |
                | /orderview/orders/history/ |
        Then 'Orders' page should get loaded
            And user should be able to see 20 as default pagination
            And user should be able to see below available pagination options
                | paginationOptions |
                | 10                |
                | 20                |
                | 50                | 

    #--------------------------------------------------------------------------------------------------

    @all @ordersPage @wholesale @us @testcase_108 
    Scenario: The wholesale user should be able to search order number

        Given 'Wholesale' user do login into the website with session
        When user open the following url
                | url                        |
                | /orderview/orders/history/ |
            And user enter 3111618 number in search box
        Then user should be able to see below number in search results
                | number  | 
                | 3111618 |

    #--------------------------------------------------------------------------------------------------

    @all @ordersPage @wholesale @us @testcase_111 
    Scenario: The wholesale user should be able to open order details page

        Given 'Wholesale' user do login into the website with session
        When user open the following url
                | url                        |
                | /orderview/orders/history/ |
            And user enter 3111618 number in search box
            And user click on the view link of '3111618' number
        Then details page of '3111618' number should get opened
    
    #--------------------------------------------------------------------------------------------------

    @all @ordersPage @retail @us @eu @testcase_159 
    Scenario: The retail user should be able to see the no orders message if the orders are not available

        Given 'Retail' user do login into the website with session
        When user open the following url
                | url                        |
                | /orderview/orders/history/ |
        Then 'Orders' page should get loaded
            And user should be able to see below message if the orders are not available
                | message                    |
                | You have placed no orders. |

    #--------------------------------------------------------------------------------------------------
    
    @all @ordersPage @wholesale @us @testcase_305 
    Scenario: The wholesale user should be able to verify that on drop-down list of all associated accounts are displayed.

        Given 'Wholesale' user do login into the website with session
        When user open the following url
                | url                        |
                | /orderview/orders/history/ |
        Then 'Orders' page should get loaded
        When user click on the filter by
        Then the 'Account' filter should be displayed
        When user click on account drop down
        Then user should be able to verify that all associated accounts are displayed

    #--------------------------------------------------------------------------------------------------
    
    @all @ordersPage @wholesale @us @testcase_307 
    Scenario: The wholesale user should be able to verify that the user can able to search the account

        Given 'Wholesale' user do login into the website with session
        When user open the following url
                | url                        |
                | /orderview/orders/history/ |
        Then 'Orders' page should get loaded
        When user click on the filter by
            And user click on account drop down 
            And user search 45046 account number
        Then user should be able to see search account

    #--------------------------------------------------------------------------------------------------

    @all @ordersPage @wholesale @us @uk @eu @testcase_313 
    Scenario: The wholesale user should be able to see apply filter and reset buttons on the filter box

        Given 'Wholesale' user do login into the website with session
        When user open the following url
                | url                        |
                | /orderview/orders/history/ |
        Then 'Orders' page should get loaded
        When user click on the filter by
        Then user should be able to see apply filter and reset buttons on the filter box

    #--------------------------------------------------------------------------------------------------
    
    @all @ordersPage @wholesale @us @testcase_315 
    Scenario: The wholesale user should be able to see that after selecting the account filters should get applied

        Given 'Wholesale' user do login into the website with session
        When user open the following url
                | url                        |
                | /orderview/orders/history/ |
        Then 'Orders' page should get loaded
        When user click on the filter by
            And user click on account drop down
            And user select '45046 - THE HOME CENTER INC' account 
            And user click on 'apply filter' button
        Then user should be able to see filter applied for below account
                | account                     |
                | 45046 - THE HOME CENTER INC |

    #--------------------------------------------------------------------------------------------------

    @all @ordersPage @wholesale @us @testcase_318 
    Scenario: The wholesale user should be able to see that the account number should persist across all tabs.

        Given 'Wholesale' user do login into the website with session
        When user open the following url
                | url                        |
                | /orderview/orders/history/ |
        Then 'Orders' page should get loaded
        When user click on the filter by
            And user click on account drop down
            And user select '45046 - THE HOME CENTER INC' account 
            And user click on 'apply filter' button
        Then user should be able to see filter applied for below account
                | account                     |
                | 45046 - THE HOME CENTER INC |
        When user click on the 'Invoices' header
        Then user should be able to see filter applied for below account
                | account                     |
                | 45046 - THE HOME CENTER INC |
        When user click on the 'Credit Memos' header
        Then user should be able to see filter applied for below account
                | account                     |
                | 45046 - THE HOME CENTER INC |
        When user click on the 'Payments' header
        Then user should be able to see filter applied for below account
                | account                     |
                | 45046 - THE HOME CENTER INC |

    #--------------------------------------------------------------------------------------------------

    @all @ordersPage @wholesale @us @testcase_329 
    Scenario: The wholesale user should be able to see the default account filter after clicking on the reset button

        Given 'Wholesale2' user do login into the website with session
        When user open the following url
                | url                        |
                | /orderview/orders/history/ |
        Then 'Orders' page should get loaded
        When user collect default applied account filter
            And user click on the filter by
            And user click on account drop down
            And user select '45046 - THE HOME CENTER INC' account 
            And user click on 'apply filter' button
        Then user should be able to see filter applied for below account
                | account                     |
                | 45046 - THE HOME CENTER INC |
        When user click on the filter by
            And user click on 'reset' button
        Then user should be able to see the default account filter as selected

    #--------------------------------------------------------------------------------------------------

    @all @ordersPage @wholesale @us @testcase_331 
    Scenario: The wholesale user should be able to see the open, close and partial options for the status column

        Given 'Wholesale' user do login into the website with session
        When user open the following url
                | url                        |
                | /orderview/orders/history/ |
        Then 'Orders' page should get loaded
        When user click on the status column
        Then the following options should be displayed for the status column
                | option   |
                | Closed   |
                | Open     |
                | Partial  |

    #--------------------------------------------------------------------------------------------------

    @all @ordersPage @wholesale @us @testcase_333 
    Scenario: The wholesale user should be able to see a validation message on entering an invalid term/number

        Given 'Wholesale' user do login into the website with session
        When user open the following url
                | url                        |
                | /orderview/orders/history/ |
        Then 'Orders' page should get loaded
        When user enter 54321 number in search box
        Then user should be able to see below validation message on order page
                | message                                             |
                | No orders found for this search.  Please try again. |

    #--------------------------------------------------------------------------------------------------

    @all @ordersPage @wholesale @us @testcase_386
    Scenario: The wholesale user should be able to see sorting icon on the order and date columns

        Given 'Wholesale' user do login into the website with session
        When user open the following url
                | url                        |
                | /orderview/orders/history/ |
        Then 'Orders' page should get loaded
            And the sorting icon should be displayed on the following columns
                | column |
                | Order  |
                | Date   |

    #--------------------------------------------------------------------------------------------------

    @all @ordersPage @wholesale @us @testcase_398 
    Scenario: The wholesale user should be able to see the filter in status column

        Given 'Wholesale' user do login into the website with session
        When user open the following url
                | url                        |
                | /orderview/orders/history/ |
        Then 'Orders' page should get loaded
            And the filter in status column should be displayed

    #--------------------------------------------------------------------------------------------------

    @all @ordersPage @wholesale @us @testcase_407 
    Scenario: The wholesale user should be able to see that the account label should get updated as per the selected filter.

        Given 'Wholesale2' user do login into the website with session
        When user open the following url
                | url                        |
                | /orderview/orders/history/ |
        Then 'Orders' page should get loaded
        When user click on the filter by
            And user click on account drop down
            And user select '45046 - THE HOME CENTER INC' account 
            And user click on 'apply filter' button
        Then user should be able to see filter applied for below account
                | account                     |
                | 45046 - THE HOME CENTER INC |
        When user click on the filter by
            And user click on account drop down
            And user select '11450CA - MARTIN GROUP SF INC' account 
            And user click on 'apply filter' button
        Then user should be able to see filter applied for below account
                | account                       |
                | 11450CA - MARTIN GROUP SF INC |