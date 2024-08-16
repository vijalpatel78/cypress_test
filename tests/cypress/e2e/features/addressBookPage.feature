Feature: Address Book Page

    The user should be able to access the address book page.

    #--------------------------------------------------------------------------------------------------

    @all @addressBookPage @retail @us @uk @eu @testcase_467
    Scenario: The retail user can navigate to the Address Book page from the account's top header menus

        Given 'Retail' user do login into the website with session
        When user open the following url
                | url                |
                | /customer/address/ |
            And user click on the below header name
                | country | header          |
                | US      | Address Book    |
                | UK      | My Address Book |
                | EU      | My Address Book |
        Then 'Address Book' page should get loaded
            And user should be able to see below header as selected 
                | country | header          |
                | US      | Address Book    |
                | UK      | My Address Book |
                | EU      | My Address Book |
            And the page URL should end with '/customer/address/'
    
    #--------------------------------------------------------------------------------------------------

    @all @addressBookPage @retail @us @uk @eu @testcase_463 
    Scenario: The retail user should be able to update the default billing or shipping address

        Given 'Retail' user do login into the website with session
        When user open the following url
                | url                |
                | /customer/address/ |
        Then 'Address Book' page should get loaded
        When user click on the edit link of the 'Default Billing Address'
            And user enter the 'Lots Rd' in the 'Address: Line 2 (Optional)' field
            And user click on the Save Address button
        Then the following success message should be displayed on the 'Address Book' page
                | message                |
                | You saved the address. |
            And the 'Lots Rd' should be displayed on the 'Default Billing Address'
            And the 'Lots Rd' should be displayed on the 'Default Shipping Address' 