Feature: Request To Order Page

    The user should be able to access the request to order page.

    #--------------------------------------------------------------------------------------------------

    @all @requestToOrderPage @wholesale @us @uk @eu @testcase_148
    Scenario: The wholesale user should be able to see 10 as default pagination along with item count

        Given 'Wholesale' user do login into the website with session
        When user open the following url
                | url                        |
                | /orequest/request/history/ |
            And user click on the 'Request To Order' header
        Then 'Request To Order' page should get loaded
            And user should be able to see 10 as the default pagination on the request to order page
            And the item count should be the same as the added request to order

    #--------------------------------------------------------------------------------------------------

    @all @requestToOrderPage @wholesale @us @uk @eu @testcase_149 
    Scenario: The wholesale user should be able to see request to order header as selected along with other top headers

        Given 'Wholesale' user do login into the website with session
        When user open the following url
                | url                        |
                | /orequest/request/history/ |
        Then 'Request To Order' page should get loaded
            And user should be able to see 'Request To Order' header as selected 
            And user should be able to see below available headers on the page
                | country | headers                                                                                                                                          |
                | US      | ACCOUNT, ORDERS, INVOICES, CREDIT MEMOS, PROJECTS, ACCOUNT INFORMATION, STORED PAYMENT METHODS, REQUEST TO ORDER, INVENTORY, DOWNLOADS, PAYMENTS |
                | UK      | My ACCOUNT, ORDERS, INVOICES, CREDIT MEMOS, PROJECTS, My ACCOUNT INFORMATION, REQUEST TO ORDER, INVENTORY, DOWNLOADS, PAYMENTS                   |
                | EU      | My ACCOUNT, ORDERS, INVOICES, CREDIT MEMOS, PROJECTS, My ACCOUNT INFORMATION, REQUEST TO ORDER, INVENTORY, DOWNLOADS, PAYMENTS                   |

    #--------------------------------------------------------------------------------------------------

    @all @requestToOrderPage @wholesale @us @uk @eu @testcase_150 
    Scenario: The wholesale user should be able to see updated subtotal after updating the product quantity

        Given 'Wholesale' user do login into the website with session
        When user enter the following product description page url:
                | country | productDescriptionPageUrl             |
                | US      | /52-maverick-ii-ceiling-fan-3mavr52/  |
                | UK      | /bryant-large-table-lamp-eu-tob3260/  |
                | EU      | /frankfort-floor-lamp-eu-arn1001/     |
            And user select the following product variants:
                | country | variant | value                                       |
                | US      | Finish  | Matte White Housing With Matte White Blades |
                | UK      | Finish  | Bronze                                      |
                | UK      | Shade   | 27.9cm x 30.5cm x 30.5cm Linen              |
                | EU      | Finish  | Hand-Rubbed Antique Brass                   |
                | EU      | Shade   | 26.7cm x 29.2cm x 63.5cm Linen              |
            And user collect the following details of product from the product description page
                | label          |
                | Product Name   |
            And user click on request order button from the product description page
            And user click on view your request to order button from pop up
            And user update 3 quantity of product from the request page
        Then the subtotal of product should get updated as per 3 product quantity
            And user remove added product from request to order page with below message
                | message                        |
                | Item was successfully removed  |

    #--------------------------------------------------------------------------------------------------

    @all @requestToOrderPage @wholesale @us @uk @eu @testcase_151 
    Scenario: The wholesale user should be able to add product in request to order

        Given 'Wholesale' user do login into the website with session
        When user enter the following product description page url:
                | country | productDescriptionPageUrl             |
                | US      | /52-maverick-ii-ceiling-fan-3mavr52/  |
                | UK      | /bryant-large-table-lamp-eu-tob3260/  |
                | EU      | /frankfort-floor-lamp-eu-arn1001/     |
            And user select the following product variants:
                | country | variant | value                                       |
                | US      | Finish  | Matte White Housing With Matte White Blades |
                | UK      | Finish  | Bronze                                      |
                | UK      | Shade   | 27.9cm x 30.5cm x 30.5cm Linen              |
                | EU      | Finish  | Hand-Rubbed Antique Brass                   |
                | EU      | Shade   | 26.7cm x 29.2cm x 63.5cm Linen              |
            And user click on request order button from the product description page
            And user collect the following details of product from the product description page
                | label          |
                | Product Name   |
                | Product Price  |
                | Product Qty    |
                | Product Sku    |
            And user click on view your request to order button from pop up
        Then the following item details should be displayed on the request order page
                | label         |
                | Product Price |
                | Product Qty   |
                | Product Sku   |
            And user remove added product from request to order page with below message
                | message                        |
                | Item was successfully removed  |
    
    #--------------------------------------------------------------------------------------------------

    @all @requestToOrderPage @wholesale @us @uk @eu @testcase_152 @skip
    Scenario: The wholesale user should be able to verify request details on the request to order list page

        Given 'Wholesale' user do login into the website with session
        When user enter the following product description page url:
                | country | productDescriptionPageUrl             |
                | US      | /52-maverick-ii-ceiling-fan-3mavr52/  |
                | UK      | /bryant-large-table-lamp-eu-tob3260/  |
                | EU      | /frankfort-floor-lamp-eu-arn1001/     |
            And user select the following product variants:
                | country | variant | value                                       |
                | US      | Finish  | Matte White Housing With Matte White Blades |
                | UK      | Finish  | Bronze                                      |
                | UK      | Shade   | 27.9cm x 30.5cm x 30.5cm Linen              |
                | EU      | Finish  | Hand-Rubbed Antique Brass                   |
                | EU      | Shade   | 26.7cm x 29.2cm x 63.5cm Linen              |
            And user collect the following details of product from the product description page
                | label          |
                | Product Name   |
            And user click on request order button from the product description page
            And user click on view your request to order button from pop up
            And user click on the 'Request To Order' header
        Then user should be able to see below request to order details
                | country | field              | value                                            |
                | US      | REQUEST TO ORDER   | 4730                                             |  
                | US      | NAME               | Test Account                                     |
                | US      | EMAIL ADDRESS      | test-cypress-wholesale@n8ko5unu.mailosaur.net    |
                | US      | CREATED            | 11.06.23                                         |
                | US      | NO OF ITEMS        | 1                                                |
                | US      | STATUS             | Open                                             |
                | US      | LINK               | View                                             |
                | UK      | REQUEST TO ORDER   | 4775                                             |  
                | UK      | NAME               | Test Account                                     |
                | UK      | EMAIL ADDRESS      | test-cypress-wholesale-uk@n8ko5unu.mailosaur.net |
                | UK      | CREATED            | 11.09.23                                         |
                | UK      | NO OF ITEMS        | 1                                                |
                | UK      | STATUS             | Open                                             |
                | UK      | LINK               | View                                             |
                | EU      | REQUEST TO ORDER   | 4910                                             |  
                | EU      | NAME               | Test Account                                     |
                | EU      | EMAIL ADDRESS      | test-cypress-wholesale-eu@n8ko5unu.mailosaur.net |
                | EU      | CREATED            | 11.16.23                                         |
                | EU      | NO OF ITEMS        | 1                                                |
                | EU      | STATUS             | Open                                             |
                | EU      | LINK               | View                                             |
            And user remove added product from request to order page with below message
                | message                        |
                | Item was successfully removed  |

    #--------------------------------------------------------------------------------------------------

    @all @requestToOrderPage @wholesale @us @uk @eu @testcase_153 @skip
    Scenario: The number of added items should be the same as the item count displayed on the request to order list page

        Given 'Wholesale' user do login into the website with session
        When user enter the following product description page url:
                | country | productDescriptionPageUrl             |
                | US      | /52-maverick-ii-ceiling-fan-3mavr52/  |
                | UK      | /bryant-large-table-lamp-eu-tob3260/  |
                | EU      | /frankfort-floor-lamp-eu-arn1001/     |
            And user select the following product variants:
                | country | variant | value                                       |
                | US      | Finish  | Matte White Housing With Matte White Blades |
                | UK      | Finish  | Bronze                                      |
                | UK      | Shade   | 27.9cm x 30.5cm x 30.5cm Linen              |
                | EU      | Finish  | Hand-Rubbed Antique Brass                   |
                | EU      | Shade   | 26.7cm x 29.2cm x 63.5cm Linen              |
            And user collect the following details of product from the product description page
                | label          |
                | Product Name   |
            And user click on request order button from the product description page
            And user click on view your request to order button from pop up
            And user click on the 'Request To Order' header
            And user collect no of items details from request to order list page for below order number
                | country | number  |
                | US      | 4730    |
                | UK      | 4775    |
                | EU      | 4910    |
            And user click on view link of below order number
                | country | number  |
                | US      | 4730    |
                | UK      | 4775    |
                | EU      | 4910    |
        Then the number of added items on the request to order details page should be the same as the item count
            And user remove added product from request to order page with below message
                | message                        |
                | Item was successfully removed  |

    #--------------------------------------------------------------------------------------------------

    @all @requestToOrderPage @wholesale @us @uk @eu @testcase_229 
    Scenario: In a wholesale account, the product ship by date of request to order page should be the same as displayed on the product description page

        Given 'Wholesale' user do login into the website with session
        When user enter the following product description page url:
                | country | productDescriptionPageUrl             |
                | US      | /52-maverick-ii-ceiling-fan-3mavr52/  |
                | UK      | /bryant-large-table-lamp-eu-tob3260/  |
                | EU      | /frankfort-floor-lamp-eu-arn1001/     |
            And user select the following product variants:
                | country | variant | value                                       |
                | US      | Finish  | Matte White Housing With Matte White Blades |
                | UK      | Finish  | Bronze                                      |
                | UK      | Shade   | 27.9cm x 30.5cm x 30.5cm Linen              |
                | EU      | Finish  | Hand-Rubbed Antique Brass                   |
                | EU      | Shade   | 26.7cm x 29.2cm x 63.5cm Linen              |
            And user collect the following details of product from the product description page
                | label          |
                | Product Name   |
                | Ship By Date   |
            And user click on request order button from the product description page
            And user click on view your request to order button from pop up
        Then the product ship by date of request to order page should be the same as displayed on the product description page
            And user remove added product from request to order page with below message
                | message                        |
                | Item was successfully removed  |

    #--------------------------------------------------------------------------------------------------

    @all @requestToOrderPage @wholesale @us @uk @eu @testcase_270
    Scenario: wholesale user should be able to verify product details from product list page to product details page also in request to order page

        Given 'Wholesale' user do login into the website with session
        When user open the following url
                | url                |
                | /customer/account/ |
            And user clear added items from the cart
            And user click on below mega menu
                | country | mega menu |
                | US      | Fans      |
                | UK      | Table     |
                | EU      | Floor     |
        Then product list page of below mega menu should get opened
                | country | mega menu |
                | US      | Fans      |
                | UK      | Table     |
                | EU      | Floor     |
        When user collect the following details of product from the list
                | country | label         | sku        |
                | US      | Product Name  | 3MAVR52    |
                | US      | Price         | 3MAVR52    |
                | US      | SKU Code      | 3MAVR52    |
                | UK      | Product Name  | EU-KW3031  |
                | UK      | Price         | EU-KW3031  |
                | UK      | SKU Code      | EU-KW3031  |
                | EU      | Product Name  | EU-ARN1042 |
                | EU      | Price         | EU-ARN1042 |
                | EU      | SKU Code      | EU-ARN1042 |
            And user click on below product from the product list
                | country | product                      |
                | US      | MAVERICK 52" CEILING FAN     |
                | UK      | LINDEN MEDIUM LAMP           |
                | EU      | LANCELOT PIVOTING FLOOR LAMP |
        Then the product description page should get opened for below sku code
                | country | sku        |
                | US      | 3MAVR52    |
                | UK      | EU-KW3031  |
                | EU      | EU-ARN1042 |
            And the following product details should be the same as displayed on the list
                | label        |
                | Product Name |
                | Price        |
                | SKU Code     |
            And user click on request order button from the product description page
            And user collect the following details of product from the product description page
                | label         |
                | Product Name  |
                | Product Price |
                | Product Qty   |
                | Product Sku   |
            And user click on view your request to order button from pop up
        Then the following item details should be displayed on the request order page
                | label         |
                | Product Price |
                | Product Qty   |
                | Product Sku   |
            And user remove added product from request to order page with below message
                | message                       |
                | Item was successfully removed |

    #--------------------------------------------------------------------------------------------------

    @all @requestToOrderPage @wholesale @us @uk @eu @testcase_379 
    Scenario: The wholesale user should be able to navigate order history page after click on view all request to order link

        Given 'Wholesale' user do login into the website with session
        When user open the following url
                | url                        |
                | /orequest/request/history/ |   
        When  user click view request of 'Open' status
            And user click on view all request to order link
        Then 'Request To Order' page should get loaded

    #--------------------------------------------------------------------------------------------------

    @all @requestToOrderPage @wholesale @us @uk @eu @testcase_380 
    Scenario: The wholesale user should be able to navigate order history page after click on back button link

        Given 'Wholesale' user do login into the website with session
        When user open the following url
                | url                        |
                | /orequest/request/history/ |   
        When user click view request of 'Submitted' status
            And user click on 'back button' link of request to order
        Then 'Request To Order' page should get loaded
    
    #--------------------------------------------------------------------------------------------------

    @all @requestToOrderPage @wholesale @us @uk @eu @testcase_420 
    Scenario: The wholesale user should see user is able to submit a request to order

        Given 'Wholesale' user do login into the website with session
        When user enter the following product description page url:
                | country | productDescriptionPageUrl                                  |
                | US      | /52-maverick-ii-ceiling-fan-3mavr52/#2461=35071            |
                | UK      | /bryant-large-table-lamp-eu-tob3260/#2461=35811&1651=81162 |
                | EU      | /frankfort-floor-lamp-eu-arn1001/#1651=80887&2461=36341    |
            And user click on request order button from the product description page
            And user click on view your request to order button from pop up
            And user click on the 'Request To Order' header
            And user collect request order number of open status
            And  user click view request of 'Open' status
            And user enter following mandatory details to submit request to order 
                | field          | value      |           
                | Phone Number   | 9898989898 |
            And user collect details of your name with email field
            And user click on submit button to submit request to order
        Then user should be able to see below success message on request to order
                | message                            |
                | Request was successfully submitted |
            And user should be able see request order number also created date on request to order 
            And user should be able to see following details after submit request to order  
                | country | field          | value                                            |          
                | US      | Your Name      | Test Account                                     |
                | US      | Phone Number   | 9898989898                                       |
                | US      | Email          | test-cypress-wholesale@n8ko5unu.mailosaur.net    |               
                | UK      | Your Name      | Test Account                                     |
                | UK      | Phone Number   | 9898989898                                       |
                | UK      | Email          | test-cypress-wholesale-uk@n8ko5unu.mailosaur.net |              
                | EU      | Your Name      | Test Account                                     |
                | EU      | Phone Number   | 9898989898                                       |
                | EU      | Email          | test-cypress-wholesale-eu@n8ko5unu.mailosaur.net |

    #--------------------------------------------------------------------------------------------------

    @all @requestToOrderPage @wholesale @us @uk @eu @testcase_440 
    Scenario: The wholesale user should be able to see the pagination drop-down values for the request to order tab.

        Given 'Wholesale' user do login into the website with session
        When user open the following url
                | url                        |
                | /orequest/request/history/ | 
        Then user should be able to see 10 as default pagination on request to order
            And user should be able to see below available pagination options request to order
                | paginationOptions |
                | 10                |
                | 20                |
                | 50                |

    #--------------------------------------------------------------------------------------------------

    @all @requestToOrderPage @wholesale @us @uk @eu @testcase_443 
    Scenario: The wholesale user should be able to verify the quantity field validation on the Request to Order page

        Given 'Wholesale' user do login into the website with session
        When user enter the following product description page url:
                | country | productDescriptionPageUrl                                  |
                | US      | /52-maverick-ii-ceiling-fan-3mavr52/#2461=35071            |
                | UK      | /bryant-large-table-lamp-eu-tob3260/#2461=35811&1651=81162 |
                | EU      | /frankfort-floor-lamp-eu-arn1001/#1651=80887&2461=36341    |
            And user collect the following details of product from the product description page
                | label        |
                | Product Name |
            And user click on request order button from the product description page
            And user click on view your request to order button from pop up
            And user update 0 quantity of product from the request page
        Then user should be able to see below quantity validation message
                | message                                 |
                | Please enter a quantity greater than 0. | 

    #--------------------------------------------------------------------------------------------------

    @all @requestToOrderPage @wholesale @us @uk @eu @testcase_476 
    Scenario: The wholesale user should be able to see the validations for all required fields to submit the request to order detail

        Given 'Wholesale' user do login into the website with session
        When user enter the following product description page url:
                | country | productDescriptionPageUrl                                  |
                | US      | /52-maverick-ii-ceiling-fan-3mavr52/#2461=35071            |
                | UK      | /bryant-large-table-lamp-eu-tob3260/#2461=35811&1651=81162 |
                | EU      | /frankfort-floor-lamp-eu-arn1001/#1651=80887&2461=36341    |
            And user click on request order button from the product description page
            And user click on view your request to order button from pop up
            And keep all required fields empty to submit the request to order detail
            And user click on submit button to submit the request to order detail
        Then user should be able to see your name validation message
                | message                   |
                | This is a required field. | 
            And user should be able to see phone number validation message
                | message                   |
                | This is a required field. | 
            And user should be able to see email validation message
                | message                   |
                | This is a required field. |