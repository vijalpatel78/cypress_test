Feature: Shopping Cart Page

    The user should be able to access the shopping cart page.

    #--------------------------------------------------------------------------------------------------
    
    @all @shoppingCartPage @user @us @uk @eu @testcase_59
    Scenario: The user should be able to open the shopping cart page

        Given user is on the login page
        When user click on the mini cart icon
        Then the shopping cart page should get opened which should contain the following url
            | url             |
            | /checkout/cart/ | 
    
    #--------------------------------------------------------------------------------------------------
    
    @all @shoppingCartPage @user @us @uk @eu @testcase_60
    Scenario: The product details should be the same as displayed on the product description page

        Given user is on the login page
        When user enter the following product description page url:
                | country | productDescriptionPageUrl          |
                | US      | /talia-large-chandelier-jn5112/    |
                | UK      | /talia-large-chandelier-eu-jn5112/ |
                | EU      | /talia-large-chandelier-eu-jn5112/ |
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
                | Product SKU    |
                | Finish         |
            And user click on the add to cart button
            And user click on the mini cart icon
            And user navigate to shopping cart page
        Then the following item details should be displayed on the shopping cart page
                | label         |
                | Product Name  |
                | Product Price |
                | Product Qty   |
                | Product SKU   |
                | Finish        |

    #--------------------------------------------------------------------------------------------------
    
    @all @shoppingCartPage @retail @us @uk @eu @testcase_61 
    Scenario: The retail user should be able to clear cart by click on ok button

        Given user is on the login page
        When 'Retail' user do login into the website
             And user enter the following product description page url:
                | country | productDescriptionPageUrl          |
                | US      | /talia-large-chandelier-jn5112/    |
                | UK      | /talia-large-chandelier-eu-jn5112/ |
                | EU      | /talia-large-chandelier-eu-jn5112/ |
            And user select the following product variants:
                | country | variant | value                        |
                | US      | Finish  | Gild and Clear Swirled Glass |
                | UK      | Finish  | Gild and Clear Swirled Glass |
                | EU      | Finish  | Gild and Clear Swirled Glass |
            And user click on the add to cart button
            And user click on the mini cart icon
            And user navigate to shopping cart page
            And user click on the clear cart button from the shopping cart page
            And user click on the 'Ok' button from the clear shopping cart pop up
        Then user should be able to see below message for clear cart
                | message                                  |
                | You have no items in your shopping cart. |

    #--------------------------------------------------------------------------------------------------

    @all @shoppingCartPage @retail @us @uk @eu @testcase_62
    Scenario: The retail user should be able to remove the product from the shopping cart

        Given user is on the login page
        When 'Retail' user do login into the website
            And user clear added items from the cart
            And user enter the following product description page url:
                | country | productDescriptionPageUrl          |
                | US      | /talia-large-chandelier-jn5112/    |
                | UK      | /talia-large-chandelier-eu-jn5112/ |
                | EU      | /talia-large-chandelier-eu-jn5112/ |
            And user select the following product variants:
                | country | variant | value                        |
                | US      | Finish  | Gild and Clear Swirled Glass |
                | UK      | Finish  | Gild and Clear Swirled Glass |
                | EU      | Finish  | Gild and Clear Swirled Glass |
            And user collect the following details of product from the product description page
                | label          |
                | Product Name   |
            And user click on the add to cart button
            And user click on the mini cart icon
            And user navigate to shopping cart page
            And user click on the 'Remove' link of product
        Then the product should not be displayed on the shopping cart page

    #--------------------------------------------------------------------------------------------------

    @all @shoppingCartPage @user @us @uk @eu @testcase_63
    Scenario: The user should be redirected to the product description page after clicking on the product image from the shopping cart

        Given user is on the home page
        When user enter the following product description page url:
                | country | productDescriptionPageUrl          |
                | US      | /talia-large-chandelier-jn5112/    |
                | UK      | /talia-large-chandelier-eu-jn5112/ |
                | EU      | /talia-large-chandelier-eu-jn5112/ |
            And user select the following product variants:
                | country | variant | value                        |
                | US      | Finish  | Gild and Clear Swirled Glass |
                | UK      | Finish  | Gild and Clear Swirled Glass |
                | EU      | Finish  | Gild and Clear Swirled Glass |
            And user collect the following details of product from the product description page
                | label          |
                | Product Name   |
            And user click on the add to cart button
            And user click on the mini cart icon
            And user navigate to shopping cart page
            And user click on the product image from the shopping cart page
        Then user should be redirected to the product description page which has the following page title
                | country | title                                              |
                | US      | Talia Large Chandelier - JN5112  Visual Comfort    |
                | UK      | Talia Large Chandelier - EU-JN5112  Visual Comfort |
                | EU      | Talia Large Chandelier - EU-JN5112  Visual Comfort |

    #--------------------------------------------------------------------------------------------------

    @all @shoppingCartPage @retail @us @uk @eu @testcase_64
    Scenario: The retail user should be able to update the product details after clicking on the edit link from the shopping cart page 

        Given user is on the login page
        When 'Retail' user do login into the website
            And user clear added items from the cart
            And user enter the following product description page url:
                | country | productDescriptionPageUrl          |
                | US      | /loras-mini-pendant-p1449/         |
                | UK      | /talia-large-chandelier-eu-jn5112/ |
                | EU      | /talia-large-chandelier-eu-jn5112/ |
            And user select the following product variants:
                | country | variant | value                        |
                | US      | Finish  | Dark Weathered Iron          |
                | UK      | Finish  | Gild and Clear Swirled Glass |
                | EU      | Finish  | Gild and Clear Swirled Glass |
            And user collect the following details of product from the product description page
                | label          |
                | Product Name   |
            And user click on the add to cart button
            And user click on the mini cart icon
            And user navigate to shopping cart page
            And user click on the 'Edit' link of product
            And user select the following product variants:
                | country | variant | value                                 |
                | US      | Finish  | Chrome                                |
                | UK      | Finish  | Plaster White and Clear Swirled Glass |
                | EU      | Finish  | Plaster White and Clear Swirled Glass |
            And user collect the following details of product from the product description page
                | label        |
                | Product Name |
                | Finish       |
            And user click on the update cart button
        Then user should be able to see the below success message on shopping cart page
                | country | message                                                   |
                | US      | Loras Mini Pendant was updated in your shopping cart.     |
                | UK      | Talia Large Chandelier was updated in your shopping cart. |
                | EU      | Talia Large Chandelier was updated in your shopping cart. |
            And the following item details should be displayed on the shopping cart page
                | label        |
                | Product Name |
                | Finish       |

    #--------------------------------------------------------------------------------------------------

    @all @shoppingCartPage @user @us @uk @eu @testcase_65
    Scenario: The user should be redirected to the product description page after clicking on the product name from the shopping cart

        Given user is on the home page
        When user enter the following product description page url:
                | country | productDescriptionPageUrl          |
                | US      | /talia-large-chandelier-jn5112/    |
                | UK      | /talia-large-chandelier-eu-jn5112/ |
                | EU      | /talia-large-chandelier-eu-jn5112/ |
            And user select the following product variants:
                | country | variant | value                        |
                | US      | Finish  | Gild and Clear Swirled Glass |
                | UK      | Finish  | Gild and Clear Swirled Glass |
                | EU      | Finish  | Gild and Clear Swirled Glass |
            And user collect the following details of product from the product description page
                | label          |
                | Product Name   |
            And user click on the add to cart button
            And user click on the mini cart icon
            And user navigate to shopping cart page
            And user click on the product name from the shopping cart page
        Then user should be redirected to the product description page which has the following page title
                | country | title                                              |
                | US      | Talia Large Chandelier - JN5112  Visual Comfort    |
                | UK      | Talia Large Chandelier - EU-JN5112  Visual Comfort |
                | EU      | Talia Large Chandelier - EU-JN5112  Visual Comfort |
    
    #--------------------------------------------------------------------------------------------------

    @all @shoppingCartPage @retail @us @testcase_66
    Scenario: The subtotal of product should get updated as per the entered product quantity in a retail account

        Given user is on the login page
        When 'Retail' user do login into the website
            And user clear added items from the cart
            And user enter the following product description page url:
                | country | productDescriptionPageUrl          |
                | US      | /talia-large-chandelier-jn5112/    |
            And user select the following product variants:
                | country | variant | value                        |
                | US      | Finish  | Gild and Clear Swirled Glass |
            And user collect the following details of product from the product description page
                | label          |
                | Product Name   |
                | Product Price  |
            And user click on the add to cart button
            And user click on the mini cart icon
            And user navigate to shopping cart page
            And user update 3 quantity of product
        Then the subtotal of product should get updated as per the entered 3 product quantity
    
    #--------------------------------------------------------------------------------------------------

    @all @shoppingCartPage @retail @us @uk @eu @testcase_67
    Scenario: The order subtotal and merchandise total should be displayed correctly in the order summary section of a retail account

        Given user is on the login page
        When 'Retail' user do login into the website
            And user clear added items from the cart
            And user enter the following product description page url:
                | country | productDescriptionPageUrl          |
                | US      | /talia-large-chandelier-jn5112/    |
                | UK      | /talia-large-chandelier-eu-jn5112/ |
                | EU      | /talia-large-chandelier-eu-jn5112/ |
            And user select the following product variants:
                | country | variant | value                        |
                | US      | Finish  | Gild and Clear Swirled Glass |
                | UK      | Finish  | Gild and Clear Swirled Glass |
                | EU      | Finish  | Gild and Clear Swirled Glass |
            And user click on the add to cart button
            And user click on the mini cart icon
            And user navigate to shopping cart page
        Then the order subtotal displayed in the order summary should be a sum of all products subtotal
            And the merchandise total displayed in the order summary should be a sum of order subtotal, shipping charges and tax

    #--------------------------------------------------------------------------------------------------

    @all @shoppingCartPage @retail @us @uk @eu @testcase_68
    Scenario: After clicking on the move to project link, the product should get removed from the shopping cart page with a success message

        Given user is on the login page
        When 'Retail' user do login into the website
            And user clear added items from the cart
            And user enter the following product description page url:
                | country | productDescriptionPageUrl          |
                | US      | /talia-large-chandelier-jn5112/    |
                | UK      | /talia-large-chandelier-eu-jn5112/ |
                | EU      | /talia-large-chandelier-eu-jn5112/ |
            And user select the following product variants:
                | country | variant | value                        |
                | US      | Finish  | Gild and Clear Swirled Glass |
                | UK      | Finish  | Gild and Clear Swirled Glass |
                | EU      | Finish  | Gild and Clear Swirled Glass |
            And user collect the following details of product from the product description page
                | label          |
                | Product Name   |
            And user click on the add to cart button
            And user click on the mini cart icon
            And user navigate to shopping cart page
            And user click on the 'Move to Project' link of product
        Then the product should not be displayed on the shopping cart page
            And user should be able to see the below success message on shopping cart page
                | country | message                                                |
                | US      | Talia Large Chandelier has been moved to your Project. |
                | UK      | Talia Large Chandelier has been moved to your Project. |
                | EU      | Talia Large Chandelier has been moved to your Project. |

    #--------------------------------------------------------------------------------------------------

    @all @shoppingCartPage @trade @us @uk @eu @testcase_69
    Scenario: After clicking on the add to quote link, the success message should be displayed and product should not get removed from the shopping cart page 

        Given user is on the login page
        When 'Trade' user do login into the website
            And user clear added items from the cart
            And user enter the following product description page url:
                | country | productDescriptionPageUrl          |
                | US      | /talia-large-chandelier-jn5112/    |
                | UK      | /talia-large-chandelier-eu-jn5112/ |
                | EU      | /talia-large-chandelier-eu-jn5112/ |
            And user select the following product variants:
                | country | variant | value                        |
                | US      | Finish  | Gild and Clear Swirled Glass |
                | UK      | Finish  | Gild and Clear Swirled Glass |
                | EU      | Finish  | Gild and Clear Swirled Glass |
            And user collect the following details of product from the product description page
                | label          |
                | Product Name   |
            And user click on the add to cart button
            And user click on the mini cart icon
            And user navigate to shopping cart page
            And user click on the 'Add to Quote' link of product
            And user select 'TestCy' from add to quote popover
            And user click on the add item button from the requisition list popup
        Then user should be able to see the below success message on shopping cart page
                | country | message                                                                               |
                | US      | All the items in your Shopping Cart have been added to the "TestCy" requisition list. |
                | UK      | All the items in your Shopping Cart have been added to the "TestCy" requisition list. |
                | EU      | All the items in your Shopping Cart have been added to the "TestCy" requisition list. |
            And the following item details should be displayed on the shopping cart page
                | label        |
                | Product Name |

    #--------------------------------------------------------------------------------------------------

    @all @shoppingCartPage @retail @us @uk @eu @testcase_70
    Scenario: In a retail account, any products should not get removed from the shopping cart page after clicking on the cancel button of clear cart popup

        Given user is on the login page
        When 'Retail' user do login into the website
            And user clear added items from the cart
            And user enter the following product description page url:
                | country | productDescriptionPageUrl          |
                | US      | /talia-large-chandelier-jn5112/    |
                | UK      | /talia-large-chandelier-eu-jn5112/ |
                | EU      | /talia-large-chandelier-eu-jn5112/ |
            And user select the following product variants:
                | country | variant | value                        |
                | US      | Finish  | Gild and Clear Swirled Glass |
                | UK      | Finish  | Gild and Clear Swirled Glass |
                | EU      | Finish  | Gild and Clear Swirled Glass |
            And user unselect the bulb checkbox
            And user collect the following details of product from the product description page
                | label        |
                | Product Name |
            And user click on the add to cart button from the product description page
            And user collect the following details of bulb from the add bulb popup
                | label      |
                | Bulb Name  |
            And user click on the add to cart button from the add bulb popup
            And user click on the mini cart icon
            And user navigate to shopping cart page
            And user click on the clear cart button from the shopping cart page
            And user click on the 'Cancel' button from the clear shopping cart pop up
        Then the following item details should be displayed on the shopping cart page
                | label        |
                | Product Name |
                | Bulb Name    |

    #--------------------------------------------------------------------------------------------------
    
    @all @shoppingCartPage @retail @us @uk @eu @testcase_71
    Scenario: In a retail account, any products should not get removed from the shopping cart page after clicking on the X icon button of clear cart popup 
    
        Given user is on the login page
        When 'Retail' user do login into the website
            And user clear added items from the cart
            And user enter the following product description page url:
                | country | productDescriptionPageUrl          |
                | US      | /talia-large-chandelier-jn5112/    |
                | UK      | /talia-large-chandelier-eu-jn5112/ |
                | EU      | /talia-large-chandelier-eu-jn5112/ |
            And user select the following product variants:
                | country | variant | value                        |
                | US      | Finish  | Gild and Clear Swirled Glass |
                | UK      | Finish  | Gild and Clear Swirled Glass |
                | EU      | Finish  | Gild and Clear Swirled Glass |
            And user unselect the bulb checkbox
            And user collect the following details of product from the product description page
                | label        |
                | Product Name |
            And user click on the add to cart button from the product description page
            And user collect the following details of bulb from the add bulb popup
                | label      |
                | Bulb Name  |
            And user click on the add to cart button from the add bulb popup
            And user click on the mini cart icon
            And user navigate to shopping cart page
            And user click on the clear cart button from the shopping cart page
            And user click on the 'X Icon' button from the clear shopping cart pop up
        Then the following item details should be displayed on the shopping cart page
                | label        |
                | Product Name |
                | Bulb Name    |
    
    #--------------------------------------------------------------------------------------------------
    
    @all @shoppingCartPage @retail @us @testcase_170
    Scenario: In a retail account, the product details should be displayed correctly on the shopping cart page
    
        Given user is on the login page
        When 'Retail' user do login into the website
            And user clear added items from the cart
            And user search 'JN5112' 
            And user press enter key
            And user collect the following details of 'JN5112' product from the list
                | label          | 
                | Product Name   |
                | Price          | 
            And user click on the 'JN5112' product
        Then the product description page of 'JN5112' should get opened
            And the following product details should be the same as displayed on the list
                | label          |
                | Product Name   |
                | Price          |
        When user select the following product variants:
                | country | variant | value                        |
                | US      | Finish  | Gild and Clear Swirled Glass |
            And user add 2 quantity of product
            And user collect the following details of product from the product description page
                | label          |
                | Product Name   |
                | Product Price  |
                | Product Qty    |
                | Product SKU    |
                | Finish         |
            And user unselect the bulb checkbox
            And user click on the add to cart button from the product description page
            And user collect the following details of bulb from the add bulb popup
                | label      |
                | Bulb Name  |
                | Bulb Price |
                | Bulb Qty   |
            And user click on the add to cart button from the add bulb popup
            And user click on the mini cart icon
            And user navigate to shopping cart page
        Then the following item details should be displayed on the shopping cart page
                | label         |
                | Product Name  |
                | Product Price |
                | Product Qty   |
                | Product SKU   |
                | Finish        |
                | Bulb Name     |
                | Bulb Price    |
                | Bulb Qty      |
            And the subtotal of product should be the multiplication of product price and qty
            And the subtotal of bulb should be the multiplication of bulb price and qty
    
    #--------------------------------------------------------------------------------------------------
    
    @all @shoppingCartPage @wholesale @us @testcase_171
    Scenario: In a wholesale account, the product details should be displayed correctly on the shopping cart page
    
        Given user is on the login page
        When 'Wholesale' user do login into the website
            And user clear added items from the cart
            And user search 'JN5112' 
            And user press enter key
            And user collect the following details of 'JN5112' product from the list
                | label          | 
                | Product Name   |
                | Price          | 
            And user click on the 'JN5112' product
        Then the product description page of 'JN5112' should get opened
            And the following product details should be the same as displayed on the list
                | label          |
                | Product Name   |
                | Price          |
            And user select the following product variants:
                | country | variant | value                        |
                | US      | Finish  | Gild and Clear Swirled Glass |
            And user add 2 quantity of product
            And user collect the following details of product from the product description page
                | label          |
                | Product Name   |
                | Product Price  |
                | Product Qty    |
                | Product SKU    |
                | Finish         |
            And user click on the add to cart button
            And user click on the mini cart icon
            And user navigate to shopping cart page
        Then the following item details should be displayed on the shopping cart page
                | label         |
                | Product Name  |
                | Product Price |
                | Product Qty   |
                | Product SKU   |
                | Finish        |
            And the subtotal of product should be the multiplication of product price and qty
    
    #--------------------------------------------------------------------------------------------------
    
    @all @shoppingCartPage @trade @us @uk @eu @testcase_172 
    Scenario: In a trade account, the product details should be displayed correctly on the shopping cart page
    
        Given user is on the login page
        When 'Trade' user do login into the website
            And user clear added items from the cart
            And user search 'JN5112' 
            And user press enter key
            And user collect the following details of 'JN5112' product from the list
                | label          | 
                | Product Name   |
                | Price          | 
            And user click on the 'JN5112' product
        Then the product description page of 'JN5112' should get opened
            And the following product details should be the same as displayed on the list
                | label          |
                | Product Name   |
                | Price          |
            And user select the following product variants:
                | country | variant | value                        |
                | US      | Finish  | Gild and Clear Swirled Glass |
                | UK      | Finish  | Gild and Clear Swirled Glass |
                | EU      | Finish  | Gild and Clear Swirled Glass |
            And user add 2 quantity of product
            And user collect the following details of product from the product description page
                | label          |
                | Product Name   |
                | Product Price  |
                | Product Qty    |
                | Product SKU    |
                | Finish         |
            And user unselect the bulb checkbox
            And user click on the add to cart button from the product description page
            And user collect the following details of bulb from the add bulb popup
                | label      |
                | Bulb Name  |
                | Bulb Price |
                | Bulb Qty   |
            And user click on the add to cart button from the add bulb popup
            And user click on the mini cart icon
            And user navigate to shopping cart page
        Then the following item details should be displayed on the shopping cart page
                | label         |
                | Product Name  |
                | Product Price |
                | Product Qty   |
                | Product SKU   |
                | Finish        |
                | Bulb Name     |
                | Bulb Price    |
                | Bulb Qty      |
            And the subtotal of product should be the multiplication of product price and qty
            And the subtotal of bulb should be the multiplication of bulb price and qty

    #--------------------------------------------------------------------------------------------------
    
    @all @shoppingCartPage @retail @us @uk @eu @testcase_193
    Scenario: The retail user should be able to see mega menus and its sub-options on the shopping cart page

        Given user is on the login page
        When 'Retail' user do login into the website
            And user click on the mini cart icon
        Then the shopping cart page should get opened which should contain the following url
                | url             |
                | /checkout/cart/ | 
        When user wait for 15 seconds 
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
    
    @all @shoppingCartPage @trade @us @uk @eu @testcase_194
    Scenario: The trade user should be able to see mega menus and its sub-options on the shopping cart page

        Given user is on the login page
        When 'Trade' user do login into the website
            And user click on the mini cart icon
        Then the shopping cart page should get opened which should contain the following url
                | url             |
                | /checkout/cart/ | 
        When user wait for 15 seconds 
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
    
    @all @shoppingCartPage @wholesale @us @uk @eu @testcase_195
    Scenario: The wholesale user should be able to see mega menus and its sub-options on the shopping cart page

        Given user is on the login page
        When 'Wholesale' user do login into the website
            And user click on the mini cart icon
        Then the shopping cart page should get opened which should contain the following url
                | url             |
                | /checkout/cart/ | 
        When user wait for 15 seconds 
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
    
    @all @shoppingCartPage @user @us @uk @eu @testcase_196
    Scenario: The user should be able to see mega menus and its sub-options on the shopping cart page

        Given user is on the login page
        When user click on the mini cart icon
        Then the shopping cart page should get opened which should contain the following url
                | url             |
                | /checkout/cart/ | 
        When user wait for 15 seconds 
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
    
    @all @shoppingCartPage @user @us @uk @eu @testcase_224 @skip
    Scenario: In a guest account, the product ship by date of cart page should be the same as displayed on the product description page

        Given user is on the home page
        When user enter the following product description page url:
                | country | productDescriptionPageUrl          |
                | US      | /talia-large-chandelier-jn5112/    |
                | UK      | /talia-large-chandelier-eu-jn5112/ |
                | EU      | /talia-large-chandelier-eu-jn5112/ |
            And user select the following product variants:
                | country | variant | value                        |
                | US      | Finish  | Gild and Clear Swirled Glass |
                | UK      | Finish  | Gild and Clear Swirled Glass |
                | EU      | Finish  | Gild and Clear Swirled Glass |               
            And user collect the following details of product from the product description page
                | label          |
                | Product Name   |
                | Ship By Date   |
            And user click on the add to cart button   
            And user click on the mini cart icon
        Then the shopping cart page should get opened which should contain the following url
                | url             |
                | /checkout/cart/ | 
            And the product ship by date of cart page should be the same as displayed on the product description page

    #--------------------------------------------------------------------------------------------------
    
    @all @shoppingCartPage @retail @us @uk @eu @testcase_225
    Scenario: In a retail account, the product ship by date of cart page should be the same as displayed on the product description page

        Given user is on the login page
        When 'Retail' user do login into the website
            And user clear added items from the cart
            And user enter the following product description page url:
                | country | productDescriptionPageUrl          |
                | US      | /talia-large-chandelier-jn5112/    |
                | UK      | /talia-large-chandelier-eu-jn5112/ |
                | EU      | /talia-large-chandelier-eu-jn5112/ |
            And user select the following product variants:
                | country | variant | value                        |
                | US      | Finish  | Gild and Clear Swirled Glass |
                | UK      | Finish  | Gild and Clear Swirled Glass |
                | EU      | Finish  | Gild and Clear Swirled Glass |               
            And user collect the following details of product from the product description page
                | label          |
                | Product Name   |
                | Ship By Date   |
            And user click on the add to cart button   
            And user click on the mini cart icon
        Then the shopping cart page should get opened which should contain the following url
                | url             |
                | /checkout/cart/ | 
            And the product ship by date of cart page should be the same as displayed on the product description page
    
    #--------------------------------------------------------------------------------------------------
    
    @all @shoppingCartPage @wholesale @us @testcase_226
    Scenario: In a wholesale account, the product ship by date of cart page should be the same as displayed on the product description page

        Given user is on the login page
        When 'Wholesale' user do login into the website
            And user clear added items from the cart
            And user enter the following product description page url:
                | country | productDescriptionPageUrl       |
                | US      | /talia-large-chandelier-jn5112/ |
            And user select the following product variants:
                | country | variant | value                        |
                | US      | Finish  | Gild and Clear Swirled Glass |             
            And user collect the following details of product from the product description page
                | label          |
                | Product Name   |
                | Ship By Date   |
            And user click on the add to cart button   
            And user click on the mini cart icon
        Then the shopping cart page should get opened which should contain the following url
                | url             |
                | /checkout/cart/ | 
            And the product ship by date of cart page should be the same as displayed on the product description page
    
    #--------------------------------------------------------------------------------------------------
    
    @all @shoppingCartPage @user @us @testcase_233 @skip
    Scenario: In a guest account, the generation lighting product details should be displayed correctly on the shopping cart page
    
        Given user is on the login page
        When user click on 'Ceiling' mega menu
            And user navigate to the product list page of 'Ceiling' mega menu
            And user click on 'Collection' filter
            And user select 'Generation Lighting' option from 'Collection' filter
        Then the 'Collection : Generation Lighting' option should be displayed as selected filter
            And the following product details should be displayed on the following product card
                | country | label          | value                   |
                | US      | Product Card   | 7728002                 |
                | US      | Designer Name  | Generation Lighting     |
                | US      | Price          | It should be displayed  |
        When user collect the following details of '7728002' product from the list
                | label          | 
                | Product Name   |
                | Designer Name  |
                | Price          | 
            And user click on the '7728002' product
        Then the product description page of '7728002' should get opened
            And the following product details should be the same as displayed on the list
                | label          |
                | Product Name   |
                | Designer Name  |
                | Price          | 
        When user select the following product variants:
                | country | variant   | value                |
                | US      | Finish    | Brushed Nickel       |
                | US      | Lamp Type | Bulb(s) Not Included |
            And user collect the following details of product from the product description page
                | label          |
                | Product Name   |
                | Product Price  |
                | Product SKU    |
            And user click on the add to cart button
            And user click on the mini cart icon
            And user navigate to shopping cart page
        Then the following item details should be displayed on the shopping cart page
                | label         |
                | Product Name  |
                | Product Price |
                | Product SKU   |

    #--------------------------------------------------------------------------------------------------
    
    @all @shoppingCartPage @trade @us @uk @eu @testcase_266 @smoke
    Scenario: The trade user should be verify product details from product list page to product details page also on mini cart and shopping cart page

        Given user is on the login page
        When 'Trade' user do login into the website
            And user clear added items from the cart
            And user click on 'Ceiling' mega menu
        Then product list page of 'Ceiling' mega menu should get opened
        When user collect the following details of product from the list
                | country | label         | sku      |
                | US      | Product Name  | JN5112   |
                | US      | Price         | JN5112   |
                | US      | SKU Code      | JN5112   |
                | US      | Designer Name | JN5112   |
                | UK      | Product Name  | JN5112   |
                | UK      | Price         | JN5112   |
                | UK      | SKU Code      | JN5112   |
                | UK      | Designer Name | JN5112   |
                | EU      | Product Name  | JN5110   |
                | EU      | Price         | JN5110   |
                | EU      | SKU Code      | JN5110   |
                | EU      | Designer Name | JN5110   |
            And user click on below product from the product list
                | country | product                |
                | US      | Talia Large Chandelier |
                | UK      | Talia Large Chandelier |
                | EU      | Talia Small Chandelier |
        Then the product description page should get opened for below sku code
                | country | sku    |
                | US      | JN5112 |
                | UK      | JN5112 |
                | EU      | JN5110 |
            And the following product details should be the same as displayed on the list
                | label         |
                | Product Name  |
                | Price         |
                | SKU Code      |
                | Designer Name |
        When user collect the following details of product from the product description page
                | label          |
                | Product Name   |
                | Product Price  |
                | Product Qty    |
                | Product SKU    |
                | Finish         |
            And user click on the add to cart button
            And user mouse hover on the mini cart icon
        Then the following item details should be displayed on the mini cart
                | label         |
                | Product Name  |
                | Product Price |
                | Product Qty   |
                | Finish        |
        When user click on the mini cart icon
            And user navigate to shopping cart page
        Then the following item details should be displayed on the shopping cart page
                | label         |
                | Product Name  |
                | Product Price |
                | Product Qty   |
                | Product SKU   |
                | Finish        |

    #--------------------------------------------------------------------------------------------------
    
    @all @shoppingCartPage @wholesale @us @testcase_267 @smoke
    Scenario: The wholesale user should be verify product details from product list page to product details page also on mini cart and shopping cart page

        Given user is on the login page
        When 'Wholesale' user do login into the website
            And user clear added items from the cart
            And user click on 'Ceiling' mega menu
        Then product list page of 'Ceiling' mega menu should get opened
        When user collect the following details of product from the list
                | country | label         | sku      |
                | US      | Product Name  | JN5112   |
                | US      | Price         | JN5112   |
                | US      | SKU Code      | JN5112   |
                | US      | Designer Name | JN5112   |
                | UK      | Product Name  | JN5112   |
                | UK      | Price         | JN5112   |
                | UK      | SKU Code      | JN5112   |
                | UK      | Designer Name | JN5112   |
                | EU      | Product Name  | JN5110   |
                | EU      | Price         | JN5110   |
                | EU      | SKU Code      | JN5110   |
                | EU      | Designer Name | JN5110   |
            And user click on below product from the product list
                | country | product                |
                | US      | Talia Large Chandelier |
                | UK      | Talia Large Chandelier |
                | EU      | Talia Small Chandelier |
        Then the product description page should get opened for below sku code
                | country | sku    |
                | US      | JN5112 |
                | UK      | JN5112 |
                | EU      | JN5110 |
            And the following product details should be the same as displayed on the list
                | label         |
                | Product Name  |
                | Price         |
                | SKU Code      |
                | Designer Name |
        When user collect the following details of product from the product description page
                | label          |
                | Product Name   |
                | Product Price  |
                | Product Qty    |
                | Product SKU    |
                | Finish         |
            And user click on the add to cart button
            And user mouse hover on the mini cart icon
        Then the following item details should be displayed on the mini cart
                | label         |
                | Product Name  |
                | Product Price |
                | Product Qty   |
                | Finish        |
        When user click on the mini cart icon
            And user navigate to shopping cart page
        Then the following item details should be displayed on the shopping cart page
                | label         |
                | Product Name  |
                | Product Price |
                | Product Qty   |
                | Product SKU   |
                | Finish        |

    #--------------------------------------------------------------------------------------------------
    
    @all @shoppingCartPage @retail @us @uk @eu @testcase_268 @smoke
    Scenario: The retail user should be verify product details from product list page to product details page also on mini cart and shopping cart page

        Given user is on the login page
        When 'Retail' user do login into the website
            And user clear added items from the cart
            And user click on 'Ceiling' mega menu
        Then product list page of 'Ceiling' mega menu should get opened
        When user collect the following details of product from the list
                | country | label         | sku      |
                | US      | Product Name  | JN5112   |
                | US      | Price         | JN5112   |
                | US      | SKU Code      | JN5112   |
                | US      | Designer Name | JN5112   |
                | UK      | Product Name  | JN5112   |
                | UK      | Price         | JN5112   |
                | UK      | SKU Code      | JN5112   |
                | UK      | Designer Name | JN5112   |
                | EU      | Product Name  | JN5110   |
                | EU      | Price         | JN5110   |
                | EU      | SKU Code      | JN5110   |
                | EU      | Designer Name | JN5110   |
            And user click on below product from the product list
                | country | product                |
                | US      | Talia Large Chandelier |
                | UK      | Talia Large Chandelier |
                | EU      | Talia Small Chandelier |
        Then the product description page should get opened for below sku code
                | country | sku    |
                | US      | JN5112 |
                | UK      | JN5112 |
                | EU      | JN5110 |
            And the following product details should be the same as displayed on the list
                | label         |
                | Product Name  |
                | Price         |
                | SKU Code      |
                | Designer Name |
        When user collect the following details of product from the product description page
                | label          |
                | Product Name   |
                | Product Price  |
                | Product Qty    |
                | Product SKU    |
                | Finish         |
            And user click on the add to cart button
            And user mouse hover on the mini cart icon
        Then the following item details should be displayed on the mini cart
                | label         |
                | Product Name  |
                | Product Price |
                | Product Qty   |
                | Finish        |
        When user click on the mini cart icon
            And user navigate to shopping cart page
        Then the following item details should be displayed on the shopping cart page
                | label         |
                | Product Name  |
                | Product Price |
                | Product Qty   |
                | Product SKU   |
                | Finish        |

    #--------------------------------------------------------------------------------------------------
    
    @all @shoppingCartPage @user @us @uk @eu @testcase_269
    Scenario: The guest user should be verify product details from product list page to product details page also on mini cart and shopping cart page

        Given user is on the login page
        When user click on 'Ceiling' mega menu
        Then product list page of 'Ceiling' mega menu should get opened
        When user collect the following details of product from the list
                | country | label         | sku      |
                | US      | Product Name  | JN5112   |
                | US      | Price         | JN5112   |
                | US      | SKU Code      | JN5112   |
                | US      | Designer Name | JN5112   |
                | UK      | Product Name  | JN5112   |
                | UK      | Price         | JN5112   |
                | UK      | SKU Code      | JN5112   |
                | UK      | Designer Name | JN5112   |
                | EU      | Product Name  | JN5110   |
                | EU      | Price         | JN5110   |
                | EU      | SKU Code      | JN5110   |
                | EU      | Designer Name | JN5110   |
            And user click on below product from the product list
                | country | product                |
                | US      | Talia Large Chandelier |
                | UK      | Talia Large Chandelier |
                | EU      | Talia Small Chandelier |
        Then the product description page should get opened for below sku code
                | country | sku    |
                | US      | JN5112 |
                | UK      | JN5112 |
                | EU      | JN5110 |
            And the following product details should be the same as displayed on the list
                | label         |
                | Product Name  |
                | Price         |
                | SKU Code      |
                | Designer Name |
        When user collect the following details of product from the product description page
                | label          |
                | Product Name   |
                | Product Price  |
                | Product Qty    |
                | Product SKU    |
                | Finish         |
            And user click on the add to cart button
            And user mouse hover on the mini cart icon
        Then the following item details should be displayed on the mini cart
                | label         |
                | Product Name  |
                | Product Price |
                | Product Qty   |
                | Finish        |
        When user click on the mini cart icon
            And user navigate to shopping cart page
        Then the following item details should be displayed on the shopping cart page
                | label         |
                | Product Name  |
                | Product Price |
                | Product Qty   |
                | Product SKU   |
                | Finish        |

    #--------------------------------------------------------------------------------------------------
    
    @all @shoppingCartPage @user @us @uk @eu @testcase_271 
    Scenario: The guest user should be verify non signature product details from product list page to product details page also on mini cart and shopping cart page

        Given user is on the login page
        When user click on 'Ceiling' mega menu
            And user navigate to the product list page of 'Ceiling' mega menu
            And user click on 'Collection' filter
            And user select 'Studio Collection' option from given filter
        When user collect the following details of product from the list
                | country | label         | sku      |
                | US      | Product Name  | CC16712  |
                | US      | Price         | CC16712  |
                | US      | SKU Code      | CC16712  |
                | US      | Designer Name | CC16712  |
                | UK      | Product Name  | EU-F3932 |
                | UK      | Price         | EU-F3932 |
                | UK      | SKU Code      | EU-F3932 |
                | UK      | Designer Name | EU-F3932 |
                | EU      | Product Name  | EU-F3932 |
                | EU      | Price         | EU-F3932 |
                | EU      | SKU Code      | EU-F3932 |
                | EU      | Designer Name | EU-F3932 |
            And user click on below product from the product list
                | country | product                  |
                | US      | EASTYN MEDIUM CHANDELIER |
                | UK      | AVENIR MEDIUM CHANDELIER |
                | EU      | AVENIR MEDIUM CHANDELIER |
        Then the product description page should get opened for below sku code
                | country | sku      |
                | US      | CC16712  |
                | UK      | EU-F3932 |
                | EU      | EU-F3932 |
            And the following product details should be the same as displayed on the list
                | label         |
                | Product Name  |
                | Price         |
                | SKU Code      |
                | Designer Name |
        When user collect the following details of product from the product description page
                | label         |
                | Product Name  |
                | Product Price |
                | Product Qty   |
                | Product SKU   |
                | Finish        |
            And user click on the add to cart button
            And user mouse hover on the mini cart icon
        Then the following item details should be displayed on the mini cart
                | label         |
                | Product Name  |
                | Product Price |
                | Product Qty   |
                | Finish        |
        When user click on the mini cart icon
            And user navigate to shopping cart page
        Then the following item details should be displayed on the shopping cart page
                | label         |
                | Product Name  |
                | Product Price |
                | Product Qty   |
                | Product SKU   |
                | Finish        |

    #--------------------------------------------------------------------------------------------------
    
    @all @shoppingCartPage @retail @us @uk @eu @testcase_272
    Scenario: The retail user should be verify non signature product details from product list page to product details page also on mini cart and shopping cart page

        Given user is on the login page
        When 'Retail' user do login into the website
            And user clear added items from the cart
            And user click on 'Ceiling' mega menu
            And user navigate to the product list page of 'Ceiling' mega menu
            And user click on 'Collection' filter
            And user select 'Studio Collection' option from given filter
        When user collect the following details of product from the list
                | country | label         | sku      |
                | US      | Product Name  | CC16712  |
                | US      | Price         | CC16712  |
                | US      | SKU Code      | CC16712  |
                | US      | Designer Name | CC16712  |
                | UK      | Product Name  | EU-F3932 |
                | UK      | Price         | EU-F3932 |
                | UK      | SKU Code      | EU-F3932 |
                | UK      | Designer Name | EU-F3932 |
                | EU      | Product Name  | EU-F3932 |
                | EU      | Price         | EU-F3932 |
                | EU      | SKU Code      | EU-F3932 |
                | EU      | Designer Name | EU-F3932 |
            And user click on below product from the product list
                | country | product                  |
                | US      | EASTYN MEDIUM CHANDELIER |
                | UK      | AVENIR MEDIUM CHANDELIER |
                | EU      | AVENIR MEDIUM CHANDELIER |
        Then the product description page should get opened for below sku code
                | country | sku      |
                | US      | CC16712  |
                | UK      | EU-F3932 |
                | EU      | EU-F3932 |
            And the following product details should be the same as displayed on the list
                | label         |
                | Product Name  |
                | Price         |
                | SKU Code      |
                | Designer Name |
            And user collect the following details of product from the product description page
                | label         |
                | Product Name  |
                | Product Price |
                | Product Qty   |
                | Product SKU   |
                | Finish        |
            And user click on the add to cart button
            And user mouse hover on the mini cart icon
        Then the following item details should be displayed on the mini cart
                | label         |
                | Product Name  |
                | Product Price |
                | Product Qty   |
                | Finish        |
        When user click on the mini cart icon
            And user navigate to shopping cart page
        Then the following item details should be displayed on the shopping cart page
                | label         |
                | Product Name  |
                | Product Price |
                | Product Qty   |
                | Product SKU   |
                | Finish        |

    #--------------------------------------------------------------------------------------------------
    
    @all @shoppingCartPage @trade @us @uk @eu @testcase_273 
    Scenario: The trade user should be verify non signature product details from product list page to product details page also on mini cart and shopping cart page

        Given user is on the login page
        When 'Trade' user do login into the website
            And user clear added items from the cart
            And user click on 'Ceiling' mega menu
            And user navigate to the product list page of 'Ceiling' mega menu
            And user click on 'Collection' filter
            And user select 'Studio Collection' option from given filter
        When user collect the following details of product from the list
                | country | label         | sku      |
                | US      | Product Name  | CC16712  |
                | US      | Price         | CC16712  |
                | US      | SKU Code      | CC16712  |
                | US      | Designer Name | CC16712  |
                | UK      | Product Name  | EU-F3932 |
                | UK      | Price         | EU-F3932 |
                | UK      | SKU Code      | EU-F3932 |
                | UK      | Designer Name | EU-F3932 |
                | EU      | Product Name  | EU-F3932 |
                | EU      | Price         | EU-F3932 |
                | EU      | SKU Code      | EU-F3932 |
                | EU      | Designer Name | EU-F3932 |
            And user click on below product from the product list
                | country | product                  |
                | US      | EASTYN MEDIUM CHANDELIER |
                | UK      | AVENIR MEDIUM CHANDELIER |
                | EU      | AVENIR MEDIUM CHANDELIER |
        Then the product description page should get opened for below sku code
                | country | sku      |
                | US      | CC16712  |
                | UK      | EU-F3932 |
                | EU      | EU-F3932 |
            And the following product details should be the same as displayed on the list
                | label         |
                | Product Name  |
                | Price         |
                | SKU Code      |
                | Designer Name |
        When user collect the following details of product from the product description page
                | label         |
                | Product Name  |
                | Product Price |
                | Product Qty   |
                | Product SKU   |
                | Finish        |
            And user click on the add to cart button
            And user mouse hover on the mini cart icon
        Then the following item details should be displayed on the mini cart
                | label         |
                | Product Name  |
                | Product Price |
                | Product Qty   |
                | Finish        |
        When user click on the mini cart icon
            And user navigate to shopping cart page
        Then the following item details should be displayed on the shopping cart page
                | label         |
                | Product Name  |
                | Product Price |
                | Product Qty   |
                | Product SKU   |
                | Finish        |

    #--------------------------------------------------------------------------------------------------
    
    @all @shoppingCartPage @wholesale @us @testcase_274 
    Scenario: The wholesale user should be verify non signature product details from product list page to product details page also on mini cart and shopping cart page

        Given user is on the login page
        When 'Wholesale' user do login into the website
            And user clear added items from the cart
            And user click on 'Ceiling' mega menu
            And user navigate to the product list page of 'Ceiling' mega menu
            And user click on 'Collection' filter
            And user select 'Studio Collection' option from given filter
        When user collect the following details of product from the list
                | country | label         | sku      |
                | US      | Product Name  | CC16712  |
                | US      | Price         | CC16712  |
                | US      | SKU Code      | CC16712  |
                | US      | Designer Name | CC16712  |
                | UK      | Product Name  | EU-F3932 |
                | UK      | Price         | EU-F3932 |
                | UK      | SKU Code      | EU-F3932 |
                | UK      | Designer Name | EU-F3932 |
                | EU      | Product Name  | EU-F3932 |
                | EU      | Price         | EU-F3932 |
                | EU      | SKU Code      | EU-F3932 |
                | EU      | Designer Name | EU-F3932 |
            And user click on below product from the product list
                | country | product                  |
                | US      | EASTYN MEDIUM CHANDELIER |
                | UK      | AVENIR MEDIUM CHANDELIER |
                | EU      | AVENIR MEDIUM CHANDELIER |
        Then the product description page should get opened for below sku code
                | country | sku      |
                | US      | CC16712  |
                | UK      | EU-F3932 |
                | EU      | EU-F3932 |
            And the following product details should be the same as displayed on the list
                | label         |
                | Product Name  |
                | Price         |
                | SKU Code      |
                | Designer Name |
        When user collect the following details of product from the product description page
                | label         |
                | Product Name  |
                | Product Price |
                | Product Qty   |
                | Product SKU   |
                | Finish        |
            And user click on the add to cart button
            And user mouse hover on the mini cart icon
        Then the following item details should be displayed on the mini cart
                | label         |
                | Product Name  |
                | Product Price |
                | Product Qty   |
                | Finish        |
        When user click on the mini cart icon
            And user navigate to shopping cart page
        Then the following item details should be displayed on the shopping cart page
                | label         |
                | Product Name  |
                | Product Price |
                | Product Qty   |
                | Product SKU   |
                | Finish        |

    #--------------------------------------------------------------------------------------------------

    @all @shoppingCartPage @retail @us @uk @eu @testcase_368
    Scenario:  The retail user should be able see validation message after keep quantity field empty

        Given user is on the login page
        When 'Retail' user do login into the website
            And user clear added items from the cart
            And user enter the following product description page url:
                | country | productDescriptionPageUrl          |
                | US      | /talia-large-chandelier-jn5112/    |
                | UK      | /talia-large-chandelier-eu-jn5112/ |
                | EU      | /talia-large-chandelier-eu-jn5112/ |
            And user select the following product variants:
                | country | variant | value                        |
                | US      | Finish  | Gild and Clear Swirled Glass |
                | UK      | Finish  | Gild and Clear Swirled Glass |
                | EU      | Finish  | Gild and Clear Swirled Glass |
            And user unselect the bulb checkbox
            And user click on the add to cart button from the product description page
            And user click on view shopping cart link
            And user click on the mini cart icon
            And user navigate to shopping cart page
            And keep quantity field blank on shopping cart page
            And user click on the clear cart button from the shopping cart page
        Then user should see below validation message on shopping cart page
                | message                   |
                | This is a required field. |

    #--------------------------------------------------------------------------------------------------

    @all @shoppingCartPage @trade @us @uk @eu @testcase_369
    Scenario:  The trade user should be able see validation message after keep quantity field empty

        Given user is on the login page
        When 'Trade' user do login into the website
            And user clear added items from the cart
            And user enter the following product description page url:
                | country | productDescriptionPageUrl          |
                | US      | /talia-large-chandelier-jn5112/    |
                | UK      | /talia-large-chandelier-eu-jn5112/ |
                | EU      | /talia-large-chandelier-eu-jn5112/ |
            And user select the following product variants:
                | country | variant | value                        |
                | US      | Finish  | Gild and Clear Swirled Glass |
                | UK      | Finish  | Gild and Clear Swirled Glass |
                | EU      | Finish  | Gild and Clear Swirled Glass |
            And user unselect the bulb checkbox
            And user click on the add to cart button from the product description page
            And user click on view shopping cart link
            And user click on the mini cart icon
            And user navigate to shopping cart page
            And keep quantity field blank on shopping cart page
            And user click on the clear cart button from the shopping cart page
        Then user should see below validation message on shopping cart page
                | message                   |
                | This is a required field. |

    #--------------------------------------------------------------------------------------------------

    @all @shoppingCartPage @user @us @uk @eu @testcase_370
    Scenario:  The guest user should be able see validation message after keep quantity field empty

        Given user is on the login page
        When user clear added items from the cart
            And user enter the following product description page url:
                | country | productDescriptionPageUrl          |
                | US      | /talia-large-chandelier-jn5112/    |
                | UK      | /talia-large-chandelier-eu-jn5112/ |
                | EU      | /talia-large-chandelier-eu-jn5112/ |
            And user select the following product variants:
                | country | variant | value                        |
                | US      | Finish  | Gild and Clear Swirled Glass |
                | UK      | Finish  | Gild and Clear Swirled Glass |
                | EU      | Finish  | Gild and Clear Swirled Glass |
            And user unselect the bulb checkbox
            And user click on the add to cart button from the product description page
            And user click on view shopping cart link
            And user click on the mini cart icon
            And user navigate to shopping cart page
            And keep quantity field blank on shopping cart page
            And user click on the clear cart button from the shopping cart page
        Then user should see below validation message on shopping cart page
                | message                   |
                | This is a required field. |
    
    #--------------------------------------------------------------------------------------------------

    @all @shoppingCartPage @retail @us @uk @eu @testcase_384 
    Scenario: The retail user should be able to enter text into sidemark and comment field after expanding the Add sidemark/comment sections

        Given user is on the login page
        When 'Retail' user do login into the website
            And user clear added items from the cart
            And user enter the following product description page url:
                | country | productDescriptionPageUrl          |
                | US      | /talia-large-chandelier-jn5112/    |
                | UK      | /talia-large-chandelier-eu-jn5112/ |
                | EU      | /talia-large-chandelier-eu-jn5112/ |
            And user select the following product variants:
                | country | variant | value                        |
                | US      | Finish  | Gild and Clear Swirled Glass |
                | UK      | Finish  | Gild and Clear Swirled Glass |
                | EU      | Finish  | Gild and Clear Swirled Glass |
            And user click on the add to cart button
            And user click on the mini cart icon
            And user navigate to shopping cart page
            And user click on add sidemark of product
            And user enter 'Test Automation' text into sidemark section of product
            And user enter 'cypress Automation' text into comment section of product

    #--------------------------------------------------------------------------------------------------

    @all @shoppingCartPage @retail @us @uk @eu @testcase_385
    Scenario: The retail user should not able to see sidemark and comment field after collapse the Add sidemark/comment sections

        Given user is on the login page
        When 'Retail' user do login into the website
            And user clear added items from the cart
            And user enter the following product description page url:
                | country | productDescriptionPageUrl          |
                | US      | /talia-large-chandelier-jn5112/    |
                | UK      | /talia-large-chandelier-eu-jn5112/ |
                | EU      | /talia-large-chandelier-eu-jn5112/ |
            And user select the following product variants:
                | country | variant | value                        |
                | US      | Finish  | Gild and Clear Swirled Glass |
                | UK      | Finish  | Gild and Clear Swirled Glass |
                | EU      | Finish  | Gild and Clear Swirled Glass |
            And user click on the add to cart button
            And user click on the mini cart icon
            And user navigate to shopping cart page
            And user click on add sidemark of product        
        Then user should see sidemark section along with comment section of product
            And user click on add sidemark of bulb
            And user should see sidemark section along with comment section of bulb
        When user click on collapse link add sidemark of product
        Then user should not able see sidemark section along with comment section of product
            And user click on collapse link of add sidemark of bulb 
            And user should not able see sidemark section along with comment section of bulb
    
    #--------------------------------------------------------------------------------------------------
    
    @all @shoppingCartPage @user @us @uk @eu @testcase_396
    Scenario: The guest user should be able to see an attention popup on entering more than 10000 qty

        Given user is on the home page
        When user enter the following product description page url:
                | country | productDescriptionPageUrl          |
                | US      | /talia-large-chandelier-jn5112/    |
                | UK      | /talia-large-chandelier-eu-jn5112/ |
                | EU      | /talia-large-chandelier-eu-jn5112/ |
            And user select the following product variants:
                | country | variant | value                        |
                | US      | Finish  | Gild and Clear Swirled Glass |
                | UK      | Finish  | Gild and Clear Swirled Glass |
                | EU      | Finish  | Gild and Clear Swirled Glass |
            And user collect the following details of product from the product description page
                | label          |
                | Product Name   |
            And user click on the add to cart button
            And user click on the mini cart icon
            And user navigate to shopping cart page
            And user update 10001 qty of product
        Then the attention popup should be displayed with the below message and the ok button & x-icon should be displayed
                | message                                                            |
                | The requested qty exceeds the maximum qty allowed in shopping cart |
        When user click on the ok button of attention popup
        Then the attention popup should get closed

    #--------------------------------------------------------------------------------------------------
    
    @all @shoppingCartPage @wholesale @us @testcase_397
    Scenario: The wholesale user should be able to see an attention popup on entering more than 10000 qty

        Given user is on the login page
        When 'Wholesale' user do login into the website
            And user clear added items from the cart
            And user enter the following product description page url:
                | country | productDescriptionPageUrl          |
                | US      | /talia-large-chandelier-jn5112/    |
                | UK      | /talia-large-chandelier-eu-jn5112/ |
                | EU      | /talia-large-chandelier-eu-jn5112/ |
            And user select the following product variants:
                | country | variant | value                        |
                | US      | Finish  | Gild and Clear Swirled Glass |
                | UK      | Finish  | Gild and Clear Swirled Glass |
                | EU      | Finish  | Gild and Clear Swirled Glass |
            And user collect the following details of product from the product description page
                | label          |
                | Product Name   |
            And user click on the add to cart button
            And user click on the mini cart icon
            And user navigate to shopping cart page
            And user update 10001 qty of product
        Then the attention popup should be displayed with the below message and the ok button & x-icon should be displayed
                | message                                                            |
                | The requested qty exceeds the maximum qty allowed in shopping cart |
        When user click on the ok button of attention popup
        Then the attention popup should get closed
    
    #--------------------------------------------------------------------------------------------------

    @all @shoppingCartPage @user @us @uk @eu @testcase_401
    Scenario: The guest user should be able to enter the product quantity within the 1 to 10000 range

        Given user is on the home page
        When user enter the following product description page url:
                | country | productDescriptionPageUrl          |
                | US      | /talia-large-chandelier-jn5112/    |
                | UK      | /talia-large-chandelier-eu-jn5112/ |
                | EU      | /talia-large-chandelier-eu-jn5112/ |
            And user select the following product variants:
                | country | variant | value                        |
                | US      | Finish  | Gild and Clear Swirled Glass |
                | UK      | Finish  | Gild and Clear Swirled Glass |
                | EU      | Finish  | Gild and Clear Swirled Glass |
            And user collect the following details of product from the product description page
                | label          |
                | Product Name   |
            And user click on the add to cart button
            And user click on the mini cart icon
            And user navigate to shopping cart page
            And user update 10000 quantity of product
        Then the 10000 quantity of product should be displayed
        When user update 1 quantity of product
        Then the 1 quantity of product should be displayed

    #--------------------------------------------------------------------------------------------------

    @all @shoppingCartPage @wholesale @us @testcase_402
    Scenario: The wholesale user should be able to enter the product quantity within the 1 to 10000 range

        Given user is on the login page
        When 'Wholesale' user do login into the website
            And user clear added items from the cart
            And user enter the following product description page url:
                | country | productDescriptionPageUrl          |
                | US      | /talia-large-chandelier-jn5112/    |
                | UK      | /talia-large-chandelier-eu-jn5112/ |
                | EU      | /talia-large-chandelier-eu-jn5112/ |
            And user select the following product variants:
                | country | variant | value                        |
                | US      | Finish  | Gild and Clear Swirled Glass |
                | UK      | Finish  | Gild and Clear Swirled Glass |
                | EU      | Finish  | Gild and Clear Swirled Glass |
            And user collect the following details of product from the product description page
                | label          |
                | Product Name   |
            And user click on the add to cart button
            And user click on the mini cart icon
            And user navigate to shopping cart page
            And user update 10000 quantity of product
        Then the 10000 quantity of product should be displayed
        When user update 1 quantity of product
        Then the 1 quantity of product should be displayed
            
    #--------------------------------------------------------------------------------------------------
    
    @all @shoppingCartPage @retail @us @uk @eu @testcase_410
    Scenario: The retail user should be able to verify the Page title, and url on the shopping cart page

        Given user is on the login page
        When 'Retail' user do login into the website
            And user enter the following product description page url:
                | country | productDescriptionPageUrl                     |
                | US      | /talia-large-chandelier-jn5112/#2461=52281    |
                | UK      | /talia-large-chandelier-eu-jn5112/#2461=52281 |
                | EU      | /talia-large-chandelier-eu-jn5112/#2461=52281 |
            And user click on the add to cart button
            And user click on the mini cart icon
            And user navigate to shopping cart page
        Then the shopping cart page should get opened which should contain the following url
                | url             |
                | /checkout/cart/ |
    
    #--------------------------------------------------------------------------------------------------

    @all @shoppingCartPage @user @us @uk @eu @testcase_459
    Scenario: The guest user should be able to see the country, state, and zip code options on the Estimate Shipping & Tax section

        Given user is on the home page
        When user enter the following product description page url:
                | country | productDescriptionPageUrl                     |
                | US      | /talia-large-chandelier-jn5112/#2461=52281    |
                | UK      | /talia-large-chandelier-eu-jn5112/#2461=52281 |
                | EU      | /talia-large-chandelier-eu-jn5112/#2461=52281 |
            And user navigate to product description page of 'JN5112' product
            And user click on the add to cart button 
            And user click on the mini cart icon
            And user navigate to shopping cart page
        Then user should be able to see the 'Estimate Shipping & Tax' section as collapsed
        When user click on the Estimate Shipping & Tax section
        Then the Estimate Shipping & Tax section should be expanded
            And user should be able to see the following options on the Estimate Shipping & Tax section
                | options         |
                | Country         |
                | State/Province  |
                | Zip/Postal Code |

    #--------------------------------------------------------------------------------------------------

    @all @shoppingCartPage @trade @us @uk @eu @testcase_460
    Scenario: The trade user should be able to see the country, state, and zip code options on the Estimate Shipping & Tax section

        Given user is on the login page
        When 'Trade' user do login into the website
            And user enter the following product description page url:
                | country | productDescriptionPageUrl                     |
                | US      | /talia-large-chandelier-jn5112/#2461=52281    |
                | UK      | /talia-large-chandelier-eu-jn5112/#2461=52281 |
                | EU      | /talia-large-chandelier-eu-jn5112/#2461=52281 |
            And user navigate to product description page of 'JN5112' product
            And user click on the add to cart button 
            And user click on the mini cart icon
            And user navigate to shopping cart page
        Then user should be able to see the 'Estimate Shipping & Tax' section as collapsed
        When user click on the Estimate Shipping & Tax section
        Then the Estimate Shipping & Tax section should be expanded
            And user should be able to see the following options on the Estimate Shipping & Tax section
                | options         |
                | Country         |
                | State/Province  |
                | Zip/Postal Code |

    #--------------------------------------------------------------------------------------------------

    @all @shoppingCartPage @retail @us @uk @eu @testcase_461
    Scenario: The retail user should be able to see the country, state, and zip code options on the Estimate Shipping & Tax section

        Given user is on the login page
        When 'Retail' user do login into the website
            And user enter the following product description page url:
                | country | productDescriptionPageUrl                     |
                | US      | /talia-large-chandelier-jn5112/#2461=52281    |
                | UK      | /talia-large-chandelier-eu-jn5112/#2461=52281 |
                | EU      | /talia-large-chandelier-eu-jn5112/#2461=52281 |
            And user navigate to product description page of 'JN5112' product
            And user click on the add to cart button 
            And user click on the mini cart icon
            And user navigate to shopping cart page
        Then user should be able to see the 'Estimate Shipping & Tax' section as collapsed
        When user click on the Estimate Shipping & Tax section
        Then the Estimate Shipping & Tax section should be expanded
            And user should be able to see the following options on the Estimate Shipping & Tax section
                | options         |
                | Country         |
                | State/Province  |
                | Zip/Postal Code |

    #--------------------------------------------------------------------------------------------------

    @all @shoppingCartPage @retail @us @uk @eu @testcase_464
    Scenario: The retail user should be able to see validation message after adding wrong zip/postal code

        Given user is on the login page
        When 'Retail' user do login into the website
            And user enter the following product description page url:
                | country | productDescriptionPageUrl                     |
                | US      | /talia-large-chandelier-jn5112/#2461=52281    |
                | UK      | /talia-large-chandelier-eu-jn5112/#2461=52281 |
                | EU      | /talia-large-chandelier-eu-jn5112/#2461=52281 |
            And user navigate to product description page of 'JN5112' product
            And user click on the add to cart button 
            And user click on the mini cart icon
            And user navigate to shopping cart page
        Then user should be able to see the 'Estimate Shipping & Tax' section as collapsed
        When user click on the Estimate Shipping & Tax section
            And user enter invalid 123456 zip code
        Then user should be able to see below zip code validation message
                | message                                       |
                | Provided Zip/Postal Code seems to be invalid. |

    #--------------------------------------------------------------------------------------------------

    @all @shoppingCartPage @trade @us @uk @eu @testcase_465
    Scenario: The trade user should be able to see validation message after adding wrong zip/postal code

        Given user is on the login page
        When 'Trade' user do login into the website
            And user enter the following product description page url:
                | country | productDescriptionPageUrl                     |
                | US      | /talia-large-chandelier-jn5112/#2461=52281    |
                | UK      | /talia-large-chandelier-eu-jn5112/#2461=52281 |
                | EU      | /talia-large-chandelier-eu-jn5112/#2461=52281 |
            And user navigate to product description page of 'JN5112' product
            And user click on the add to cart button 
            And user click on the mini cart icon
            And user navigate to shopping cart page
        Then user should be able to see the 'Estimate Shipping & Tax' section as collapsed
        When user click on the Estimate Shipping & Tax section
            And user enter invalid 123456 zip code
        Then user should be able to see below zip code validation message
                | message                                       |
                | Provided Zip/Postal Code seems to be invalid. |

    #--------------------------------------------------------------------------------------------------

    @all @shoppingCartPage @retail @us @uk @eu @testcase_468
    Scenario: The retail user should be able to see that the user can select the country, state, zip code from estimate shipping and tax

        Given user is on the login page
        When 'Retail' user do login into the website
            And user clear added items from the cart
            And user enter the following product description page url:
                | country | productDescriptionPageUrl                                                             |
                | US      | /linden-table-lamp-kw3032/#1651=53641&2461=36101                                      |
                | UK      | /linden-table-lamp-eu-kw3032/?selected_product=KW%203032PW-L-EU#1651=81020&2461=36101 |
                | EU      | /linden-table-lamp-eu-kw3032/?selected_product=KW%203032PW-L-EU#1651=81020&2461=36101 |
            And user click on the add to cart button 
            And user click on the mini cart icon
            And user navigate to shopping cart page
        Then user should be able to see the 'Estimate Shipping & Tax' section as collapsed
        When user click on the Estimate Shipping & Tax section
        Then the Estimate Shipping & Tax section should be expanded
        When user select below country from dropdown
                | country | countryName   |
                | US      | United States |
                | UK      | Belgium       |
                | EU      | Belgium       |
        Then user should be able to see the selected country on the Estimate Shipping & Tax section
                | country | countryName   |
                | US      | United States |
                | UK      | Belgium       |
                | EU      | Belgium       |
        When user select below state from dropdown
                | country | stateName                |
                | US      | California               |
                | UK      | Brussels-Capital Region  |
                | EU      | Antwerpen                |
        Then user should be able to see the selected state on the Estimate Shipping & Tax section
                | country | stateName                |
                | US      | California               |
                | UK      | Brussels-Capital Region  |
                | EU      | Antwerpen                |
        When user enter below zip code
                | country | zipCode  |
                | US      | 95035    |
                | UK      | 3215     |
                | EU      | 1234     |
        Then user should be able to see the selected zip on the Estimate Shipping & Tax section
                | country | zipCode  |
                | US      | 95035    |
                | UK      | 3215     |
                | EU      | 1234     |
        When user click on 'Standard Overnight' shipping method on shopping cart
        Then the merchandise total displayed in the order summary should be a sum of order subtotal, shipping charges and tax on shopping cart

    #--------------------------------------------------------------------------------------------------

    @all @shoppingCartPage @retail @us @uk @eu @testcase_480
    Scenario: The retail user should be able to verify that product quantity field is not accepting invalid input.

        Given user is on the login page
        When 'Retail' user do login into the website
            And user clear added items from the cart
            And user enter the following product description page url:
                | country | productDescriptionPageUrl                     |
                | US      | /talia-large-chandelier-jn5112/#2461=52281    |
                | UK      | /talia-large-chandelier-eu-jn5112/#2461=52281 |
                | EU      | /talia-large-chandelier-eu-jn5112/#2461=52281 |
            And user collect the following details of product from the product description page
                | label          |
                | Product Name   |
            And user click on the add to cart button
            And user click on the mini cart icon
            And user navigate to shopping cart page
            And user update 0 quantity of product on shopping cart
        Then user should be able to see below quantity validation message on shopping cart
                | message                                             |
                | Please enter a number greater than 0 in this field. |
        When user reload the current page 
            And user update -1 quantity of product on shopping cart
        Then user should be able to see below quantity validation message on shopping cart
                | message                                             |
                | Please enter a number greater than 0 in this field. |
