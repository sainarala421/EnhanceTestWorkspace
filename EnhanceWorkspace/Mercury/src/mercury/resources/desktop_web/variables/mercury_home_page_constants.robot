*** Settings ***
Resource          ${MERCURY_VARIABLE_DIR}mercury_global_page_constants.robot

*** Variables ***
#=====================================================#
#           Mercury Home Page Elements
#=====================================================#
#=====================================================#
#           Mercury Home Page Sub Menu
#=====================================================#
@{MERCURY_HOME_PAGE_SUB_MENU_CORE_ELEMENTS_LIST}       ${MERCURY_PRODUCTS_SECONDARY_NAV_LINK}    ${MERCURY_PRICING_SECONDARY_NAV_LINK}
...                                                    ${MERCURY_JOIN_SECONDARY_NAV_LINK}    ${MERCURY_MOVING_HOUSE_SECONDARY_NAV_LINK}
...                                                    ${MERCURY_MY_ACCOUNT_SECONDARY_NAV_LINK}

${MERCURY_PRODUCTS_SECONDARY_NAV_LINK}                 ${MERCURY_GLOBAL_PRIMARY_NAV} a[href="/Products"]
${MERCURY_PRICING_SECONDARY_NAV_LINK}                  ${MERCURY_GLOBAL_PRIMARY_NAV} a[href="/pricing"]
${MERCURY_JOIN_SECONDARY_NAV_LINK}                     ${MERCURY_GLOBAL_PRIMARY_NAV} a[href="/join"]
${MERCURY_MOVING_HOUSE_SECONDARY_NAV_LINK}             ${MERCURY_GLOBAL_PRIMARY_NAV} a[href="/Moving-House"]
${MERCURY_MY_ACCOUNT_SECONDARY_NAV_LINK}               ${MERCURY_GLOBAL_PRIMARY_NAV} a[href="/MyAccount"]

#=====================================================#
#           Mercury Home Page Content
#=====================================================#
${MERCURY_HOME_PAGE_CONTENT}    css = .bg-default > .grid--child-padding-off
