Feature: Login Page

    Retail, Trade, or Wholesale users can do a login from the home page.

    #--------------------------------------------------------------------------------------------------

    @all @loginPage @retail @us @uk @eu @testcase_02
    Scenario: The retail user should be able to do login from the home page

        Given user is on the login page
        When 'Retail' user do login
        Then user should get logged-in

    #--------------------------------------------------------------------------------------------------

    @all @loginPage @trade @us @uk @eu @testcase_234
    Scenario: The trade user should be able to do login from the home page

        Given user is on the login page
        When 'Trade' user do login
        Then user should get logged-in

    #--------------------------------------------------------------------------------------------------

    @all @loginPage @wholesale @us @uk @eu @testcase_235
    Scenario: The wholesale user should be able to do login from the home page

        Given user is on the login page
        When 'Wholesale' user do login
        Then user should get logged-in

    #--------------------------------------------------------------------------------------------------

    @all @loginPage @user @us @uk @eu @testcase_423
    Scenario: The user should be able to see the validation message on entering invalid credentials

        Given user is on the login page
        When user enter the 'testaccountinvalid@n8ko5unu.mailosaur.net' email
            And user enter the 'Test123@pqj' password
            And user click on the login button
        Then the following validation message should be displayed on the login page
            | message                                                                                                     |
            | The account sign-in was incorrect or your account is disabled temporarily. Please wait and try again later. |

    #--------------------------------------------------------------------------------------------------

    @all @loginPage @user @us @uk @eu @testcase_424 
    Scenario: The user should be able to see the validation message on entering incorrect email address

        Given user is on the login page
        When user enter the 'test@n8ko5unu.mailosaur.n.t' email
            And user enter the 'Test123@pqj' password
            And user click on the login button
        Then the following field validation message should be displayed on the login page
            | field | message                                                      |
            | Email | Please enter a valid email address (Ex: johndoe@domain.com). |