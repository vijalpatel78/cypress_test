Feature: Invoices Page

    The user should be able to access the invoices page.

    #--------------------------------------------------------------------------------------------------
    
    @all @invoicesPage @wholesale @us @uk @eu @testcase_96 
    Scenario: The wholesale user should be able to see a placeholder for the search box 

        Given 'Wholesale' user do login into the website with session
        When user open the following url
                | url                          |
                | /orderview/invoices/history/ |
            And user click on the 'Invoices' header
        Then 'Invoices' page should get loaded
            And user should be able to see the below placeholder for the search box 
                | placeholder                                              |
                | Search by Invoice Number, PO Number, Product Name or SKU |
    
    #--------------------------------------------------------------------------------------------------
    
    @all @invoicesPage @wholesale @us @uk @eu @testcase_97 
    Scenario: The wholesale user should be able to see invoices header as selected along with other top headers

        Given 'Wholesale' user do login into the website with session
        When user open the following url
                | url                          |
                | /orderview/invoices/history/ |
        Then 'Invoices' page should get loaded
            And user should be able to see 'Invoices' header as selected 
            And user should be able to see below available headers on the page
                | country | headers                                                                                                                                          |
                | US      | ACCOUNT, ORDERS, INVOICES, CREDIT MEMOS, PROJECTS, ACCOUNT INFORMATION, STORED PAYMENT METHODS, REQUEST TO ORDER, INVENTORY, DOWNLOADS, PAYMENTS |
                | UK      | My ACCOUNT, ORDERS, INVOICES, CREDIT MEMOS, PROJECTS, My ACCOUNT INFORMATION, REQUEST TO ORDER, INVENTORY, DOWNLOADS, PAYMENTS                   |
                | EU      | My ACCOUNT, ORDERS, INVOICES, CREDIT MEMOS, PROJECTS, My ACCOUNT INFORMATION, REQUEST TO ORDER, INVENTORY, DOWNLOADS, PAYMENTS                   |
    
    #--------------------------------------------------------------------------------------------------
    
    @all @invoicesPage @wholesale @us @testcase_100 
    Scenario: The wholesale user should be able to see pagination at the bottom of invoices page

        Given 'Wholesale' user do login into the website with session
        When user open the following url
                | url                          |
                | /orderview/invoices/history/ |
        Then 'Invoices' page should get loaded
            And the pagination should be available at the bottom of page
    
    #--------------------------------------------------------------------------------------------------

    @all @invoicesPage @wholesale @us @testcase_101 
    Scenario: The wholesale user should be able to see 20 as default pagination along with other pagination options

        Given 'Wholesale' user do login into the website with session
        When user open the following url
                | url                          |
                | /orderview/invoices/history/ |
        Then 'Invoices' page should get loaded
            And user should be able to see 20 as default pagination
            And user should be able to see below available pagination options
                | paginationOptions |
                | 10                |
                | 20                |
                | 50                |   

    #--------------------------------------------------------------------------------------------------

    @all @invoicesPage @wholesale @us @testcase_102 
    Scenario: The wholesale user should be able to see headers of invoices list

        Given 'Wholesale' user do login into the website with session
        When user open the following url
                | url                          |
                | /orderview/invoices/history/ |
        Then 'Invoices' page should get loaded
            And user should be able to see below available headers of list
                | headers        |
                | INVOICE        |
                | PURCHASE ORDER |
                | INVOICE DATE   |
                | DUE DATE       |
                | AMOUNT         |
                | PAID TO DATE   |
                | DIVISION       |
                | STATUS         |
                | ACTION         |
    
    #--------------------------------------------------------------------------------------------------
    
    @all @invoicesPage @wholesale @us @uk @eu @testcase_105 
    Scenario: The wholesale user should be able to see search box and account filter

        Given 'Wholesale' user do login into the website with session
        When user open the following url
                | url                          |
                | /orderview/invoices/history/ |
        Then 'Invoices' page should get loaded
            And user should be able to see search box
        When user click on the filter by
        Then the 'Account' filter should be displayed
    
    #--------------------------------------------------------------------------------------------------

    @all @invoicesPage @wholesale @us @testcase_109 
    Scenario: The wholesale user should be able to search invoice number

        Given 'Wholesale' user do login into the website with session
        When user open the following url
                | url                          |
                | /orderview/invoices/history/ |
            And user enter 3218828 number in search box
        Then user should be able to see below number in search results
                | number   | 
                | 3218828  |
    
    #--------------------------------------------------------------------------------------------------

    @all @invoicesPage @wholesale @us @testcase_110 
    Scenario: The wholesale user should be able to open invoice details page

        Given 'Wholesale' user do login into the website with session
        When user open the following url
                | url                          |
                | /orderview/invoices/history/ |
            And user enter 3218828 number in search box
            And user click on the view link of '3218828' number
        Then details page of '3218828' number should get opened
    
    #--------------------------------------------------------------------------------------------------

    @all @invoicesPage @wholesale @us @uk @eu @testcase_295 
    Scenario: The wholesale user should be able to see apply filter and reset buttons on the filter box

        Given 'Wholesale' user do login into the website with session
        When user open the following url
                | url                          |
                | /orderview/invoices/history/ |
        Then 'Invoices' page should get loaded
        When user click on the filter by
        Then user should be able to see apply filter and reset buttons on the filter box

    #--------------------------------------------------------------------------------------------------

    @all @invoicesPage @wholesale @us @testcase_300 
    Scenario: The wholesale user should be able to see sorting icon on the Invoice, Invoice Date, Due Date, Amount, and Paid to Date columns

        Given 'Wholesale' user do login into the website with session
        When user open the following url
                | url                          |
                | /orderview/invoices/history/ |
        Then 'Invoices' page should get loaded
            And the sorting icon should be displayed on the following columns
                | column        |
                | Invoice       |
                | Invoice Date  |
                | Due Date      |
                | Amount        |
                | Paid to Date  |
    
    #--------------------------------------------------------------------------------------------------

    @all @invoicesPage @wholesale @us @testcase_306 
    Scenario: The wholesale user should be able to see the open and close options for the status column

        Given 'Wholesale' user do login into the website with session
        When user open the following url
                | url                          |
                | /orderview/invoices/history/ |
        Then 'Invoices' page should get loaded
        When user click on the status column
        Then the following options should be displayed for the status column
                | option   |
                | Closed   |
                | Open     |

    #--------------------------------------------------------------------------------------------------

    @all @invoicesPage @wholesale @us @testcase_317 
    Scenario: The wholesale user should be able to select different accounts from the account filter

        Given 'Wholesale2' user do login into the website with session
        When user open the following url
                | url                          |
                | /orderview/invoices/history/ |
        Then 'Invoices' page should get loaded
        When user click on the filter by
            And user click on account drop down
            And user select '45046 - THE HOME CENTER INC' account
        Then the '45046 - THE HOME CENTER INC' account should be displayed as selected
        When user click on account dropdown
            And user select '11450CA - MARTIN GROUP SF INC' account
        Then the '11450CA - MARTIN GROUP SF INC' account should be displayed as selected

    #--------------------------------------------------------------------------------------------------

    @all @invoicesPage @wholesale @us @testcase_337 
    Scenario: The wholesale user should be able to see the orders as per the selected status option

        Given 'Wholesale' user do login into the website with session
        When user open the following url
                | url                          |
                | /orderview/invoices/history/ |
        Then 'Invoices' page should get loaded
        When user select '50' from the pagination dropdown
            And user click on the status column
            And user click on the 'Open' status option
        Then the orders with 'Open' status should be displayed and 'Closed' status should not be displayed

    #--------------------------------------------------------------------------------------------------

    @all @invoicesPage @wholesale @us @testcase_336 
    Scenario: The wholesale user should be able to see the 20 orders on the list by default

        Given 'Wholesale' user do login into the website with session
        When user open the following url
                | url                          |
                | /orderview/invoices/history/ |
        Then 'Invoices' page should get loaded
            And the 20 orders should be displayed on the list by default

    #--------------------------------------------------------------------------------------------------

    @all @invoicesPage @wholesale @us @testcase_371 
    Scenario: The wholesale user should be able to see the default account filter after clicking on the reset button

        Given 'Wholesale2' user do login into the website with session
        When user open the following url
                | url                          |
                | /orderview/invoices/history/ |
        Then 'Invoices' page should get loaded
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

    @all @invoicesPage @wholesale @us @uk @eu @testcase_373 
    Scenario: The wholesale user should be able to see the filter by option

        Given 'Wholesale' user do login into the website with session
        When user open the following url
                | url                          |
                | /orderview/invoices/history/ |
        Then 'Invoices' page should get loaded
            And user should be able to see the filter by option
        When user click on the filter by
        Then the filter sidebar should be opened    
            And the 'Account' filter should be displayed

    #--------------------------------------------------------------------------------------------------

    @all @invoicesPage @wholesale @us @testcase_375 
    Scenario: The wholesale user should be able to see the applied account filter on the page

        Given 'Wholesale' user do login into the website with session
         When user open the following url
                | url                          |
                | /orderview/invoices/history/ |
        Then 'Invoices' page should get loaded
        When user click on the filter by
            And user click on account drop down
            And user select '45046 - THE HOME CENTER INC' account 
            And user click on 'apply filter' button
        Then user should be able to see filter applied for below account
                | account                     |
                | 45046 - THE HOME CENTER INC |

    #--------------------------------------------------------------------------------------------------

    @all @invoicesPage @wholesale @us @testcase_383 
    Scenario: The wholesale user should be able to see a validation message on entering an invalid term/number

        Given 'Wholesale' user do login into the website with session
        When user open the following url
                | url                          |
                | /orderview/invoices/history/ |
        Then 'Invoices' page should get loaded
        When user enter 220017 number in search box
        Then the following validation message should be displayed on the 'Invoices' page
                | message                                              |
                | No invoices found for this search.  Please try again.|