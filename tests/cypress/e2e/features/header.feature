Feature: Header Section

    The user should be able to access the header section.

    #--------------------------------------------------------------------------------------------------
    
    @all @header @user @us @uk @eu @testcase_430
    Scenario: The guest user should be able to see that the showroom icon is visible and by clicking on the icon it should redirect to the showroom landing page

        Given user is on the login page
        Then user should be able to see showroom icon
        When user click on showroom icon
        Then page url should end with the '/showrooms/' sub-url
            And 'Showrooms' page should get loaded

    #--------------------------------------------------------------------------------------------------

    @all @header @user @us @uk @eu @testcase_433
    Scenario: The guest user should be able to see that contact us icon is visible and by clicking on the icon it should redirect to the contact us page

        Given user is on the login page
        Then user should be able to see contact us icon
        When user click on contact us icon
        Then page url should end with the '/contact/' sub-url
            And 'Contact Us' page should get loaded
    
    #--------------------------------------------------------------------------------------------------

    @all @header @user @us @uk @eu @testcase_452
    Scenario: The guest user should be able to see the website logo in the center of header

        Given user is on the login page
        Then user should be able to see the website logo in the 'center' of header
    
    #--------------------------------------------------------------------------------------------------

    @all @header @user @us @uk @eu @testcase_453
    Scenario: The guest user should be redirected to the home page by clicking on the website logo

        Given user is on the login page
        When user click on the website logo 
        Then home page should get opened with below title
            | country | title                                                              |
            | US      | Signature Designer Light Fixtures Experience Visual Comfort & Co.  |
            | UK      | Signature Designer Lighting Experience Visual Comfort & Co.        |
            | EU      | Signature Designer Lighting Experience Visual Comfort & Co.        |