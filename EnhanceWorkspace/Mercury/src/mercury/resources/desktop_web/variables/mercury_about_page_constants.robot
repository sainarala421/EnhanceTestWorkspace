*** Settings ***
Resource          ${MERCURY_VARIABLE_DIR}mercury_global_page_constants.robot

*** Variables ***
#=====================================================#
#           Mercury About Page Elements
#=====================================================#
${MERCURY_ABOUT_PAGE_CONTENT}                           css = main

#=====================================================#
#           Mercury Home Page Sub Menu
#=====================================================#
@{MERCURY_ABOUT_PAGE_SUB_MENU_CORE_ELEMENTS_LIST}    ${MERCURY_RENEWABLE_ENERGY_LINK}    ${MERCURY_PARTNERSHIPS_LINK}
...                                                  ${MERCURY_CAREERS_LINK}    ${MERCURY_LEADERSHIP_HOUSE_LINK}
...                                                  ${MERCURY_SAFETY_LINK}

${MERCURY_RENEWABLE_ENERGY_LINK}                     ${MERCURY_GLOBAL_PRIMARY_NAV} a[href="/About/Renewable-Energy"]
${MERCURY_PARTNERSHIPS_LINK}                         ${MERCURY_GLOBAL_PRIMARY_NAV} a[href="/About/Partnerships"]
${MERCURY_CAREERS_LINK}                              ${MERCURY_GLOBAL_PRIMARY_NAV} a[href="/About/Careers"]
${MERCURY_LEADERSHIP_HOUSE_LINK}                     ${MERCURY_GLOBAL_PRIMARY_NAV} a[href="/About/Leadership-Governance"]
${MERCURY_SAFETY_LINK}                               ${MERCURY_GLOBAL_PRIMARY_NAV} a[href="/About/Safety"]