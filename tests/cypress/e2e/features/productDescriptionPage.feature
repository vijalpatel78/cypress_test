Feature: Product Description Page

    The user should be able to access the product description page.

    #--------------------------------------------------------------------------------------------------
    
    @all @productDescriptionPage @retail @us @uk @eu @testcase_46
    Scenario: The product name and price should be the same as displayed on the search result page of retail account

        Given user is on the login page
        When 'Retail' user do login into the website
            And user search 'JN5112' 
            And user press enter key
            And user collect the following details of 'JN5112' product from the list
                | label         | 
                | Product Name  |
                | Price         |
            And user click on the 'JN5112' product
        Then the product description page of 'JN5112' should get opened
            And the following product details should be the same as displayed on the list
                | label         |
                | Product Name  |
                | Price         |

    #--------------------------------------------------------------------------------------------------
    
    @all @productDescriptionPage @wholesale @us @uk @eu @testcase_47
    Scenario: The product name and price should be the same as displayed on the search result page of wholesale account

        Given user is on the login page
        When 'Wholesale' user do login into the website
            And user search 'JN5112' 
            And user press enter key
            And user collect the following details of 'JN5112' product from the list
                | label         | 
                | Product Name  |
                | Price         |
            And user click on the 'JN5112' product
        Then the product description page of 'JN5112' should get opened
            And the following product details should be the same as displayed on the list
                | label         |
                | Product Name  |
                | Price         |
    
    #--------------------------------------------------------------------------------------------------
    
    @all @productDescriptionPage @trade @us @uk @eu @testcase_48
    Scenario: The product name and price should be the same as displayed on the search result page of trade account

        Given user is on the login page
        When 'Trade' user do login into the website
            And user search 'JN5112' 
            And user press enter key
            And user collect the following details of 'JN5112' product from the list
                | label          | 
                | Product Name   |
                | Original Price | 
                | Trade Price    |
            And user click on the 'JN5112' product
        Then the product description page of 'JN5112' should get opened
            And the following product details should be the same as displayed on the list
                | label          |
                | Product Name   |
                | Original Price | 
                | Trade Price    |

    #--------------------------------------------------------------------------------------------------
    
    @all @productDescriptionPage @user @us @uk @eu @testcase_49
    Scenario: The user should not be able to save the product to project without login

        Given user is on the home page
        When user enter the following product description page url:
                | country | productDescriptionPageUrl          |
                | US      | /talia-large-chandelier-jn5112/    |
                | UK      | /talia-large-chandelier-eu-jn5112/ |
                | EU      | /talia-large-chandelier-eu-jn5112/ |
            And user navigate to product description page of 'JN5112' product
            And user click on save to project link
        Then user redirect to login page which has below title
                | title |
                | Login |
            And the following validation message should be displayed on login page
                | validationMessage                                        |
                | You must login or register to add items to your project. |      

    #--------------------------------------------------------------------------------------------------
    
    @all @productDescriptionPage @user @us @uk @eu @testcase_50
    Scenario: The user should be able to add the product to cart   

        Given user is on the home page
        When user enter the following product description page url:
                | country | productDescriptionPageUrl          |
                | US      | /talia-large-chandelier-jn5112/    |
                | UK      | /talia-large-chandelier-eu-jn5112/ |
                | EU      | /talia-large-chandelier-eu-jn5112/ |
            And user navigate to product description page of 'JN5112' product
            And user select the following product variants:
                | country | variant | value                        |
                | US      | Finish  | Gild and Clear Swirled Glass |
                | UK      | Finish  | Gild and Clear Swirled Glass |
                | EU      | Finish  | Gild and Clear Swirled Glass |               
            And user collect the following details of product from the product description page
                | label          |
                | Product Name   |
                | Product Price  |
                | Product Qty    |
                | Finish         |
            And user click on the add to cart button
        Then the following add to cart success message should be displayed
                | successMessage | 
                | You added Talia Large Chandelier to your shopping cart.  |
            And the following item details should be displayed on the mini cart
                | label          |
                | Product Name   |
                | Product Price  |
                | Product Qty    |
                | Finish         |

    #--------------------------------------------------------------------------------------------------
    
    @all @productDescriptionPage @user @us @uk @eu @testcase_51
    Scenario: The sku code should get changed according to the selected finish from dropdown

        Given user is on the home page
        When user enter the following product description page url:
                | country | productDescriptionPageUrl          |
                | US      | /talia-large-chandelier-jn5112/    |
                | UK      | /talia-large-chandelier-eu-jn5112/ |
                | EU      | /talia-large-chandelier-eu-jn5112/ |
            And user navigate to product description page of 'JN5112' product
            And user select the following product variants:
                | country | variant | value                                         |
                | US      | Finish  | Burnished Silver Leaf and Clear Swirled Glass |
                | UK      | Finish  | Burnished Silver Leaf and Clear Swirled Glass |
                | EU      | Finish  | Burnished Silver Leaf and Clear Swirled Glass |
        Then user should be able to see below sku code
                | country | skuCode          | 
                | US      | JN 5112BSL/CG    |
                | UK      | JN 5112BSL/CG-EU |
                | EU      | JN 5112BSL/CG-EU | 

    #--------------------------------------------------------------------------------------------------
    
    @all @productDescriptionPage @retail @us @uk @eu @testcase_52
    Scenario: The retail user should be able to save the product to project

        Given user is on the login page
        When 'Retail' user do login into the website
            And user enter the following product description page url:
                | country | productDescriptionPageUrl          |
                | US      | /talia-large-chandelier-jn5112/    |
                | UK      | /talia-large-chandelier-eu-jn5112/ |
                | EU      | /talia-large-chandelier-eu-jn5112/ |
            And user navigate to product description page of 'JN5112' product
            And user click on save to project link
        Then user should be able to see below success message of save to project or quote
            | message                                                                                  |
            | Talia Large Chandelier has been added to your Projects.Click here to view your Projects. |

    #--------------------------------------------------------------------------------------------------
    
    @all @productDescriptionPage @user @us @testcase_53 
    Scenario: The user should be able to add the product to cart without bulb 

        Given user is on the home page
        When user enter the following product description page url:
                | country | productDescriptionPageUrl          |
                | US      | /talia-large-chandelier-jn5112/    |
                | UK      | /talia-large-chandelier-eu-jn5112/ |
                | EU      | /talia-large-chandelier-eu-jn5112/ |
            And user navigate to product description page of 'JN5112' product
            And user select the following product variants:
                | country | variant | value                        |
                | US      | Finish  | Gild and Clear Swirled Glass |
            And user unselect the bulb checkbox
            And user collect the following details of product from the product description page
                | label          |
                | Product Name   |
                | Product Price  |
                | Product Qty    |
                | Finish         |
            And user click on the add to cart button from the product description page
            And user collect the following details of bulb from the add bulb popup
                | label     |
                | Bulb Name |
            And user close the add bulb popup
        Then the following add to cart success message should be displayed
                | successMessage                                          | 
                | You added Talia Large Chandelier to your shopping cart. |
            And the bulb name should not be displayed on the mini cart
            And the following item details should be displayed on the mini cart
                | label         |
                | Product Name  |
                | Product Price |
                | Product Qty   |
                | Finish        |
    
    #--------------------------------------------------------------------------------------------------
    
    @all @productDescriptionPage @user @us @testcase_54
    Scenario: The user should be able to add the product to cart with a bulb from the add bulb popup 

        Given user is on the home page
        When user enter the following product description page url:
                | country | productDescriptionPageUrl          |
                | US      | /talia-large-chandelier-jn5112/    |
                | UK      | /talia-large-chandelier-eu-jn5112/ |
                | EU      | /talia-large-chandelier-eu-jn5112/ |
            And user navigate to product description page of 'JN5112' product
            And user select the following product variants:
                | country | variant | value                        |
                | US      | Finish  | Gild and Clear Swirled Glass |
            And user unselect the bulb checkbox
            And user collect the following details of product from the product description page
                | label          |
                | Product Name   |
                | Product Price  |
                | Product Qty    |
                | Finish         |
            And user click on the add to cart button from the product description page
            And user collect the following details of bulb from the add bulb popup
                | label      |
                | Bulb Name  |
                | Bulb Price |
                | Bulb Qty   |
            And user click on the add to cart button from the add bulb popup
            And user click on the mini cart icon           
        Then user redirect to shopping cart page which has below title
                | title         |
                | Shopping Cart |                                   
            And the following item details should be displayed on the shopping cart page
                | label         |
                | Product Name  |
                | Product Price |
                | Product Qty   |
                | Finish        |
                | Bulb Name     |
                | Bulb Price    |
                | Bulb Qty      |
    
    #--------------------------------------------------------------------------------------------------
    
    @all @productDescriptionPage @retail @us @uk @eu @testcase_55
    Scenario: The retail user should be able to create new project and save product to that new project

        Given user is on the login page
        When 'Retail' user do login into the website
            And user delete 'Cypress Test Project' from 'Projects' page if present
            And user enter the following product description page url:
                | country | productDescriptionPageUrl          |
                | US      | /talia-large-chandelier-jn5112/    |
                | UK      | /talia-large-chandelier-eu-jn5112/ |
                | EU      | /talia-large-chandelier-eu-jn5112/ |
            And user navigate to product description page of 'JN5112' product
            And user select the following product variants:
                | country | variant | value                        |
                | US      | Finish  | Gild and Clear Swirled Glass |
                | UK      | Finish  | Gild and Clear Swirled Glass |
                | EU      | Finish  | Gild and Clear Swirled Glass |
            And user click on the create new project link
            And user enter 'Cypress Test Project' project name
            And user click on the create new project button
        Then the following success messages of adding a product to a new project should be displayed
                | successMessages                                                                          | 
                | Project "Cypress Test Project" was saved.                                                |
                | Talia Large Chandelier has been added to your Projects.Click here to view your Projects. |
            And user delete 'Cypress Test Project' from 'Projects' page if present
    
    #--------------------------------------------------------------------------------------------------

    @all @productDescriptionPage @retail @us @uk @eu @testcase_56
    Scenario: The retail user should be able to change the quantity of product

        Given user is on the login page
        When 'Retail' user do login into the website
            And user clear added items from the cart
            And user enter the following product description page url:
                | country | productDescriptionPageUrl          |
                | US      | /talia-large-chandelier-jn5112/    |
                | UK      | /talia-large-chandelier-eu-jn5112/ |
                | EU      | /talia-large-chandelier-eu-jn5112/ |
            And user navigate to product description page of 'JN5112' product
            And user select the following product variants:
                | country | variant | value                        |
                | US      | Finish  | Gild and Clear Swirled Glass |
                | UK      | Finish  | Gild and Clear Swirled Glass |
                | EU      | Finish  | Gild and Clear Swirled Glass | 
            And user add 5 quantity of product
            And user click on the add to cart button
        Then the following quantity should be displayed on the mini cart for 'Talia Large Chandelier' product
                | productQuantity |
                | 5               |

    #--------------------------------------------------------------------------------------------------

    @all @productDescriptionPage @trade @us @uk @eu @testcase_57
    Scenario: The trade user should be able to save the product to quote

        Given user is on the login page
        When 'Trade' user do login into the website
            And user enter the following product description page url:
                | country | productDescriptionPageUrl          |
                | US      | /talia-large-chandelier-jn5112/    |
                | UK      | /talia-large-chandelier-eu-jn5112/ |
                | EU      | /talia-large-chandelier-eu-jn5112/ |
            And user navigate to product description page of 'JN5112' product
            And user select the following product variants:
                | country | variant | value                        |
                | US      | Finish  | Gild and Clear Swirled Glass |
                | UK      | Finish  | Gild and Clear Swirled Glass |
                | EU      | Finish  | Gild and Clear Swirled Glass | 
            And user click add to quote button
            And user select 'TestCy' from add to quote
        Then user should be able to see below success message of save to project or quote
                | message                                                            |
                | Product Talia Large Chandelier has been added to the quote TestCy. | 

    #--------------------------------------------------------------------------------------------------
    
    @all @productDescriptionPage @user @us @uk @eu @testcase_58
    Scenario: The sku code and finish option should get changed according to the selected product image

        Given user is on the home page
        When user enter the following product description page url:
                | country | productDescriptionPageUrl          |
                | US      | /talia-large-chandelier-jn5112/    |
                | UK      | /talia-large-chandelier-eu-jn5112/ |
                | EU      | /talia-large-chandelier-eu-jn5112/ |
            And user navigate to product description page of 'JN5112' product
            And user click on below product image from the product description page
                | country | image           |
                | US      | JN 5112PW/CG    |
                | UK      | JN 5112PW/CG-EU |
                | EU      | JN 5112PW/CG-EU |  
        Then user should be able to see below finish selected
                | Finish                                |
                | Plaster White and Clear Swirled Glass |
            And user should be able to see below sku code
                | country | skuCode         | 
                | US      | JN 5112PW/CG    |
                | UK      | JN 5112PW/CG-EU |
                | EU      | JN 5112PW/CG-EU |    

    #--------------------------------------------------------------------------------------------------
    
    @all @productDescriptionPage @wholesale @us @uk @eu @testcase_189
    Scenario: The wholesale user should be able to see mega menus and its sub-options on the product description page

        Given user is on the login page
        When 'Wholesale' user do login into the website
            And user enter the following product description page url:
                | country | productDescriptionPageUrl          |
                | US      | /talia-large-chandelier-jn5112/    |
                | UK      | /talia-large-chandelier-eu-jn5112/ |
                | EU      | /talia-large-chandelier-eu-jn5112/ |
            And user wait for 5 seconds  
            And user mouseover on the 'Wall' mega menu    
        Then user should be able to see submenus of 'Wall' mega menu 
        When user mouseover on the 'Ceiling' mega menu
        Then user should be able to see submenus of 'Ceiling' mega menu
        When user mouseover on the 'Table' mega menu
        Then user should be able to see submenus of 'Table' mega menu
        When user mouseover on the 'Floor' mega menu
        Then user should be able to see submenus of 'Floor' mega menu
        When user mouseover on the 'Outdoor' mega menu
        Then user should be able to see submenus of 'Outdoor' mega menu
        When user mouseover on the 'Fans' mega menu
        Then user should be able to see submenus of 'Fans' mega menu
        When user mouseover on the 'Architectural' mega menu
        Then user should be able to see submenus of 'Architectural' mega menu
        When user mouseover on the 'Our Collections' mega menu
        Then user should be able to see submenus of 'Our Collections' mega menu
        When user mouseover on the 'Our Designers' mega menu
        Then user should be able to see submenus of 'Our Designers' mega menu
        When user mouseover on the 'Sale' mega menu
        Then user should be able to see submenus of 'Sale' mega menu

    #--------------------------------------------------------------------------------------------------
    
    @all @productDescriptionPage @trade @us @uk @eu @testcase_190
    Scenario: The trade user should be able to see mega menus and its sub-options on the product description page

        Given user is on the login page
        When 'Trade' user do login into the website
            And user enter the following product description page url:
                | country | productDescriptionPageUrl          |
                | US      | /talia-large-chandelier-jn5112/    |
                | UK      | /talia-large-chandelier-eu-jn5112/ |
                | EU      | /talia-large-chandelier-eu-jn5112/ |
            And user wait for 5 seconds 
            And user mouseover on the 'Wall' mega menu    
        Then user should be able to see submenus of 'Wall' mega menu 
        When user mouseover on the 'Ceiling' mega menu
        Then user should be able to see submenus of 'Ceiling' mega menu
        When user mouseover on the 'Table' mega menu
        Then user should be able to see submenus of 'Table' mega menu
        When user mouseover on the 'Floor' mega menu
        Then user should be able to see submenus of 'Floor' mega menu
        When user mouseover on the 'Outdoor' mega menu
        Then user should be able to see submenus of 'Outdoor' mega menu
        When user mouseover on the 'Fans' mega menu
        Then user should be able to see submenus of 'Fans' mega menu
        When user mouseover on the 'Architectural' mega menu
        Then user should be able to see submenus of 'Architectural' mega menu
        When user mouseover on the 'Our Collections' mega menu
        Then user should be able to see submenus of 'Our Collections' mega menu
        When user mouseover on the 'Our Designers' mega menu
        Then user should be able to see submenus of 'Our Designers' mega menu
        When user mouseover on the 'Sale' mega menu
        Then user should be able to see submenus of 'Sale' mega menu

    #--------------------------------------------------------------------------------------------------
    
    @all @productDescriptionPage @retail @us @uk @eu @testcase_191
    Scenario: The retail user should be able to see mega menus and its sub-options on the product description page

        Given user is on the login page
        When 'Retail' user do login into the website
            And user enter the following product description page url:
                | country | productDescriptionPageUrl          |
                | US      | /talia-large-chandelier-jn5112/    |
                | UK      | /talia-large-chandelier-eu-jn5112/ |
                | EU      | /talia-large-chandelier-eu-jn5112/ |
            And user wait for 5 seconds 
            And user mouseover on the 'Wall' mega menu    
        Then user should be able to see submenus of 'Wall' mega menu 
        When user mouseover on the 'Ceiling' mega menu
        Then user should be able to see submenus of 'Ceiling' mega menu
        When user mouseover on the 'Table' mega menu
        Then user should be able to see submenus of 'Table' mega menu
        When user mouseover on the 'Floor' mega menu
        Then user should be able to see submenus of 'Floor' mega menu
        When user mouseover on the 'Outdoor' mega menu
        Then user should be able to see submenus of 'Outdoor' mega menu
        When user mouseover on the 'Fans' mega menu
        Then user should be able to see submenus of 'Fans' mega menu
        When user mouseover on the 'Architectural' mega menu
        Then user should be able to see submenus of 'Architectural' mega menu
        When user mouseover on the 'Our Collections' mega menu
        Then user should be able to see submenus of 'Our Collections' mega menu
        When user mouseover on the 'Our Designers' mega menu
        Then user should be able to see submenus of 'Our Designers' mega menu
        When user mouseover on the 'Sale' mega menu
        Then user should be able to see submenus of 'Sale' mega menu

    #--------------------------------------------------------------------------------------------------
    
    @all @productDescriptionPage @user @us @uk @eu @testcase_192
    Scenario: The user should be able to see mega menus and its sub-options on the product description page

        Given user is on the home page
        When user enter the following product description page url:
                | country | productDescriptionPageUrl          |
                | US      | /talia-large-chandelier-jn5112/    |
                | UK      | /talia-large-chandelier-eu-jn5112/ |
                | EU      | /talia-large-chandelier-eu-jn5112/ |
            And user wait for 5 seconds 
            And user mouseover on the 'Wall' mega menu    
        Then user should be able to see submenus of 'Wall' mega menu 
        When user mouseover on the 'Ceiling' mega menu
        Then user should be able to see submenus of 'Ceiling' mega menu
        When user mouseover on the 'Table' mega menu
        Then user should be able to see submenus of 'Table' mega menu
        When user mouseover on the 'Floor' mega menu
        Then user should be able to see submenus of 'Floor' mega menu
        When user mouseover on the 'Outdoor' mega menu
        Then user should be able to see submenus of 'Outdoor' mega menu
        When user mouseover on the 'Fans' mega menu
        Then user should be able to see submenus of 'Fans' mega menu
        When user mouseover on the 'Architectural' mega menu
        Then user should be able to see submenus of 'Architectural' mega menu
        When user mouseover on the 'Our Collections' mega menu
        Then user should be able to see submenus of 'Our Collections' mega menu
        When user mouseover on the 'Our Designers' mega menu
        Then user should be able to see submenus of 'Our Designers' mega menu
        When user mouseover on the 'Sale' mega menu
        Then user should be able to see submenus of 'Sale' mega menu

    #--------------------------------------------------------------------------------------------------
    
    @all @productDescriptionPage @user @us @uk @eu @testcase_221
    Scenario: The user should be able to see the ship by date on the product description page

        Given user is on the home page
        When user enter the following product description page url:
                | country | productDescriptionPageUrl          |
                | US      | /talia-large-chandelier-jn5112/    |
                | UK      | /talia-large-chandelier-eu-jn5112/ |
                | EU      | /talia-large-chandelier-eu-jn5112/ |
            And user navigate to product description page of 'JN5112' product
            And user select the following product variants:
                | country | variant | value                        |
                | US      | Finish  | Gild and Clear Swirled Glass |
                | UK      | Finish  | Gild and Clear Swirled Glass |
                | EU      | Finish  | Gild and Clear Swirled Glass |     
        Then the ship by date should be displayed on the product description page

    #--------------------------------------------------------------------------------------------------
    
    @all @productDescriptionPage @retail @us @uk @eu @testcase_222
    Scenario: The retail user should be able to see the ship by date on the product description page

        Given user is on the login page
        When 'Retail' user do login into the website
            And user enter the following product description page url:
                | country | productDescriptionPageUrl          |
                | US      | /talia-large-chandelier-jn5112/    |
                | UK      | /talia-large-chandelier-eu-jn5112/ |
                | EU      | /talia-large-chandelier-eu-jn5112/ |
            And user navigate to product description page of 'JN5112' product
            And user select the following product variants:
                | country | variant | value                        |
                | US      | Finish  | Gild and Clear Swirled Glass |
                | UK      | Finish  | Gild and Clear Swirled Glass |
                | EU      | Finish  | Gild and Clear Swirled Glass |     
        Then the ship by date should be displayed on the product description page
    
    #--------------------------------------------------------------------------------------------------
    
    @all @productDescriptionPage @wholesale @us @uk @eu @testcase_223
    Scenario: The wholesale user should be able to see the ship by date on the product description page

        Given user is on the login page
        When 'Wholesale' user do login into the website
            And user enter the following product description page url:
                | country | productDescriptionPageUrl          |
                | US      | /talia-large-chandelier-jn5112/    |
                | UK      | /talia-large-chandelier-eu-jn5112/ |
                | EU      | /talia-large-chandelier-eu-jn5112/ |
            And user navigate to product description page of 'JN5112' product
            And user select the following product variants:
                | country | variant | value                        |
                | US      | Finish  | Gild and Clear Swirled Glass |
                | UK      | Finish  | Gild and Clear Swirled Glass |
                | EU      | Finish  | Gild and Clear Swirled Glass |     
        Then the ship by date should be displayed on the product description page

    #--------------------------------------------------------------------------------------------------
    
    @all @productDescriptionPage @user @us @uk @eu @testcase_236 
    Scenario: In a guest account, the specifications of product should be changed according to the selected in or cm

        Given user is on the home page
        When user enter the following product description page url:
                | country | productDescriptionPageUrl          |
                | US      | /talia-large-chandelier-jn5112/    |
                | UK      | /talia-large-chandelier-eu-jn5112/ |
                | EU      | /talia-large-chandelier-eu-jn5112/ |
            And user click on 'in' specifications
        Then user should be able to see below inch specifications 
                | country | specifications                                                                                                                                                          |
                | US      | Height: 24", Width: 33", Canopy: 5" Round, Socket: 8 - E12 Candelabra, Wattage: 8 - 40 B11, Assembly Required, Chain Length: 6 ft, Weight: 37 lbs.                        |
                | UK      | Height: 24", Width: 33", Canopy: 5" Round, Socket: 8 - E14 Candelabra, Wattage: 8 - 40 B, IP Rating: IP20 Class I, Assembly Required, Chain Length: 6 ft, Weight: 16.8 kg |
                | EU      | Height: 24", Width: 33", Canopy: 5" Round, Socket: 8 - E14 Candelabra, Wattage: 8 - 40 B, IP Rating: IP20 Class I, Assembly Required, Chain Length: 6 ft, Weight: 16.8 kg |
        When user click on 'cm' specifications
        Then user should be able to see below cm specifications
                | country | specifications                                                                                                                                                                       |
                | US      | Height: 60.96cm, Width: 83.82cm, Canopy: 12.70cm Round, Socket: 8 - E12 Candelabra, Wattage: 8 - 40 B11, Assembly Required, Chain Length: 182.88 cm, Weight: 37 lbs.                        |
                | UK      | Height: 60.96cm, Width: 83.82cm, Canopy: 12.70cm Round, Socket: 8 - E14 Candelabra, Wattage: 8 - 40 B, IP Rating: IP20 Class I, Assembly Required, Chain Length: 182.88 cm, Weight: 16.8 kg |
                | EU      | Height: 60.96cm, Width: 83.82cm, Canopy: 12.70cm Round, Socket: 8 - E14 Candelabra, Wattage: 8 - 40 B, IP Rating: IP20 Class I, Assembly Required, Chain Length: 182.88 cm, Weight: 16.8 kg |

    #--------------------------------------------------------------------------------------------------
    
    @all @productDescriptionPage @retail @us @uk @eu @testcase_237 
    Scenario: In a retail account, the specifications of product should be changed according to the selected in or cm

        Given user is on the login page
        When 'Retail' user do login into the website
            And user enter the following product description page url:
                | country | productDescriptionPageUrl          |
                | US      | /talia-large-chandelier-jn5112/    |
                | UK      | /talia-large-chandelier-eu-jn5112/ |
                | EU      | /talia-large-chandelier-eu-jn5112/ |
            And user click on 'in' specifications
        Then user should be able to see below inch specifications 
                | country | specifications                                                                                                                                                            |
                | US      | Height: 24", Width: 33", Canopy: 5" Round, Socket: 8 - E12 Candelabra, Wattage: 8 - 40 B11, Assembly Required, Chain Length: 6 ft, Weight: 37 lbs.                        |
                | UK      | Height: 24", Width: 33", Canopy: 5" Round, Socket: 8 - E14 Candelabra, Wattage: 8 - 40 B, IP Rating: IP20 Class I, Assembly Required, Chain Length: 6 ft, Weight: 16.8 kg |
                | EU      | Height: 24", Width: 33", Canopy: 5" Round, Socket: 8 - E14 Candelabra, Wattage: 8 - 40 B, IP Rating: IP20 Class I, Assembly Required, Chain Length: 6 ft, Weight: 16.8 kg |
        When user click on 'cm' specifications
        Then user should be able to see below cm specifications
                | country | specifications                                                                                                                                                                              |
                | US      | Height: 60.96cm, Width: 83.82cm, Canopy: 12.70cm Round, Socket: 8 - E12 Candelabra, Wattage: 8 - 40 B11, Assembly Required, Chain Length: 182.88 cm, Weight: 37 lbs.                        |
                | UK      | Height: 60.96cm, Width: 83.82cm, Canopy: 12.70cm Round, Socket: 8 - E14 Candelabra, Wattage: 8 - 40 B, IP Rating: IP20 Class I, Assembly Required, Chain Length: 182.88 cm, Weight: 16.8 kg |
                | EU      | Height: 60.96cm, Width: 83.82cm, Canopy: 12.70cm Round, Socket: 8 - E14 Candelabra, Wattage: 8 - 40 B, IP Rating: IP20 Class I, Assembly Required, Chain Length: 182.88 cm, Weight: 16.8 kg |

    #--------------------------------------------------------------------------------------------------
    
    @all @productDescriptionPage @wholesale @us @uk @eu @testcase_238 
    Scenario: In a wholesale account, the specifications of product should be changed according to the selected in or cm

        Given user is on the login page
        When 'Wholesale' user do login into the website
            And user enter the following product description page url:
                | country | productDescriptionPageUrl          |
                | US      | /talia-large-chandelier-jn5112/    |
                | UK      | /talia-large-chandelier-eu-jn5112/ |
                | EU      | /talia-large-chandelier-eu-jn5112/ |
            And user click on 'in' specifications
        Then user should be able to see below inch specifications 
                | country | specifications                                                                                                                                                            |
                | US      | Height: 24", Width: 33", Canopy: 5" Round, Socket: 8 - E12 Candelabra, Wattage: 8 - 40 B11, Assembly Required, Chain Length: 6 ft, Weight: 37 lbs.                        |
                | UK      | Height: 24", Width: 33", Canopy: 5" Round, Socket: 8 - E14 Candelabra, Wattage: 8 - 40 B, IP Rating: IP20 Class I, Assembly Required, Chain Length: 6 ft, Weight: 16.8 kg |
                | EU      | Height: 24", Width: 33", Canopy: 5" Round, Socket: 8 - E14 Candelabra, Wattage: 8 - 40 B, IP Rating: IP20 Class I, Assembly Required, Chain Length: 6 ft, Weight: 16.8 kg |
        When user click on 'cm' specifications
        Then user should be able to see below cm specifications
                | country | specifications                                                                                                                                                                              |
                | US      | Height: 60.96cm, Width: 83.82cm, Canopy: 12.70cm Round, Socket: 8 - E12 Candelabra, Wattage: 8 - 40 B11, Assembly Required, Chain Length: 182.88 cm, Weight: 37 lbs.                        |
                | UK      | Height: 60.96cm, Width: 83.82cm, Canopy: 12.70cm Round, Socket: 8 - E14 Candelabra, Wattage: 8 - 40 B, IP Rating: IP20 Class I, Assembly Required, Chain Length: 182.88 cm, Weight: 16.8 kg |
                | EU      | Height: 60.96cm, Width: 83.82cm, Canopy: 12.70cm Round, Socket: 8 - E14 Candelabra, Wattage: 8 - 40 B, IP Rating: IP20 Class I, Assembly Required, Chain Length: 182.88 cm, Weight: 16.8 kg |

    #--------------------------------------------------------------------------------------------------

    @all @productDescriptionPage @user @us @uk @eu @testcase_239
    Scenario: The user should be able to see olapic section on the product description page

        Given user is on the home page
        When user enter the following product description page url:
                | country | productDescriptionPageUrl          |
                | US      | /talia-large-chandelier-jn5112/    |    
                | UK      | /talia-large-chandelier-eu-jn5112/ |
                | EU      | /talia-large-chandelier-eu-jn5112/ |
        Then user should be able to see olapic section on the product description page

    #--------------------------------------------------------------------------------------------------

    @all @productDescriptionPage @retail @us @uk @eu @testcase_240
    Scenario: The retail user should be able to see olapic section on the product description page

        Given user is on the login page
        When 'Retail' user do login into the website
            And user enter the following product description page url:
                | country | productDescriptionPageUrl          |
                | US      | /talia-large-chandelier-jn5112/    |    
                | UK      | /talia-large-chandelier-eu-jn5112/ |
                | EU      | /talia-large-chandelier-eu-jn5112/ |
        Then user should be able to see olapic section on the product description page

    #--------------------------------------------------------------------------------------------------

    @all @productDescriptionPage @wholesale @us @uk @eu @testcase_241
    Scenario: The wholesale user should be able to see olapic section on the product description page

        Given user is on the login page
        When 'Wholesale' user do login into the website
            And user enter the following product description page url:
                | country | productDescriptionPageUrl          |
                | US      | /talia-large-chandelier-jn5112/    |    
                | UK      | /talia-large-chandelier-eu-jn5112/ |
                | EU      | /talia-large-chandelier-eu-jn5112/ |
        Then user should be able to see olapic section on the product description page

    #--------------------------------------------------------------------------------------------------

    @all @productDescriptionPage @user @us @uk @eu @testcase_257 
    Scenario: The user should be able to add product with different variants
    
        Given user is on the home page
        When user search the following sku code
                | country | skuCode     |
                | US      | 700FJBRL    |
                | UK      | EU-CHC2164  |
                | EU      | EU-CHC2164  |
            And user press enter key
            And user click on the product name for the below sku code
                | country | skuCode    |
                | US      | 700FJBRL   |
                | UK      | EU-CHC2164 |
                | EU      | EU-CHC2164 |
            And user click on below product image from the product description page
                | country | image          |
                | US      | 700FJBRLFS     |
                | UK      | CHC 2164GI-EU  |
                | EU      | CHC 2164GI-EU  |
            And user collect the following details of product from the product description page
                | label         |
                | Product Name  |
                | Product Price |
            And user click on the add to cart button
        Then the following item details should be displayed on the mini cart
                | label         |
                | Product Name  |
                | Product Price |
        When user click on the 'Remove' link of product from the mini cart
            And user click on the 'Ok' button from the clear shopping cart pop up
            And user click on below product image from the product description page
                | country | image               |
                | US      | 700FJBRLFS-LEDS930  |
                | UK      | CHC 2164PN-EU       |
                | EU      | CHC 2164PN-EU       |
            And user collect the following details of product from the product description page
                | label         |
                | Product Name  |
                | Product Price |
            And user click on the add to cart button
        Then the following item details should be displayed on the mini cart
                | label         |
                | Product Name  |
                | Product Price |

    #--------------------------------------------------------------------------------------------------

    @all @productDescriptionPage @retail @us @uk @eu @testcase_258 
    Scenario: The retail user should be able to add product with different variants
    
        Given user is on the login page
        When 'Retail' user do login into the website
            And user clear added items from the cart
            And user search the following sku code
                | country | skuCode     |
                | US      | 700FJBRL    |
                | UK      | EU-CHC2164  |
                | EU      | EU-CHC2164  |
            And user press enter key
            And user click on the product name for the below sku code
                | country | skuCode    |
                | US      | 700FJBRL   |
                | UK      | EU-CHC2164 |
                | EU      | EU-CHC2164 |
            And user click on below product image from the product description page
                | country | image          |
                | US      | 700FJBRLFS     |
                | UK      | CHC 2164GI-EU  |
                | EU      | CHC 2164GI-EU  |
            And user collect the following details of product from the product description page
                | label         |
                | Product Name  |
                | Product Price |
            And user click on the add to cart button
        Then the following item details should be displayed on the mini cart
                | label         |
                | Product Name  |
                | Product Price |
        When user click on the 'Remove' link of product from the mini cart
            And user click on the 'Ok' button from the clear shopping cart pop up
            And user click on below product image from the product description page
                | country | image               |
                | US      | 700FJBRLFS-LEDS930  |
                | UK      | CHC 2164PN-EU       |
                | EU      | CHC 2164PN-EU       |
            And user collect the following details of product from the product description page
                | label         |
                | Product Name  |
                | Product Price |
            And user click on the add to cart button
        Then the following item details should be displayed on the mini cart
                | label         |
                | Product Name  |
                | Product Price |

    #--------------------------------------------------------------------------------------------------

    @all @productDescriptionPage @trade @us @uk @eu @testcase_259 
    Scenario: The trade user should be able to add product with different variants
    
        Given user is on the login page
        When 'Trade' user do login into the website
            And user clear added items from the cart
            And user search the following sku code
                | country | skuCode     |
                | US      | 700FJBRL    |
                | UK      | EU-CHC2164  |
                | EU      | EU-CHC2164  |
            And user press enter key
            And user click on the product name for the below sku code
                | country | skuCode    |
                | US      | 700FJBRL   |
                | UK      | EU-CHC2164 |
                | EU      | EU-CHC2164 |
            And user click on below product image from the product description page
                | country | image          |
                | US      | 700FJBRLFS     |
                | UK      | CHC 2164GI-EU  |
                | EU      | CHC 2164GI-EU  |
            And user collect the following details of product from the product description page
                | label         |
                | Product Name  |
                | Product Price |
            And user click on the add to cart button
        Then the following item details should be displayed on the mini cart
                | label         |
                | Product Name  |
                | Product Price |
        When user click on the 'Remove' link of product from the mini cart
            And user click on the 'Ok' button from the clear shopping cart pop up
            And user click on below product image from the product description page
                | country | image               |
                | US      | 700FJBRLFS-LEDS930  |
                | UK      | CHC 2164PN-EU       |
                | EU      | CHC 2164PN-EU       |
            And user collect the following details of product from the product description page
                | label         |
                | Product Name  |
                | Product Price |
            And user click on the add to cart button
        Then the following item details should be displayed on the mini cart
                | label         |
                | Product Name  |
                | Product Price |

    #--------------------------------------------------------------------------------------------------

    @all @productDescriptionPage @wholesale @us @testcase_260
    Scenario: The wholesale user should be able to add product with different variants
    
        Given user is on the login page
        When 'Wholesale' user do login into the website
            And user clear added items from the cart
            And user search the following sku code
                | country | skuCode     |
                | US      | 700FJBRL    |
                | UK      | EU-CHC2164  |
                | EU      | EU-CHC2164  |
            And user press enter key
            And user click on the product name for the below sku code
                | country | skuCode    |
                | US      | 700FJBRL   |
                | UK      | EU-CHC2164 |
                | EU      | EU-CHC2164 |
            And user click on below product image from the product description page
                | country | image          |
                | US      | 700FJBRLFS     |
                | UK      | CHC 2164GI-EU  |
                | EU      | CHC 2164GI-EU  |
            And user collect the following details of product from the product description page
                | label         |
                | Product Name  |
                | Product Price |
            And user click on the add to cart button
        Then the following item details should be displayed on the mini cart
                | label         |
                | Product Name  |
                | Product Price |
        When user click on the 'Remove' link of product from the mini cart
            And user click on the 'Ok' button from the clear shopping cart pop up
            And user click on below product image from the product description page
                | country | image               |
                | US      | 700FJBRLFS-LEDS930  |
                | UK      | CHC 2164PN-EU       |
                | EU      | CHC 2164PN-EU       |
            And user collect the following details of product from the product description page
                | label         |
                | Product Name  |
                | Product Price |
            And user click on the add to cart button
        Then the following item details should be displayed on the mini cart
                | label         |
                | Product Name  |
                | Product Price |

    #--------------------------------------------------------------------------------------------------
    
    @all @productDescriptionPage @wholesale @us @uk @eu @testcase_261
    Scenario: The wholesale user should be able to verify the more from the series section

        Given user is on the login page
        When 'Wholesale' user do login into the website
            And user enter the following product description page url:
                | country | productDescriptionPageUrl          |
                | US      | /talia-large-chandelier-jn5112/    |
                | UK      | /talia-large-chandelier-eu-jn5112/ |
                | EU      | /talia-large-chandelier-eu-jn5112/ |
            And user click on the view series link from the product description page
        Then user should see 'More from the series' section
            And the product image, name, price, and designer name should be displayed in the more from series section
        When user collect the first product name from the more series section
            And user click on the first product name from the more series section
        Then user navigate to the product description page of first product
                
    #--------------------------------------------------------------------------------------------------
    
    @all @productDescriptionPage @retail @us @uk @eu @testcase_262
    Scenario: The retail user should be able to verify the more from the series section

        Given user is on the login page
        When 'Retail' user do login into the website
            And user enter the following product description page url:
                | country | productDescriptionPageUrl          |
                | US      | /talia-large-chandelier-jn5112/    |
                | UK      | /talia-large-chandelier-eu-jn5112/ |
                | EU      | /talia-large-chandelier-eu-jn5112/ |
            And user click on the view series link from the product description page
        Then user should see 'More from the series' section
            And the product image, name, price, and designer name should be displayed in the more from series section
        When user collect the first product name from the more series section
            And user click on the first product name from the more series section
        Then user navigate to the product description page of first product

    #--------------------------------------------------------------------------------------------------
    
    @all @productDescriptionPage @trade @us @uk @eu @testcase_263
    Scenario: The trade user should be able to verify the more from the series section

        Given user is on the login page
        When 'Trade' user do login into the website
            And user enter the following product description page url:
                | country | productDescriptionPageUrl          |
                | US      | /talia-large-chandelier-jn5112/    |
                | UK      | /talia-large-chandelier-eu-jn5112/ |
                | EU      | /talia-large-chandelier-eu-jn5112/ |
            And user click on the view series link from the product description page
        Then user should see 'More from the series' section
            And the product image, name, price, trade price and designer name should be displayed in the more from series section
        When user collect the first product name from the more series section
            And user click on the first product name from the more series section
        Then user navigate to the product description page of first product 

    #--------------------------------------------------------------------------------------------------
    
    @all @productDescriptionPage @user @us @uk @eu @testcase_320 
    Scenario: The user should be able to verify that with empty finish field by click on the add to cart button the validation message displayed

        Given user is on the home page
        When user enter the following product description page url:
                | country | productDescriptionPageUrl          |
                | US      | /talia-large-chandelier-jn5112/    |
                | UK      | /talia-large-chandelier-eu-jn5112/ |
                | EU      | /talia-large-chandelier-eu-jn5112/ |
            And user navigate to product description page of 'JN5112' product 
            And user select the following product variants:
                | country | variant | value               |
                | US      | Finish  | Choose an Option... |
                | UK      | Finish  | Choose an Option... |
                | EU      | Finish  | Choose an Option... | 
            And user click on the add to cart button from the product description page 
        Then user should see below validation message
                | message                   |
                | This is a required field. |     

    #--------------------------------------------------------------------------------------------------
    
    @all @productDescriptionPage @retail @us @uk @eu @testcase_321 
    Scenario: The retail user should be able to verify that with empty finish field by click on the add to cart button the validation message displayed

        Given user is on the login page
        When 'Retail' user do login into the website
            And user enter the following product description page url:
                | country | productDescriptionPageUrl          |
                | US      | /talia-large-chandelier-jn5112/    |
                | UK      | /talia-large-chandelier-eu-jn5112/ |
                | EU      | /talia-large-chandelier-eu-jn5112/ |
            And user navigate to product description page of 'JN5112' product 
            And user select the following product variants:
                | country | variant | value               |
                | US      | Finish  | Choose an Option... |
                | UK      | Finish  | Choose an Option... |
                | EU      | Finish  | Choose an Option... | 
            And user click on the add to cart button from the product description page 
        Then user should see below validation message
                | message                   |
                | This is a required field. |

    #--------------------------------------------------------------------------------------------------
    
    @all @productDescriptionPage @trade @us @uk @eu @testcase_322 
    Scenario: The trade user should be able to verify that with empty finish field by click on the add to cart button the validation message displayed

        Given user is on the login page
        When 'Trade' user do login into the website
            And user enter the following product description page url:
                | country | productDescriptionPageUrl          |
                | US      | /talia-large-chandelier-jn5112/    |
                | UK      | /talia-large-chandelier-eu-jn5112/ |
                | EU      | /talia-large-chandelier-eu-jn5112/ |
            And user navigate to product description page of 'JN5112' product 
            And user select the following product variants:
                | country | variant | value               |
                | US      | Finish  | Choose an Option... |
                | UK      | Finish  | Choose an Option... |
                | EU      | Finish  | Choose an Option... | 
            And user click on the add to cart button from the product description page 
        Then user should see below validation message
                | message                   |
                | This is a required field. |

    #--------------------------------------------------------------------------------------------------
    
    @all @productDescriptionPage @wholesale @us @testcase_323
    Scenario: The wholesale user should be able to verify that with empty finish field by click on the add to cart button the validation message displayed

        Given user is on the login page
        When 'Wholesale' user do login into the website
            And user enter the following product description page url:
                | country | productDescriptionPageUrl          |
                | US      | /talia-large-chandelier-jn5112/    |
                | UK      | /talia-large-chandelier-eu-jn5112/ |
                | EU      | /talia-large-chandelier-eu-jn5112/ |
            And user navigate to product description page of 'JN5112' product 
            And user select the following product variants:
                | country | variant | value               |
                | US      | Finish  | Choose an Option... |
                | UK      | Finish  | Choose an Option... |
                | EU      | Finish  | Choose an Option... | 
            And user click on the add to cart button from the product description page 
        Then user should see below validation message
                | message                   |
                | This is a required field. |

    #--------------------------------------------------------------------------------------------------
    
    @all @productDescriptionPage @user @us @uk @eu @testcase_324
    Scenario: The user should be able to verify that with empty shade field by click on the add to cart button the validation message displayed

        Given user is on the home page
        When user search the following sku code
                | country | skuCode   |
                | US      | KW3031    |
                | UK      | EU-KW3031 |
                | EU      | EU-KW3031 |
            And user press enter key
            And user click on the product name for the below sku code
                | country | skuCode   |
                | US      | KW3031    |
                | UK      | EU-KW3031 |
                | EU      | EU-KW3031 | 
            And user select the following product variants:
                | country | variant | value               |
                | US      | Shade   | Choose an Option... |
                | UK      | Shade   | Choose an Option... |
                | EU      | Shade   | Choose an Option... |
            And user click on the add to cart button from the product description page 
        Then user should see below validation message
                | message                   |
                | This is a required field. |

    #--------------------------------------------------------------------------------------------------
    
    @all @productDescriptionPage @retail @us @uk @eu @testcase_325
    Scenario: The retail user should be able to verify that with empty shade field by click on the add to cart button the validation message displayed

        Given user is on the login page
        When 'Retail' user do login into the website
            And user search the following sku code
                | country | skuCode   |
                | US      | KW3031    |
                | UK      | EU-KW3031 |
                | EU      | EU-KW3031 |
            And user press enter key
            And user click on the product name for the below sku code
                | country | skuCode   |
                | US      | KW3031    |
                | UK      | EU-KW3031 |
                | EU      | EU-KW3031 | 
            And user select the following product variants:
                | country | variant | value               |
                | US      | Shade   | Choose an Option... |
                | UK      | Shade   | Choose an Option... |
                | EU      | Shade   | Choose an Option... |
            And user click on the add to cart button from the product description page 
        Then user should see below validation message
                | message                   |
                | This is a required field. |

    #--------------------------------------------------------------------------------------------------
    
    @all @productDescriptionPage @trade @us @uk @eu @testcase_326
    Scenario: The trade user should be able to verify that with empty shade field by click on the add to cart button the validation message displayed

        Given user is on the login page
        When 'Trade' user do login into the website
            And user search the following sku code
                | country | skuCode   |
                | US      | KW3031    |
                | UK      | EU-KW3031 |
                | EU      | EU-KW3031 |
            And user press enter key
            And user click on the product name for the below sku code
                | country | skuCode   |
                | US      | KW3031    |
                | UK      | EU-KW3031 |
                | EU      | EU-KW3031 | 
            And user select the following product variants:
                | country | variant | value               |
                | US      | Shade   | Choose an Option... |
                | UK      | Shade   | Choose an Option... |
                | EU      | Shade   | Choose an Option... |
            And user click on the add to cart button from the product description page 
        Then user should see below validation message
                | message                   |
                | This is a required field. |

    #--------------------------------------------------------------------------------------------------
    
    @all @productDescriptionPage @wholesale @us @testcase_327
    Scenario: The wholesale user should be able to verify that with empty shade field by click on the add to cart button the validation message displayed

        Given user is on the login page
        When 'Wholesale' user do login into the website
            And user search the following sku code
                | country | skuCode   |
                | US      | KW3031    |
                | UK      | EU-KW3031 |
                | EU      | EU-KW3031 |
            And user press enter key
            And user click on the product name for the below sku code
                | country | skuCode   |
                | US      | KW3031    |
                | UK      | EU-KW3031 |
                | EU      | EU-KW3031 | 
            And user select the following product variants:
                | country | variant | value               |
                | US      | Shade   | Choose an Option... |
                | UK      | Shade   | Choose an Option... |
                | EU      | Shade   | Choose an Option... |
            And user click on the add to cart button from the product description page 
        Then user should see below validation message
                | message                   |
                | This is a required field. |
    
    #--------------------------------------------------------------------------------------------------
    
    @all @productDescriptionPage @user @us @uk @eu @testcase_358
    Scenario: The user should be able to see the change image as per the selected option from the shade dropdown

        Given user is on the home page
        When user enter the following product description page url:
                | country | productDescriptionPageUrl                    |
                | US      | /dorchester-swing-arm-floor-lamp-cha9121/    |
                | UK      | /dorchester-swing-arm-floor-lamp-eu-cha9121/ |
                | EU      | /dorchester-swing-arm-floor-lamp-eu-cha9121/ |
            And user navigate to product description page of 'CHA9121' product 
            And user select the following product variants:
                | country | variant | value                        |
                | US      | Finish  | Antique-Burnished Brass      |
                | US      | Shade   | 8" x 12" x 5.5" Linen        |
                | UK      | Finish  | Antique-Burnished Brass      |
                | UK      | Shade   | 20.3cm x 30.5cm x 14cm Linen |
                | EU      | Finish  | Antique-Burnished Brass      |
                | EU      | Shade   | 20.3cm x 30.5cm x 14cm Linen |
        Then the following image should be displayed as per the selected options
                | country | image            |
                | US      | CHA9121ABL.png   |  
                | UK      | CHA9121ABL.png   |   
                | EU      | CHA9121ABL.png   | 
        When user select the following product variants:
                | country | variant | value                          |
                | US      | Finish  | Antique-Burnished Brass        |
                | US      | Shade   | 6" x 12" x 8.5" Black          |
                | UK      | Finish  | Antique-Burnished Brass        |
                | UK      | Shade   | 15.3cm x 30.5cm x 21.6cm Black |
                | EU      | Finish  | Antique-Burnished Brass        |
                | EU      | Shade   | 15.3cm x 30.5cm x 21.6cm Black |
        Then the following image should be displayed as per the selected options
                | country | image            |
                | US      | cha9121abb_1.png |  
                | UK      | cha9121abb.png   |   
                | EU      | cha9121abb.png   | 

    #--------------------------------------------------------------------------------------------------

    @all @productDescriptionPage @user @us @testcase_365
    Scenario: The user should be able to see the LED bulb checkbox as checked by default

        Given user is on the home page
        When user enter the following product description page url:
            | country | productDescriptionPageUrl          |
            | US      | /talia-large-chandelier-jn5112/    |
        Then the product description page of 'JN5112' should get opened
            And the LED bulb checkbox should be checked by default
    
    #--------------------------------------------------------------------------------------------------

    @all @productDescriptionPage @trade @us @uk @eu @testcase_367
    Scenario: The trade user should be able to see trade price on the product description page

        Given user is on the login page
        When 'Trade' user do login into the website
            And user enter the following product description page url:
                | country | productDescriptionPageUrl          |
                | US      | /talia-large-chandelier-jn5112/    |
                | UK      | /talia-large-chandelier-eu-jn5112/ |
                | EU      | /talia-large-chandelier-eu-jn5112/ |
            And user navigate to product description page of 'JN5112' product 
        Then user should be able to see trade price
            And user should be able to see retail price as strikethrough
    
    #--------------------------------------------------------------------------------------------------

    @all @productDescriptionPage @user @us @uk @eu @testcase_404
    Scenario: The guest user should be able to see the change image as per the selected option from the finish dropdown

        Given user is on the home page
        When user enter the following product description page url:
                | country | productDescriptionPageUrl          |
                | US      | /linden-medium-table-lamp-kw3031/  |
                | UK      | /linden-medium-lamp-eu-kw3031/     |
                | EU      | /linden-medium-lamp-eu-kw3031/     |
        Then the product description page of the following sku should get opened
                | country | skuCode   |
                | US      | KW3031    |
                | UK      | EU-KW3031 |
                | EU      | EU-KW3031 |
        When user select the following product variants:
                | country | variant | value                        |
                | US      | Finish  | Black Porcelain              |
                | US      | Shade   | 13" x 17" x 12" Linen        |
                | UK      | Finish  | Black Porcelain              |
                | UK      | Shade   | 33cm x 43.2cm x 30.5cm Linen |
                | EU      | Finish  | Black Porcelain              |
                | EU      | Shade   | 33cm x 43.2cm x 30.5cm Linen |
        Then the following image should be displayed as per the selected options
                | country | image              |
                | US      | kw3031blkl_3.png   |  
                | UK      | kw3031blkl.png     |   
                | EU      | kw3031blkl.png     | 
        When user select the following product variants:
                | country | variant | value                         |
                | US      | Finish  | Plaster White                 |
                | US      | Shade   | 13" x 17" x 12" Linen         |
                | UK      | Finish  | Plaster White                 |
                | UK      | Shade   | 33cm x 43.2cm x 30.5cm Linen  |
                | EU      | Finish  | Plaster White                 |
                | EU      | Shade   | 33cm x 43.2cm x 30.5cm Linen  |
        Then the following image should be displayed as per the selected options
                | country | image           |
                | US      | kw3031pwl_3.png |  
                | UK      | kw3031pwl.png   |   
                | EU      | kw3031pwl.png   | 

    #--------------------------------------------------------------------------------------------------

    @all @productDescriptionPage @user @us @testcase_413
    Scenario: The guest user should be able to see the proposition 65 section and able to collapse or expand it

        Given user is on the home page
        When user enter the following product description page url:
            | country | productDescriptionPageUrl                       |
            | US      | /avedon-large-table-lamp/#1651=82612&2461=87659 |
        Then the product description page of 'MF3002' should get opened
            And the proposition 65 section should be displayed
        When user click on the '+' icon of proposition 65 section
        Then the proposition 65 section should be expanded with the following message
            | message                                                                                                                                                                                                                         |
            | WARNING: This product can expose you to chemicals including lead, which are known to the State of California to cause cancer and birth defects or other reproductive harm. For more information go to:  www.P65Warnings.ca.gov. |
        When user click on the '-' icon of proposition 65 section
        Then the proposition 65 section should be collapsed

    #--------------------------------------------------------------------------------------------------

    @all @productDescriptionPage @trade @us @testcase_414
    Scenario: The trade user should be able to see the proposition 65 section and able to collapse or expand it

        Given user is on the login page
        When 'Trade' user do login into the website
            And user enter the following product description page url:
            | country | productDescriptionPageUrl                       |
            | US      | /avedon-large-table-lamp/#1651=82612&2461=87659 |
        Then the product description page of 'MF3002' should get opened
            And the proposition 65 section should be displayed
        When user click on the '+' icon of proposition 65 section
        Then the proposition 65 section should be expanded with the following message
            | message                                                                                                                                                                                                                         |
            | WARNING: This product can expose you to chemicals including lead, which are known to the State of California to cause cancer and birth defects or other reproductive harm. For more information go to:  www.P65Warnings.ca.gov. |
        When user click on the '-' icon of proposition 65 section
        Then the proposition 65 section should be collapsed

    #--------------------------------------------------------------------------------------------------

    @all @productDescriptionPage @wholesale @us @testcase_415
    Scenario: The wholesale user should be able to see the proposition 65 section and able to collapse or expand it

        Given user is on the login page
        When 'Wholesale' user do login into the website
            And user enter the following product description page url:
            | country | productDescriptionPageUrl                       |
            | US      | /avedon-large-table-lamp/#1651=82612&2461=87659 |
        Then the product description page of 'MF3002' should get opened
            And the proposition 65 section should be displayed
        When user click on the '+' icon of proposition 65 section
        Then the proposition 65 section should be expanded with the following message
            | message                                                                                                                                                                                                                         |
            | WARNING: This product can expose you to chemicals including lead, which are known to the State of California to cause cancer and birth defects or other reproductive harm. For more information go to:  www.P65Warnings.ca.gov. |
        When user click on the '-' icon of proposition 65 section
        Then the proposition 65 section should be collapsed

    #--------------------------------------------------------------------------------------------------

    @all @productDescriptionPage @retail @us @testcase_416
    Scenario: The retail user should be able to see the proposition 65 section and able to collapse or expand it

        Given user is on the login page
        When 'Retail' user do login into the website
            And user enter the following product description page url:
            | country | productDescriptionPageUrl                       |
            | US      | /avedon-large-table-lamp/#1651=82612&2461=87659 |
        Then the product description page of 'MF3002' should get opened
            And the proposition 65 section should be displayed
        When user click on the '+' icon of proposition 65 section
        Then the proposition 65 section should be expanded with the following message
            | message                                                                                                                                                                                                                         |
            | WARNING: This product can expose you to chemicals including lead, which are known to the State of California to cause cancer and birth defects or other reproductive harm. For more information go to:  www.P65Warnings.ca.gov. |
        When user click on the '-' icon of proposition 65 section
        Then the proposition 65 section should be collapsed
    
    #--------------------------------------------------------------------------------------------------

    @all @productDescriptionPage @user @us @uk @eu @testcase_455
    Scenario: The guest user should be able to see the product added success message below the Add to Cart button

        Given user is on the home page
        When user enter the following product description page url:
                | country | productDescriptionPageUrl                     |
                | US      | /talia-large-chandelier-jn5112/#2461=52281    |
                | UK      | /talia-large-chandelier-eu-jn5112/#2461=52281 |
                | EU      | /talia-large-chandelier-eu-jn5112/#2461=52281 |
            And user navigate to product description page of 'JN5112' product
            And user click on the add to cart button from the product description page 
        Then the following success message should be displayed below the Add to Cart button
                | message                                            |
                | Added Talia Large Chandelier to your shopping cart |