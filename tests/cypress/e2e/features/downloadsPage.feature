Feature: Downloads Page

    The user should be able to access the downloads page.

    #--------------------------------------------------------------------------------------------------

    @all @downloadsPage @wholesale @us @uk @eu @testcase_485 @skip
    Scenario: The wholesale user should be able to see updated year on header section

        Given 'Wholesale' user do login into the website with session
        When user open the following url
                | url                               |
                | /downloadstab/customer/downloads/ |
            And user navigate to the 'Downloads' page
            And the following header text should be displayed
                | text                                                     |
                | Visual Comfort Signature Collection 2024 Resource Guide  |

    #--------------------------------------------------------------------------------------------------

    @all @downloadsPage @wholesale @us @testcase_486 @skip
    Scenario: The wholesale user should be able to see '2024 Price list'

        Given 'Wholesale' user do login into the website with session
        When user open the following url
                | url                               |
                | /downloadstab/customer/downloads/ |
            And user navigate to the 'Downloads' page
        Then user should be displayed 'VC 2024 IMAP Price List' text under price list section