*** Settings ***
Documentation        [PRODUCT:MERCURY] This suite should test the navigation functionality in Mercury Home Page's main menu
Default Tags         MercuryMainMenuNavigationDataDrivenTest    MERCURY    FUNCTIONALITY    HIGH
Force Tags           REGRESSION
Suite Setup          Launch Mercury Home Page
Suite Teardown       Close All Browsers
Test Teardown        User Is In "Mercury Home" Page
Resource             ${MERCURY_GLOBAL_SETUP}
Resource             ${MERCURY_PAGERESOURCE_DIR}mercury_home_page.robot
Test Template        Guest User Has Successfully Visited "${e_TARGET_PAGE}" Page Through "${e_NAV_TYPE}" From "${e_SOURCE_PAGE}"

*** Test Cases ***                                                           Target Page             Menu         Source Page
User Has Successfully Visited About Page Via Home Page's Main Menu           Mercury About           Main Menu    Mercury Home
User Has Successfully Visited For Business Page Via Home Page's Main Menu    Mercury For Business    Main Menu    Mercury Home
User Has Successfully Visited Investors Page Via Home Page's Main Menu       Mercury Investors       Main Menu    Mercury Home
User Has Successfully Visited Help Page Via Home Page's Main Menu            Mercury Help            Main Menu    Mercury Home
User Has Successfully Visited My Account Page Via Home Page's Main Menu      Mercury My Account      Main Menu    Mercury Home
