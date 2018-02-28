*** Settings ***
Documentation        [PRODUCT:MERCURY] This suite should test the navigation functionality in Mercury Home Page's main menu
Default Tags         MercuryProductsMenuNavigationDataDrivenTest    MERCURY    FUNCTIONALITY    HIGH
Force Tags           REGRESSION    SMOKE
Suite Setup          Launch Mercury Home Page
Suite Teardown       Close All Browsers
Test Teardown        User Is In "Mercury Products" Page
Resource             ${MERCURY_GLOBAL_SETUP}
Resource             ${MERCURY_PAGERESOURCE_DIR}mercury_products_page.robot
Test Template        Guest User Has Successfully Visited "${e_TARGET_PAGE}" Page Through "${e_NAV_TYPE}" From "${e_SOURCE_PAGE}"

*** Test Cases ***                                                               Target Page                    Menu             Source Page
User Has Successfully Visited Electricity Page Via Products Page's Main Menu      Mercury Electricity           Secondary Nav    Mercury Products
User Has Successfully Visited Gas Page Via Products Page's Main Menu              Mercury Gas                   Secondary Nav    Mercury Products
User Has Successfully Visited E-Transport Page Via Products Page's Main Menu      Mercury Electric Transport    Secondary Nav    Mercury Products
User Has Successfully Visited Evie Page Via Products Page's Main Menu             Mercury Evie                  Secondary Nav    Mercury Products
User Has Successfully Visited E-Bikes Page Via Products Page's Main Menu          Mercury Electric Bikes        Secondary Nav    Mercury Products
User Has Successfully Visited Airpoints Page Via Products Page's Main Menu        Mercury Airpoints             Secondary Nav    Mercury Products
User Has Successfully Visited Solar Page Via Products Page's Main Menu            Mercury Solar                 Secondary Nav    Mercury Products
