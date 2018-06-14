package co.nz.enhanceconsulting.globalvariables;

import java.io.File;

/**
 * @author Francis John Agunday
 *
 * Global Variable Utility Class
 *
 */
public class GlobalVARS{
    // browser defaults
    public static final String BROWSER = "chrome";
    public static final String PLATFORM = "OSX";
    public static final String ENVIRONMENT = "local";
    public static String DEF_BROWSER = null;
    public static String DEF_PLATFORM = null;
    public static String DEF_ENVIRONMENT = null;

    // suite folder defaults
    public static String SUITE_NAME = null;
    public static final String TARGET_URL = "http://www.practiceselenium.com/";
    public static String propFile = "src/test/java/co/nz/enhanceconsulting/popertiesfiles/selenium.properties";
    public static final String SE_PROPS = new File(propFile).getAbsolutePath();
    public static final String TEST_OUTPUT_PATH = "src/test/artifacts/testoutputs";
    public static final String LOGFILE_PATH = TEST_OUTPUT_PATH + "src/test/artifacts/logs";
    public static final String REPORT_PATH = TEST_OUTPUT_PATH + "src/test/artifacts/reports";
    public static final String REPORT_CONFIG_FILE = "src/test/java/co/nz/enhanceconsulting/configfiles/extent-config.xml";

    // suite timeout defaults
    public static final int TIMEOUT_MINUTE = 60;
    public static final int TIMEOUT_ELEMENT = 10;

    // test data
    private static final String DATA_FILE = "src/test/resources/testdata/PassionTeaCo.json";
}
