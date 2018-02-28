*** Settings ***
Documentation        [PRODUCT:MERCURY] This suite should test the navigation functionality in Mercury Home Page's main menu
Default Tags         MercuryMainMenuNavigationTest    MERCURY    FUNCTIONALITY    HIGH
Force Tags           REGRESSION
Suite Setup          Launch Mercury Home Page
Suite Teardown       Close All Browsers
Test Teardown        User Is In "Mercury Home" Page
Resource             ${MERCURY_GLOBAL_SETUP}
Resource             ${MERCURY_PAGERESOURCE_DIR}mercury_home_page.robot

*** Test Cases ***
User Has Successfully Visited About Page Via Home Page's Main Menu
    Given User Is In "Mercury Home" Page
    When User Clicks "Mercury About" "Link"
    Then User Should Be Redirected To "Mercury About" Page

User Has Successfully Visited For Business Page Via Home Page's Main Menu
    Given User Is In "Mercury Home" Page
    When User Clicks "Mercury For Business" "Link"
    Then User Should Be Redirected To "Mercury For Business" Page

User Has Successfully Visited Investors Page Via Home Page's Main Menu
    Given User Is In "Mercury Home" Page
    When User Clicks "Mercury Investors" "Link"
    Then User Should Be Redirected To "Mercury Investors" Page

User Has Successfully Visited Help Page Via Home Page's Main Menu
    Given User Is In "Mercury Home" Page
    When User Clicks "Mercury Help" "Link"
    Then User Should Be Redirected To "Mercury Help" Page

User Has Successfully Visited My Account Page Via Home Page's Main Menu
    Given User Is In "Mercury Home" Page
    When User Clicks "Mercury My Account" "Link"
    Then User Should Be Redirected To "Mercury My Account" Page
