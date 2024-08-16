Feature: Company Users Page

    The user should be able to access the company users page.

    #--------------------------------------------------------------------------------------------------
    
    @all @companyUsersPage @trade @us @uk @eu @testcase_162 
    Scenario: The trade user should be able to see company users header as selected along with other top headers

        Given 'Trade' user do login into the website with session
        When user open the following url
                | url             |
                | /company/users/ |
            And user click on the 'Company Users' header
        Then 'Company Users' page should get loaded
            And user should be able to see below header as selected 
                | country | header           |
                | US      | Company Users    |
                | UK      | My Company Users |
                | EU      | My Company Users |
            And user should be able to see below available headers on the page
                | country | headers                                                                                                                                            |
                | US      | ACCOUNT, ORDERS, QUOTES, PROJECTS, ADDRESS BOOK, ACCOUNT INFORMATION, WALLET, TRADE DOCUMENTS, COMPANY PROFILE, COMPANY USERS, INVENTORY           |
                | UK      | MY ACCOUNT, ORDERS, QUOTES, PROJECTS, MY ADDRESS BOOK, MY ACCOUNT INFORMATION, MY TRADE DOCUMENTS, MY COMPANY PROFILE, MY COMPANY USERS, INVENTORY |
                | EU      | MY ACCOUNT, ORDERS, QUOTES, PROJECTS, MY ADDRESS BOOK, MY ACCOUNT INFORMATION, MY TRADE DOCUMENTS, MY COMPANY PROFILE, MY COMPANY USERS, INVENTORY |

    #--------------------------------------------------------------------------------------------------
    
    @all @companyUsersPage @trade @us @uk @eu @testcase_163 
    Scenario: The trade user should be able to add new user

        Given 'Trade' user do login into the website with session
        When user open the following url
                | url             |
                | /company/users/ |
            And user click on the add new user button
            And user enter the following user details:
                | field        | value                                     |
                | Job Title    | Sales                                     |  
                | First Name   | Trade                                     |
                | Last Name    | User Cypress                              |
                | Email        | test-cypress-trade@n8ko5unu.mailosaur.net |
                | Phone Number | 7145155920                                |
            And user click on the save button from the user popup
        Then the following success message should be displayed on the company users page
                | successMessage                         |
                | The customer was successfully created. |
            And the given name and email should be displayed on the company users page 
            And user delete the given user
    
    #--------------------------------------------------------------------------------------------------
    
    @all @companyUsersPage @trade @us @uk @eu @testcase_167
    Scenario: The trade user should be able to edit user details

        Given 'Trade' user do login into the website with session
        When user open the following url
                | url             |
                | /company/users/ |
            And user click on the add new user button
            And user enter the following user details:
                | field        | value                                     |
                | Job Title    | Sales                                     |  
                | First Name   | Barbara                                   |
                | Last Name    | Hepworth                                  |
                | Email        | test-cypress-trade@n8ko5unu.mailosaur.net |
                | Phone Number | 7145155920                                |
            And user click on the save button from the user popup
            And the following success message should be displayed on the company users page
                | successMessage                         |
                | The customer was successfully created. |
            And user click on the edit link of given user from the company users list page
            And user enter the following user details:
                | field        | value             | 
                | First Name   | Test              |
                | Last Name    | Account Cypress   |
            And user click on the save button from the user popup
        Then the following success message should be displayed on the company users page
                | successMessage                         |
                | The customer was successfully updated. |
            And the given name and email should be displayed on the company users page 
            And user delete the given user

    #--------------------------------------------------------------------------------------------------
    
    @all @companyUsersPage @trade @us @uk @eu @testcase_168 
    Scenario: The trade user should be able to delete user

        Given 'Trade' user do login into the website with session
        When user open the following url
                | url             |
                | /company/users/ |
            And user click on the add new user button
            And user enter the following user details:
                | field        | value                                     |
                | Job Title    | Sales                                     |  
                | First Name   | Barbara                                   |
                | Last Name    | Hepworth                                  |
                | Email        | test-cypress-trade@n8ko5unu.mailosaur.net |
                | Phone Number | 7145155920                                |
            And user click on the save button from the user popup
            And the following success message should be displayed on the company users page
                | successMessage                         |
                | The customer was successfully created. |
            And user click on the delete link of given user from the company users list page
            And user click on the delete button from the delete user popup
        Then the following success message should be displayed on the company users page
                | successMessage                         |
                | The customer was successfully deleted. |
            And the deleted user should not be displayed on the company users list page

    #--------------------------------------------------------------------------------------------------
    
    @all @companyUsersPage @trade @us @uk @eu @testcase_357 
    Scenario:  The company admin user can able to edit the status of company user

        Given 'Trade' user do login into the website with session
        When user open the following url
                | url             |
                | /company/users/ |
            And user click on the add new user button
            And user enter the following user details:
                | field        | value                                     |
                | Job Title    | Sales                                     |  
                | First Name   | Barbara                                   |
                | Last Name    | Hepworth                                  |
                | Email        | test-trade-user@n8ko5unu.mailosaur.net    |
                | Phone Number | 7145155920                                |
            And user click on the save button from the user popup
            And the following success message should be displayed on the company users page
                | successMessage                         |
                | The customer was successfully created. |
            And user click on the edit link of given user from the company users list page
            And user click on status dropdown and select status as inactive
            And user click on the save button from the user popup
            Then the following success message should be displayed on the company users page
                 | successMessage                         |
                 | The customer was successfully updated. |
            And user click on inactive user link
            And user status should be displayed as 'Inactive' on the company users page
            And user delete the given user
        
    #--------------------------------------------------------------------------------------------------

    @all @companyUsersPage @trade @us @uk @eu @testcase_360
    Scenario: The company admin user can able to see show active users and show inactive users options

        Given 'Trade' user do login into the website with session
        When user open the following url
                | url             |
                | /company/users/ |
            And user click on show all user link
        Then user can able to see 'Show Active Users' as option on the company users page
            And user can able to see 'Show Inactive Users' option on the company users page

    #--------------------------------------------------------------------------------------------------

    @all @companyUsersPage @trade @us @uk @eu @testcase_362
    Scenario: The company admin user should able to see show active users list 

        Given 'Trade' user do login into the website with session
        When user open the following url
                | url             |
                | /company/users/ |
            And user click on the add new user button
            And user enter the following user details:
                | field        | value                                     |
                | Job Title    | Sales                                     |  
                | First Name   | Barbara                                   |
                | Last Name    | Hepworth                                  |
                | Email        | test-trade-user@n8ko5unu.mailosaur.net    |
                | Phone Number | 7145155920                                |
            And user click on the save button from the user popup
            And user click on show all user link
            And user click on active user link
        Then users status should be displayed as 'Active' and not display 'Inactive' on the show active user list
            And user delete the given user
    
    #--------------------------------------------------------------------------------------------------

    @all @companyUsersPage @trade @us @uk @eu @testcase_372
    Scenario: The company admin user should able to see show inactive users list 

        Given 'Trade' user do login into the website with session
        When user open the following url
                | url             |
                | /company/users/ |
            And user click on the add new user button
            And user enter the following user details:
                | field        | value                                     |
                | Job Title    | Sales                                     |  
                | First Name   | Barbara                                   |
                | Last Name    | Hepworth                                  |
                | Email        | test-trade-user@n8ko5unu.mailosaur.net    |
                | Phone Number | 7145155920                                |
            And user click on the save button from the user popup
            And the following success message should be displayed on the company users page
                | successMessage                         |
                | The customer was successfully created. |
            And user click on the edit link of given user from the company users list page
            And user click on status dropdown and select status as inactive
            And user click on the save button from the user popup
            Then the following success message should be displayed on the company users page
                 | successMessage                         |
                 | The customer was successfully updated. |
            And user click on show all user link
            And user click on inactive user link
        Then users status should be displayed as 'Inactive' and not display 'Active' on the show Inactive user list
            And user delete the given user
    
    #--------------------------------------------------------------------------------------------------

    @all @companyUsersPage @trade @us @uk @eu @testcase_377 
    Scenario: The trade user should be able to show pagination dropdown

        Given 'Trade' user do login into the website with session
        When user open the following url
                | url             |
                | /company/users/ |
        Then pagination dropdown should be available at the bottom of page

   #--------------------------------------------------------------------------------------------------

    @all @companyUsersPage @trade @us @uk @eu @testcase_378 
    Scenario: The trade user should be able to login to system.

        Given 'Trade' user do login into the website with session
        When user open the following url
                | url             |
                | /company/users/ |
        Then user email should be displayed under email column on the company users list page

    #--------------------------------------------------------------------------------------------------

    @all @companyUsersPage @trade @us @uk @eu @testcase_412
    Scenario: The trade user should be able to see count on UI match with number of users display on grid.

        Given 'Trade' user do login into the website with session
        When user open the following url
                | url             |
                | /company/users/ |
        Then the item count should be the same as the added users