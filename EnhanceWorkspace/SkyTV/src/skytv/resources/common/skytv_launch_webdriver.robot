*** Variables ***
${SKYTV_BASE_URL}            https://www.sky.co.nz
${SKYTV_ACCESS_BASE_URL}     https://skyaccess.skytv.co.nz
${FIREFOX_PROFILE_DIR}       ${COMMON_DIR}${/}global_resources${/}firefoxprofile

*** Keywords ***
Browser For External Website Is Launched
    [Arguments]    ${p_urlExt}    ${p_browser}    ${p_alias}
    Setup Desired Capability
    Setup Password
    Run Keyword If    '${BROWSER}' == 'firefox'    Setup Server
    Run Keyword If    '${SERVER_IS_AWS}' == '1'
    ...    Open Browser    ${p_urlExt}    browser=${p_browser}    alias=${p_alias}
    ...    remote_url=${LOCALHOST}    desired_capabilities=${DESIRED_CAPABILITY}    ff_profile_dir=${FIREFOX_PROFILE_DIR}
    ...    ELSE IF    '${SERVER_IS_AWS}' == '0'
    ...    Open Browser    ${p_urlExt}    browser=${p_browser}    alias=${p_alias}
    Setup Browser Window Size
    #Maximize Browser Window
    Reload Page

Browser Is Open
    [Arguments]    ${p_urlExt}    ${p_browser}    ${p_alias}
    Setup Desired Capabilities    ${p_alias}
    ${t_iePrivateBrowser}=    Evaluate    '${BROWSER}'=='ie' and '${p_alias}'=='${ALIAS2}'
    Run Keyword If    '${SERVER_IS_AWS}' == '1' or '${t_iePrivateBrowser}'=='True'
    ...    Browser Is Launched    ${p_urlExt}    ${p_browser}    ${p_alias}    ${LOCALHOST}    ${DESIRED_CAPABILITY}
    ...    ELSE IF    '${SERVER_IS_AWS}' == '0'
    ...    Browser Is Launched    ${p_urlExt}    ${p_browser}    ${p_alias}    ${EMPTY}    ${EMPTY}

Launch Browser Setup
    [Documentation]    The following arguments are required for this keyword
    ...    ${p_urlExtension}    ${p_browser}    ${p_alias}    ${p_nativeEvents}
    [Arguments]    ${p_urlExtension}    ${p_browser}    ${p_alias}    ${p_nativeEvents}
    ...    ${p_keyword_1}=No Operation    ${p_keyword_2}=No Operation    ${p_keyword_3}=No Operation    ${p_keyword_4}=No Operation
    Run Keyword If    ${p_nativeEvents}
    ...    Setup Desired Capability Native True
    ...    ELSE    Setup Desired Capabilities    ${p_alias}
    ${t_iePrivateBrowser}=    Evaluate    '${BROWSER}'=='ie' and '${p_alias}'=='${ALIAS2}'
    Run Keyword If    '${SERVER_IS_AWS}' == '1' or '${t_iePrivateBrowser}'=='True'
    ...    Browser Is Launched    ${p_urlExtension}    ${p_browser}    ${p_alias}    ${LOCALHOST}    ${DESIRED_CAPABILITY}
    ...    ELSE IF    '${SERVER_IS_AWS}' == '0'    Browser Is Launched
    ...    ${p_urlExtension}    ${p_browser}    ${p_alias}    ${EMPTY}    ${EMPTY}
    Run Keywords    ${p_keyword_1}    ${p_keyword_2}    ${p_keyword_3}    ${p_keyword_4}

Launch SkyTV Home Page
    [Documentation]    This keyword can be used to launch browser on a test setup.
    ...   Note: This is a workaround!
    Browser Is Open    ${/}    ${BROWSER}    ${ALIAS1}

#===============================================#
#             INTERNAL KEYWORDS                 #
#===============================================#
Browser Is Launched
    [Arguments]    ${p_urlExt}    ${p_browser}    ${p_alias}    ${p_remoteUrl}    ${p_desiredCapability}
    Setup Global Timeout

    ${t_baseURLISSkyTV} =    Run Keyword And Return Status
    ...    Should Contain    ${SUITE DOCUMENTATION.lower()}    product:skytv
    ${t_baseURL} =    Set Variable If    ${t_baseURLISSkyTV}
    ...    SKYTV
    Set Global Variable    ${g_BASE_URL}    ${t_baseURL}

    Run Keyword If    ${HEADLESS}    Start Virtual Display    ${DESKTOP_BROWSER_WIDTH}    ${DESKTOP_BROWSER_HEIGHT}
    Run Keyword If    '${BROWSER}'=='chrome' and '${SERVER_IS_AWS}' == '1'   Open Chrome Browser Using Create Webdriver    ${p_urlExt}    ${p_alias}    ${p_remoteUrl}
    ...    ELSE IF    '${BROWSER}'=='chrome' and '${SERVER_IS_AWS}' == '0'    Open No Sandbox Chrome Browser    ${p_urlExt}    ${p_alias}
    ...    ELSE IF    '${BROWSER}'=='firefox'    Open Firefox Browser With Desired Capabilities    ${${g_BASE_URL}_BASE_URL}${p_urlExt}    ${p_alias}    ${p_remoteUrl}    ${p_desiredCapability}
    Run Keyword If    '${BROWSER}'=='chrome'    Get Chrome Test Environment Details
    Setup Browser Window Size
    #Maximize Browser Window
    Set Selenium Speed    .5

Open Chrome Browser Using Create Webdriver
    [Arguments]    ${p_urlExt}   ${p_alias}    ${p_remoteUrl}
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${options}    add_argument    --no-sandbox
    ${options} =    Call Method    ${options}    to_capabilities
    Create Webdriver    Remote    command_executor=${p_remoteUrl}    alias=${p_alias}    desired_capabilities=${options}
    # Create WebDriver    Chrome    alias=${p_alias}    chrome_options=${options}
    Go To    ${${g_BASE_URL}_BASE_URL}${p_urlExt}

Open No Sandbox Chrome Browser
    [Arguments]    ${p_urlExt}   ${p_alias}
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${options}    add_argument    --no-sandbox
    Create Webdriver    Chrome   alias=${p_alias}    chrome_options=${options}
    Go To    ${${g_BASE_URL}_BASE_URL}${p_urlExt}

Open Firefox Browser With Desired Capabilities
     [Arguments]    ${p_urlExt}    ${p_alias}    ${p_remoteUrl}    ${p_desiredCapability}
     Open Browser    ${${g_BASE_URL}_BASE_URL}${p_urlExt}    browser=firefox    alias=${p_alias}    remote_url=${p_remoteUrl}
    ...    desired_capabilities=${p_desiredCapability}    ff_profile_dir=${FIREFOX_PROFILE_DIR}

Remove AB Test Cookie
    Delete Cookie    ${BYPASS_GA_COOKIE}
    Reload Page

Set Browser Alias For User Type
    [Documentation]    Setting up of alias to a browser based on the
    ...    user type used in the test case
    : FOR    ${element}    IN    @{EMPLOYERS_LIST}
    \    ${t_containsValue} =    Run Keyword And Return Status
    ...    Should Contain    ${TESTNAME}    ${element}
    \    ${t_alias} =    Set Variable If    ${t_containsValue}    ${ALIAS1}
    \    Exit For Loop If    ${t_containsValue}
    ${t_alias} =    Set Variable If    '${t_containsValue}'=='False'    ${ALIAS2}
    Set Test Variable    ${tc_BROWSER_ALIAS}    ${t_alias}

Get Chrome Test Environment Details
    [Documentation]    This test is for logging the test environment details.
    ...    Note: this is currently for chrome browser only
    ${t_extendedS2Library} =    Get Library Instance    ExtendedSelenium2Library
    ${t_capabilities} =    Set Variable    ${t_extendedS2Library._current_browser().capabilities}
    Set Suite Documentation    [TEST ENVIRONMENT]:    append = True
    Set Suite Documentation    Chromedriver Version: ${t_capabilities['chrome']['chromedriverVersion']};    append = True
    Set Suite Documentation    Browser: ${t_capabilities['browserName']};    append = True
    Set Suite Documentation    Browser Version: ${t_capabilities['version']};    append = True
    Set Suite Documentation    Platform: ${t_capabilities['platform']};    append = True
    Log    Capabilities: ${t_capabilities}

#==============================#
#           SETTERS            #
#==============================#
Setup Server
    ${hasEnvVar} =    Run Keyword And Return Status    Get Environment Variable    AWS_ENABLED
    Run Keyword If    '${hasEnvVar}' == 'True'    Set Global Variable    ${SERVER_IS_AWS}    1
    # Run Keyword If    '${hasEnvVar}' == 'True'    Set Global Variable    ${SERVER_IS_AWS}    %{AWS_ENABLED}

Setup Browser Window Size
    Set Window Size    ${DESKTOP_BROWSER_WIDTH}    ${DESKTOP_BROWSER_HEIGHT}

Setup Global Timeout
    Run Keyword If    '${SKYTV_BASE_URL}'!='https://www.skytvforum.com'
    ...    Set Global Variable    ${TIMEOUT}    90 sec

Setup Desired Capabilities
    [Arguments]    ${p_alias}
    Setup Server
    Run Keyword If    '${BROWSER}' == 'firefox' or '${BROWSER}' == 'chrome'    Setup Desired Capabilities For Firefox
    ...    ELSE IF    '${BROWSER}'=='ie' and '${p_alias}'=='${ALIAS1}'    Setup Desired Capabilities For IE
    ...    ELSE IF    '${BROWSER}'=='ie' and '${p_alias}'=='${ALIAS2}'    Setup Desired Private Browsing Capabilities For IE

#==============================#
#           GETTERS            #
#==============================#
