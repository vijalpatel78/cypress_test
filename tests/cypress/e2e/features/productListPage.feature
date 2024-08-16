Feature: Product List Page

    The user should be able to access the product list page.

    #--------------------------------------------------------------------------------------------------
    
    @all @productListPage @user @us @uk @eu @testcase_24 
    Scenario: The user should be able to navigate the product list page

        Given user is on the login page
        When user click on 'Ceiling' mega menu
        Then product list page of 'Ceiling' mega menu should get opened
            And the below breadcrumb value should be displayed on the product list page
                | value          |
                | Home / Ceiling |

    #--------------------------------------------------------------------------------------------------
    
    @all @productListPage @user @us @uk @eu @testcase_28
    Scenario: The user should be able to see featured as by default selected option of sort by dropdown

        Given user is on the login page
        When user click on 'Ceiling' mega menu
        Then product list page of 'Ceiling' mega menu should get opened
            And the below option of sort by dropdown should be displayed as by default selected
                | option    |
                | FEATURED  |
    
    #--------------------------------------------------------------------------------------------------
    
    @all @productListPage @user @us @uk @eu @testcase_33
    Scenario: The user should be able to select black option from finish filter on the product list page

        Given user is on the login page
        When user click on 'Ceiling' mega menu
            And user navigate to the product list page of 'Ceiling' mega menu
            And user click on 'Finish' filter
            And user select 'Black' option from given filter
        Then the 'Finish : Black' option should be displayed as selected filter 
                
    #--------------------------------------------------------------------------------------------------
    
    @all @productListPage @user @us @uk @eu @testcase_29
    Scenario: The user should be able to see available filters on the product list page

        Given user is on the login page
        When user click on 'Ceiling' mega menu
        Then product list page of 'Ceiling' mega menu should get opened
            And user should be able to see below available filters on product list page
                | filters      |
                | FINISH       |
                | PRICE        |

    #--------------------------------------------------------------------------------------------------
    
    @all @productListPage @retail @us @uk @eu @testcase_32
    Scenario: The retail user should be able to see product name, designer name, sku code, price and view additional finishes text on product card

        Given user is on the login page
        When 'Retail' user do login into the website
            And user click on the 'Chandelier' submenu of 'Ceiling' mega menu
        Then product list page of 'Chandelier' mega menu should get opened
            And the following product details should be displayed on the following product card
                | country | label              | value                    |
                | US      | Product Card       | JN5112                   |
                | US      | Product Name       | Talia Large Chandelier   |  
                | US      | Designer Name      | Julie Neill              |
                | US      | SKU Code           | JN5112                   |
                | US      | Price              | It should be displayed   |
                | US      | View More Link     | View Additional Finishes |
                | UK      | Product Card       | EU-TOB5003               |
                | UK      | Product Name       | Bryant Large Chandelier  |
                | UK      | Designer Name      | Thomas O'Brien           |  
                | UK      | SKU Code           | EU-TOB5003               |
                | UK      | Price              | It should be displayed   |
                | UK      | View More Link     | View Additional Finishes |
                | EU      | Product Card       | EU-TOB5003               |
                | EU      | Product Name       | Bryant Large Chandelier  |  
                | EU      | Designer Name      | Thomas O'Brien           |
                | EU      | SKU Code           | EU-TOB5003               |
                | EU      | Price              | It should be displayed   |
                | EU      | View More Link     | View Additional Finishes |

    #--------------------------------------------------------------------------------------------------
    
    @all @productListPage @trade @us @uk @eu @testcase_37
    Scenario: The trade user should be able to see product name, designer name, sku code, price and view additional finishes text on product card

        Given user is on the login page
        When 'Trade' user do login into the website
            And user click on the 'Chandelier' submenu of 'Ceiling' mega menu
        Then product list page of 'Chandelier' mega menu should get opened
            And the following product details should be displayed on the following product card
                | country | label              | value                    |
                | US      | Product Card       | JN5112                   |
                | US      | Product Name       | Talia Large Chandelier   |  
                | US      | Designer Name      | Julie Neill              |
                | US      | SKU Code           | JN5112                   |
                | US      | Original Price     | It should be displayed   |
                | US      | Price              | It should be displayed   |
                | US      | View More Link     | View Additional Finishes |
                | UK      | Product Card       | EU-TOB5003               |
                | UK      | Product Name       | Bryant Large Chandelier  |
                | UK      | Designer Name      | Thomas O'Brien           |  
                | UK      | SKU Code           | EU-TOB5003               |
                | UK      | Original Price     | It should be displayed   |
                | UK      | Price              | It should be displayed   |
                | UK      | View More Link     | View Additional Finishes |
                | EU      | Product Card       | EU-TOB5003               |
                | EU      | Product Name       | Bryant Large Chandelier  |  
                | EU      | Designer Name      | Thomas O'Brien           |
                | EU      | SKU Code           | EU-TOB5003               |
                | EU      | Original Price     | It should be displayed   |
                | EU      | Price              | It should be displayed   |
                | EU      | View More Link     | View Additional Finishes |

    #--------------------------------------------------------------------------------------------------
    
    @all @productListPage @user @us @uk @eu @testcase_38 @smoke
    Scenario: The user should be able to see 48 products on the product list page

        Given user is on the login page
        When user click on 'Ceiling' mega menu
        Then product list page of 'Ceiling' mega menu should get opened
            And 48 products should be displayed on the product list page

    #--------------------------------------------------------------------------------------------------
    
    @all @productListPage @wholesale @us @uk @eu @testcase_39
    Scenario: The wholesale user should be able to see product name, designer name, sku code, price and view additional finishes text on product card

        Given user is on the login page
        When 'Wholesale' user do login into the website
            And user click on the 'Chandelier' submenu of 'Ceiling' mega menu
        Then product list page of 'Chandelier' mega menu should get opened
            And the following product details should be displayed on the following product card
                | country | label              | value                    |
                | US      | Product Card       | JN5112                   |
                | US      | Product Name       | Talia Large Chandelier   |  
                | US      | Designer Name      | Julie Neill              |
                | US      | SKU Code           | JN5112                   |
                | US      | Price              | It should be displayed   |
                | US      | View More Link     | View Additional Finishes |
                | UK      | Product Card       | EU-TOB5003               |
                | UK      | Product Name       | Bryant Large Chandelier  |
                | UK      | Designer Name      | Thomas O'Brien           |  
                | UK      | SKU Code           | EU-TOB5003               |
                | UK      | Price              | It should be displayed   |
                | UK      | View More Link     | View Additional Finishes |
                | EU      | Product Card       | EU-TOB5003               |
                | EU      | Product Name       | Bryant Large Chandelier  |  
                | EU      | Designer Name      | Thomas O'Brien           |
                | EU      | SKU Code           | EU-TOB5003               |
                | EU      | Price              | It should be displayed   |
                | EU      | View More Link     | View Additional Finishes |

    #--------------------------------------------------------------------------------------------------
    
    @all @productListPage @user @us @eu @testcase_42
    Scenario: The user should be able to see product name, designer name, sku code, price and view additional finishes text on product card

        Given user is on the login page
        When user click on the 'Chandelier' submenu of 'Ceiling' mega menu
        Then product list page of 'Chandelier' mega menu should get opened
            And the following product details should be displayed on the following product card
                | country | label              | value                    |
                | US      | Product Card       | JN5112                   |
                | US      | Product Name       | Talia Large Chandelier   |  
                | US      | Designer Name      | Julie Neill              |
                | US      | SKU Code           | JN5112                   |
                | US      | Price              | It should be displayed   |
                | US      | View More Link     | View Additional Finishes |
                | EU      | Product Card       | EU-TOB5003               |
                | EU      | Product Name       | Bryant Large Chandelier  |  
                | EU      | Designer Name      | Thomas O'Brien           |
                | EU      | SKU Code           | EU-TOB5003               |
                | EU      | Price              | It should be displayed   |
                | EU      | View More Link     | View Additional Finishes |

    #--------------------------------------------------------------------------------------------------
    
    @all @productListPage @user @us @uk @eu @testcase_43
    Scenario: The user should be able to see pagination at the bottom of product list page

        Given user is on the login page
        When user click on 'Ceiling' mega menu
        Then product list page of 'Ceiling' mega menu should get opened
            And pagination should be available at the bottom of page

    #--------------------------------------------------------------------------------------------------
    
    @all @productListPage @user @us @uk @eu @testcase_45 @skip
    Scenario: The user should be able to apply the product price filter by moving the price slider

        Given user is on the home page
        When user click on 'Ceiling' mega menu
            And user navigate to the product list page of 'Ceiling' mega menu
            And user click on 'Price' filter
            And user move a slider under price filter
            And user click on apply button of price filter
        Then the price range displayed on the applied filter and price filter popup should be the same

    #--------------------------------------------------------------------------------------------------
    
    @all @productListPage @user @us @testcase_72 @skip
    Scenario: The user should be able to apply the generation lighting filter and able to see generation lighting text on product card

        Given user is on the login page
        When user click on 'Ceiling' mega menu
            And user navigate to the product list page of 'Ceiling' mega menu
            And user click on 'Collection' filter
            And user select 'Generation Lighting' option from 'Collection' filter
        Then the 'Collection : Generation Lighting' option should be displayed as selected filter 
            And the following product details should be displayed on the product card of '7728002'
                | country | label         | value                |
                | US      | Designer Name | Generation Lighting  |

    #--------------------------------------------------------------------------------------------------
    
    @all @productListPage @wholesale @us @uk @eu @testcase_185
    Scenario: The wholesale user should be able to see mega menus and its sub-options on the product list page

        Given user is on the login page
        When 'Wholesale' user do login into the website
            And user click on 'Ceiling' mega menu
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
    
    @all @productListPage @trade @us @uk @eu @testcase_186
    Scenario: The trade user should be able to see mega menus and its sub-options on the product list page

        Given user is on the login page
        When 'Trade' user do login into the website
            And user click on 'Ceiling' mega menu
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
    
    @all @productListPage @retail @us @uk @eu @testcase_187
    Scenario: The retail user should be able to see mega menus and its sub-options on the product list page

        Given user is on the login page
        When 'Retail' user do login into the website
            And user click on 'Ceiling' mega menu
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
    
    @all @productListPage @user @us @uk @eu @testcase_188
    Scenario: The user should be able to see mega menus and its sub-options on the product list page

        Given user is on the login page
        When user click on 'Ceiling' mega menu
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
    
    @all @productListPage @wholesale @us @uk @eu @testcase_206
    Scenario: The wholesale user should be able to see mega menus and their sub-options after applying a filter on the product list page

        Given user is on the login page
        When 'Wholesale' user do login into the website
            And user click on 'Ceiling' mega menu
            And user navigate to the product list page of 'Ceiling' mega menu
            And user click on 'Finish' filter
            And user select 'Black' option from given filter
        Then the 'Finish : Black' option should be displayed as selected filter 
        When user mouseover on the 'Wall' mega menu    
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
    
    @all @productListPage @retail @us @uk @eu @testcase_207
    Scenario: The retail user should be able to see mega menus and their sub-options after applying a filter on the product list page

        Given user is on the login page
        When 'Retail' user do login into the website
            And user click on 'Ceiling' mega menu
            And user navigate to the product list page of 'Ceiling' mega menu
            And user click on 'Finish' filter
            And user select 'Black' option from given filter
        Then the 'Finish : Black' option should be displayed as selected filter 
        When user mouseover on the 'Wall' mega menu    
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
    
    @all @productListPage @user @us @uk @eu @testcase_208
    Scenario: The user should be able to see mega menus and their sub-options after applying a filter on the product list page

        Given user is on the login page
        When user click on 'Ceiling' mega menu
            And user navigate to the product list page of 'Ceiling' mega menu
            And user click on 'Finish' filter
            And user select 'Black' option from given filter
        Then the 'Finish : Black' option should be displayed as selected filter 
        When user mouseover on the 'Wall' mega menu    
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
    
    @all @productListPage @user @us @uk @eu @testcase_209
    Scenario: The user should be able to apply multiple filters and able to see available filters

        Given user is on the login page
        When user click on 'Ceiling' mega menu
            And user navigate to the product list page of 'Ceiling' mega menu
            And user click on 'Finish' filter
            And user select 'Black' option from given filter
            And user click on 'Style' filter
            And user select 'Transitional' option from given filter
        Then the user should be able to see the following selected multiple filters
                | filterName | filterValue  |
                | Finish     | Black        |
                | Style      | Transitional |
            And user should be able to see below available filters on product list page
                | filters |
                | Finish  |
                | Style   |
    
    #--------------------------------------------------------------------------------------------------
    
    @all @productListPage @retail @us @uk @eu @testcase_210
    Scenario: The retail user should be able to apply multiple filters and able to see available filters

        Given user is on the login page
        When 'Retail' user do login into the website
            And user click on 'Ceiling' mega menu
            And user navigate to the product list page of 'Ceiling' mega menu
            And user click on 'Finish' filter
            And user select 'Black' option from given filter
            And user click on 'Style' filter
            And user select 'Transitional' option from given filter
        Then the user should be able to see the following selected multiple filters
                | filterName | filterValue  |
                | Finish     | Black        |
                | Style      | Transitional |
            And user should be able to see below available filters on product list page
                | filters |
                | Finish  |
                | Style   |
    
    #--------------------------------------------------------------------------------------------------
    
    @all @productListPage @wholesale @us @uk @eu @testcase_211
    Scenario: The wholesale user should be able to apply multiple filters and able to see available filters

        Given user is on the login page
        When 'Wholesale' user do login into the website
            And user click on 'Ceiling' mega menu
            And user navigate to the product list page of 'Ceiling' mega menu
            And user click on 'Finish' filter
            And user select 'Black' option from given filter
            And user click on 'Style' filter
            And user select 'Transitional' option from given filter
        Then the user should be able to see the following selected multiple filters
                | filterName | filterValue  |
                | Finish     | Black        |
                | Style      | Transitional |
            And user should be able to see below available filters on product list page
                | filters |
                | Finish  |
                | Style   |

    #--------------------------------------------------------------------------------------------------
    
    @all @productListPage @wholesale @us @uk @eu @testcase_218
    Scenario: The wholesale user should be able to see products after applying the filter

        Given user is on the login page
        When 'Wholesale' user do login into the website
            And user click on 'Ceiling' mega menu
            And user navigate to the product list page of 'Ceiling' mega menu
            And user click on 'Finish' filter
            And user select 'Black' option from given filter
        Then the 'Finish : Black' option should be displayed as selected filter
            And the products should be displayed on the product list page

    #--------------------------------------------------------------------------------------------------
    
    @all @productListPage @retail @us @uk @eu @testcase_219
    Scenario: The retail user should be able to see products after applying the filter

        Given user is on the login page
        When 'Retail' user do login into the website
            And user click on 'Ceiling' mega menu
            And user navigate to the product list page of 'Ceiling' mega menu
            And user click on 'Finish' filter
            And user select 'Black' option from given filter
        Then the 'Finish : Black' option should be displayed as selected filter
            And the products should be displayed on the product list page

    #--------------------------------------------------------------------------------------------------
    
    @all @productListPage @user @us @uk @eu @testcase_220 
    Scenario: The user should be able to see products after applying the filter

        Given user is on the login page
        When user click on 'Ceiling' mega menu
            And user navigate to the product list page of 'Ceiling' mega menu
            And user click on 'Finish' filter
            And user select 'Black' option from given filter
        Then the 'Finish : Black' option should be displayed as selected filter
            And the products should be displayed on the product list page
    
    #--------------------------------------------------------------------------------------------------
    
    @all @productListPage @retail @us @uk @eu @testcase_253
    Scenario: In a retail account, the product image, SKU, price and finish should be changed as per the selected product variant

        Given user is on the login page
        When 'Retail' user do login into the website
            And user click on the 'Chandelier' submenu of 'Ceiling' mega menu
            And user find the following sku code from the list
                | country | productSku |
                | US      | JN5112     |
                | UK      | EU-TOB5003 |
                | EU      | EU-TOB5003 |
            And user mouse hover on the following variant sku of the following product sku
                | country | productSku | variantSku        |
                | US      | JN5112     | JN 5112BSL/CG     |
                | UK      | EU-TOB5003 | TOB 5003HAB-L-EU  |
                | EU      | EU-TOB5003 | TOB 5003HAB-L-EU  |
        Then the following details should be displayed on the following product card
                | country | label        | value                                         |
                | US      | Card         | Talia Large Chandelier                        |
                | US      | Image        | JN5112BSLCG.png                               |  
                | US      | SKU          | JN 5112BSL/CG                                 |
                | US      | Price        | It should be displayed                        |
                | US      | Variant Link | Burnished Silver Leaf and Clear Swirled Glass |
                | UK      | Card         | Bryant Large Chandelier                       |
                | UK      | Image        | tob5003habl_1.png                             |  
                | UK      | SKU          | TOB 5003HAB-L-EU                              |
                | UK      | Price        | It should be displayed                        |
                | UK      | Variant Link | Hand-Rubbed Antique Brass with Linen Shades   |
                | EU      | Card         | Bryant Large Chandelier                       |
                | EU      | Image        | tob5003habl_1.png                             |  
                | EU      | SKU          | TOB 5003HAB-L-EU                              |
                | EU      | Price        | It should be displayed                        |
                | EU      | Variant Link | Hand-Rubbed Antique Brass with Linen Shades   |
    
    #--------------------------------------------------------------------------------------------------
    
    @all @productListPage @trade @us @uk @eu @testcase_254
    Scenario: In a trade account, the product image, SKU, price and finish should be changed as per the selected product variant

        Given user is on the login page
        When 'Trade' user do login into the website
            And user click on the 'Chandelier' submenu of 'Ceiling' mega menu
            And user find the following sku code from the list
                | country | productSku |
                | US      | JN5112     |
                | UK      | EU-TOB5003 |
                | EU      | EU-TOB5003 |
            And user mouse hover on the following variant sku of the following product sku
                | country | productSku | variantSku        |
                | US      | JN5112     | JN 5112BSL/CG     |
                | UK      | EU-TOB5003 | TOB 5003HAB-L-EU  |
                | EU      | EU-TOB5003 | TOB 5003HAB-L-EU  |
        Then the following details should be displayed on the following product card
                | country | label          | value                                          |
                | US      | Card           | Talia Large Chandelier                         |
                | US      | Image          | JN5112BSLCG.png                                |  
                | US      | SKU            | JN 5112BSL/CG                                  |
                | US      | Original Price | It should be displayed                         |
                | US      | Price          | It should be displayed                         |
                | US      | Variant Link   | Burnished Silver Leaf and Clear Swirled Glass  |
                | UK      | Card           | Bryant Large Chandelier                        |
                | UK      | Image          | tob5003habl_1.png                              |  
                | UK      | SKU            | TOB 5003HAB-L-EU                               |
                | UK      | Original Price | It should be displayed                         |
                | UK      | Price          | It should be displayed                         |
                | UK      | Variant Link   | Hand-Rubbed Antique Brass with Linen Shades    |
                | EU      | Card           | Bryant Large Chandelier                        |
                | EU      | Image          | tob5003habl_1.png                              |  
                | EU      | SKU            | TOB 5003HAB-L-EU                               |
                | EU      | Original Price | It should be displayed                         |
                | EU      | Price          | It should be displayed                         |
                | EU      | Variant Link   | Hand-Rubbed Antique Brass with Linen Shades    |
    
    #--------------------------------------------------------------------------------------------------
    
    @all @productListPage @wholesale @us @uk @eu @testcase_255
    Scenario: In a wholesale account, the product image, SKU, price and finish should be changed as per the selected product variant

        Given user is on the login page
        When 'Wholesale' user do login into the website
            And user click on the 'Chandelier' submenu of 'Ceiling' mega menu
            And user find the following sku code from the list
                | country | productSku |
                | US      | JN5112     |
                | UK      | EU-TOB5003 |
                | EU      | EU-TOB5003 |
            And user mouse hover on the following variant sku of the following product sku
                | country | productSku | variantSku        |
                | US      | JN5112     | JN 5112BSL/CG     |
                | UK      | EU-TOB5003 | TOB 5003HAB-L-EU  |
                | EU      | EU-TOB5003 | TOB 5003HAB-L-EU  |
        Then the following details should be displayed on the following product card
                | country | label        | value                                         |
                | US      | Card         | Talia Large Chandelier                        |
                | US      | Image        | JN5112BSLCG.png                               |  
                | US      | SKU          | JN 5112BSL/CG                                 |
                | US      | Price        | It should be displayed                        |
                | US      | Variant Link | Burnished Silver Leaf and Clear Swirled Glass |  
                | UK      | Card         | Bryant Large Chandelier                       |
                | UK      | Image        | tob5003habl_1.png                             |  
                | UK      | SKU          | TOB 5003HAB-L-EU                              |
                | UK      | Price        | It should be displayed                        |
                | UK      | Variant Link | Hand-Rubbed Antique Brass with Linen Shades   |
                | EU      | Card         | Bryant Large Chandelier                       |
                | EU      | Image        | tob5003habl_1.png                             |  
                | EU      | SKU          | TOB 5003HAB-L-EU                              |
                | EU      | Price        | It should be displayed                        |
                | EU      | Variant Link | Hand-Rubbed Antique Brass with Linen Shades   |
    
    #--------------------------------------------------------------------------------------------------
    
    @all @productListPage @user @us @testcase_256 
    Scenario: In a guest account, the product image, SKU, price and finish should be changed as per the selected product variant

        Given user is on the login page
        When user click on the 'Chandelier' submenu of 'Ceiling' mega menu
            And user find the following sku code from the list
                | country | productSku |
                | US      | JN5112     |
            And user mouse hover on the following variant sku of the following product sku
                | country | productSku | variantSku        |
                | US      | JN5112     | JN 5112BSL/CG     |
        Then the following details should be displayed on the following product card
                | country | label        | value                                          |
                | US      | Card         | Talia Large Chandelier                         |
                | US      | Image        | JN5112BSLCG.png                                |  
                | US      | SKU          | JN 5112BSL/CG                                  |
                | US      | Price        | It should be displayed                         |
                | US      | Variant Link | Burnished Silver Leaf and Clear Swirled Glass  |

    #--------------------------------------------------------------------------------------------------
    
    @all @productListPage @user @us @uk @eu @testcase_279 
    Scenario: The guest user should be able to verify the selecting product from child category, it is redirected to the product listing page

        Given user is on the login page
        When user click on the 'Decorative' submenu of 'Table' mega menu
        Then product list page of 'Decorative' mega menu should get opened
            And the below breadcrumb value should be displayed on the product list page
                | value                     |
                | Home / Table / Decorative |

    #--------------------------------------------------------------------------------------------------
    
    @all @productListPage @wholesale @us @uk @eu @testcase_280 
    Scenario: The wholesale user should be able to verify the selecting product from child category, it is redirected to the product listing page

        Given user is on the login page
        When 'Wholesale' user do login into the website
            And user click on the 'Decorative' submenu of 'Table' mega menu
        Then product list page of 'Decorative' mega menu should get opened
            And the below breadcrumb value should be displayed on the product list page
                | value                     |
                | Home / Table / Decorative |

    #--------------------------------------------------------------------------------------------------
    
    @all @productListPage @retail @us @uk @eu @testcase_281 
    Scenario: The retail user should be able to verify the selecting product from child category, it is redirected to the product listing page

        Given user is on the login page
        When 'Retail' user do login into the website
            And user click on the 'Decorative' submenu of 'Table' mega menu
        Then product list page of 'Decorative' mega menu should get opened
            And the below breadcrumb value should be displayed on the product list page
                | value                     |
                | Home / Table / Decorative |

    #--------------------------------------------------------------------------------------------------
    
    @all @productListPage @trade @us @uk @eu @testcase_282 
    Scenario: The trade user should be able to verify the selecting product from child category, it is redirected to the product listing page

        Given user is on the login page
        When 'Trade' user do login into the website
            And user click on the 'Decorative' submenu of 'Table' mega menu
        Then product list page of 'Decorative' mega menu should get opened
            And the below breadcrumb value should be displayed on the product list page
                | value                     |
                | Home / Table / Decorative |

    #--------------------------------------------------------------------------------------------------

    @all @productListPage @user @us @uk @eu @testcase_283
    Scenario: The guest user should be able to  Verify that product list is displaying as per selected values from STYLE filter by option

        Given user is on the login page
        When user click on 'Ceiling' mega menu
            And user navigate to the product list page of 'Ceiling' mega menu
            And user click on 'style' filter
            And user select 'Mid-Century' option from given filter
        Then the 'style : Mid-Century' option should be displayed as selected filter
            And remove icon and clear all option should be display
            And the products should be displayed on the product list page

    #--------------------------------------------------------------------------------------------------

    @all @productListPage @wholesale @us @uk @eu @testcase_284
    Scenario: The wholesale user should be able to  Verify that product list is displaying as per selected values from STYLE filter by option

        Given user is on the login page
        When 'Wholesale' user do login into the website
            And user click on 'Ceiling' mega menu
            And user navigate to the product list page of 'Ceiling' mega menu
            And user click on 'style' filter
            And user select 'Mid-Century' option from given filter
        Then the 'style : Mid-Century' option should be displayed as selected filter
            And remove icon and clear all option should be display
            And the products should be displayed on the product list page

    #--------------------------------------------------------------------------------------------------

    @all @productListPage @retail @us @uk @eu @testcase_285
    Scenario: The retail user should be able to  Verify that product list is displaying as per selected values from STYLE filter by option

        Given user is on the login page
        When 'Retail' user do login into the website
            And user click on 'Ceiling' mega menu
            And user navigate to the product list page of 'Ceiling' mega menu
            And user click on 'style' filter
            And user select 'Mid-Century' option from given filter
        Then the 'style : Mid-Century' option should be displayed as selected filter
            And remove icon and clear all option should be display
            And the products should be displayed on the product list page

    #--------------------------------------------------------------------------------------------------

    @all @productListPage @trade @us @uk @eu @testcase_286
    Scenario: The trade user should be able to  Verify that product list is displaying as per selected values from STYLE filter by option

        Given user is on the login page
        When 'Trade' user do login into the website
            And user click on 'Ceiling' mega menu
            And user navigate to the product list page of 'Ceiling' mega menu
            And user click on 'style' filter
            And user select 'Mid-Century' option from given filter
        Then the 'style : Mid-Century' option should be displayed as selected filter
            And remove icon and clear all option should be display
            And the products should be displayed on the product list page

    #--------------------------------------------------------------------------------------------------

    @all @productListPage @user @us @uk @eu @testcase_301 @skip
    Scenario: The guest user should be able to Verify that product list is displaying as per selected values from WIDTH filter by option

        Given user is on the login page
        When user click on 'Ceiling' mega menu
            And user navigate to the product list page of 'Ceiling' mega menu
            And user click on 'Width' filter
            And user select the following option from 'Width' filter
                | country | width          |
                | US      | 10" - 15"      |
                | UK      | 10cm - 20cm    |
                | EU      | 10cm - 20cm    |
        Then the option should be displayed as selected filter
                | country | width                  |
                | US      | width : 10" - 15"      |
                | UK      | width : 10cm - 20cm    |
                | EU      | width : 10cm - 20cm    |
            And remove icon and clear all option should be display
            And the products should be displayed on the product list page

    #--------------------------------------------------------------------------------------------------

    @all @productListPage @trade @us @uk @eu @testcase_302 @skip
    Scenario: The trade user should be able to Verify that product list is displaying as per selected values from WIDTH filter by option

        Given user is on the login page
        When 'Trade' user do login into the website
            And user click on 'Ceiling' mega menu
            And user navigate to the product list page of 'Ceiling' mega menu
            And user click on 'Width' filter
            And user select the following option from 'Width' filter
                | country | width          |
                | US      | 10" - 15"      |
                | UK      | 10cm - 20cm    |
                | EU      | 10cm - 20cm    |
        Then the option should be displayed as selected filter
                | country | width                  |
                | US      | width : 10" - 15"      |
                | UK      | width : 10cm - 20cm    |
                | EU      | width : 10cm - 20cm    |
            And remove icon and clear all option should be display
            And the products should be displayed on the product list page
    
    #--------------------------------------------------------------------------------------------------

    @all @productListPage @wholesale @us @uk @eu @testcase_303 @skip
    Scenario: The Wholesale user should be able to Verify that product list is displaying as per selected values from WIDTH filter by option

        Given user is on the login page
        When 'Wholesale' user do login into the website
            And user click on 'Ceiling' mega menu
            And user navigate to the product list page of 'Ceiling' mega menu
            And user click on 'Width' filter
            And user select the following option from 'Width' filter
                | country | width          |
                | US      | 10" - 15"      |
                | UK      | 10cm - 20cm    |
                | EU      | 10cm - 20cm    |
        Then the option should be displayed as selected filter
                | country | width                  |
                | US      | width : 10" - 15"      |
                | UK      | width : 10cm - 20cm    |
                | EU      | width : 10cm - 20cm    |
            And remove icon and clear all option should be display
            And the products should be displayed on the product list page

    #--------------------------------------------------------------------------------------------------

    @all @productListPage @retail @us @uk @eu @testcase_304 @skip
    Scenario: The retail user should be able to Verify that product list is displaying as per selected values from WIDTH filter by option

        Given user is on the login page
        When 'Retail' user do login into the website
            And user click on 'Ceiling' mega menu
            And user navigate to the product list page of 'Ceiling' mega menu
            And user click on 'Width' filter
            And user select the following option from 'Width' filter
                | country | width          |
                | US      | 10" - 15"      |
                | UK      | 10cm - 20cm    |
                | EU      | 10cm - 20cm    |
        Then the option should be displayed as selected filter
                | country | width                  |
                | US      | width : 10" - 15"      |
                | UK      | width : 10cm - 20cm    |
                | EU      | width : 10cm - 20cm    |
            And remove icon and clear all option should be display
            And the products should be displayed on the product list page

    #--------------------------------------------------------------------------------------------------

    @all @productListPage @user @us @uk @eu @testcase_296
    Scenario: The guest user should be verify that when user click on clear all of product list page, all filter should removed

        Given user is on the login page
        When user click on 'Ceiling' mega menu
            And user navigate to the product list page of 'Ceiling' mega menu
            And user click on 'Availability' filter
            And user select 'In Stock' option from given filter
        Then the 'Availability : In Stock' option should be displayed as selected filter
        When user click on 'clear all' link of selected filter
        Then selected filter should be removed 

    #--------------------------------------------------------------------------------------------------

    @all @productListPage @wholesale @us @uk @eu @testcase_297
    Scenario: The wholesale user should be verify that when user click on clear all of product list page, all filter should removed

        Given user is on the login page
        When 'Wholesale' user do login into the website
            And user click on 'Ceiling' mega menu
            And user navigate to the product list page of 'Ceiling' mega menu
            And user click on 'Availability' filter
            And user select 'In Stock' option from given filter
        Then the 'Availability : In Stock' option should be displayed as selected filter
        When user click on 'clear all' link of selected filter
        Then selected filter should be removed

    #--------------------------------------------------------------------------------------------------

    @all @productListPage @retail @us @uk @eu @testcase_298
    Scenario: The retail user should be verify that when user click on clear all of product list page, all filter should removed

        Given user is on the login page
        When 'Retail' user do login into the website
            And user click on 'Ceiling' mega menu
            And user navigate to the product list page of 'Ceiling' mega menu
            And user click on 'Availability' filter
            And user select 'In Stock' option from given filter
        Then the 'Availability : In Stock' option should be displayed as selected filter
        When user click on 'clear all' link of selected filter
        Then selected filter should be removed

    #--------------------------------------------------------------------------------------------------

    @all @productListPage @trade @us @uk @eu @testcase_299
    Scenario: The trade should be verify that when user click on clear all of product list page, all filter should removed

        Given user is on the login page
        When 'Trade' user do login into the website
            And user click on 'Ceiling' mega menu
            And user navigate to the product list page of 'Ceiling' mega menu
            And user click on 'Availability' filter
            And user select 'In Stock' option from given filter
        Then the 'Availability : In Stock' option should be displayed as selected filter
        When user click on 'clear all' link of selected filter
        Then selected filter should be removed 
   
    #--------------------------------------------------------------------------------------------------

    @all @productListPage @user @us @uk @eu @testcase_308
    Scenario: The guest user should be able to Verify that product list is displaying as per selected values from HEIGHT filter by option

        Given user is on the login page
        When user click on 'Ceiling' mega menu
            And user navigate to the product list page of 'Ceiling' mega menu
            And user click on 'Height' filter
            And user select the following option from 'Height' filter
                | country | height         |
                | US      | 10" - 15"      |
                | UK      | 10cm - 20cm    |
                | EU      | 10cm - 20cm    |
        Then the option should be displayed as selected filter
                | country | height                  |
                | US      | height : 10" - 15"      |
                | UK      | height : 10cm - 20cm    |
                | EU      | height : 10cm - 20cm    |
            And remove icon and clear all option should be display
            And the products should be displayed on the product list page
            
    #--------------------------------------------------------------------------------------------------

    @all @productListPage @trade @us @uk @eu @testcase_309
    Scenario: The trade user should be able to Verify that product list is displaying as per selected values from HEIGHT filter by option

        Given user is on the login page
        When 'Trade' user do login into the website
            And user click on 'Ceiling' mega menu
            And user navigate to the product list page of 'Ceiling' mega menu
            And user click on 'Height' filter
            And user select the following option from 'Height' filter
                | country | height         |
                | US      | 10" - 15"      |
                | UK      | 10cm - 20cm    |
                | EU      | 10cm - 20cm    |
        Then the option should be displayed as selected filter
                | country | height                  |
                | US      | height : 10" - 15"      |
                | UK      | height : 10cm - 20cm    |
                | EU      | height : 10cm - 20cm    |
            And remove icon and clear all option should be display
            And the products should be displayed on the product list page
    
    #--------------------------------------------------------------------------------------------------

    @all @productListPage @wholesale @us @uk @eu @testcase_310
    Scenario: The Wholesale user should be able to Verify that product list is displaying as per selected values from HEIGHT filter by option

        Given user is on the login page
        When 'Wholesale' user do login into the website
            And user click on 'Ceiling' mega menu
            And user navigate to the product list page of 'Ceiling' mega menu
            And user click on 'Height' filter
            And user select the following option from 'Height' filter
                | country | height         |
                | US      | 10" - 15"      |
                | UK      | 10cm - 20cm    |
                | EU      | 10cm - 20cm    |
        Then the option should be displayed as selected filter
                | country | height                  |
                | US      | height : 10" - 15"      |
                | UK      | height : 10cm - 20cm    |
                | EU      | height : 10cm - 20cm    |
            And remove icon and clear all option should be display
            And the products should be displayed on the product list page

    #--------------------------------------------------------------------------------------------------

    @all @productListPage @retail @us @uk @eu @testcase_311
    Scenario: The retail user should be able to Verify that product list is displaying as per selected values from HEIGHT filter by option

        Given user is on the login page
        When 'Retail' user do login into the website
            And user click on 'Ceiling' mega menu
            And user navigate to the product list page of 'Ceiling' mega menu
            And user click on 'Height' filter
            And user select the following option from 'Height' filter
                | country | height         |
                | US      | 10" - 15"      |
                | UK      | 10cm - 20cm    |
                | EU      | 10cm - 20cm    |
        Then the option should be displayed as selected filter
                | country | height                  |
                | US      | height : 10" - 15"      |
                | UK      | height : 10cm - 20cm    |
                | EU      | height : 10cm - 20cm    |
            And remove icon and clear all option should be display
    
    #--------------------------------------------------------------------------------------------------

    @all @productListPage @user @us @uk @eu @testcase_335
    Scenario: The guest user should be able to see filter options behavior after a page refresh

        Given user is on the login page
        When user click on 'Ceiling' mega menu
            And user navigate to the product list page of 'Ceiling' mega menu
            And user click on 'Collection' filter
            And user select 'Modern Collection' option from given filter
        Then the 'Collection : Modern Collection' option should be displayed as selected filter
        When user reload the current page
        Then the 'Collection : Modern Collection' option should be displayed as selected filter
    
    #--------------------------------------------------------------------------------------------------

    @all @productListPage @retail @us @uk @eu @testcase_343
    Scenario: The retail user should be able to Verify that product list is displaying as per selected values from DESIGNER filter by option

        Given user is on the login page
        When 'Retail' user do login into the website
            And user click on 'Ceiling' mega menu
            And user navigate to the product list page of 'Ceiling' mega menu
            And user click on 'designer' filter
            And user select 'aerin' option from given filter
        Then the 'designer : aerin' option should be displayed as selected filter
            And remove icon and clear all option should be display
            And the products should be displayed on the product list page
    
    #--------------------------------------------------------------------------------------------------

    @all @productListPage @trade @us @uk @eu @testcase_351
    Scenario: The trade user should be able to Verify that product list is displaying as per selected values from AVAILABILITY filter by option

        Given user is on the login page
        When 'Trade' user do login into the website
            And user click on 'Ceiling' mega menu
            And user navigate to the product list page of 'Ceiling' mega menu
            And user click on 'availability' filter
            And user select 'Within 4 Weeks' option from given filter
        Then the 'availability : Within 4 Weeks' option should be displayed as selected filter
            And remove icon and clear all option should be display
            And the products should be displayed on the product list page
    
    #--------------------------------------------------------------------------------------------------

    @all @productListPage @user @us @uk @eu @testcase_363
    Scenario: The guest user should navigate to the product description page by clicking on the product name, image, or view link from the PLP

        Given user is on the login page
        When user click on 'Ceiling' mega menu
        Then product list page of 'Ceiling' mega menu should get opened
            And the products should be displayed on the product list page
        When user click on the product name for the below sku code
                | country | skuCode    |
                | US      | JN5112     |
                | UK      | EU-TOB5003 |
                | EU      | EU-TOB5003 |
        Then the product description page of the given sku code should get opened
            And the url should contain the given sku code
            And the below breadcrumb value should be displayed
                | country | value                                       |
                | US      | Home / Ceiling / Talia Large Chandelier     |
                | UK      | Home / Ceiling / Bryant Large Chandelier    |
                | EU      | Home / Ceiling / Bryant Large Chandelier    |
        When user click on 'Ceiling' mega menu
        Then product list page of 'Ceiling' mega menu should get opened
            And the products should be displayed on the product list page
        When user click on the product image for the below sku code
                | country | skuCode    |
                | US      | JN5112     |
                | UK      | EU-TOB5003 |
                | EU      | EU-TOB5003 |
        Then the product description page of the given sku code should get opened
            And the url should contain the given sku code
            And the below breadcrumb value should be displayed
                | country | value                                       |
                | US      | Home / Ceiling / Talia Large Chandelier     |
                | UK      | Home / Ceiling / Bryant Large Chandelier    |
                | EU      | Home / Ceiling / Bryant Large Chandelier    |
        When user click on 'Ceiling' mega menu
        Then product list page of 'Ceiling' mega menu should get opened
            And the products should be displayed on the product list page
        When user click on the view additional finishes link for the below sku code
                | country | skuCode    |
                | US      | JN5112     |
                | UK      | EU-TOB5003 |
                | EU      | EU-TOB5003 |
       Then the product description page of the given sku code should get opened
            And the url should contain the given sku code
            And the below breadcrumb value should be displayed
                | country | value                                       |
                | US      | Home / Ceiling / Talia Large Chandelier     |
                | UK      | Home / Ceiling / Bryant Large Chandelier    |
                | EU      | Home / Ceiling / Bryant Large Chandelier    |

    #--------------------------------------------------------------------------------------------------

    @all @productListPage @trade @us @uk @eu @testcase_408
    Scenario: The trade user should be able to see trade price on the product list page

        Given user is on the login page
        When 'Trade' user do login into the website
            And user click on the 'Chandelier' submenu of 'Ceiling' mega menu
        Then product list page of 'Chandelier' submenu should get opened
            And user should be able to see trade price with trade label on the PLP
            And user should be able to see retail price as strikethrough on the PLP

    #--------------------------------------------------------------------------------------------------

    @all @productListPage @wholesale @us @uk @eu @testcase_417 
    Scenario: The wholesale user should be verify that when user click on x icon link of product list page, all filter should removed

        Given user is on the login page
        When 'Wholesale' user do login into the website
            And user click on 'Ceiling' mega menu
            And user navigate to the product list page of 'Ceiling' mega menu
            And user click on 'Availability' filter
            And user select 'Within 4 Weeks' option from given filter
        Then the 'Availability : Within 4 Weeks' option should be displayed as selected filter
        When user click on 'x icon' link of selected filter
        Then selected filter should be removed

    #--------------------------------------------------------------------------------------------------

    @all @productListPage @retail @us @uk @eu @testcase_419 
    Scenario: The retail user should be see the filter price is displayed based on the filter selection.

        Given user is on the login page
        When 'Retail' user do login into the website
             And user click on 'Ceiling' mega menu
        Then user navigate to the product list page of 'Ceiling' mega menu
        When user click on 'Price' filter
            And user enter '1000' min price and '1500' max price
            And user click on apply button
        Then the 'Price : 1000 - 1500' option should be displayed as selected filter
             And the products should be displayed on the product list page

    #--------------------------------------------------------------------------------------------------

    @all @productListPage @user @us @uk @eu @testcase_462 @skip
    Scenario: The guest user should click on main product image, it is redirect to PDP without query string url however if click on a product variant, it is redirect to the PDP with query string in the url

        Given user is on the login page
        When user click on 'Ceiling' mega menu
        Then product list page of 'Ceiling' mega menu should get opened
        When user click on the product image for the below sku code
                | country | skuCode   |
                | US      | JN5112    |
                | UK      | EU-JN5112 |
                | EU      | EU-JN5112 |
        Then page url should end with the following sub-url
                | country | sub_url                               |
                | US      | /talia-large-chandelier-jn5112/       |
                | UK      | /uk/talia-large-chandelier-eu-jn5112/ |
                | EU      | /eu/talia-large-chandelier-eu-jn5112/ | 
        When user click on 'Ceiling' mega menu
            And user mouse hover also click on the following sku variant of the following product name
                | country | productName             | variantSku       |
                | US      | Talia Large Chandelier  | JN 5112BSL/CG    |
                | UK      | Talia Large Chandelier  | JN 5112BSL/CG-EU |
                | EU      | Talia Large Chandelier  | JN 5112BSL/CG-EU |
        Then page url should be include the following url
                | country | sub_url                                                                              |
                | US      | /talia-large-chandelier-jn5112/?selected_product=JN%205112BSL/CG#2461=52271          |
                | UK      | /uk/talia-large-chandelier-eu-jn5112/?selected_product=JN%205112BSL/CG-EU#2461=52271 |
                | EU      | /eu/talia-large-chandelier-eu-jn5112/?selected_product=JN%205112BSL/CG-EU#2461=52271 |

    #--------------------------------------------------------------------------------------------------

    @all @productListPage @trade @us @uk @eu @testcase_484 @skip
    Scenario: The trade user should click on main product image, it is redirect to PDP without query string url however if click on a product variant, it is redirect to the PDP with query string in the url

        Given user is on the login page
        When 'Trade' user do login into the website
            And user click on 'Ceiling' mega menu
        Then product list page of 'Ceiling' mega menu should get opened
        When user click on the product image for the below sku code
                | country | skuCode   |
                | US      | JN5112    |
                | UK      | EU-JN5112 |
                | EU      | EU-JN5112 |
        Then page url should end with the following sub-url
                | country | sub_url                               |
                | US      | /talia-large-chandelier-jn5112/       |
                | UK      | /uk/talia-large-chandelier-eu-jn5112/ |
                | EU      | /eu/talia-large-chandelier-eu-jn5112/ | 
        When user click on 'Ceiling' mega menu
            And user mouse hover also click on the following sku variant of the following product name
                | country | productName             | variantSku       |
                | US      | Talia Large Chandelier  | JN 5112BSL/CG    |
                | UK      | Talia Large Chandelier  | JN 5112BSL/CG-EU |
                | EU      | Talia Large Chandelier  | JN 5112BSL/CG-EU |
        Then page url should be include the following url
                | country | sub_url                                                                              |
                | US      | /talia-large-chandelier-jn5112/?selected_product=JN%205112BSL/CG#2461=52271          |
                | UK      | /uk/talia-large-chandelier-eu-jn5112/?selected_product=JN%205112BSL/CG-EU#2461=52271 |
                | EU      | /eu/talia-large-chandelier-eu-jn5112/?selected_product=JN%205112BSL/CG-EU#2461=52271 |
				
				
    #--------------------------------------------------------------------------------------------------

    @all @productListPage @trade @us @uk @eu @testcase_489 @skip
    Scenario: The trade user should click on product anchor title, it is redirect to PDP without query string url however if finish filter is selected, it is redirect to the PDP with corresponding simple product url.
       
        Given user is on the login page
        When 'Trade' user do login into the website
            And user click on 'Ceiling' mega menu
        Then product list page of 'Ceiling' mega menu should get opened
        When user click on the product name for the below sku code
                | country | skuCode   |
                | US      | JN5112    |
                | UK      | EU-JN5112 |
                | EU      | EU-JN5112 |
        Then page url should end with the following sub-url
                | country | sub_url                               |
                | US      | /talia-large-chandelier-jn5112/       |
                | UK      | /uk/talia-large-chandelier-eu-jn5112/ |
                | EU      | /eu/talia-large-chandelier-eu-jn5112/ |
        When user click on 'Ceiling' mega menu
            And user click on 'Finish' filter
            And user select 'Black' option from given filter
            And user click on the product name for the below sku code
                | country | skuCode    |
                | US      | 3109305    |
                | UK      | EU-ARN5350 |
                | EU      | EU-ARN5350 |
        Then page url should be include the following url
                | country | sub_url                                                                            |
                | US      | /foxdale-five-light-chandelier/?selected_product=3109305-112#1661=47161&2461=42201 |
                | UK      | /uk/agnes-small-pendant-eu-arn5350/?selected_product=ARN%205350MBK-EU#2461=35641   |
                | EU      | /eu/agnes-small-pendant-eu-arn5350/?selected_product=ARN%205350MBK-EU#2461=35641   |
            Then user should be able to see below sku code
                | country | skuCode        | 
                | US      | 3109305-112    |
                | UK      | ARN 5350MBK-EU |
                | EU      | ARN 5350MBK-EU |