*** Variables ***
#=====================================================#
#           Mercury Products Page Elements
#=====================================================#
#=====================================================#
#           Mercury Products Page Sub Menu
#=====================================================#
@{MERCURY_PRODUCTS_SUB_MENU_CORE_ELEMENTS_LIST}     ${MERCURY_ELECTRICITY_SECONDARY_NAV_LINK}    ${MERCURY_GAS_SECONDARY_NAV_LINK}
...                                                 ${MERCURY_ELECTRIC_TRANSPORT_SECONDARY_NAV_LINK}    ${MERCURY_ELECTRIC_VEHICLES_SECONDARY_NAV_LINK}
...                                                 ${MERCURY_ELECTRIC_BIKES_SECONDARY_NAV_LINK}    ${MERCURY_AIRPOINTS_SECONDARY_NAV_LINK}
...                                                 ${MERCURY_SOLAR_SECONDARY_NAV_LINK}

${MERCURY_ELECTRICITY_SECONDARY_NAV_LINK}           ${MERCURY_GLOBAL_SECONDARY_NAV} a[href="/Products/Electricity"]
${MERCURY_GAS_SECONDARY_NAV_LINK}                   ${MERCURY_GLOBAL_SECONDARY_NAV} a[href="/Products/Gas"]
${MERCURY_ELECTRIC_TRANSPORT_SECONDARY_NAV_LINK}    ${MERCURY_GLOBAL_SECONDARY_NAV} a[href="/Products/E-transport"]
${MERCURY_EVIE_SECONDARY_NAV_LINK}                  ${MERCURY_GLOBAL_SECONDARY_NAV} a[href="/Products/Evie"]
${MERCURY_ELECTRIC_VEHICLES_SECONDARY_NAV_LINK}     ${MERCURY_GLOBAL_SECONDARY_NAV} a[href="/Products/electric-vehicles"]
${MERCURY_ELECTRIC_BIKES_SECONDARY_NAV_LINK}        ${MERCURY_GLOBAL_SECONDARY_NAV} a[href="/Products/Electric-Bikes"]
${MERCURY_AIRPOINTS_SECONDARY_NAV_LINK}             ${MERCURY_GLOBAL_SECONDARY_NAV} a[href="/Products/Airpoints"]
${MERCURY_SOLAR_SECONDARY_NAV_LINK}                 ${MERCURY_GLOBAL_SECONDARY_NAV} a[href="/Products/Solar"]

#=====================================================#
#           Mercury Products Page Content
#=====================================================#
${MERCURY_HOME_PAGE_CONTENT}    css = .bg-default > .grid--child-padding-off
