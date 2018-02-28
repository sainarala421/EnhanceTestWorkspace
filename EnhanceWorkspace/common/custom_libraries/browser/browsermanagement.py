from robot.libraries.BuiltIn import BuiltIn
# from PIL import Image
import time
import io
import os
import robot
from robot.api import logger
from Selenium2Library.keywords import _LoggingKeywords
from ExtendedSelenium2Library.keywords import ExtendedJavascriptKeywords

seleniumExtended = BuiltIn().get_library_instance('ExtendedSelenium2Library')

retry_count = 10
seleniumExtended.screenshot_root_directory = None
seleniumExtended._chrome_screenshot_index = 0

def navigate_to(expected_url):


    """Navigates the active browser instance to the provided url.
    The loop should handle relaunching of the URL if
    there's a performance issue."""

    seleniumExtended._info("Opening url '%s'." % expected_url)
    seleniumExtended._current_browser().get(expected_url)
    for num in range(1, retry_count):
        current_url = seleniumExtended.get_location()
        if expected_url in current_url:
            break
        else:
            seleniumExtended._current_browser().get(expected_url)
            seleniumExtended._info("Iterates launching of URL because "
            "location should have contained '%s' "
            "but it was '%s'" % (expected_url, current_url))
    if not expected_url in current_url:
        raise AssertionError("Location should have contained '%s' "
            "but it was '%s'" % (expected_url, current_url))


# def capture_full_page_screenshot(filename=None):

#     """Workaround for capturing the whole page screenshot by stitching screen
#     captured images upon scrolling the page.

#     Note: This keyword only works in chrome and should only be used
#     in chrome browsers.
#     Reference: https://snipt.net/restrada/python-selenium-workaround
#     -for-full-page-screenshot-using-chromedriver-2x
#     """
#     if not filename:
#         seleniumExtended._chrome_screenshot_index += 1
#         filename = 'selenium-full-page-screenshot-%d.png' % seleniumExtended._chrome_screenshot_index
#     else:
#         filename = filename.replace('/', os.sep)

#     screenshotDir = seleniumExtended._get_screenshot_directory()
#     logDir = seleniumExtended._get_log_dir()
#     path = os.path.join(screenshotDir, filename)
#     link = robot.utils.get_link_path(path, logDir)

#     seleniumExtended._current_browser().set_window_size(1024, 800)
#     seleniumExtended._current_browser().execute_script("window.scrollTo(0, 0);")
#     total_width = seleniumExtended._current_browser().execute_script("return document.body.offsetWidth")
#     total_height = seleniumExtended._current_browser().execute_script("return document.body.parentNode.scrollHeight")
#     viewport_width = seleniumExtended._current_browser().execute_script("return document.body.clientWidth")
#     viewport_height = seleniumExtended._current_browser().execute_script("return window.innerHeight")
#     rectangles = [(min(j, total_width - viewport_width), min(i, total_height - viewport_height))
#         for i in range(0, total_height, viewport_height)
#         for j in range(0, total_width, viewport_width)]
#     stitched_image = Image.new('RGB', (total_width, total_height))

#     for rectangle in rectangles:
#         seleniumExtended._current_browser().execute_script("window.scrollTo({0}, {1})".format(rectangle[0], rectangle[1]))
#         time.sleep(0.01)
#         screenshot = Image.open(io.BytesIO(seleniumExtended._current_browser().get_screenshot_as_png()))
#         stitched_image.paste(screenshot, rectangle)
#         stitched_image.save(path)

#     seleniumExtended._current_browser().execute_script("window.scrollTo(0, 0);")

#     if hasattr(seleniumExtended._current_browser(), 'get_screenshot_as_file'):
#         if not path:
#             raise RuntimeError('Failed to save screenshot ' + filename)
#     else:
#         if not seleniumExtended._current_browser().save_screenshot(path):
#             raise RuntimeError('Failed to save screenshot ' + filename)
#     seleniumExtended._html('</td></tr><tr><td colspan="3"><a href="%s">'
#             '<img src="%s" width="800px"></a>' % (link, link))

def get_console_errors():

    """ Gets all JS errors on the browser and captures a screenshot of the page.
    It will only work on chrome. This method should also close all
    open browsers
    """
    logs = seleniumExtended._current_browser().get_log('browser')
    seleniumExtended._log(logs)
    seleniumExtended.capture_page_screenshot()
