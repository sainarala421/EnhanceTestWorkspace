*** Settings ***
Documentation     This resource file contains all elements/locators for testing skytv home page
Resource          ${SKYTV_VARIABLE_DIR}skytv_login_page_constants.robot

*** Keywords ***
#==============================================================#
#                         GIVEN
#==============================================================#

#==============================================================#
#                         WHEN
#==============================================================#
Use Inputs Login Credentials Username "${e_USERNAME}" And Password "${e_PASSWORD}"
    Input Text "${e_USERNAME}" On Field "${SKYTV_EMAIL_FIELD}"
    Input Text "${e_PASSWORD}" On Field "${SKYTV_PASSWORD_FIELD}"

#==============================================================#
#                         THEN
#==============================================================#
The "${e_USER_STATE}" Page Elements Should Be Displayed Successfully
    The "SkyTV Main Header" Elements Should Be Loaded Successfully
    The "SkyTV Main Menu" Elements Should Be Loaded Successfully
    Run Keyword If    '${e_USER_STATE}' == 'Log In'
    ...    The "SkyTV Logout Button" Should Be "Visible"
    ...    ELSE    The "SkyTV SIgnin Register Button" Should Be "Visible"

#==============================================================#
#                    INTERNAL KEYWORDS
#==============================================================#
