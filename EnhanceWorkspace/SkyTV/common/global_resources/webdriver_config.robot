*** Variables ***
${BROWSER}              chrome
${PLATFORM}             WINDOWS
${VERSION}              57.0.1    # browser version only for firefox
${NATIVE_EVENTS}        ${false}
${LOCALHOST}            http://localhost:4444/wd/hub
${DESIRED_CAPABILITY}   Dynamic
${SERVER_IS_AWS}        0
${ALIAS1}               browser1
${ALIAS2}               browser2
${ENHANCE_EXT}       /
${ALERT_BEHAVIOUR}      dismiss
${HEADLESS}             False

*** Keywords ***
Setup Desired Capability
    Run Keyword If    '${BROWSER}'=='firefox' or '${BROWSER}'=='chrome'    Setup Desired Capabilities For Firefox

Setup Desired Capabilities For Firefox
    ${t_DefaultDC}=    Evaluate   sys.modules['selenium.webdriver'].DesiredCapabilities.FIREFOX    sys, selenium.webdriver
    ${DC}=   Copy Dictionary   ${t_DefaultDC}
    Set To Dictionary    ${DC}
    ...    platform=${PLATFORM}
    # ...    version=${VERSION}    # browser version is not required at this time
    ...    nativeEvents=${NATIVE_EVENTS}
    ...    unexpectedAlertBehaviour=${ALERT_BEHAVIOUR}
    Log    ${DC}
    Set Suite Variable    ${DESIRED_CAPABILITY}    ${DC}

Setup Desired Capability Native True
    ${DC}    Create Dictionary    browserName=${BROWSER}
    Set To Dictionary    ${DC}
    ...    platform=${PLATFORM}
    ...    version=${VERSION}
    ...    unexpectedAlertBehaviour=${ALERT_BEHAVIOUR}
    Log    ${DC}
    Set Suite Variable    ${DESIRED_CAPABILITY}    ${DC}

Setup Desired Private Browsing Capabilities For IE
    ${t_ieDefaultDC}=    Evaluate   sys.modules['selenium.webdriver'].DesiredCapabilities.INTERNETEXPLORER    sys, selenium.webdriver
    ${DC}=   Copy Dictionary   ${t_ieDefaultDC}
    Set To Dictionary    ${DC}
    ...    ie.forceCreateProcessApi=${true}
    ...    ie.browserCommandLineSwitches=-private
    Log    ${DC}
    Set Suite Variable    ${DESIRED_CAPABILITY}    ${DC}

Setup Desired Capabilities For IE
    ${t_ieDefaultDC}=    Evaluate   sys.modules['selenium.webdriver'].DesiredCapabilities.INTERNETEXPLORER    sys, selenium.webdriver
    Set Suite Variable    ${DESIRED_CAPABILITY}    ${t_ieDefaultDC}
