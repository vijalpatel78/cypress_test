Feature: Create New Account Page

    The user should be able to create a new account with the application.

    #--------------------------------------------------------------------------------------------------
    
    @all @createNewAccountPage @retail @us @eu @testcase_27 
    Scenario: The retail user should be able to create a new account

        Given user is on the login page
        When user click on the create an account button
            And user enter the following new retail account details:
                | field      | value                                      |
                | First Name | Barbara                                    |
                | Last Name  | Hepworth                                   |
                | Email      | test-cypress-retail@n8ko5unu.mailosaur.net |
                | Password   | sculpture@stIves123                        |
            And user click on the terms and conditions checkbox
            And user click on the create account button
        Then new retail account should get created with the following success message:
                | successMessage                                       |
                | Thank you for registering with Visual Comfort & Co.. |
            And welcome message should contain the following first and last name:
                | label      | value                    |
                | First Name | Barbara                  |
                | Last Name  | Hepworth                 |
            And user should get logged into the account

    #--------------------------------------------------------------------------------------------------
    
    @all @createNewAccountPage @wholesale @trade @us @eu @testcase_161 
    Scenario: The wholesale or trade user should be able to request an account with JPG file

        Given user is on the login page
        When user click on the request an account button
            And user enter the following account details:
                | field                  | value                                     |
                | First Name             | Barbara                                   |
                | Last Name              | Hepworth                                  |
                | Company Name           | Test Company                              |
                | Email                  | test-cypress-trade@n8ko5unu.mailosaur.net |
                | Password               | sculpture@stIves123                       |
                | Type of Business       | Ecommerce                                 |
                | Interested Collections | VC Signature                              |
            And user enter the following address details:
                | country | field          | value                    |
                | US      | Address Line 1 | 2808 18th St S           |
                | US      | Country        | United States            |
                | US      | City           | Homewood                 |
                | US      | State          | Alabama                  |
                | US      | Zip Code       | 35209-2510               |
                | US      | Phone Number   | 2058475330               |
                | UK      | Address Line 1 | 52 Southend Avenue       |
                | UK      | Country        | United Kingdom           |
                | UK      | City           | Newport                  |
                | UK      | State          | Barton                   |
                | UK      | Zip Code       | PO30 1FL                 |
                | UK      | Phone Number   | 07089196791              |
                | EU      | Address Line 1 | 108, De Hoper North      |
                | EU      | Country        | Netherlands              |
                | EU      | City           | Amsterdam                |
                | EU      | State          | Holland                  |
                | EU      | Zip Code       | 1511 HN                  |
                | EU      | Phone Number   | 07089196791              |
            And user upload 'tradeWholesaleAccountCreationJPGFile.jpg' file located in the fixtures folder
            And user click on the terms and conditions checkbox
            And user click on the submit account request button to create a new account
        Then new wholesale or trade account should get created with the following success message
                | successMessage                                                    |
                | Thank you! We're reviewing your request and will contact you soon |
    
    #--------------------------------------------------------------------------------------------------
    
    @all @createNewAccountPage @wholesale @trade @us @uk @eu @testcase_381
    Scenario: The wholesale or trade user should be able to click the privacy policy link from the create new account page

        Given user is on the login page
        When user click on the request an account button
            And user click on the privacy policy link from the create new account page
        Then the 'Privacy Policy' page should be opened
            And the page URL should end with '/privacy-policy/'
            And the below breadcrumb value should be displayed on the page
                | value                 |
                | Home / Privacy Policy |
    
    #--------------------------------------------------------------------------------------------------

    @all @createNewAccountPage @retail @us @uk @eu @testcase_425
    Scenario: The retail user should be able to see a validation message on leaving required fields blank

        Given user is on the login page
        When user click on the create an account button
            And user click on the create account button from the 'Create New Customer Account' page
        Then the following field validation message should be displayed on the 'Create New Customer Account' page
                | field              | message                                           |
                | First Name         | This is a required field.                         |
                | Last Name          | This is a required field.                         |
                | Email              | This is a required field.                         |
                | Password           | This is a required field.                         |
                | Confirm Password   | This is a required field.                         |
                | Terms & Conditions | Please select terms and condition before proceed  |
    
    #--------------------------------------------------------------------------------------------------

    @all @createNewAccountPage @retail @us @uk @eu @testcase_426
    Scenario: The retail user should be able to see 'Passwords must match' validation message on entering mismatch passwords

        Given user is on the login page
        When user click on the create an account button
            And user enter the following new retail account details:
                | field            | value                       |
                | First Name       | Barbara                     |
                | Last Name        | Hepworth                    |
                | Email            | test@n8ko5unu.mailosaur.net |
                | Password         | sculpture@stIves123         |
                | Confirm Password | test@#                      |              
            And user click on the terms and conditions checkbox
            And user click on the create account button
        Then the following field validation message should be displayed on the 'Create New Customer Account' page
                | field              | message                |
                | Confirm Password   | Passwords must match.  |
    
    #--------------------------------------------------------------------------------------------------

    @all @createNewAccountPage @wholesale @trade @us @uk @eu @testcase_431
    Scenario: The wholesale or trade user should be able to see 'Passwords must match' validation message on entering mismatch passwords

        Given user is on the login page
        When user click on the request an account button
            And user enter the following account details:
                | field              | value                   |
                | Password           | sculpture@stIves123     |
                | Confirm Password   | test@123AS              |
            And user click on the submit account request button
        Then the following field validation message should be displayed on the 'Request Trade/Wholesale Account' page
                | field              | message                |
                | Confirm Password   | Passwords must match.  |
    
    #--------------------------------------------------------------------------------------------------

    @all @createNewAccountPage @wholesale @trade @us @uk @eu @testcase_432
    Scenario: The wholesale or trade user should be able to see the 'We don't recognize or support this file extension type.' validation message on uploading the wrong file format

        Given user is on the login page
        When user click on the request an account button
            And user enter the following account details:
                | field                  | value                                     |
                | First Name             | Barbara                                   |
                | Last Name              | Hepworth                                  |
                | Company Name           | Test Company                              |
                | Email                  | test-cypress-trade@n8ko5unu.mailosaur.net |
                | Password               | sculpture@stIves123                       |
                | Type of Business       | Ecommerce                                 |
                | Interested Collections | VC Signature                              |
            And user enter the following address details:
                | country | field          | value                    |
                | US      | Address Line 1 | 2808 18th St S           |
                | US      | Country        | United States            |
                | US      | City           | Homewood                 |
                | US      | State          | Alabama                  |
                | US      | Zip Code       | 35209-2510               |
                | US      | Phone Number   | 2058475330               |
                | UK      | Address Line 1 | 52 Southend Avenue       |
                | UK      | Country        | United Kingdom           |
                | UK      | City           | Newport                  |
                | UK      | State          | Barton                   |
                | UK      | Zip Code       | PO30 1FL                 |
                | UK      | Phone Number   | 07089196791              |
                | EU      | Address Line 1 | 108, De Hoper North      |
                | EU      | Country        | Netherlands              |
                | EU      | City           | Amsterdam                |
                | EU      | State          | Holland                  |
                | EU      | Zip Code       | 1511 HN                  |
                | EU      | Phone Number   | 07089196791              |
            And user click on the terms and conditions checkbox
            And user upload the wrong 'wrongFileFormatForCreateNewTradeAccount.xlsx' file format located in the fixtures folder
        Then the attention popup with the following message should be displayed on the 'Request Trade/Wholesale Account' page
                | message                                                 |
                | We don't recognize or support this file extension type. |
    
    #--------------------------------------------------------------------------------------------------

    @all @createNewAccountPage @wholesale @trade @us @eu @testcase_436
    Scenario: The wholesale or trade user should be able to request an account with PNG file

        Given user is on the login page
        When user click on the request an account button
            And user enter the following account details:
                | field                  | value                                     |
                | First Name             | Barbara                                   |
                | Last Name              | Hepworth                                  |
                | Company Name           | Test Company                              |
                | Email                  | test-cypress-trade@n8ko5unu.mailosaur.net |
                | Password               | sculpture@stIves123                       |
                | Type of Business       | Ecommerce                                 |
                | Interested Collections | VC Signature                              |
            And user enter the following address details:
                | country | field          | value                    |
                | US      | Address Line 1 | 2808 18th St S           |
                | US      | Country        | United States            |
                | US      | City           | Homewood                 |
                | US      | State          | Alabama                  |
                | US      | Zip Code       | 35209-2510               |
                | US      | Phone Number   | 2058475330               |
                | UK      | Address Line 1 | 52 Southend Avenue       |
                | UK      | Country        | United Kingdom           |
                | UK      | City           | Newport                  |
                | UK      | State          | Barton                   |
                | UK      | Zip Code       | PO30 1FL                 |
                | UK      | Phone Number   | 07089196791              |
                | EU      | Address Line 1 | 108, De Hoper North      |
                | EU      | Country        | Netherlands              |
                | EU      | City           | Amsterdam                |
                | EU      | State          | Holland                  |
                | EU      | Zip Code       | 1511 HN                  |
                | EU      | Phone Number   | 07089196791              |
            And user upload 'tradeWholesaleAccountCreationPNGFile.png' file located in the fixtures folder
            And user click on the terms and conditions checkbox
            And user click on the submit account request button to create a new account
        Then new wholesale or trade account should get created with the following success message
                | successMessage                                                    |
                | Thank you! We're reviewing your request and will contact you soon |
    
    #--------------------------------------------------------------------------------------------------

    @all @createNewAccountPage @wholesale @trade @us @eu @testcase_437
    Scenario: The wholesale or trade user should be able to request an account with PDF file

        Given user is on the login page
        When user click on the request an account button
            And user enter the following account details:
                | field                  | value                                     |
                | First Name             | Barbara                                   |
                | Last Name              | Hepworth                                  |
                | Company Name           | Test Company                              |
                | Email                  | test-cypress-trade@n8ko5unu.mailosaur.net |
                | Password               | sculpture@stIves123                       |
                | Type of Business       | Ecommerce                                 |
                | Interested Collections | VC Signature                              |
            And user enter the following address details:
                | country | field          | value                    |
                | US      | Address Line 1 | 2808 18th St S           |
                | US      | Country        | United States            |
                | US      | City           | Homewood                 |
                | US      | State          | Alabama                  |
                | US      | Zip Code       | 35209-2510               |
                | US      | Phone Number   | 2058475330               |
                | UK      | Address Line 1 | 52 Southend Avenue       |
                | UK      | Country        | United Kingdom           |
                | UK      | City           | Newport                  |
                | UK      | State          | Barton                   |
                | UK      | Zip Code       | PO30 1FL                 |
                | UK      | Phone Number   | 07089196791              |
                | EU      | Address Line 1 | 108, De Hoper North      |
                | EU      | Country        | Netherlands              |
                | EU      | City           | Amsterdam                |
                | EU      | State          | Holland                  |
                | EU      | Zip Code       | 1511 HN                  |
                | EU      | Phone Number   | 07089196791              |
            And user upload 'tradeWholesaleAccountCreationPDFFile.pdf' file located in the fixtures folder
            And user click on the terms and conditions checkbox
            And user click on the submit account request button to create a new account
        Then new wholesale or trade account should get created with the following success message
                | successMessage                                                    |
                | Thank you! We're reviewing your request and will contact you soon |
    
    #--------------------------------------------------------------------------------------------------

    @all @createNewAccountPage @wholesale @trade @us @uk @eu @testcase_442
    Scenario: The wholesale or trade user should be able to see the validation message if the password does not meet the minimum requirements for password creation

        Given user is on the login page
        When user click on the request an account button
            And user enter the following account details:
                | field     | value       |
                | Password  | test*test   |
            And user click on the submit account request button
        Then the following field validation message should be displayed on the 'Request Trade/Wholesale Account' page
                | field      | message                                                                                                                                 |
                | Password   | Minimum of different classes of characters in password is 3. Classes of characters: Lower Case, Upper Case, Digits, Special Characters. |

    #--------------------------------------------------------------------------------------------------

    @all @createNewAccountPage @wholesale @trade @us @uk @eu @testcase_444
    Scenario: The wholesale or trade user should be able to see the 'Minimum password length must be equal or greater than 8 symbols' validation message

        Given user is on the login page
        When user click on the request an account button
            And user enter the following account details:
                | field      | value   |
                | Password   | test    |
            And user click on the submit account request button
        Then the following field validation message should be displayed on the 'Request Trade/Wholesale Account' page
                | field    | message                                                                                                            |
                | Password | Minimum length of this field must be equal or greater than 8 symbols. Leading and trailing spaces will be ignored. |

    #--------------------------------------------------------------------------------------------------

    @all @createNewAccountPage @wholesale @trade @us @uk @eu @testcase_446
    Scenario: The wholesale or trade user should be able to see a validation message on leaving required fields blank

        Given user is on the login page
        When user click on the request an account button
            And user click on the submit account request button from the 'Request Trade/Wholesale Account' page
        Then the following field validation message should be displayed on the 'Request Trade/Wholesale Account' page
                | field                 | message                                           |
                | First Name            | This is a required field.                         |
                | Last Name             | This is a required field.                         |
                | Company Name          | This is a required field.                         |
                | Contact Email         | This is a required field.                         |
                | Confirm Contact Email | This is a required field.                         |
                | Password              | This is a required field.                         |
                | Confirm Password      | This is a required field.                         |
                | Address               | This is a required field.                         |
                | City                  | This is a required field.                         |
                | State                 | This is a required field.                         |
                | ZIP/Postal Code       | This is a required field.                         |
                | Phone                 | This is a required field.                         |
                | Type of Business      | This is a required field.                         |
                | Upload Document       | This is a required field                          |
                | Terms & Conditions    | Please select terms and condition before proceed  |

    #--------------------------------------------------------------------------------------------------
    
    @all @createNewAccountPage @retail @us @uk @eu @testcase_447
    Scenario: The retail user should be able to click the privacy policy link from the create new account page

        Given user is on the login page
        When user click on the create an account button
            And user click on the privacy policy link from the create new account page
        Then the 'Privacy Policy' page should be opened
            And the page URL should end with '/privacy-policy/'
            And the below breadcrumb value should be displayed on the page
                | value                 |
                | Home / Privacy Policy |