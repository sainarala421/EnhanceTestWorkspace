*** Settings ***
Documentation        [PRODUCT:SKYTV] This suite should test the availability of SkyTV Home Page
Default Tags         SKYTVLoginTest    SKYTV    FUNCTIONALITY    HIGH
Force Tags           REGRESSION
Suite Setup          Launch SkyTV Home Page
Suite Teardown       Close All Browsers
Resource             ${SKYTV_GLOBAL_SETUP}
Resource             ${SKYTV_PAGERESOURCE_DIR}skytv_home_page.robot
Resource             ${SKYTV_PAGERESOURCE_DIR}skytv_login_page.robot

*** Variables ****
${p_username}        francisagunday@gmail.com

*** Test Cases ***
Returning User Has Successfully Logged In To His Sky TV Account
    Given User Is In "SkyTV Home" Page
    When User Clicks "SkyTV Signin Register" "Button"
    Then User Should Be Redirected To "SkyTV Login" Page
    When Use Inputs Login Credentials Username "${p_username}" And Password "%{PASSWORD}"
    And User Clicks "SkyTV Signin" "Button"
    Then The "Log In" Page Elements Should Be Displayed Successfully

Returning User Has Successfully Logged Out From His Sky TV Account
    Given User Is In "SkyTV Home" Page
    When User Clicks "SkyTV Logout" "Button"
    Then User Should Be Redirected To "SkyTV Logout" Page
    And The "Log Out" Page Elements Should Be Displayed Successfully
