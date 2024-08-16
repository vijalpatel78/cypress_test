Feature: Projects Page

    The user should be able to access the projects page.

    #--------------------------------------------------------------------------------------------------
    
@all @projectsPage @retail @us @uk @eu @testcase_130
    Scenario: The retail user should be able to delete an existing project by clicking the delete project link from the list

        Given 'Retail' user do login into the website with session
        When user open the following url
                | url                    |
                | /customer/account/     |
            And user click on profile icon
            And user click on below option
                | country | option   |
                | US      | Projects |
                | UK      | Projects |
                | EU      | Projects |
            And user navigate to the 'Projects' page
            And user add new 'Cypress 01' project
            And user click on the 'Delete Project' link of 'Cypress 01' project
            And user click on the 'Yes, Delete Project' button of delete project popup
        Then the following success message should be displayed on the projects page
                | successMessages                     | 
                | Selected projects has been deleted. |
            And the following project should not be displayed on the projects list
                | project    |
                | Cypress 01 |

    #--------------------------------------------------------------------------------------------------
    
    @all @projectsPage @retail @us @uk @eu @testcase_131
    Scenario: The retail user should be able to delete an existing project by clicking the delete selected button

        Given 'Retail' user do login into the website with session
        When user open the following url
                | url                   |
                | /wishlist/index/list/ |
            And user navigate to the 'Projects' page
            And user add new 'Cypress 02' project
            And user click on the checkbox of 'Cypress 02' project
            And user click on the delete selected button
            And user click on the 'Yes, Delete Project' button of delete project popup
        Then the following success message should be displayed on the projects page
                | successMessages                     | 
                | Selected projects has been deleted. |
            And the following project should not be displayed on the projects list
                | project    |
                | Cypress 02 |

    #--------------------------------------------------------------------------------------------------
    
    @all @projectsPage @retail @us @uk @eu @testcase_133
    Scenario: The retail user should be able to open project details page

        Given 'Retail' user do login into the website with session
        When user open the following url
                | url                   |
                | /wishlist/index/list/ |
            And user navigate to the 'Projects' page
            And user add new 'Cypress 03' project
            And user click on the 'View Project' link of 'Cypress 03' project
        Then details page of 'Cypress 03' project should get opened

    #--------------------------------------------------------------------------------------------------

    @all @projectsPage @retail @us @testcase_135
    Scenario: The retail user should be able to rename an existing project

        Given 'Retail' user do login into the website with session
        When user open the following url
                | url                   |
                | /wishlist/index/list/ |
            And user navigate to the 'Projects' page
            And user delete 'Cypress 05' project if present
            And user add new 'Cypress 04' project
            And user click on the 'Cypress 04' project
            And user enter the 'Cypress 05' project name 
            And user click on the 'Save' button of rename project popup
        Then the following success message should be displayed on the projects page
                | successMessages                 | 
                | Project "Cypress 05" was saved. |

    #--------------------------------------------------------------------------------------------------

    @all @projectsPage @retail @us @uk @eu @testcase_136
    Scenario: The retail user should be able to see projects header as selected along with other top headers 

        Given 'Retail' user do login into the website with session
        When user open the following url
                | url                   |
                | /wishlist/index/list/ |
            And user navigate to the 'Projects' page
        Then user should be able to see 'Projects' header as selected
            And user should be able to see below available headers on the projects page
                | country | headers                                                                |
                | US      | ACCOUNT, ORDERS, PROJECTS, ADDRESS BOOK, ACCOUNT INFORMATION, WALLET   |
                | UK      | MY ACCOUNT, ORDERS, PROJECTS, MY ADDRESS BOOK, MY ACCOUNT INFORMATION  |
                | EU      | MY ACCOUNT, ORDERS, PROJECTS, MY ADDRESS BOOK, MY ACCOUNT INFORMATION  |
    
    #--------------------------------------------------------------------------------------------------

    @all @projectsPage @retail @us @uk @eu @testcase_137
    Scenario: The retail user should be able to see 20 as default pagination along with item count

        Given 'Retail' user do login into the website with session
        When user open the following url
                | url                   |
                | /wishlist/index/list/ |
            And user navigate to the 'Projects' page
        Then user should be able to see 20 as the default pagination on the page
            And the item count should be the same as the added projects

    #--------------------------------------------------------------------------------------------------

    @all @projectsPage @retail @us @uk @eu @testcase_138
    Scenario: The retail user should be able to remove product from the project

        Given 'Retail' user do login into the website with session
        When user open the following url
                | url                    |
                | /customer/account/     |
            And user delete 'Cypress 06' from 'Projects' page if present
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
            And user click on the create new project link
            And user enter 'Cypress 06' project name
            And user click on the create new project button
            And the following success messages of adding a product to a new project should be displayed
                | successMessages                                                                           | 
                | Project "Cypress 06" was saved.                                                           |
                | Talia Large Chandelier has been added to your Projects.Click here to view your Projects.  |
            And user open the following url
                | url                   |
                | /wishlist/index/list/ |
            And user navigate to the 'Projects' page
            And user click on the 'View Project' link of 'Cypress 06' project
            And user click on the 'Remove' link of product from the project page
        Then the following success message should be displayed on the projects page
               | successMessages                                            | 
               | Talia Large Chandelier has been removed from your Project. |
            And the product should not be displayed on the projects page

    #--------------------------------------------------------------------------------------------------

    @all @projectsPage @retail @us @uk @eu @testcase_141
    Scenario: The retail user should be able to add products to the cart from the projects page

        Given 'Retail' user do login into the website with session
        When user open the following url
                | url                    |
                | /customer/account/     |
            And user clear added items from the cart
            And user delete 'Cypress 07' from 'Projects' page if present
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
            And user click on the create new project link
            And user enter 'Cypress 07' project name
            And user click on the create new project button
            And the following success messages of adding a product to a new project should be displayed
                | successMessages                                                                           | 
                | Project "Cypress 07" was saved.                                                           |
                | Talia Large Chandelier has been added to your Projects.Click here to view your Projects.  |
            And user open the following url
                | url                   |
                | /wishlist/index/list/ |
            And user navigate to the 'Projects' page
            And user click on the 'View Project' link of 'Cypress 07' project
            And user click on the add to cart button from the projects page
        Then the following success message should be displayed on the projects page
               | successMessages                                         | 
               | You added Talia Large Chandelier to your shopping cart. |
            And the mini cart count should be increased by 1
 
    #--------------------------------------------------------------------------------------------------

    @all @projectsPage @retail @us @uk @eu @testcase_142
    Scenario: The retail user should be able to edit products from the projects page

        Given 'Retail' user do login into the website with session
        When user open the following url
                | url                    |
                | /customer/account/     |
            And user delete 'Cypress 08' from 'Projects' page if present
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
            And user click on the create new project link
            And user enter 'Cypress 08' project name
            And user click on the create new project button
            And the following success messages of adding a product to a new project should be displayed
                | successMessages                                                                           | 
                | Project "Cypress 08" was saved.                                                           |
                | Talia Large Chandelier has been added to your Projects.Click here to view your Projects.  |
            And user open the following url
                | url                   |
                | /wishlist/index/list/ |
            And user navigate to the 'Projects' page
            And user click on the 'View Project' link of 'Cypress 08' project
            And user click on the 'Edit' link of product from the project page
            And user select the following product variants:
                | country | variant | value                                 |
                | US      | Finish  | Plaster White and Clear Swirled Glass |
                | UK      | Finish  | Plaster White and Clear Swirled Glass |
                | EU      | Finish  | Plaster White and Clear Swirled Glass |
            And user add 2 quantity of product
            And user collect the following details of product from the product description page
                | label        |
                | Product Qty  |
                | Finish       |
            And user click on the update project button
        Then the following success message should be displayed on the projects page
                | successMessages                                          | 
                | Talia Large Chandelier has been updated in your Project. |
            And the following item details should be displayed on the projects page
                | label         |
                | Product Qty   |
                | Finish        |

    #--------------------------------------------------------------------------------------------------

    @all @projectsPage @retail @us @uk @eu @testcase_169
    Scenario: The retail user should be able to add project from the projects page

        Given 'Retail' user do login into the website with session
        When user open the following url
                | url                   |
                | /wishlist/index/list/ |
            And user navigate to the 'Projects' page
            And user delete 'Cypress 09' project if present
            And user click on the create new project button from the projects page
            And user enter the 'Cypress 09' new project name
            And user click on the create new project button
        Then the following success message should be displayed on the projects page
                | successMessages                 | 
                | Project "Cypress 09" was saved. | 
            And details page of 'Cypress 09' project should get opened
            And the following message should be displayed on the project details page
                | message                            |
                | You have no items in your project. |

    #--------------------------------------------------------------------------------------------------

    @all @projectsPage @retail @us @uk @eu @testcase_227
    Scenario: In a retail account, the product ship by date of projects page should be the same as displayed on the product description page

        Given 'Retail' user do login into the website with session
        When user open the following url
                | url                    |
                | /customer/account/     |
            And user delete 'Cypress 10' from 'Projects' page if present
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
            And user click on the create new project link
            And user enter 'Cypress 10' project name
            And user click on the create new project button
            And the following success messages of adding a product to a new project should be displayed
                | successMessages                                                                           | 
                | Project "Cypress 10" was saved.                                                           |
                | Talia Large Chandelier has been added to your Projects.Click here to view your Projects.  |
            And user open the following url
                | url                   |
                | /wishlist/index/list/ |
            And user navigate to the 'Projects' page
            And user click on the 'View Project' link of 'Cypress 10' project
        Then details page of 'Cypress 10' project should get opened
            And the product ship by date of project page should be the same as displayed on the product description page

    #--------------------------------------------------------------------------------------------------

    @all @projectsPage @wholesale @us @uk @eu @testcase_228
    Scenario: In a wholesale account, the product ship by date of projects page should be the same as displayed on the product description page

        Given 'Wholesale' user do login into the website with session
        When user open the following url
                | url                    |
                | /customer/account/     |
            And user delete 'Cypress 10' from 'Projects' page if present
            And user enter the following product description page url:
                | country | productDescriptionPageUrl            |
                | US      | /bryant-large-table-lamp-tob3260/    |
                | UK      | /bryant-large-table-lamp-eu-tob3260/ |
                | EU      | /bryant-large-table-lamp-eu-tob3260/ |
            And user select the following product variants:
                | country | variant | value                           |
                | US      | Finish  | Bronze                          |
                | US      | Shade   | 11" x 12" X 12" Linen           |
                | UK      | Finish  | Bronze                          |
                | UK      | Shade   | 27.9cm x 30.5cm x 30.5cm Linen  |
                | EU      | Finish  | Bronze                          |
                | EU      | Shade   | 27.9cm x 30.5cm x 30.5cm Linen  |
            And user collect the following details of product from the product description page
                | label          |
                | Product Name   |
                | Ship By Date   |
            And user click on the create new project link
            And user enter 'Cypress 10' project name
            And user click on the create new project button
            And the following success message of adding a product to a new project should be displayed
                | successMessage                                                                             | 
                | Bryant Large Table Lamp has been added to your Projects.Click here to view your Projects.  |
            And user open the following url
                | url                   |
                | /wishlist/index/list/ |
            And user navigate to the 'Projects' page
            And user click on the 'View Project' link of 'Cypress 10' project
        Then details page of 'Cypress 10' project should get opened
            And the product ship by date of project page should be the same as displayed on the product description page
    
    #--------------------------------------------------------------------------------------------------

    @all @projectsPage @retail @us @uk @eu @testcase_466
    Scenario: The retail user should be redirected to the PDP for add to cart if variant details are not provided

        Given 'Retail' user do login into the website with session
        When user open the following url
                | url                    |
                | /customer/account/     |
            And user delete 'Cypress 08' from 'Projects' page if present
            And user enter the following product description page url:
                | country | productDescriptionPageUrl                  |
                | US      | /farfalle-large-linear-chandelier-jn5505/  |
                | UK      | /farfalle-large-linear-chandelier/         |
                | EU      | /farfalle-large-linear-chandelier/         |
            And user collect the following details of product from the product description page
                | label         |
                | Product Name  |
                | Product Price |
            And user click on the create new project link
            And user enter 'Cypress 08' project name
            And user click on the create new project button
        Then the following success messages of adding a product to a new project should be displayed
                | successMessages                                                                                    | 
                | Project "Cypress 08" was saved.                                                                    |
                | Farfalle Large Linear Chandelier has been added to your Projects.Click here to view your Projects. |
        When user open the following url
                | url                   |
                | /wishlist/index/list/ |
            And user navigate to the 'Projects' page
            And user click on the 'View Project' link of 'Cypress 08' project
        Then the following item details should be displayed on the projects page
                | label         |
                | Product Name  |
                | Product Price |
        When user click on the add to cart button from the projects page
        Then the product description page of 'JN5505' should get opened
            And the following message should be displayed on the product description page 
                | message                                   |
                | You need to choose options for your item. |
        When user select the following product variants:
                | country | variant | value |
                | US      | Finish  | Gild  |
                | UK      | Finish  | Gild  |
                | EU      | Finish  | Gild  |     
            And user click on the add to cart button
        Then the following success message should be displayed on the projects page
                | successMessage                                                     | 
                | You added Farfalle Large Linear Chandelier to your shopping cart.  |

    #--------------------------------------------------------------------------------------------------

    @all @projectsPage @retail @us @uk @eu @testcase_470
    Scenario: The retail user should be able to move product from one project to another project by clicking on the move button

        Given 'Retail' user do login into the website with session
        When user open the following url
                | url                    |
                | /customer/account/     |
            And user delete 'Cypress 06' from 'Projects' page if present
            And user enter the following product description page url:
                | country | productDescriptionPageUrl                                                   |
                | US      | /farfalle-large-sconce-jn2502/?qty=1#2461=36111                             |
                | UK      | /farfalle-large-sconce-eu-jn2502/?selected_product=JN%202502G-EU#2461=36111 |
                | EU      | /farfalle-large-sconce-eu-jn2502/?selected_product=JN%202502G-EU#2461=36111 |
            And user collect the following details of product from the product description page
                | label         |
                | Product Name  |
                | Product Price |
            And user click on the create new project link
            And user enter 'Cypress 06' project name
            And user click on the create new project button
        Then the following success messages of adding a product to a new project should be displayed
                | successMessages                                                                         | 
                | Project "Cypress 06" was saved.                                                         |
                | Farfalle Large Sconce has been added to your Projects.Click here to view your Projects. |
        When user open the following url
                | url                   |
                | /wishlist/index/list/ |
            And user navigate to the 'Projects' page
            And user click on the 'View Project' link of 'Cypress 06' project
        Then the following item details should be displayed on the projects page
                | label         |
                | Product Name  |
                | Product Price |
        When user select the given product name
            And user click on the move button
            And user select the 'Project' from the move to project button options
        Then the following success message should be displayed on the projects page
               | successMessages                                         | 
               | 1 items were moved to Project: "Farfalle Large Sconce". |
            And the product should not be displayed on the projects page
        When user click on the 'Projects' header
            And user click on the 'View Project' link of 'Project' project
        Then the following item details should be displayed on the projects page
                | label         |
                | Product Name  |
                | Product Price |

    #--------------------------------------------------------------------------------------------------

    @all @projectsPage @retail @us @uk @eu @testcase_475
    Scenario: The retail user should be able to copy product from one project to another project by clicking on the copy button

        Given 'Retail' user do login into the website with session
        When user open the following url
                | url                    |
                | /customer/account/     |
            And user delete 'Cypress 09' from 'Projects' page if present
            And user enter the following product description page url:
                | country | productDescriptionPageUrl                                                   |
                | US      | /farfalle-large-sconce-jn2502/?qty=1#2461=36111                             |
                | UK      | /farfalle-large-sconce-eu-jn2502/?selected_product=JN%202502G-EU#2461=36111 |
                | EU      | /farfalle-large-sconce-eu-jn2502/?selected_product=JN%202502G-EU#2461=36111 |
            And user collect the following details of product from the product description page
                | label         |
                | Product Name  |
                | Product Price |
            And user click on the create new project link
            And user enter 'Cypress 09' project name
            And user click on the create new project button
        Then the following success messages of adding a product to a new project should be displayed
                | successMessages                                                                         | 
                | Project "Cypress 09" was saved.                                                         |
                | Farfalle Large Sconce has been added to your Projects.Click here to view your Projects. |
        When user open the following url
                | url                   |
                | /wishlist/index/list/ |
            And user navigate to the 'Projects' page
            And user click on the 'View Project' link of 'Cypress 09' project
        Then the following item details should be displayed on the projects page
                | label         |
                | Product Name  |
                | Product Price |
        When user select the given product name
            And user click on the copy button
            And user select the 'Project' from the copy to project button options
        Then the following success message should be displayed on the projects page
               | successMessages                                          | 
               | 1 items were copied to Project: "Farfalle Large Sconce". |
            And the following item details should be displayed on the projects page
                | label         |
                | Product Name  |
                | Product Price |
        When user click on the 'Projects' header
            And user click on the 'View Project' link of 'Project' project
        Then the following item details should be displayed on the projects page
                | label         |
                | Product Name  |
                | Product Price |

    #--------------------------------------------------------------------------------------------------

    @all @projectsPage @trade @us @uk @eu @testcase_477
    Scenario: The trade user should be able to move product from one project to another project by clicking on the move to project link

        Given 'Trade' user do login into the website with session
        When user open the following url
                | url                    |
                | /customer/account/     |
            And user delete 'Cypress 07' from 'Projects' page if present
            And user enter the following product description page url:
                | country | productDescriptionPageUrl                                                    |
                | US      | /eaton-linear-sconce-arn2027/?selected_product=ARN%202027PN#2461=35531       |
                | UK      | /eaton-linear-sconce-eu-arn2027/?selected_product=ARN%202027PN-EU#2461=35531 |
                | EU      | /eaton-linear-sconce-eu-arn2027/?selected_product=ARN%202027PN-EU#2461=35531 |
            And user collect the following details of product from the product description page
                | label         |
                | Product Name  |
                | Product Price |
            And user click on the create new project link
            And user enter 'Cypress 07' project name
            And user click on the create new project button
        Then the following success messages of adding a product to a new project should be displayed
                | successMessages                                                                       | 
                | Project "Cypress 07" was saved.                                                       |
                | Eaton Linear Sconce has been added to your Projects.Click here to view your Projects. |
        When user open the following url
                | url                   |
                | /wishlist/index/list/ |
            And user navigate to the 'Projects' page
            And user click on the 'View Project' link of 'Cypress 07' project
        Then the following item details should be displayed on the projects page
                | label         |
                | Product Name  |
                | Product Price |
        When user click on the move to project link
            And user select the 'Project' from the move to project link options
        Then the following success message should be displayed on the projects page
                | successMessages                             | 
                | "Eaton Linear Sconce" was moved to Project. |
            And the product should not be displayed on the projects page
        When user click on the 'Projects' header
            And user click on the 'View Project' link of 'Project' project
        Then the following item details should be displayed on the projects page
                | label         |
                | Product Name  |
                | Product Price |
    
    #--------------------------------------------------------------------------------------------------

    @all @projectsPage @trade @us @uk @eu @testcase_479
    Scenario: The trade user should be able to copy product from one project to another project by clicking on the copy to project link

        Given 'Trade' user do login into the website with session
        When user open the following url
                | url                    |
                | /customer/account/     |
            And user delete 'Cypress 05' from 'Projects' page if present
            And user enter the following product description page url:
                | country | productDescriptionPageUrl                                                    |
                | US      | /eaton-linear-sconce-arn2027/?selected_product=ARN%202027PN#2461=35531       |
                | UK      | /eaton-linear-sconce-eu-arn2027/?selected_product=ARN%202027PN-EU#2461=35531 |
                | EU      | /eaton-linear-sconce-eu-arn2027/?selected_product=ARN%202027PN-EU#2461=35531 |
            And user collect the following details of product from the product description page
                | label         |
                | Product Name  |
                | Product Price |
            And user click on the create new project link
            And user enter 'Cypress 05' project name
            And user click on the create new project button
        Then the following success messages of adding a product to a new project should be displayed
                | successMessages                                                                       | 
                | Project "Cypress 05" was saved.                                                       |
                | Eaton Linear Sconce has been added to your Projects.Click here to view your Projects. |
        When user open the following url
                | url                   |
                | /wishlist/index/list/ |
            And user navigate to the 'Projects' page
            And user click on the 'View Project' link of 'Cypress 05' project
        Then the following item details should be displayed on the projects page
                | label         |
                | Product Name  |
                | Product Price |
        When user click on the copy to project link
            And user select the 'Project' from the copy to project link options
        Then the following success message should be displayed on the projects page
                | successMessages                              | 
                | "Eaton Linear Sconce" was copied to Project. |
            And the following item details should be displayed on the projects page
                | label         |
                | Product Name  |
                | Product Price |
        When user click on the 'Projects' header
            And user click on the 'View Project' link of 'Project' project
        Then the following item details should be displayed on the projects page
                | label         |
                | Product Name  |
                | Product Price |