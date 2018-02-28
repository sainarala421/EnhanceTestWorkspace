from datetime import datetime
import logging
from robot.libraries.BuiltIn import BuiltIn

string_lib = BuiltIn().get_library_instance('String')

# MD5 hash for Selenium. Adding this to project/contest names
# should exclude them from the search result
MD5 = 'fe2512f2ce74c5b64d3eb061766f76c0'


class TestData:

    def generate_test_project_title(self):
        """Returns project title using MD5 hash and formatted local datetime."""

        current_datetime = self._get_formatted_current_local_datetime()
        return MD5 + ' ' + current_datetime

    def generate_test_username(self):
        """Returns username with formatted local datetime.
        'T' prefix indicates that it's a testdata."""

        current_datetime = self._get_formatted_current_local_datetime()[:15]
        logging.info("Formatted Datetime is %s" % current_datetime)
        return 'T'+current_datetime

    def generate_test_email(self):
        """Returns email with formatted local datetime with randrom string
        to make it unique."""

        current_datetime = self._get_formatted_current_local_datetime()
        random_string = string_lib.generate_random_string(8, '[NUMBERS][LETTERS]')
        return 'testuser'+current_datetime+random_string+'@mercury.com'

    def _get_formatted_current_local_datetime(self):
        current_local_datetime = datetime.now()
        current_datetime_stripped = current_local_datetime.strftime('%y%m%d%H%M%S%f')
        return current_datetime_stripped
