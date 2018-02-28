*** Settings ***
Documentation        [PRODUCT:MERCURY] This suite should test the availability of Mercury Home Page
Default Tags         MercuryAboutPageAvailabilityTest    MERCURY    AVAILABILITY    HIGH
Force Tags           REGRESSION
Suite Setup          Launch Mercury Home Page
Suite Teardown       Close All Browsers
Resource             ${MERCURY_GLOBAL_SETUP}
Resource             ${MERCURY_PAGERESOURCE_DIR}mercury_about_page.robot

*** Test Cases ***
User Has Successfully Visited The Mercury Home Page
    Given User Is In "Mercury About" Page
    Then The "Mercury Logo" Should Be "Visible"
    And The "Mercury About Page Content" Should Be "Visible"
    And The "Mercury About Page Sub Menu" Elements Should Be Loaded Successfully
    And The "Mercury Primary Search Button" Should Be "Visible"
    And The "Mercury Global Navigation" Elements Should Be Loaded Successfully
    And The "Mercury Global Footers" Elements Should Be Loaded Successfully