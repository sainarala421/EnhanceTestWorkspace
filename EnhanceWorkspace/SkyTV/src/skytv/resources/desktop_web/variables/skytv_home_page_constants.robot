*** Variables ***
#===========================================#
#           SkyTV Header Elements
#===========================================#
@{SKYTV_MAIN_HEADER_CORE_ELEMENTS_LIST}    ${SKYTV_ABOUT_US_LINK}    ${SKYTV_SKYGO_LINK}    ${SKYTV_SKY_BUSINESS_LINK}
${SKYTV_HEADER_CONTAINER}                  jquery = .iop-header-links .container
${SKYTV_ABOUT_US_LINK}                     ${SKYTV_HEADER_CONTAINER} li > a:contains("About us")
${SKYTV_SKYGO_LINK}                        ${SKYTV_HEADER_CONTAINER} li > a:contains("SKYGO")
${SKYTV_SKY_BUSINESS_LINK}                 ${SKYTV_HEADER_CONTAINER} li > a:contains("SKY BUSINESS")

@{SKYTV_MAIN_MENU_CORE_ELEMENTS_LIST}      ${SKYTV_MAIN_MENU_CONTAINER}    ${SKYTV_WHATS_ON_MENU}
...                                        ${SKYTV_SUPPORT_MENU}    ${SKYTV_MY_ACCOUNT_MENU}    ${SKYTV_SEARCH_BAR}
...                                        ${SKYTV_CART_BUTTON}
${SKYTV_MAIN_MENU_CONTAINER}               jquery = .iop-header .container
${SKYTV_LOGO}                              jquery = .iop-icon-text:contains("SKY")
${SKYTV_WHATS_ON_MENU}                     jquery = #menu-desktop a:contains("Shop")
${SKYTV_SUPPORT_MENU}                      jquery = #menu-desktop a:contains("Support")
${SKYTV_MY_ACCOUNT_MENU}                   jquery = #menu-desktop a:contains("My Account")
${SKYTV_SEARCH_BAR}                        jquery = button.iop-search-suggest-button
${SKYTV_CART_BUTTON}                       jquery = .iop-icon-text:contains("Cart")
${SKYTV_SIGNIN_REGISTER_BUTTON}            jquery = .iop-auth-login a:contains("Sign In / Register"):eq(0)
${SKYTV_LOGOUT_BUTTON}                     jquery = .iop-auth-logout:contains("Sign Out"):eq(0)