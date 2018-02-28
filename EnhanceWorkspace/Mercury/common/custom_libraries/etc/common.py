from robot.libraries.BuiltIn import BuiltIn
from robot.api.deco import keyword
import re


class Common(object):

    """ General Library for Commonly Used Keywords

    = Keywords =

    | `Unselect All Checkboxes` | locator |
    | `Page Should Not Have Broken Images` |

    """

    ROBOT_LIBRARY_DOC_FORMAT = 'reST'
    ROBOT_LIBRARY_VERSION = '0.1'

    def __init__(self):
        self._robot = BuiltIn()
        self._selenium = self._robot.get_library_instance(
            'ExtendedSelenium2Library')

    def unselect_all_checkboxes(self, locator):
        """ Unselect all checkboxes that match the specified locator

        :param locator: Element locator
        :type locator: string
        """
        checkboxes = self._selenium.get_webelements(locator)
        for current_checkbox in checkboxes:
            self._selenium.unselect_checkbox(current_checkbox)

    def _match_message(self, log):
        return re.search(
            '(.*) \- ' +
            'Failed to load resource: the server responded with a status of ' +
            '(\d+) \((.*)\)',
            dict(log)['message'])

    def _filter_message(self, log):
        return self._match_message(log) is not None

    def _map_message(self, log):
        match = self._match_message(log)
        return {
          'url': match.group(1),
          'status_code': match.group(2),
          'status_msg': match.group(3)
        }

    @keyword('Get Resources That Failed To Load')
    def get_failed_resources(self):
        failed_logs = []
        logs = self._selenium.get_browser_logs()
        if logs and len(logs) > 0:
            failed_logs = map(
                self._map_message,
                filter(self._filter_message, logs)
                )

        return failed_logs

    def _is_image(self, log):
        img_extensions = ['.jpg', '.jpeg', '.gif', '.png', '.bmp', '.svg']
        return reduce(
            lambda previous,
            ext: log['url'].endswith(ext) or previous,
            img_extensions,
            False
            )

    @keyword('Page Should Not Have Broken Images')
    def check_broken_images(self):
        """ Checks all broken images in the current page
        """
        failed_logs = filter(self._is_image, self.get_failed_resources())
        if len(failed_logs) > 0:
            self._robot.fail(
                'Page has broken images: \n%s' % '\n'.join(
                    set(
                        ['url: %s status: %s' % (
                            log['url'], log['status_code'])
                            for log in failed_logs]
                        )
                    )
                )
