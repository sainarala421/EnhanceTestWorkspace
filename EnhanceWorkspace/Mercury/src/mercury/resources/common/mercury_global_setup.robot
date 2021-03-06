*** Settings ***
Library           ExtendedSelenium2Library    timeout=60    block_until_page_ready=${false}    run_on_failure=Log Console Errors
Library           OperatingSystem
Library           Collections
Library           String
Library           DateTime
Library           XvfbRobot
Library           HttpLibrary.HTTP
Resource          ${GLOBAL_FILE_PATH}
Resource          ${COMMON_DIR}${/}global_resources${/}webdriver_config.robot
Resource          ${MERCURY_VARIABLE_DIR}mercury_global_constants.robot
Resource          ${MERCURY_VARIABLE_DIR}mercury_url_extension_constants.robot
Resource          mercury_global_helper.robot
Resource          mercury_launch_webdriver.robot
Resource          ${MERCURY_VARIABLE_DIR}mercury_url_extension_constants.robot

*** Keywords ***
Log Console Errors
    Capture Page Screenshot
    ${t_logs}=    Get Browser Logs
    ${t_logs}=    Remove Duplicates    ${t_logs}
    Log    ${t_logs}

