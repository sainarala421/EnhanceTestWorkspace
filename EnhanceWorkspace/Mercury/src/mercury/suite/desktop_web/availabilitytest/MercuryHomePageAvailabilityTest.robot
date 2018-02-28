*** Settings ***
Documentation        [PRODUCT:MERCURY] This suite should test the availability of Mercury Home Page
Default Tags         MercuryHomePageAvailabilityTest    MERCURY    AVAILABILITY    HIGH
Force Tags           REGRESSION
Suite Setup          Launch Mercury Home Page
#Suite Teardown       Close All Browsers
Resource             ${MERCURY_GLOBAL_SETUP}
Resource             ${MERCURY_PAGERESOURCE_DIR}mercury_home_page.robot

*** Test Cases ***
User Has Successfully Visited The Mercury Home Page
    Given User Is In "Mercury Home" Page
    Then The Mercury Home Page Should Be Loaded Successfully
