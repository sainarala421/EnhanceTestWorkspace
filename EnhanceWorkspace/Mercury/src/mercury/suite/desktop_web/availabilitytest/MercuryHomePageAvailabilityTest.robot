*** Settings ***
Documentation        [PRODUCT:MERCURY] This suite should test the availability of Mercury Home Page
Default Tags         MercuryHomePageAvailabilityTest    MERCURY    AVAILABILITY    HIGH
Force Tags           SMOKE    REGRESSION
Suite Setup          Launch Mercury Home Page
Suite Teardown       Close All Browsers
Resource             ${MERCURY_GLOBAL_SETUP}
Resource             ${MERCURY_PAGERESOURCE_DIR}mercury_home_page.robot

*** Test Cases ***
User Has Successfully Visited The Mercury Home Page
    Given User Is In "Mercury Home" Page
    Then The "Mercury Logo" Should Be "Visible"
    And The "Mercury Homepage Content" Should Be "Visible"
    And The "Mercury Home Page Sub Menu" Elements Should Be Loaded Successfully
    And The "Mercury Primary Search Button" Should Be "Visible"
    And The "Mercury Global Navigation" Elements Should Be Loaded Successfully
    And The "Mercury Global Footers" Elements Should Be Loaded Successfully
