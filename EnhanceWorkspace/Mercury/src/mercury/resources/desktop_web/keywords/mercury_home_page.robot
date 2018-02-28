*** Settings ***
Documentation     This resource file contains all elements/locators for testing Mercury's home page
Resource          ${MERCURY_VARIABLE_DIR}mercury_home_page_constants.robot

*** Keywords ***
#==============================================================#
#                         GIVEN
#==============================================================#

#==============================================================#
#                         WHEN
#==============================================================#

#==============================================================#
#                         THEN
#==============================================================#
The Mercury Home Page Should Be Loaded Successfully
    The "Mercury Logo" Should Be "Visible"
    The "Mercury Global Navigation" Elements Should Be Loaded Successfully
    The "Mercury Global Primary Nav" Elements Should Be Loaded Successfully
    The "Mercury Global Footers" Elements Should Be Loaded Successfully

#==============================================================#
#                    INTERNAL KEYWORDS
#==============================================================#
