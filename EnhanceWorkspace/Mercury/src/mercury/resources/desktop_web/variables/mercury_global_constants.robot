*** Settings ***
Documentation    This file contains all the global variables available on Mercury Website

*** Variables ***
#=================================================#
#                Resource file paths              #
#=================================================#
${MERCURY_COMMONRESOURCES_FILEPATH}               ../resources/common_resources/
${MERCURY_PAGERESOURCES_FILEPATH}                 ../resources/page_resources/
${MERCURY_VARIABLES_FILEPATH}                     ../variables/

#=================================================#
#                Timeout and Wait                 #
#=================================================#
${TIMEOUT}                                     10x
${INTERVAL}                                    3 sec
${INTERNAL_TIMEOUT}                            10s
${INTERNAL_INTERVAL}                           2s

#=================================================#
#                Mercury Cookies                 #
#=================================================#
# Mercury Cookies
${MERCURY_LOGGEDIN_COOKIE}                         SC_LOGGED_IN
${MERCURY_USERID_COOKIE}                           ajs_user_id

#=================================================#
#                 Passwords                       #
#=================================================#
# Note this is temporary and not advisable to be put here
${MERCURY_GENERIC_PASSWORD}                        12345678

#=================================================#
#                Windows Size                     #
#=================================================#
${DESKTOP_BROWSER_HEIGHT}                        800
${DESKTOP_BROWSER_WIDTH}                         1024
${MOBILE_BROWSER_HEIGHT}                         640
${MOBILE_BROWSER_WIDTH}                          384
