Feature: Home Page

    The user should be able to access the home page.

    #--------------------------------------------------------------------------------------------------
    
    @all @homePage @user @uk @eu @testcase_01 
    Scenario: The user should be able to access the home page 

        When user opens the home page url
        Then home page should get opened with below title
            | country | title                                                              |
            | US      | Signature Designer Light Fixtures Experience Visual Comfort & Co.  |
            | UK      | Signature Designer Lighting Experience Visual Comfort & Co.        |
            | EU      | Signature Designer Lighting Experience Visual Comfort & Co.        |

    #--------------------------------------------------------------------------------------------------
    
    @all @homePage @user @uk @eu @testcase_73 
    Scenario: The user should be able to see the default country and 3 countries should be available in the country dropdown

        Given user is on the home page
        Then user should be able to see the below country as default country
            | country |
            | US      |
            | UK      |
            | EU      |
        When user click on the country flag
        Then user should be able to see below available countries in dropdown
            | countryName         |
            | United States (US)  |
            | United Kingdom (UK) |
            | European Union (EU) |

    #--------------------------------------------------------------------------------------------------
    
    @all @homePage @user @uk @eu @testcase_85 
    Scenario: The user should be able to see submenu options from the table mega menu

        Given user is on the home page
        When user mouseover on the 'Table' mega menu
        Then user should be able to see all sub option of 'Table' mega menu

    #--------------------------------------------------------------------------------------------------
    
    @all @homePage @user @uk @eu @testcase_86 
    Scenario: The user should be able to see submenu options from the outdoor mega menu

        Given user is on the home page
        When user mouseover on the 'Outdoor' mega menu
        Then user should be able to see all sub option of 'Outdoor' mega menu

    #--------------------------------------------------------------------------------------------------
    
    @all @homePage @user @testcase_87 
    Scenario: The user should be able to see submenu options from the fans mega menu

        Given user is on the home page
        When user mouseover on the 'Fans' mega menu
        Then user should be able to see all sub option of 'Fans' mega menu

    #--------------------------------------------------------------------------------------------------
    
    @all @homePage @user @testcase_88 
    Scenario: The user should be able to see submenu options from the architectural mega menu

        Given user is on the home page
        When user mouseover on the 'Architectural' mega menu
        Then user should be able to see all sub option of 'Architectural' mega menu
    
    #--------------------------------------------------------------------------------------------------
    
    @all @homePage @user @uk @eu @testcase_89 
    Scenario: The user should be able to see submenu options from the ceiling mega menu

        Given user is on the home page
        When user mouseover on the 'Ceiling' mega menu
        Then user should be able to see all sub option of 'Ceiling' mega menu

    #--------------------------------------------------------------------------------------------------
    
    @all @homePage @user @uk @eu @testcase_90 
    Scenario: The user should be able to see submenu options from the wall mega menu

        Given user is on the home page
        When user mouseover on the 'Wall' mega menu
        Then user should be able to see all sub option of 'Wall' mega menu
    
    #--------------------------------------------------------------------------------------------------
    
    @all @homePage @user @uk @eu @testcase_91 
    Scenario: The user should be able to see submenu options from the floor mega menu

        Given user is on the home page
        When user mouseover on the 'Floor' mega menu
        Then user should be able to see all sub option of 'Floor' mega menu
    
    #--------------------------------------------------------------------------------------------------
    
    @all @homePage @user @uk @eu @testcase_92 
    Scenario: The user should be able to see submenu options from the sale mega menu

        Given user is on the home page
        When user mouseover on the 'Sale' mega menu
        Then user should be able to see all sub option of 'Sale' mega menu

    #--------------------------------------------------------------------------------------------------
    
    @all @homePage @user @uk @eu @testcase_93 
    Scenario: The user should be able to see submenu options from the our designers mega menu

        Given user is on the home page
        When user mouseover on the 'Our Designers' mega menu
        Then user should be able to see all sub option of 'Our Designers' mega menu                                                                                                                                                                                               

    #--------------------------------------------------------------------------------------------------
    
    @all @homePage @user @testcase_94 
    Scenario: The user should be able to see submenu options from the our collections mega menu

        Given user is on the home page
        When user mouseover on the 'Our Collections' mega menu
        Then user should be able to see all sub option of 'Our Collections' mega menu

    #--------------------------------------------------------------------------------------------------

    @all @homePage @user @uk @eu @testcase_95 
    Scenario: The user should be able to see all mega menu and search bar 

        When user is on the home page
        Then user should be able to see the search bar
            And user should be able to see available mega menu
                
    #--------------------------------------------------------------------------------------------------
    
    @all @homePage @retail @uk @eu @testcase_182 
    Scenario: The retail user should be able to see mega menus and its sub-options on the home page

        Given user is on the login page
        When 'Retail' user do login into the website
            And user is on the home page
            And user mouseover on the 'Wall' mega menu
        Then user should be able to see all sub option of 'Wall' mega menu
        When user mouseover on the 'Ceiling' mega menu
        Then user should be able to see all sub option of 'Ceiling' mega menu
        When user mouseover on the 'Table' mega menu
        Then user should be able to see all sub option of 'Table' mega menu
        When user mouseover on the 'Floor' mega menu
        Then user should be able to see all sub option of 'Floor' mega menu
        When user mouseover on the 'Outdoor' mega menu
        Then user should be able to see all sub option of 'Outdoor' mega menu
        When user mouseover on the 'Fans' mega menu
        Then user should be able to see all sub option of 'Fans' mega menu
        When user mouseover on the 'Architectural' mega menu
        Then user should be able to see all sub option of 'Architectural' mega menu
        When user mouseover on the 'Our Collections' mega menu
        Then user should be able to see all sub option of 'Our Collections' mega menu
        When user mouseover on the 'Our Designers' mega menu
        Then user should be able to see all sub option of 'Our Designers' mega menu
        When user mouseover on the 'Sale' mega menu
        Then user should be able to see all sub option of 'Sale' mega menu

    #--------------------------------------------------------------------------------------------------
    
    @all @homePage @trade @uk @eu @testcase_183 
    Scenario: The trade user should be able to see mega menus and its sub-options on the home page

        Given user is on the login page
        When 'Trade' user do login into the website
            And user is on the home page
            And user mouseover on the 'Wall' mega menu
        Then user should be able to see all sub option of 'Wall' mega menu
        When user mouseover on the 'Ceiling' mega menu
        Then user should be able to see all sub option of 'Ceiling' mega menu
        When user mouseover on the 'Table' mega menu
        Then user should be able to see all sub option of 'Table' mega menu
        When user mouseover on the 'Floor' mega menu
        Then user should be able to see all sub option of 'Floor' mega menu
        When user mouseover on the 'Outdoor' mega menu
        Then user should be able to see all sub option of 'Outdoor' mega menu
        When user mouseover on the 'Fans' mega menu
        Then user should be able to see all sub option of 'Fans' mega menu
        When user mouseover on the 'Architectural' mega menu
        Then user should be able to see all sub option of 'Architectural' mega menu
        When user mouseover on the 'Our Collections' mega menu
        Then user should be able to see all sub option of 'Our Collections' mega menu
        When user mouseover on the 'Our Designers' mega menu
        Then user should be able to see all sub option of 'Our Designers' mega menu
        When user mouseover on the 'Sale' mega menu
        Then user should be able to see all sub option of 'Sale' mega menu

    #--------------------------------------------------------------------------------------------------
    
    @all @homePage @wholesale @uk @eu @testcase_184 
    Scenario: The wholesale user should be able to see mega menus and its sub-options on the home page

        Given user is on the login page
        When 'Wholesale' user do login into the website
            And user is on the home page
            And user mouseover on the 'Wall' mega menu
        Then user should be able to see all sub option of 'Wall' mega menu
        When user mouseover on the 'Ceiling' mega menu
        Then user should be able to see all sub option of 'Ceiling' mega menu
        When user mouseover on the 'Table' mega menu
        Then user should be able to see all sub option of 'Table' mega menu
        When user mouseover on the 'Floor' mega menu
        Then user should be able to see all sub option of 'Floor' mega menu
        When user mouseover on the 'Outdoor' mega menu
        Then user should be able to see all sub option of 'Outdoor' mega menu
        When user mouseover on the 'Fans' mega menu
        Then user should be able to see all sub option of 'Fans' mega menu
        When user mouseover on the 'Architectural' mega menu
        Then user should be able to see all sub option of 'Architectural' mega menu
        When user mouseover on the 'Our Collections' mega menu
        Then user should be able to see all sub option of 'Our Collections' mega menu
        When user mouseover on the 'Our Designers' mega menu
        Then user should be able to see all sub option of 'Our Designers' mega menu
        When user mouseover on the 'Sale' mega menu
        Then user should be able to see all sub option of 'Sale' mega menu

    #--------------------------------------------------------------------------------------------------
    
    @all @homePage @user @uk @eu @testcase_200 
    Scenario: The respective country website should be opened after clicking on the country from the dropdown

        Given user is on the home page
        When user click on the country flag
            And user click on the below option of country dropdown
                | country | dropdownOption      |
                | US      | European Union (EU) |
                | UK      | United States (US)  |
                | EU      | United Kingdom (UK) |
        Then the website of respective country should be opened
                | country | website               |
                | US      | visualcomfort.com/eu/ |
                | UK      | visualcomfort.com/    |
                | EU      | visualcomfort.com/uk/ |
        When user go back to the previous page 
            And user click on the country flag
            And user click on the below option of country dropdown
                | country | dropdownOption      |
                | US      | United Kingdom (UK) |
                | UK      | European Union (EU) |
                | EU      | United States (US)  |
        Then the website of respective country should be opened
                | country | website               |
                | US      | visualcomfort.com/uk/ |
                | UK      | visualcomfort.com/eu/ |
                | EU      | visualcomfort.com/    |
    
    #--------------------------------------------------------------------------------------------------

    @all @homePage @user @uk @eu @testcase_316 
    Scenario: The guest user should navigate to the product list page of the floor mega menu's submenu

        Given user is on the home page
        When user click on the 'Decorative' submenu of 'Floor' mega menu
        Then product list page of 'Decorative' submenu should get opened
            And page url should end with the '/floor/decorative/' sub-url
            And the below breadcrumb value should be displayed on the product list page
                | value                     |
                | Home / Floor / Decorative |
            And the products should be displayed on the product list page
    
    #--------------------------------------------------------------------------------------------------
    
    @all @homePage @user @uk @eu @testcase_334 
    Scenario: The guest user should navigate to the wall product list page by clicking on the wall mega menu

        Given user is on the home page
        When user click on 'Wall' mega menu
        Then product list page of 'Wall' mega menu should get opened
            And page url should end with the '/wall/' sub-url
            And the below breadcrumb value should be displayed on the product list page
                | value       |
                | Home / Wall |
            And the products should be displayed on the product list page

    #--------------------------------------------------------------------------------------------------

    @all @homePage @user @uk @eu @testcase_339 
    Scenario: The guest user should navigate to the product list page of the wall mega menu's submenu

        Given user is on the home page
        When user click on the 'Decorative' submenu of 'Wall' mega menu
        Then product list page of 'Decorative' submenu should get opened
            And page url should end with the following sub-url
                | country | sub_url                |
                | US      | /wall/decorative-wall/ |
                | UK      | /wall/decorative/      |
                | EU      | /wall/decorative/      |  
            And the below breadcrumb value should be displayed on the product list page
                | value                    |
                | Home / Wall / Decorative |
            And the products should be displayed on the product list page

    #--------------------------------------------------------------------------------------------------

    @all @homePage @user @uk @eu @testcase_340 
    Scenario: The guest user should navigate to the product list page of the new introductions submenu from the ceiling mega menu

        Given user is on the home page
        When user click on the 'New Introductions' submenu of 'Ceiling' mega menu
        Then page url should end with the '/ceiling/new-introductions/' sub-url  
            And the below breadcrumb value should be displayed on the product list page
                | value                              |
                | Home / Ceiling / New Introductions |
            And the products should be displayed on the product list page

    #--------------------------------------------------------------------------------------------------

    @all @homePage @user @uk @eu @testcase_341 
    Scenario: The guest user should navigate to the product list page of task submenu from the table mega menu

        Given user is on the home page
        When user click on the 'Task' submenu of 'Table' mega menu
        Then product list page of 'Task' submenu should get opened
            When page url should include the following sub-url
                | country | sub_url            |
                | US      | /table/table-task/ |
                | UK      | /table/task/       |
                | EU      | /table/task/       |  
            And the below breadcrumb value should be displayed on the product list page
                | value               |
                | Home / Table / Task |
            And the products should be displayed on the product list page

    #--------------------------------------------------------------------------------------------------

    @all @homePage @user @uk @eu @testcase_342 
    Scenario: The guest user should navigate to the floor product list page by clicking on the floor mega menu

        Given user is on the home page
        When user click on 'Floor' mega menu
        Then product list page of 'Floor' mega menu should get opened
            And page url should end with the '/floor/' sub-url
            And the below breadcrumb value should be displayed on the product list page
                | value        |
                | Home / Floor |
            And the products should be displayed on the product list page
    
    #--------------------------------------------------------------------------------------------------

    @all @homePage @user @testcase_344 
    Scenario: The guest user should navigate to the product list page of the sale submenu from the ceiling mega menu

        Given user is on the home page
        When user click on the 'Sale' submenu of 'Ceiling' mega menu
        Then product list page of 'Sale' submenu should get opened
            And page url should include the following sub-url
                | country | sub_url            |
                | US      | /sale/             |
            And the below breadcrumb value should be displayed on the product list page
                | value       |
                | Home / Sale |
            And the products should be displayed on the product list page

    #--------------------------------------------------------------------------------------------------

    @all @homePage @user @uk @eu @testcase_345 
    Scenario: The guest user should navigate to the product list page of the new introductions sub menu of wall mega menu

        Given user is on the home page
        When user click on the 'New Introductions' submenu of 'Wall' mega menu
        Then product list page of 'New Introductions' submenu should get opened
            And page url should end with the '/wall/new-introductions/' sub-url 
            And the below breadcrumb value should be displayed on the product list page
                | value                           |
                | Home / Wall / New Introductions |
            And the products should be displayed on the product list page

    #--------------------------------------------------------------------------------------------------

    @all @homePage @user @uk @eu @testcase_346 
    Scenario: The guest user should navigate to the product list page of latern submenu from the ceiling mega menu

        Given user is on the home page
        When user click on the 'Lantern' submenu of 'Ceiling' mega menu
        Then page url should end with the '/ceiling/lantern/' sub-url  
            And the below breadcrumb value should be displayed on the product list page
                | value                    |
                | Home / Ceiling / Lantern |
            And the products should be displayed on the product list page

    #--------------------------------------------------------------------------------------------------

    @all @homePage @user @uk @eu @testcase_347 
    Scenario: The guest user should navigate to the outdoor product list page by clicking on the outdoor mega menu

        Given user is on the home page
        When user click on 'Outdoor' mega menu
        Then product list page of 'Outdoor' mega menu should get opened
            And page url should end with the '/outdoor/' sub-url
            And the below breadcrumb value should be displayed on the product list page
                | value          |
                | Home / Outdoor |
            And the products should be displayed on the product list page
    
    #--------------------------------------------------------------------------------------------------

    @all @homePage @user @uk @eu @testcase_348 
    Scenario: The guest user should navigate to the product list page of the outdoor mega menu's submenu

        Given user is on the home page
        When user click on the 'Wall' submenu of 'Outdoor' mega menu
        Then product list page of 'Wall' submenu should get opened
            And page url should end with the '/outdoor/wall/' sub-url
            And the below breadcrumb value should be displayed on the product list page
                | value                 |
                | Home / Outdoor / Wall |
            And the products should be displayed on the product list page

    #--------------------------------------------------------------------------------------------------

    @all @homePage @user @uk @testcase_349 
    Scenario: The guest user should navigate to the product list page of the new introductions submenu from the table mega menu

        Given user is on the home page
        When user click on the 'New Introductions' submenu of 'Table' mega menu
        Then page url should end with the '/table/new-introductions/' sub-url  
            And the below breadcrumb value should be displayed on the product list page
                | value                            |
                | Home / Table / New Introductions |
            And the products should be displayed on the product list page

    #--------------------------------------------------------------------------------------------------

    @all @homePage @user @testcase_350 
    Scenario: The guest user should navigate to the inspiration page by clicking on the inspiration mega menu

        Given user is on the home page
        When user click on 'Inspiration' mega menu
        Then the page of 'Inspiration' mega menu should get opened
            And page url should end with the '/inspiration/' sub-url
            And the below breadcrumb value should be displayed on the product list page
                | value              |
                | Home / Inspiration |
            And the inspiration products should be displayed
    
    #--------------------------------------------------------------------------------------------------

    @all @homePage @user @uk @eu @testcase_352 
    Scenario: The guest user should navigate to the our designers page by clicking on the our designers mega menu

        Given user is on the home page
        When user click on 'Our Designers' mega menu
        Then the page of 'Designers' mega menu should get opened
            And page url should end with the '/our-designers/' sub-url
            And all designer images and names should be displayed

    #--------------------------------------------------------------------------------------------------

    @all @homePage @user @uk @eu @testcase_353 
    Scenario: The guest user should navigate to the fans product list page by clicking on the fans mega menu

        Given user is on the home page
        When user click on 'Fans' mega menu
        Then product list page of 'Fans' mega menu should get opened
            And page url should end with the '/Fans/' sub-url
            And the below breadcrumb value should be displayed on the product list page
                | value       |
                | Home / Fans |
            And the products should be displayed on the product list page
    
    #--------------------------------------------------------------------------------------------------

    @all @homePage @user @testcase_354 
    Scenario: The guest user should navigate to the architectural product list page by clicking on the architectural mega menu

        Given user is on the home page
        When user click on 'Architectural' mega menu
        Then product list page of 'Architectural' mega menu should get opened
            And page url should end with the '/Architectural/' sub-url
            And the below breadcrumb value should be displayed on the product list page
                | value                |
                | Home / Architectural |
    
    #--------------------------------------------------------------------------------------------------

    @all @homePage @user @testcase_355 
    Scenario: The guest user should navigate to the product list page of the sale submenu from the table mega menu

        Given user is on the home page
        When user click on the 'Sale' submenu of 'Table' mega menu
        Then product list page of 'Sale' submenu should get opened
            And page url should include the following sub-url
                | country | sub_url            |
                | US      | /sale/             |
            And the below breadcrumb value should be displayed on the product list page
                | value       |
                | Home / Sale |
            And the following filter should be displayed as selected
                | selected_filter     |
                | Table - Decorative  |
                | Table - Task        |
            And remove icon and clear all option should be display
            And the products should be displayed on the product list page
    
    #--------------------------------------------------------------------------------------------------

    @all @homePage @user @testcase_356 
    Scenario: The guest user should navigate to the product list page of the architectural mega menu's submenu

        Given user is on the home page
        When user click on the 'Kable Lite' submenu of 'Architectural' mega menu
        Then product list page of 'Kable Lite' submenu should get opened
            And page url should end with the '/architectural/kable-lite/' sub-url
            And the below breadcrumb value should be displayed on the product list page
                | value                             |
                | Home / Architectural / Kable Lite |
    
    #--------------------------------------------------------------------------------------------------

    @all @homePage @user @testcase_359 
    Scenario: The guest user should navigate to the product list page of the fans mega menu's submenu

        Given user is on the home page
        When user click on the 'Indoor' submenu of 'Fans' mega menu
        Then product list page of 'Indoor' submenu should get opened
            And page url should end with the '/fans/indoor/' sub-url
            And the below breadcrumb value should be displayed on the product list page
                | value                |
                | Home / Fans / Indoor |
            And the products should be displayed on the product list page

    #--------------------------------------------------------------------------------------------------
    
    @all @homePage @user @uk @eu @testcase_361 
    Scenario: The guest should be able to see explore our products section, user click on any link from explore our products section it should navigate to product list page

        When user is on the home page
        Then user should see 'Explore our products' section of home page
            And user should see 'Explore our products' section images
            And user should be able to see below links on explore our products section
                | country | links                                                                      |
                | US      | Ceiling, Wall, Table, Floor, Outdoor, Ceiling Fans, Architectural, Systems |
                | UK      | Ceiling, Table, Floor, Wall, Outdoor, Best Sellers                         |
                | EU      | Ceiling, Table, Floor, Wall, Outdoor, Best Sellers                         |
        When user click on 'Ceiling' link from explore our products section
        Then page url should include the following sub-url
                | country | sub_url                       |
                | US      | /ceiling/?tid=hp_b2m1_ceiling |
                | UK      | /ceiling/                     |
                | EU      | /ceiling/                     |
            And the below breadcrumb value should be displayed on the product list page
                | value          |
                | Home / Ceiling |

    #--------------------------------------------------------------------------------------------------
    
    @all @homePage @user @testcase_364 
    Scenario: The guest should be able to see new introductions section, user click on any link from new introductions section it should navigate to product list page

        When user is on the home page
        Then user should see 'New Introductions' section of home page
            And user should see 'New Introductions' section images
            And user should be able to see below links on new introductions section
                | links    |
                | Shop New |
                | Ceiling  |
                | Wall     |
                | Table    |
        When user click on 'Ceiling' link from new introductions section
        Then page url should end with the '/new-introductions/?tid=hp_b3m2_niceiling' sub-url
            And the below breadcrumb value should be displayed on the product list page
                | value                              |
                | Home / Ceiling / New Introductions |

    #--------------------------------------------------------------------------------------------------

    @all @homePage @user @uk @eu @testcase_366 
    Scenario: The guest user should be able to see 4 columns of designer names for the our designers mega menu

        Given user is on the home page
        When user mouseover on the 'Our Designers' mega menu
        Then user should be able to see all sub option of 'Our Designers' mega menu
            And the 4 columns of designer names should be displayed on our designers mega menu

    #--------------------------------------------------------------------------------------------------
    
    @all @homePage @user @testcase_400 
    Scenario: The guest should be able to see the spotlight section, user click on any link from spotlight section it should navigate to respected page

        When user is on the home page
        Then user should see 'the spotlight' section of home page
            And user should see 'the spotlight' section images
        When user click on the read more link of 'Designer Julie Neill’s Illuminating Creativity' spotlight section
        Then page url should end with the '/julie-neill-spotlight/?tid=hp_b6m2_julieneill' sub-url
            And below breadcrumb value should be displayed
                | value                                               |
                | Home / Let the Light In: The Julie Neill Collection |

    #--------------------------------------------------------------------------------------------------

    @all @homePage @user @testcase_403 
    Scenario: The guest should be able to see the inspiration galleries section, user click on any link from inspiration galleries section it should navigate to respected page

        When user is on the home page
        Then user should see 'Inspiration Galleries' section of home page
            And user should see 'Inspiration Galleries' section images
        When user click on view more link of 'Kitchen Gallery' 
        Then page url should end with the '/kitchen-gallery/?tid=hp_b7m1_kitchen' sub-url
            And below breadcrumb value should be displayed
                | value                                |
                | Home / Social Media Gallery: Kitchen |

    #--------------------------------------------------------------------------------------------------
    
    @all @homePage @user @uk @eu @testcase_482
    Scenario: The guest user should navigate to the table product list page by clicking on the table mega menu

        Given user is on the home page
        When user click on 'Table' mega menu
        Then product list page of 'Table' mega menu should get opened
            And page url should end with the '/table/' sub-url
            And the below breadcrumb value should be displayed on the product list page
                | value        |
                | Home / Table |
            And the products should be displayed on the product list page