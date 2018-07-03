*** Settings ***
Documentation        [PRODUCT:SKYTV] This suite should test the availability of SkyTV Home Page
Default Tags         LoginTest    SKYTV    AVAILABILITY    HIGH
Force Tags           REGRESSION
Suite Setup          Launch SkyTV Home Page
Suite Teardown       Close All Browsers
Resource             ${SKYTV_GLOBAL_SETUP}
Resource             ${SKYTV_PAGERESOURCE_DIR}skytv_home_page.robot

*** Test Cases ***
User Has Successfully Visited The SkyTV Home Page
    Given User Is In "SkyTV Home" Page
    Then The "SkyTV Signin Register Button" Should Be "Visible"
    And The "SkyTV Main Header" Elements Should Be Loaded Successfully
    And The "SkyTV Main Menu" Elements Should Be Loaded Successfully
