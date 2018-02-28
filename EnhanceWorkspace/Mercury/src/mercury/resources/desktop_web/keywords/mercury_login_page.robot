*** Settings ***
Documentation     This resource file contains all elements/locators for testing mercury home page
Resource          ${MERCURY_VARIABLE_DIR}mercury_login_page_constants.robot

*** Keywords ***
#==============================================================#
#                         GIVEN
#==============================================================#

#==============================================================#
#                         WHEN
#==============================================================#
Use Inputs Login Credentials Username "${e_USERNAME}" And Password "${e_PASSWORD}"
    Input Text "${e_USERNAME}" On Field "${MERCURY_EMAIL_FIELD}"
    Input Text "${e_PASSWORD}" On Field "${MERCURY_PASSWORD_FIELD}"

#==============================================================#
#                         THEN
#==============================================================#
The "${e_USER_STATE}" Page Elements Should Be Displayed Successfully
    "Mercury Main Header" Should Be Loaded Successfully
    "Mercury Main Menu" Elements Should Be Loaded Successfully
    Run Keyword If    '${e_USER_STATE}' == 'Log In'
    ...    The "Mercury Logout Button" Should Be "Visible"
    ...    ELSE    The "Mercury SIgnin Register Button" Should Be "Visible"

#==============================================================#
#                    INTERNAL KEYWORDS
#==============================================================#
