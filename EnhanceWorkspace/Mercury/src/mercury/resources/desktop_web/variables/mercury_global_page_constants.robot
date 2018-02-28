*** Variables ***
#=====================================================#
#           Mercury Global Navigation Elements
#=====================================================#
${MERCURY_LOGO}                                     id = logo
@{MERCURY_GLOBAL_NAVIGATION_CORE_ELEMENTS_LIST}     ${MERCURY_FOR_HOME_LINK}    ${MERCURY_ABOUT_LINK}
...                                                 ${MERCURY_FOR_BUSINESS_LINK}    ${MERCURY_INVESTORS_LINK}
...                                                 ${MERCURY_HELP_LINK}    ${MERCURY_MY_ACCOUNT_LINK}
${MERCURY_NAV_GLOBAL}                               css = .nav-global
${MERCURY_FOR_HOME_LINK}                            ${MERCURY_NAV_GLOBAL} a[href="/"]
${MERCURY_ABOUT_LINK}                               ${MERCURY_NAV_GLOBAL} a[href="/About"]
${MERCURY_FOR_BUSINESS_LINK}                        ${MERCURY_NAV_GLOBAL} a[href="/for-business"]
${MERCURY_INVESTORS_LINK}                           ${MERCURY_NAV_GLOBAL} a[href="/Investors"]
${MERCURY_HELP_LINK}                                ${MERCURY_NAV_GLOBAL} a[href="/Help"]
${MERCURY_MY_ACCOUNT_LINK}                          ${MERCURY_NAV_GLOBAL} a[href="https://myaccount.mercury.co.nz"]

#=====================================================#
#           Mercury Global Search Box Elements
#=====================================================#
${MERCURY_GLOBAL_PRIMARY_NAV}                       css = #nav-primary
${MERCURY_PRIMARY_SEARCH_BUTTON}                    ${MERCURY_GLOBAL_PRIMARY_NAV} button.search__overlay-toggle
${MERCURY_PRIMARY_SEARCH_SUBMIT_BUTTON}             ${MERCURY_GLOBAL_PRIMARY_NAV} button.search__overlay__submit

# Secondary Nav
${MERCURY_GLOBAL_SECONDARY_NAV}                     css = #nav-secondary
#=====================================================#
#           Mercury Global Footer Elements
#=====================================================#
@{MERCURY_GLOBAL_FOOTERS_CORE_ELEMENTS_LIST}    @{MERCURY_FOOTER_TOP_CORE_ELEMENTS_LIST}
...                                             @{MERCURY_FOOTER_SITEMAP_CORE_ELEMENTS_LIST}
...                                             @{MERCURY_FOOTER_DOWN_CORE_ELEMENTS_LIST}
# Footer Top
@{MERCURY_FOOTER_TOP_CORE_ELEMENTS_LIST}        ${MERCURY_FOOTER_BEE_LOGO}    ${MERCURY_FOOTER_CALL_EMAIL_US_LINK}
...
${MERCURY_FOOTER_TOP}                           jquery = .footer-top
${MERCURY_FOOTER_BEE_LOGO}                      ${MERCURY_FOOTER_TOP} .logo-bee
${MERCURY_FOOTER_CALL_EMAIL_US_LINK}            ${MERCURY_FOOTER_TOP} .footer-information .footer-call-or-email a.col-black
# SITEMAP
@{MERCURY_FOOTER_SITEMAP_CORE_ELEMENTS_LIST}    ${MERCURY_FOOTER_FOR_HOME_LINK}    ${MERCURY_FOOTER_PRICING_LINK}
...                                             ${MERCURY_FOOTER_PRODUCTS_LINK}    ${MERCURY_FOOTER_MOVING_LINK}
...                                             ${MERCURY_FOOTER_JOIN_LINK}    ${MERCURY_FOOTER_BUSINESS_LINK}
...                                             ${MERCURY_FOOTER_PRODUCTS_LINK}    ${MERCURY_FOOTER_BUSINESS_PARTNERS_LINK}
...                                             ${MERCURY_FOOTER_INVESTORS_LINK}    ${MERCURY_FOOTER_HELP_LINK}
...                                             ${MERCURY_FOOTER_ABOUT_LINK}    ${MERCURY_FOOTER_OUTAGES_FAULTS_LINK}
...                                             ${MERCURY_FOOTER_CAREERS_LINK}
${MERCURY_FOOTER_FOR_HOME_LINK}                 ${MERCURY_FOOTER_TOP} a[href="/"]
${MERCURY_FOOTER_PRICING_LINK}                  ${MERCURY_FOOTER_TOP} a[href="/Pricing"]
${MERCURY_FOOTER_PRODUCTS_LINK}                 ${MERCURY_FOOTER_TOP} a[href="/Products"]
${MERCURY_FOOTER_MOVING_LINK}                   ${MERCURY_FOOTER_TOP} a[href="/Moving-House"]
${MERCURY_FOOTER_JOIN_LINK}                     ${MERCURY_FOOTER_TOP} a[href="/Join"]
${MERCURY_FOOTER_BUSINESS_LINK}                 ${MERCURY_FOOTER_TOP} a[href="/For-Business"]
${MERCURY_FOOTER_PRODUCTS_LINK}                 ${MERCURY_FOOTER_TOP} a[href="/For-Business/Our-Products"]
${MERCURY_FOOTER_BUSINESS_PARTNERS_LINK}        ${MERCURY_FOOTER_TOP} a[href="/For-Business/Business-Partners"]
${MERCURY_FOOTER_INVESTORS_LINK}                ${MERCURY_FOOTER_TOP} a[href="/Investors"]:eq(1)
${MERCURY_FOOTER_HELP_LINK}                     ${MERCURY_FOOTER_TOP} a[href="/Help"]:eq(1)
${MERCURY_FOOTER_ABOUT_LINK}                    ${MERCURY_FOOTER_TOP} a[href="/About"]:eq(1)
${MERCURY_FOOTER_OUTAGES_FAULTS_LINK}           ${MERCURY_FOOTER_TOP} a[href="/Help/Outages-Faults"]:eq(1)
${MERCURY_FOOTER_CAREERS_LINK}                  ${MERCURY_FOOTER_TOP} a[href="/About/Careers"]
# Footer Down
@{MERCURY_FOOTER_DOWN_CORE_ELEMENTS_LIST}       ${MERCURY_FOOTER_SOCIALS}    ${MERCURY_FOOTER_PRIVACY_LINK}
...                                             ${MERCURY_FOOTER_TERMS_LINK}    ${MERCURY_FOOTER_FACEBOOK_LINK}
...                                             ${MERCURY_FOOTER_TWITTER_LINK}    ${MERCURY_FOOTER_INSTAGRAM_LINK}
...                                             ${MERCURY_FOOTER_INSTAGRAM_LINK}    ${MERCURY_FOOTER_YOUTUBE_LINK}
${MERCURY_FOOTER_DOWN}                          css = .footer-down
${MERCURY_FOOTER_SOCIALS}                       ${MERCURY_FOOTER_DOWN} .footer-socials
${MERCURY_FOOTER_PRIVACY_LINK}                  ${MERCURY_FOOTER_SOCIALS} a[href="/Privacy"]
${MERCURY_FOOTER_TERMS_LINK}                    ${MERCURY_FOOTER_SOCIALS} a[href="/Terms-Conditions"]
${MERCURY_FOOTER_FACEBOOK_LINK}                 ${MERCURY_FOOTER_SOCIALS} a[href="https://www.facebook.com/mercurynz"]
${MERCURY_FOOTER_TWITTER_LINK}                  ${MERCURY_FOOTER_SOCIALS} a[href="https://twitter.com/mercurynz"]
${MERCURY_FOOTER_INSTAGRAM_LINK}                ${MERCURY_FOOTER_SOCIALS} a[href="https://www.instagram.com/mercury_nz/"]
${MERCURY_FOOTER_YOUTUBE_LINK}                  ${MERCURY_FOOTER_SOCIALS} a[href="https://www.youtube.com/mercurynewzealand"]
# Copywrite
${MERCURY_FOOTER_COPYWRITE_LINK}                css = .footer-copyright

#=====================================================#
#           Mercury Global Chat Link
#=====================================================#
${MERCURY_CHAT_LINK}                            id = #sapIconLink

#=====================================================#
#           Mercury Home Page Elements
#=====================================================#
