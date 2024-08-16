Feature: Payment History Page

    The user should be able to access the payment history page.

    #--------------------------------------------------------------------------------------------------
    
    @all @paymentHistoryPage @wholesale @us @uk @eu @testcase_143
    Scenario: The wholesale user should be able to see payments header as selected along with other top headers

        Given 'Wholesale' user do login into the website with session
        When user open the following url
                | url                          |
                | /orderview/payments/history/ |
            And user click on profile icon
            And user click on below option
                | country | option     |
                | US      | Account    |
                | UK      | My Account |
                | EU      | My Account |
            And user click on the 'Payments' header
        Then 'Payments' page should get loaded
            And user should be able to see 'Payments' header as selected 
            And user should be able to see below available headers on the page
                | country | headers                                                                                                                                           |
                | US      | ACCOUNT, ORDERS, INVOICES, CREDIT MEMOS, PROJECTS, ACCOUNT INFORMATION, STORED PAYMENT METHODS, REQUEST TO ORDER, INVENTORY, DOWNLOADS, PAYMENTS  |
                | UK      | My ACCOUNT, ORDERS, INVOICES, CREDIT MEMOS, PROJECTS, My ACCOUNT INFORMATION, REQUEST TO ORDER, INVENTORY, DOWNLOADS, PAYMENTS                    |
                | EU      | My ACCOUNT, ORDERS, INVOICES, CREDIT MEMOS, PROJECTS, My ACCOUNT INFORMATION, REQUEST TO ORDER, INVENTORY, DOWNLOADS, PAYMENTS                    |
    
    #--------------------------------------------------------------------------------------------------
    
    @all @paymentHistoryPage @wholesale @us @testcase_144
    Scenario: The wholesale user should be able to see headers of payments list

        Given 'Wholesale' user do login into the website with session
        When user open the following url
                | url                          |
                | /orderview/payments/history/ |
        Then 'Payments' page should get loaded
            And user should be able to see below available headers of payments list
                | headers           |
                | PAYMENT NO        |
                | PAYMENT AMOUNT    |
                | PAYMENT DATE      |
                | PAID BY           |
                | CHECK NO./REF NO. |

    #--------------------------------------------------------------------------------------------------
    
    @all @paymentHistoryPage @wholesale @us @uk @eu @testcase_145
    Scenario: The wholesale user should be able to see account filter

        Given 'Wholesale' user do login into the website with session
        When user open the following url
                | url                          |
                | /orderview/payments/history/ |
        Then 'Payments' page should get loaded
        When user click on the filter by
        Then the 'Account' filter should be displayed

    #--------------------------------------------------------------------------------------------------
    
    @all @paymentHistoryPage @wholesale @us @uk @eu @testcase_146
    Scenario: The wholesale user should be able to see the placeholder of search box

        Given 'Wholesale' user do login into the website with session
        When user open the following url
                | url                          |
                | /orderview/payments/history/ |
        Then 'Payments' page should get loaded
            And user should be able to see the below placeholder for the search box 
                | placeholder                               |
                | Search by Payment Number or Check Number  |

    #--------------------------------------------------------------------------------------------------
    
    @all @paymentHistoryPage @wholesale @us @testcase_147
    Scenario: The wholesale user should be able to search check number

        Given 'Wholesale' user do login into the website with session
        When user open the following url
                | url                          |
                | /orderview/payments/history/ |
            And user enter '6586' in search box
        Then user should be able to see below check number in search results
                | number        | 
                | 6586          |
    
    #--------------------------------------------------------------------------------------------------
    
    @all @paymentHistoryPage @wholesale @us @testcase_154
    Scenario: The wholesale user should be able to search payment number

        Given 'Wholesale' user do login into the website with session
        When user open the following url
                | url                          |
                | /orderview/payments/history/ |
            And user enter '1109240' in search box
        Then user should be able to see below payment number in search results
                | number  | 
                | 1109240 |

    #--------------------------------------------------------------------------------------------------

    @all @paymentHistoryPage @wholesale @us @testcase_155
    Scenario: The user should be able to see pagination at the bottom of payments page

        Given 'Wholesale' user do login into the website with session
        When user open the following url
            | url                          |
            | /orderview/payments/history/ |
        Then 'Payments' page should get loaded
            And the pagination should be available at the bottom of page    

    #--------------------------------------------------------------------------------------------------

    @all @paymentHistoryPage @wholesale @us @testcase_438
    Scenario: The user should be able to see pagination text label of payments page

        Given 'Wholesale' user do login into the website with session
        When user open the following url
            | url                          |
            | /orderview/payments/history/ |
        Then 'Payments' page should get loaded
             And the pagination text label should be available at the bottom of page 

    #--------------------------------------------------------------------------------------------------

    @all @paymentHistoryPage @wholesale @us @testcase_439
    Scenario: The user should be able to see default pagination dropdown value 20 and have values as 10 20 50 

        Given 'Wholesale' user do login into the website with session
        When user open the following url
            | url                          |
            | /orderview/payments/history/ |
        Then 'Payments' page should get loaded
            And user should be able to see 20 as default pagination
            And user should be able to see below available pagination options
                | paginationOptions |
                | 10                |
                | 20                |
                | 50                |

    #--------------------------------------------------------------------------------------------------
    
    @all @paymentHistoryPage @wholesale @us @testcase_441
    Scenario: The user should be able to see validation message on invalid search

        Given 'Wholesale' user do login into the website with session
        When user open the following url
                | url                          |
                | /orderview/payments/history/ |
            And user enter '80689512' in search box
            And the following search validation message should be displayed
                | text                                                                                                         |
                | Sorry we couldn't find what you are looking for. Please be sure you enter a valid Payment or Check number    |