*** Settings ***
Documentation    This file contains all the url and url extensions of mercury.com Website

*** Variables ***
#===========================================#
#           Main Header Menu
#===========================================#
${MERCURY_LOGIN_URL_EXT}           ${/}login-registration
${MERCURY_LOGOUT_URL_EXT}          ${/}welcome
${MERCURY_ABOUT_URL_EXT}           ${/}About
${MERCURY_FOR_BUSINESS_URL_EXT}    ${/}for-business
${MERCURY_INVESTORS_URL_EXT}       ${/}Investors
${MERCURY_HELP_URL_EXT}            ${/}Help
${MERCURY_MY_ACCOUNT_URL}          https://sts.mercury.co.nz/account/login.aspx

#===========================================#
#           Main Header Sub Menu
#===========================================#
${MERCURY_PRODUCTS_URL_EXT}        ${/}Products
${MERCURY_PRICING_URL_EXT}         ${/}pricing
${MERCURY_JOIN_URL_EXT}            ${/}join
${MERCURY_MOVING_HOUSE_URL_EXT}    ${/}Moving-House

#===========================================#
#           Products
#===========================================#
${MERCURY_ELECTRICITY_URL_EXT}           ${MERCURY_PRODUCTS_URL_EXT}${/}Electricity
${MERCURY_GAS_URL_EXT}                   ${MERCURY_PRODUCTS_URL_EXT}${/}Gas
${MERCURY_ELECTRIC_TRANSPORT_URL_EXT}    ${MERCURY_PRODUCTS_URL_EXT}${/}E-transport
${MERCURY_EVIE_URL_EXT}                  ${/}Evie
${MERCURY_ELECTRIC_VEHICLES_URL_EXT}     ${MERCURY_PRODUCTS_URL_EXT}${/}electric-vehicles
${MERCURY_ELECTRIC_BIKES_URL_EXT}        ${MERCURY_PRODUCTS_URL_EXT}${/}Electric-Bikes
${MERCURY_AIRPOINTS_URL_EXT}             ${MERCURY_PRODUCTS_URL_EXT}${/}Airpoints
${MERCURY_SOLAR_URL_EXT}                 ${MERCURY_PRODUCTS_URL_EXT}${/}Solar