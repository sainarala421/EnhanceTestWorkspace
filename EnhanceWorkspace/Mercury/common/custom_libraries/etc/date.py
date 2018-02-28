import datetime
import re
from dateutil.relativedelta import relativedelta
from .number import convert_to_ordinal_number


class Date:

    """ General Library for Manipulating Dates

    = Keywords =

    | `Get Next Weekday` | Day Name | Date=None |

    """

    ROBOT_LIBRARY_DOC_FORMAT = 'reST'
    ROBOT_LIBRARY_VERSION = '0.1'

    WEEKDAYS = [
        'Monday',
        'Tuesday',
        'Wednesday',
        'Thursday',
        'Friday',
        'Saturday',
        'Sunday']
    WEEKDAYS.extend([day[:3] for day in WEEKDAYS])

    def get_next_week_day(self, day_name, result_format='%Y-%m-%d', today=None):
        """ Get the date of the next weekday after a specified date

        :param day_name: English name of the target weekday (e.g. 'Mon', 'Tue')
        :type day_name: string

        :param today: Reference date. Defaults to today
        :type today: date

        :param result_format: Format for the returned date. Must be compatible with
                       date.strftime(). Defaults to '%Y-%m-%d'
                       Additionally '%o' may be used as a format code to
                       convert date to an ordinal number
        :type format: string

        :returns: A date string indicating the date of the next week day
        :rtype: string
        """
        weekday = self._get_week_day_from_name(day_name)

        if today is None:
            today = datetime.date.today()
        else:
            today = datetime.datetime.strptime(today, '%Y-%m-%d').date()

        target_date = today + relativedelta(days=+1, weekday=weekday)

        # Match any %o that is not preceeded by %
        regex = re.compile('(?<!\%)\%o')
        if regex.search(result_format):
            result_format = regex.sub(
                convert_to_ordinal_number(target_date.day),
                result_format
            )

        return target_date.strftime(result_format)

    def _get_week_day_from_name(self, name):
        try:
            return self.WEEKDAYS.index(name) % 7
        except ValueError:
            raise ValueError(
                'Invalid day name. Must be one of Sun, Sunday, Mon, Monday, etc.')
