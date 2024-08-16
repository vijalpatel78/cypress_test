Feature: Search Results Page

    The user should be able to access the search results page.

    #--------------------------------------------------------------------------------------------------
    
    @all @searchResultsPage @user @us @uk @eu @testcase_25 
    Scenario: The user should be able to search for a product by name

        Given user is on the home page
        When user search 'Table'
            And user press enter key
        Then search results page of 'Table' should get opened
            And search results text should contain 'Table'

    #--------------------------------------------------------------------------------------------------
    
    @all @searchResultsPage @user @us @uk @eu @testcase_26 
    Scenario: The user should be able to search for a product by sku code

        Given user is on the home page
        When user search 'JN5112'
            And user press enter key
        Then search results page of 'JN5112' should get opened
            And search results text should contain 'JN5112'

    #--------------------------------------------------------------------------------------------------

    @all @searchResultsPage @user @us @uk @eu @testcase_31 @smoke
    Scenario: The user should be able to see 48 products on the first page of search results

        Given user is on the home page
        When user search 'Chandelier'
            And user press enter key
        Then search results page of 'Chandelier' should get opened
            And 48 products should be displayed on the first page of search results

    #--------------------------------------------------------------------------------------------------
    
    @all @searchResultsPage @user @us @uk @eu @testcase_34 
    Scenario: The user should be able to select option from finish filter

        Given user is on the home page
        When user search 'Chandelier'
            And user press enter key
            And user navigate to the search results page of 'Chandelier' 
            And user click on 'Finish' filter
            And user select 'Black' option from given filter
        Then the 'Finish : Black' option should be displayed as selected filter 
    
    #--------------------------------------------------------------------------------------------------
    
    @all @searchResultsPage @wholesale @us @uk @eu @testcase_35
    Scenario: The wholesale user should be able to see product name, designer name, sku code, price and view additional finishes text on the product card

        Given user is on the login page
        When 'Wholesale' user do login into the website
            And user search 'Chandelier'
            And user press enter key
        Then search results page of 'Chandelier' should get opened
            And the following product details should be displayed on the product card of 'JN5112'
                | country | label              | value                    |
                | US      | Product Name       | Talia Large Chandelier   |  
                | US      | Designer Name      | Julie Neill              |
                | US      | SKU Code           | JN5112                   |
                | US      | Price              | It should be displayed   |
                | US      | View More Link     | View Additional Finishes |
                | UK      | Product Name       | Talia Large Chandelier   |  
                | UK      | Designer Name      | Julie Neill              |
                | UK      | SKU Code           | EU-JN5112                |
                | UK      | Price              | It should be displayed   |
                | UK      | View More Link     | View Additional Finishes |
                | EU      | Product Name       | Talia Large Chandelier   |  
                | EU      | Designer Name      | Julie Neill              |
                | EU      | SKU Code           | EU-JN5112                |
                | EU      | Price              | It should be displayed   |
                | EU      | View More Link     | View Additional Finishes |
                
    #--------------------------------------------------------------------------------------------------
    
    @all @searchResultsPage @trade @us @uk @eu @testcase_36
    Scenario: The trade user should be able to see product name, designer name, sku code, price and view additional finishes text on the product card

        Given user is on the login page
        When 'Trade' user do login into the website
            And user search 'Chandelier'
            And user press enter key
        Then search results page of 'Chandelier' should get opened
            And the following product details should be displayed on the product card of 'JN5112'
                | country | label              | value                    |
                | US      | Product Name       | Talia Large Chandelier   |  
                | US      | Designer Name      | Julie Neill              |
                | US      | SKU Code           | JN5112                   |
                | US      | Original Price     | It should be displayed   |
                | US      | Price              | It should be displayed   |
                | US      | View More Link     | View Additional Finishes |
                | UK      | Product Name       | Talia Large Chandelier   |  
                | UK      | Designer Name      | Julie Neill              |
                | UK      | SKU Code           | EU-JN5112                |
                | UK      | Original Price     | It should be displayed   |
                | UK      | Price              | It should be displayed   |
                | UK      | View More Link     | View Additional Finishes |
                | EU      | Product Name       | Talia Large Chandelier   |  
                | EU      | Designer Name      | Julie Neill              |
                | EU      | SKU Code           | EU-JN5112                |
                | EU      | Original Price     | It should be displayed   |
                | EU      | Price              | It should be displayed   |
                | EU      | View More Link     | View Additional Finishes |
    
    #--------------------------------------------------------------------------------------------------
    
    @all @searchResultsPage @retail @us @uk @eu @testcase_40
    Scenario: The retail user should be able to see product name, designer name, sku code, price and view additional finishes text on the product card

        Given user is on the login page
        When 'Retail' user do login into the website
            And user search 'Chandelier'
            And user press enter key
        Then search results page of 'Chandelier' should get opened
            And the following product details should be displayed on the product card of 'JN5112'
                | country | label              | value                    |
                | US      | Product Name       | Talia Large Chandelier   |  
                | US      | Designer Name      | Julie Neill              |
                | US      | SKU Code           | JN5112                   |
                | US      | Price              | It should be displayed   |
                | US      | View More Link     | View Additional Finishes |
                | UK      | Product Name       | Talia Large Chandelier   |  
                | UK      | Designer Name      | Julie Neill              |
                | UK      | SKU Code           | EU-JN5112                |
                | UK      | Price              | It should be displayed   |
                | UK      | View More Link     | View Additional Finishes |
                | EU      | Product Name       | Talia Large Chandelier   |  
                | EU      | Designer Name      | Julie Neill              |
                | EU      | SKU Code           | EU-JN5112                |
                | EU      | Price              | It should be displayed   |
                | EU      | View More Link     | View Additional Finishes |

    #--------------------------------------------------------------------------------------------------

    @all @searchResultsPage @user @us @uk @eu @testcase_30 
    Scenario: The user should be able to see featured as by default selected option of sort by dropdown

        Given user is on the home page
        When user search 'Chandelier'
            And user press enter key
        Then search results page of 'Chandelier' should get opened
            And the below option of sort by dropdown should be displayed as by default selected
                | option   |
                | FEATURED |
    
    #--------------------------------------------------------------------------------------------------

    @all @searchResultsPage @user @us @uk @eu @testcase_41 
    Scenario: The user should be able to see pagination at the bottom of search results page 

        Given user is on the home page
        When user search 'Chandelier'
            And user press enter key
        Then search results page of 'Chandelier' should get opened
            And pagination should be available at the bottom of page

    #--------------------------------------------------------------------------------------------------
    
    @all @searchResultsPage @retail @us @uk @eu @testcase_201
    Scenario: The retail user should be able to see mega menus and its sub-options on the search results page

        Given user is on the login page
        When 'Retail' user do login into the website
            And user search 'Chandelier'
            And user press enter key
        Then search results page of 'Chandelier' should get opened
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
    
    @all @searchResultsPage @trade @us @uk @eu @testcase_202
    Scenario: The trade user should be able to see mega menus and its sub-options on the search results page

        Given user is on the login page
        When 'Trade' user do login into the website
            And user search 'Chandelier'
            And user press enter key
        Then search results page of 'Chandelier' should get opened 
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
    
    @all @searchResultsPage @wholesale @us @uk @eu @testcase_203
    Scenario: The wholesale user should be able to see mega menus and its sub-options on the search results page

        Given user is on the login page
        When 'Wholesale' user do login into the website
            And user search 'Chandelier'
            And user press enter key
        Then search results page of 'Chandelier' should get opened 
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

    @all @searchResultsPage @user @us @uk @eu @testcase_204
    Scenario: The user should be able to see mega menus and its sub-options on the search results page 

        Given user is on the home page
        When user search 'Chandelier'
            And user press enter key
        Then search results page of 'Chandelier' should get opened
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
    
    @all @searchResultsPage @user @us @uk @eu @testcase_212
    Scenario: The user should be able to apply multiple filters and able to see available filters

        Given user is on the home page
        When user search 'Chandelier'
            And user press enter key
            And user navigate to the search results page of 'Chandelier'
            And user click on 'Finish' filter
            And user select 'Black' option from given filter
            And user click on 'Style' filter
            And user select 'Contemporary | Modern' option from given filter
        Then the user should be able to see the following selected multiple filters
                | filterName | filterValue  |
                | Finish     | Black        |
                | Style      | Modern       |
                | Style      | Contemporary |
            And user should be able to see below available filters on product list page
                | filters |
                | Finish  |
                | Style   |
    
    #--------------------------------------------------------------------------------------------------
    
    @all @searchResultsPage @retail @us @uk @eu @testcase_213
    Scenario: The retail user should be able to apply multiple filters and able to see available filters

        Given user is on the login page
        When 'Retail' user do login into the website
            And user search 'Chandelier'
            And user press enter key
            And user navigate to the search results page of 'Chandelier'
            And user click on 'Finish' filter
            And user select 'Black' option from given filter
            And user click on 'Style' filter
            And user select 'Contemporary | Modern' option from given filter
        Then the user should be able to see the following selected multiple filters
                | filterName | filterValue  |
                | Finish     | Black        |
                | Style      | Modern       |
                | Style      | Contemporary |
            And user should be able to see below available filters on product list page
                | filters |
                | Finish  |
                | Style   |
    
    #--------------------------------------------------------------------------------------------------
    
    @all @searchResultsPage @wholesale @us @uk @eu @testcase_214
    Scenario: The wholesale user should be able to apply multiple filters and able to see available filters

        Given user is on the login page
        When 'Wholesale' user do login into the website
            And user search 'Chandelier'
            And user press enter key
            And user navigate to the search results page of 'Chandelier'
            And user click on 'Finish' filter
            And user select 'Black' option from given filter
            And user click on 'Style' filter
            And user select 'Contemporary | Modern' option from given filter
        Then the user should be able to see the following selected multiple filters
                | filterName | filterValue  |
                | Finish     | Black        |
                | Style      | Modern       |
                | Style      | Contemporary |
            And user should be able to see below available filters on product list page
                | filters |
                | Finish  |
                | Style   |

    #--------------------------------------------------------------------------------------------------

    @all @searchResultsPage @wholesale @us @uk @eu @testcase_215
    Scenario: The wholesale user should be able to see mega menus and their sub-options after applying a filter on the search results page

        Given user is on the login page
        When 'Wholesale' user do login into the website
            And user search 'Chandelier'
            And user press enter key
            And user navigate to the search results page of 'Chandelier'
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

    @all @searchResultsPage @retail @us @uk @eu @testcase_216
    Scenario: The retail user should be able to see mega menus and their sub-options after applying a filter on the search results page

        Given user is on the login page
        When 'Retail' user do login into the website
            And user search 'Chandelier'
            And user press enter key
            And user navigate to the search results page of 'Chandelier'
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

    @all @searchResultsPage @user @us @uk @eu @testcase_217
    Scenario: The user should be able to see mega menus and their sub-options after applying a filter on the search results page

        Given user is on the home page
        When user search 'Chandelier'
            And user press enter key
            And user navigate to the search results page of 'Chandelier'
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
    
    @all @searchResultsPage @user @us @uk @eu @testcase_287 
    Scenario: The guest user should be verify that when user clicks on the clear all, filters on search results, all filter should removed

        Given user is on the home page
        When user search 'Table'
            And user press enter key
        Then search results page of 'Table' should get opened
        When user click on 'Designer' filter
            And user select 'Kelly Wearstler' option from given filter
            And user click on 'clear all' link of selected filter
        Then selected filter should be removed 

    #--------------------------------------------------------------------------------------------------
    
    @all @searchResultsPage @retail @us @uk @eu @testcase_288
    Scenario: The retail user should be verify that when user clicks on the clear all, filters on search results, all filter should removed

        Given user is on the login page
        When 'Retail' user do login into the website
            And user search 'Table'
            And user press enter key
        Then search results page of 'Table' should get opened
        When user click on 'Designer' filter
            And user select 'Kelly Wearstler' option from given filter
           And user click on 'clear all' link of selected filter
        Then selected filter should be removed

    #--------------------------------------------------------------------------------------------------
    
    @all @searchResultsPage @trade @us @uk @eu @testcase_289
    Scenario: The trade user should be verify that when user clicks on the clear all, filters on search results, all filter should removed

        Given user is on the login page
        When 'Trade' user do login into the website
            And user search 'Table'
            And user press enter key
        Then search results page of 'Table' should get opened
        When user click on 'Designer' filter
            And user select 'Kelly Wearstler' option from given filter
            And user click on 'clear all' link of selected filter
        Then selected filter should be removed

    #--------------------------------------------------------------------------------------------------
    
    @all @searchResultsPage @wholesale @us @uk @eu @testcase_290
    Scenario: The wholesale user should be verify that when user clicks on the clear all, filters on search results, all filter should removed

        Given user is on the login page
        When 'Wholesale' user do login into the website
            And user search 'Table'
            And user press enter key
        Then search results page of 'Table' should get opened
        When user click on 'Designer' filter
            And user select 'Kelly Wearstler' option from given filter
            And user click on 'clear all' link of selected filter
        Then selected filter should be removed

    #--------------------------------------------------------------------------------------------------
    
    @all @searchResultsPage @user @us @uk @eu @testcase_291
    Scenario: The guest user should be verify that when user click on the x icon, filters on search results, all filter should removed

        Given user is on the home page
        When user search 'Table'
            And user press enter key
        Then search results page of 'Table' should get opened
        When user click on 'Designer' filter
            And user select 'Kelly Wearstler' option from given filter
            And user click on 'x icon' link of selected filter
        Then selected filter should be removed 

    #--------------------------------------------------------------------------------------------------
    
    @all @searchResultsPage @retail @us @uk @eu @testcase_292
    Scenario: The retail user should be verify that when user click on the x icon, filters on search results, all filter should removed

        Given user is on the login page
        When 'Retail' user do login into the website
            And user search 'Table'
            And user press enter key
        Then search results page of 'Table' should get opened
        When user click on 'Designer' filter
            And user select 'Kelly Wearstler' option from given filter
            And user click on 'x icon' link of selected filter
        Then selected filter should be removed

    #--------------------------------------------------------------------------------------------------
    
    @all @searchResultsPage @trade @us @uk @eu @testcase_293
    Scenario: The trade user should be verify that when user click on the x icon, filters on search results, all filter should removed

        Given user is on the login page
        When 'Trade' user do login into the website
            And user search 'Table'
            And user press enter key
        Then search results page of 'Table' should get opened
        When user click on 'Designer' filter
            And user select 'Kelly Wearstler' option from given filter
            And user click on 'x icon' link of selected filter
        Then selected filter should be removed

    #--------------------------------------------------------------------------------------------------
    
    @all @searchResultsPage @wholesale @us @uk @eu @testcase_294
    Scenario: The wholesale user should be verify that when user click on the x icon, filters on search results, all filter should removed

        Given user is on the login page
        When 'Wholesale' user do login into the website
            And user search 'Table'
            And user press enter key
        Then search results page of 'Table' should get opened
        When user click on 'Designer' filter
            And user select 'Kelly Wearstler' option from given filter
            And user click on 'x icon' link of selected filter
        Then selected filter should be removed
    
    #--------------------------------------------------------------------------------------------------

    @all @searchResultsPage @user @us @uk @eu @testcase_338
    Scenario: The guest user should navigate to the product description page by clicking on the product name, image, or view link from the SRP

        Given user is on the home page
        When user search 'Chandelier'
            And user press enter key
        Then search results page of 'Chandelier' should get opened
            And the products should be displayed on the product list page
        When user click on the product name for the below sku code
                | country | skuCode    |
                | US      | JN5112     |
                | UK      | EU-TOB5003 |
                | EU      | EU-RL5231  |
        Then the product description page of the given sku code should get opened
            And the url should contain the given sku code
            And the below breadcrumb value should be displayed
                | country | value                                       |
                | US      | Home / Ceiling / Talia Large Chandelier     |
                | UK      | Home / Ceiling / Bryant Large Chandelier    |
                | EU      | Home / Ceiling / Adrianna Medium Chandelier |
       When user search 'Chandelier'
            And user press enter key
        Then search results page of 'Chandelier' should get opened
            And the products should be displayed on the product list page
        When user click on the product image for the below sku code
                | country | skuCode    |
                | US      | JN5112     |
                | UK      | EU-TOB5003 |
                | EU      | EU-RL5231  |
        Then the product description page of the given sku code should get opened
            And the url should contain the given sku code
            And the below breadcrumb value should be displayed
                | country | value                                       |
                | US      | Home / Ceiling / Talia Large Chandelier     |
                | UK      | Home / Ceiling / Bryant Large Chandelier    |
                | EU      | Home / Ceiling / Adrianna Medium Chandelier |
        When user search 'Chandelier'
            And user press enter key
        Then search results page of 'Chandelier' should get opened
            And the products should be displayed on the product list page
        When user click on the view additional finishes link for the below sku code
                | country | skuCode    |
                | US      | JN5112     |
                | UK      | EU-TOB5003 |
                | EU      | EU-RL5231  |
       Then the product description page of the given sku code should get opened
            And the url should contain the given sku code
            And the below breadcrumb value should be displayed
                | country | value                                       |
                | US      | Home / Ceiling / Talia Large Chandelier     |
                | UK      | Home / Ceiling / Bryant Large Chandelier    |
                | EU      | Home / Ceiling / Adrianna Medium Chandelier |
    
    #--------------------------------------------------------------------------------------------------
    
    @all @searchResultsPage @user @us @uk @eu @testcase_387
    Scenario: The guest user should be able to see changes in the "View Additional Finishes" link as per the mouse hover on the product variant

        Given user is on the home page
        When user search 'Lamp'
            And user press enter key
        Then search results page of 'Lamp' should get opened
        When user find the following sku code from the list
                | country | productSku |
                | US      | KW3031     |
                | UK      | EU-KW3031  |
                | EU      | EU-KW3031  |
            And user mouse hover on the following variant sku of the following product name
                | country | productName               | variantSku      |
                | US      | Linden Medium Table Lamp  | KW 3031BLK-L    |
                | UK      | Linden Medium Lamp        | KW 3031BLK-L-EU |
                | EU      | Linden Medium Lamp        | KW 3031BLK-L-EU |
        Then the 'Black with Linen Shade' text should be displayed on the product card      
        When user mouse hover on the following variant sku of the following product name
                | country | productName               | variantSku      |
                | US      | Linden Medium Table Lamp  | KW 3031PW-L     |
                | UK      | Linden Medium Lamp        | KW 3031PW-L-EU  |
                | EU      | Linden Medium Lamp        | KW 3031PW-L-EU  |
        Then the 'Plaster White with Linen Shade' text should be displayed on the product card 
    
    #--------------------------------------------------------------------------------------------------

    @all @searchResultsPage @user @us @uk @eu @testcase_390
    Scenario: The guest user should be able to see the "Last Call" badge on the search results page

        Given user is on the home page
        When user search the following sku code
                | country | skuCode     |
                | US      | ARN2481     |
                | UK      | EU-BBL5090  |
                | EU      | EU-BBL5090  |
            And user press enter key
        Then search results page of the following sku code should get opened
                | country | skuCode     |
                | US      | ARN2481     |
                | UK      | EU-BBL5090  |
                | EU      | EU-BBL5090  |
            And the 'Last Call' badge should be displayed on the given sku code

    #--------------------------------------------------------------------------------------------------

    @all @searchResultsPage @retail @us @uk @eu @testcase_391
    Scenario: The retail user should be able to see the "Last Call" badge on the search results page

        Given user is on the login page
        When 'Retail' user do login into the website
            And user search the following sku code
                | country | skuCode     |
                | US      | ARN2481     |
                | UK      | EU-BBL5090  |
                | EU      | EU-BBL5090  |
            And user press enter key
        Then search results page of the following sku code should get opened
                | country | skuCode     |
                | US      | ARN2481     |
                | UK      | EU-BBL5090  |
                | EU      | EU-BBL5090  |
            And the 'Last Call' badge should be displayed on the given sku code

    #--------------------------------------------------------------------------------------------------

    @all @searchResultsPage @wholesale @us @uk @eu @testcase_392
    Scenario: The wholesale user should be able to see the "Last Call" badge on the search results page

        Given user is on the login page
        When 'Wholesale' user do login into the website
            And user search the following sku code
                | country | skuCode     |
                | US      | ARN2481     |
                | UK      | EU-BBL5090  |
                | EU      | EU-BBL5090  |
            And user press enter key
        Then search results page of the following sku code should get opened
                | country | skuCode     |
                | US      | ARN2481     |
                | UK      | EU-BBL5090  |
                | EU      | EU-BBL5090  |
            And the 'Last Call' badge should be displayed on the given sku code

    #--------------------------------------------------------------------------------------------------

    @all @searchResultsPage @trade @us @uk @eu @testcase_393
    Scenario: The trade user should be able to see the "Last Call" badge on the search results page

        Given user is on the login page
        When 'Trade' user do login into the website
            And user search the following sku code
                | country | skuCode     |
                | US      | ARN2481     |
                | UK      | EU-BBL5090  |
                | EU      | EU-BBL5090  |
            And user press enter key
        Then search results page of the following sku code should get opened
                | country | skuCode     |
                | US      | ARN2481     |
                | UK      | EU-BBL5090  |
                | EU      | EU-BBL5090  |
            And the 'Last Call' badge should be displayed on the given sku code

    #--------------------------------------------------------------------------------------------------

    @all @searchResultsPage @wholesale @us @uk @eu @testcase_395
    Scenario: The wholesale user should be verify that product list is displaying as per selected values from style filter by option

        Given user is on the login page
        When 'Wholesale' user do login into the website
            And user search 'Table'
            And user press enter key
        Then search results page of 'Table' should get opened
        When user click on 'Style' filter
            And user select 'Mid-Century' option from given filter
        Then remove icon and clear all option should be display
            And the products should be displayed on the product list page
    
    #--------------------------------------------------------------------------------------------------

    @all @searchResultsPage @wholesale @us @uk @eu @testcase_399 @skip
    Scenario: The wholesale user should be verify that product list is displaying as per selected values from width filter by option

        Given user is on the login page
        When 'Wholesale' user do login into the website
            And user search 'Table'
            And user press enter key
        Then search results page of 'Table' should get opened
        When user click on 'Width' filter
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

    @all @searchResultsPage @wholesale @us @uk @eu @testcase_405
    Scenario: The wholesale user should be verify that product list is displaying as per selected values from designer filter by option

        Given user is on the login page
        When 'Wholesale' user do login into the website
            And user search 'Table'
            And user press enter key
        Then search results page of 'Table' should get opened
        When user click on 'Designer' filter
            And user select 'Aerin' option from given filter
        Then remove icon and clear all option should be display
            And the products should be displayed on the product list page

    #--------------------------------------------------------------------------------------------------

    @all @searchResultsPage @wholesale @us @uk @eu @testcase_406
    Scenario: The wholesale user should be verify that product list is displaying as per selected values from availability filter by option

        Given user is on the login page
        When 'Wholesale' user do login into the website
            And user search 'Table'
            And user press enter key
        Then search results page of 'Table' should get opened
        When user click on 'Availability' filter
            And user select 'In Stock' option from given filter
        Then remove icon and clear all option should be display
            And the products should be displayed on the product list page
    
    #--------------------------------------------------------------------------------------------------

    @all @searchResultsPage @wholesale @us @uk @eu @testcase_411
    Scenario: The wholesale user should be verify that product list is displaying as per selected values from height filter by option

        Given user is on the login page
        When 'Wholesale' user do login into the website
            And user search 'Table'
            And user press enter key
        Then search results page of 'Table' should get opened
        When user click on 'height' filter
                And user select the following option from 'height' filter
                | country | height          |
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

    @all @searchResultsPage @retail @us @uk @eu @testcase_418
    Scenario: The retail user should be see that the product data is displayed based on the filter selection.

        Given user is on the login page
        When 'Retail' user do login into the website
            And user search 'Table'
            And user press enter key
        Then search results page of 'Table' should get opened
        When user click on 'Price' filter
            And user enter '300' min price and '3000' max price on search results page
            And user click on apply button on search results page
        Then the 'Price : 300 - 3000' option should be displayed as selected filter
    
    #--------------------------------------------------------------------------------------------------

    @all @searchResultsPage @user @us @uk @eu @testcase_449
    Scenario: The guest user Verify that when the user types in a search term recommended search terms display in a drop-down.

        Given user is on the login page
        When user search 'Table'
        Then user should be able to see 'table' recommended search terms in a drop-down
    
    #--------------------------------------------------------------------------------------------------

    @all @searchResultsPage @user @us @uk @eu @testcase_450
    Scenario: The guest user should be able to ensure users are redirected to the search results page when attempting a misspelled keyword search

        Given user is on the home page
        When user search 'CIELING'
            And user press enter key
        Then search results page of 'CIELING' should get opened
            And the products should be displayed on the product list page  
    
    #--------------------------------------------------------------------------------------------------

    @all @searchResultsPage @user @us @uk @eu @testcase_451
    Scenario: The guest user should be able to see user searching for a designer name it is redirected to the search results page.

        Given user is on the home page
        When user search 'AERIN'
            And user press enter key
        Then search results page of 'AERIN' should get opened
            And search results text should contain 'AERIN'
            And the products should be displayed on the product list page

    #--------------------------------------------------------------------------------------------------

    @all @searchResultsPage @user @us @uk @eu @testcase_454
    Scenario: The guest user ensure that the search results are not null for search terms with a minimum of 3 Alpha letters.

        Given user is on the home page
        When user search 'Tal'
        And user press enter key
        Then search results page of 'Tal' should get opened
            And user should be able to see list of product contain 'Tal'

    #--------------------------------------------------------------------------------------------------

    @all @searchResultsPage @user @us @uk @eu @testcase_483
    Scenario: The guest user searches for a collection Name they are redirected to a search result page

        Given user is on the home page
        When user search 'TALIA'
            And user press enter key
        Then search results page of 'TALIA' should get opened
            And user should be able to see list of collection product contain 'TALIA'

    #--------------------------------------------------------------------------------------------------

    @all @searchResultsPage @user @us @uk @eu @testcase_487 @skip
    Scenario: The guest user should click on main product image, it is redirect to PDP without query string url however if click on a product variant, it is redirect to the PDP with query string in the url
       
        Given user is on the home page
        When user search 'Table'
            And user press enter key
        Then search results page of 'Table' should get opened
        When user click on the product image for the below sku code
                | country | skuCode    |
                | US      | CHA8655    |
                | UK      | EU-CHA8655 |
                | EU      | EU-CHA8655 |
        Then page url should end with the following sub-url
                | country | sub_url                                     |
                | US      | /orson-balustrade-form-table-cha8655/       |
                | UK      | /uk/orson-balustrade-form-table-eu-cha8655/ |
                | EU      | /eu/orson-balustrade-form-table-eu-cha8655/ | 
        When user search 'Table'
            And user press enter key
            And user mouse hover also click on the following sku variant of the following product name
                | country | productName                 | variantSku      |
                | US      | Orson Balustrade Form Table | CHA 8655OSB-L   |
                | UK      | Orson Balustrade Form Table | CHA 8655DM-L-EU |
                | EU      | Orson Balustrade Form Table | CHA 8655DM-L-EU |
        Then page url should be include the following url
                | country | sub_url                                                                                              |
                | US      | /orson-balustrade-form-table-cha8655/?selected_product=CHA%208655OSB-L#1651=11401&2461=36891         |
                | UK      | /uk/orson-balustrade-form-table-eu-cha8655/?selected_product=CHA%208655DM-L-EU#1651=84164&2461=36231 |
                | EU      | /eu/orson-balustrade-form-table-eu-cha8655/?selected_product=CHA%208655DM-L-EU#1651=84164&2461=36231 |

    #--------------------------------------------------------------------------------------------------

    @all @searchResultsPage @wholesale @us @uk @eu @testcase_488 @skip
    Scenario: The wholesale user should click on main product image, it is redirect to PDP without query string url however if click on a product variant, it is redirect to the PDP with query string in the url
       
        Given user is on the login page
        When 'Wholesale' user do login into the website
            And user search 'Table'
            And user press enter key
        Then search results page of 'Table' should get opened
        When user click on the product image for the below sku code
                | country | skuCode    |
                | US      | CHA8655    |
                | UK      | EU-CHA8655 |
                | EU      | EU-CHA8655 |
        Then page url should end with the following sub-url
                | country | sub_url                                     |
                | US      | /orson-balustrade-form-table-cha8655/       |
                | UK      | /uk/orson-balustrade-form-table-eu-cha8655/ |
                | EU      | /eu/orson-balustrade-form-table-eu-cha8655/ | 
        When user search 'Table'
            And user press enter key
            And user mouse hover also click on the following sku variant of the following product name
                | country | productName                 | variantSku      |
                | US      | Orson Balustrade Form Table | CHA 8655OSB-L   |
                | UK      | Orson Balustrade Form Table | CHA 8655DM-L-EU |
                | EU      | Orson Balustrade Form Table | CHA 8655DM-L-EU |
        Then page url should be include the following url
                | country | sub_url                                                                                              |
                | US      | /orson-balustrade-form-table-cha8655/?selected_product=CHA%208655OSB-L#1651=11401&2461=36891         |
                | UK      | /uk/orson-balustrade-form-table-eu-cha8655/?selected_product=CHA%208655DM-L-EU#1651=84164&2461=36231 |
                | EU      | /eu/orson-balustrade-form-table-eu-cha8655/?selected_product=CHA%208655DM-L-EU#1651=84164&2461=36231 |

    #--------------------------------------------------------------------------------------------------

    @all @searchResultsPage @retail @us @uk @eu @testcase_490 @skip
    Scenario: The retail user should click on product anchor title, it is redirect to PDP without query string url however if finish filter is selected, it is redirect to the PDP with corresponding simple product url.

        Given user is on the login page
        When 'Retail' user do login into the website
            And user search 'Table'
            And user press enter key
        Then search results page of 'Table' should get opened
        When user click on the product name for the below sku code
                | country | skuCode    |
                | US      | KW3031     |
                | UK      | EU-CHA8655 |
                | EU      | EU-CHA8655 |
        Then page url should be include the following url
                | country | sub_url                                     |
                | US      | /linden-medium-table-lamp-kw3031/           |
                | UK      | /uk/orson-balustrade-form-table-eu-cha8655/ |
                | EU      | /eu/orson-balustrade-form-table-eu-cha8655/ |
        When user search 'Table'
            And user press enter key
            And user click on 'Finish' filter
            And user select 'Black' option from given filter
            And user click on the product name for the below sku code
                | country | skuCode    |
                | US      | KW3031     |
                | UK      | EU-KW3032  |
                | EU      | EU-KW3032 |
        Then page url should be include the following url
                | country | sub_url                                                                                   |
                | US      | /linden-medium-table-lamp-kw3031/?selected_product=KW%203031BLK-L#1651=53631&2461=36971   |
                | UK      | /uk/linden-table-lamp-eu-kw3032/?selected_product=KW%203032BLK-L-EU#1651=81020&2461=36971 |
                | EU      | /eu/linden-table-lamp-eu-kw3032/?selected_product=KW%203032BLK-L-EU#1651=81020&2461=36971 |
            Then user should be able to see below sku code
                | country | skuCode         | 
                | US      | KW 3031BLK-L    |
                | UK      | KW 3032BLK-L-EU |
                | EU      | KW 3032BLK-L-EU |