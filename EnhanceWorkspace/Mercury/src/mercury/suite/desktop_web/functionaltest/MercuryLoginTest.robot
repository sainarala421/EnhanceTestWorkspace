*** Settings ***
Documentation        [PRODUCT:MERCURY] This suite should test the availability of Mercury Home Page
Default Tags         MercuryLoginTest    MERCURY    FUNCTIONALITY    HIGH
Force Tags           REGRESSION
Suite Setup          Launch Mercury Home Page
Suite Teardown       Close All Browsers
Resource             ${MERCURY_GLOBAL_SETUP}
Resource             ${MERCURY_PAGERESOURCE_DIR}mercury_home_page.robot
Resource             ${MERCURY_PAGERESOURCE_DIR}mercury_login_page.robot

*** Variables ****
${p_username}        francisagunday@gmail.com

*** Test Cases ***
Returning User Has Successfully Logged In To His Mercury Account
    Given User Is In "Mercury Home" Page
    When User Clicks "Mercury Signin Register" "Button"
    Then User Should Be Redirected To "Mercury Login" Page
    When Use Inputs Login Credentials Username "${p_username}" And Password "%{PASSWORD}"
    And User Clicks "Mercury Signin" "Button"
    Then The "Log In" Page Elements Should Be Displayed Successfully

Returning User Has Successfully Logged Out From His Mercury Account
    Given User Is In "Mercury Home" Page
    When User Clicks "Mercury Logout" "Button"
    Then User Should Be Redirected To "Mercury Logout" Page
    And The "Log Out" Page Elements Should Be Displayed Successfully
