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
Resource          ${SKYTV_VARIABLE_DIR}skytv_global_constants.robot
Resource          ${SKYTV_VARIABLE_DIR}skytv_url_extension_constants.robot
Resource          skytv_global_helper.robot
Resource          skytv_launch_webdriver.robot
Resource          ${SKYTV_VARIABLE_DIR}skytv_url_extension_constants.robot

*** Keywords ***
Log Console Errors
    Capture Page Screenshot
    ${t_logs}=    Get Browser Logs
    ${t_logs}=    Remove Duplicates    ${t_logs}
    Log    ${t_logs}

