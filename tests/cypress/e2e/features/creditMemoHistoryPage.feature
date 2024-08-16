Feature: Credit Memo History Page

    The user should be able to access the credit memo history page.

    #--------------------------------------------------------------------------------------------------
    
    @all @creditMemoHistoryPage @wholesale @us @testcase_112 
    Scenario: The wholesale user should be able to see pagination at the bottom of credit memos page

        Given 'Wholesale' user do login into the website with session
        When user open the following url
                | url                             |
                | /orderview/creditmemos/history/ |
            And user click on the 'Credit Memos' header
        Then 'Credit Memos' page should get loaded
            And the pagination should be available at the bottom of page

    #--------------------------------------------------------------------------------------------------
    
    @all @creditMemoHistoryPage @wholesale @us @uk @eu @testcase_113 
    Scenario: The wholesale user should be able to see search box and account filter

        Given 'Wholesale' user do login into the website with session
        When user open the following url
                | url                             |
                | /orderview/creditmemos/history/ |
        Then 'Credit Memos' page should get loaded
            And user should be able to see search box
        When user click on the filter by
        Then the 'Account' filter should be displayed

    #--------------------------------------------------------------------------------------------------
    
    @all @creditMemoHistoryPage @wholesale @us @uk @eu @testcase_114 
    Scenario: The wholesale user should be able to see a placeholder for the search box 

        Given 'Wholesale' user do login into the website with session
        When user open the following url
                | url                             |
                | /orderview/creditmemos/history/ |
        Then 'Credit Memos' page should get loaded
            And user should be able to see the below placeholder for the search box 
                | placeholder                                            |
                | Search by Credit Memo Number or  Purchase Order Number |

    #--------------------------------------------------------------------------------------------------
    
    @all @creditMemoHistoryPage @wholesale @us @uk @eu @testcase_115 
    Scenario: The wholesale user should be able to see credit memos header as selected along with other top headers

        Given 'Wholesale' user do login into the website with session
        When user open the following url
                | url                             |
                | /orderview/creditmemos/history/ |
        Then 'Credit Memos' page should get loaded
            And user should be able to see 'Credit Memos' header as selected 
            And user should be able to see below available headers on the page
                | country | headers                                                                                                                                          |
                | US      | ACCOUNT, ORDERS, INVOICES, CREDIT MEMOS, PROJECTS, ACCOUNT INFORMATION, STORED PAYMENT METHODS, REQUEST TO ORDER, INVENTORY, DOWNLOADS, PAYMENTS |
                | UK      | My ACCOUNT, ORDERS, INVOICES, CREDIT MEMOS, PROJECTS, My ACCOUNT INFORMATION, REQUEST TO ORDER, INVENTORY, DOWNLOADS, PAYMENTS                   |
                | EU      | My ACCOUNT, ORDERS, INVOICES, CREDIT MEMOS, PROJECTS, My ACCOUNT INFORMATION, REQUEST TO ORDER, INVENTORY, DOWNLOADS, PAYMENTS                   |
    
    #--------------------------------------------------------------------------------------------------

    @all @creditMemoHistoryPage @wholesale @us @testcase_116 
    Scenario: The wholesale user should be able to see 20 as default pagination along with other pagination options

        Given 'Wholesale' user do login into the website with session
        When user open the following url
                | url                             |
                | /orderview/creditmemos/history/ |
        Then 'Credit Memos' page should get loaded
            And user should be able to see 20 as default pagination
            And user should be able to see below available pagination options
                | paginationOptions |
                | 10                |
                | 20                |
                | 50                |

    #--------------------------------------------------------------------------------------------------

    @all @creditMemoHistoryPage @wholesale @us @testcase_117 
    Scenario: The wholesale user should be able to open credit memos details page

        Given 'Wholesale' user do login into the website with session
        When user open the following url
                | url                             |
                | /orderview/creditmemos/history/ |
            And user enter 247216 number in search box
            And user click on the view link of '247216' number
        Then details page of '247216' number should get opened

    #--------------------------------------------------------------------------------------------------

    @all @creditMemoHistoryPage @wholesale @us @testcase_118 
    Scenario: The wholesale user should be able to search credit memos number

        Given 'Wholesale' user do login into the website with session
        When user open the following url
                | url                             |
                | /orderview/creditmemos/history/ |
            And user enter 247216 number in search box
        Then user should be able to see below number in search results
                | number  | 
                | 247216  |
    
    #--------------------------------------------------------------------------------------------------

    @all @creditMemoHistoryPage @wholesale @us @testcase_119 
    Scenario: The wholesale user should be able to see headers of credit memos list

        Given 'Wholesale' user do login into the website with session
        When user open the following url
                | url                             |
                | /orderview/creditmemos/history/ |
        Then 'Credit Memos' page should get loaded
            And user should be able to see below available headers of list
                | headers          |
                | CREDIT MEMO      |
                | PURCHASE ORDER   | 
                | CREDIT MEMO DATE |
                | AMOUNT           |
                | DIVISION         |
                | STATUS           |
                | ACTION           |
    
    #--------------------------------------------------------------------------------------------------

    @all @creditMemoHistoryPage @wholesale @us @testcase_312 
    Scenario: The wholesale user should be able to see sorting icon on the Credit Memo, Credit Memo Date, and Amount columns

        Given 'Wholesale' user do login into the website with session
        When user open the following url
                | url                             |
                | /orderview/creditmemos/history/ |
        Then 'Credit Memos' page should get loaded
            And the sorting icon should be displayed on the following columns
                | column           |
                | Credit Memo      |
                | Credit Memo Date |
                | Amount           |
    
    #--------------------------------------------------------------------------------------------------

    @all @creditMemoHistoryPage @wholesale @us @uk @eu @testcase_314 
    Scenario: The wholesale user should be able to see apply filter and reset buttons on the filter box

        Given 'Wholesale' user do login into the website with session
        When user open the following url
                | url                             |
                | /orderview/creditmemos/history/ |
        Then 'Credit Memos' page should get loaded
        When user click on the filter by
        Then user should be able to see apply filter and reset buttons on the filter box
    
    #--------------------------------------------------------------------------------------------------
    
    @all @creditMemoHistoryPage @wholesale @us @testcase_319 
    Scenario: The wholesale user should be able to see the applied account filter on the page

        Given 'Wholesale' user do login into the website with session
        When user open the following url
                | url                             |
                | /orderview/creditmemos/history/ |
        Then 'Credit Memos' page should get loaded
        When user click on the filter by
            And user click on account drop down
            And user select '45046 - THE HOME CENTER INC' account 
            And user click on 'apply filter' button
        Then user should be able to see filter applied for below account
                | account                     |
                | 45046 - THE HOME CENTER INC |
    
    #--------------------------------------------------------------------------------------------------

    @all @creditMemoHistoryPage @wholesale @us @testcase_328 
    Scenario: The wholesale user should be able to see a validation message on entering an invalid term/number

        Given 'Wholesale' user do login into the website with session
        When user open the following url
                | url                             |
                | /orderview/creditmemos/history/ |
        Then 'Credit Memos' page should get loaded
        When user enter 220017 number in search box
        Then the following validation message should be displayed on the 'Credit Memos' page
                | message                                                   |
                | No Credit Memos found for this search.  Please try again. |

    #--------------------------------------------------------------------------------------------------

    @all @creditMemoHistoryPage @wholesale @us @testcase_330 
    Scenario: The wholesale user should be able to see the default account filter after clicking on the reset button

        Given 'Wholesale2' user do login into the website with session
        When user open the following url
                | url                             |
                | /orderview/creditmemos/history/ |
        Then 'Credit Memos' page should get loaded
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

    @all @creditMemoHistoryPage @wholesale @us @testcase_332 
    Scenario: The wholesale user should be able to select different accounts from the account filter

        Given 'Wholesale2' user do login into the website with session
        When user open the following url
                | url                             |
                | /orderview/creditmemos/history/ |
        Then 'Credit Memos' page should get loaded
        When user click on the filter by
            And user click on account drop down
            And user select '45046 - THE HOME CENTER INC' account
        Then the '45046 - THE HOME CENTER INC' account should be displayed as selected
        When user click on account dropdown
            And user select '09913CA - #3D Studio, Inc.' account
        Then the '09913CA - #3D Studio, Inc.' account should be displayed as selected

    #--------------------------------------------------------------------------------------------------

    @all @creditMemoHistoryPage @wholesale @us @uk @eu @testcase_374 
    Scenario: The wholesale user should be able to see the filter by option

        Given 'Wholesale' user do login into the website with session
        When user open the following url
                | url                             |
                | /orderview/creditmemos/history/ |
        Then 'Credit Memos' page should get loaded
            And user should be able to see the filter by option
        When user click on the filter by
        Then the filter sidebar should be opened    
            And the 'Account' filter should be displayed

    #--------------------------------------------------------------------------------------------------

    @all @creditMemoHistoryPage @wholesale @us @testcase_376 
    Scenario: The wholesale user should be able to see the 'You have no Credit Memos' message if data are not available for the applied account filter

        Given 'Wholesale2' user do login into the website with session
        When user open the following url
                | url                             |
                | /orderview/creditmemos/history/ |
        Then 'Credit Memos' page should get loaded
        When user click on the filter by
            And user click on account drop down
            And user select '09913CA - #3D Studio, Inc.' account
            And user click on 'apply filter' button
        Then user should be able to see filter applied for below account
                | account                    |
                | 09913CA - #3D Studio, Inc. |
            And the following validation message should be displayed on the 'Credit Memos' page
                | message                   |
                | You have no Credit Memos. |