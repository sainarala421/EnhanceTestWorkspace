*** Settings ***
Documentation        [PRODUCT:MERCURY] This suite should test the navigation functionality in Mercury Home Page's main menu
Default Tags         MercurySubMenuNavigationDataDrivenTest    MERCURY    FUNCTIONALITY    HIGH
Force Tags           REGRESSION
Suite Setup          Launch Mercury Home Page
Suite Teardown       Close All Browsers
Test Teardown        User Is In "Mercury Home" Page
Resource             ${MERCURY_GLOBAL_SETUP}
Resource             ${MERCURY_PAGERESOURCE_DIR}mercury_home_page.robot
Test Template        Guest User Has Successfully Visited "${e_TARGET_PAGE}" Page Through "${e_NAV_TYPE}" From "${e_SOURCE_PAGE}"

*** Test Cases ***                                                           Target Page              Menu             Source Page
User Has Successfully Visited Products Page Via Home Page's Main Menu        Mercury Products         Secondary Nav    Mercury Home
User Has Successfully Visited Pricing Page Via Home Page's Main Menu         Mercury Pricing          Secondary Nav    Mercury Home
User Has Successfully Visited Join Page Via Home Page's Main Menu            Mercury Join             Secondary Nav    Mercury Home
User Has Successfully Visited Moving House Page Via Home Page's Main Menu    Mercury Moving House     Secondary Nav    Mercury Home
User Has Successfully Visited My Account Page Via Home Page's Main Menu      Mercury My Account       Secondary Nav    Mercury Home
