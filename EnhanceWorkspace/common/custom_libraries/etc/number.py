ROBOT_LIBRARY_DOC_FORMAT = 'reST'
ROBOT_LIBRARY_VERSION = '0.1'


def convert_to_ordinal_number(number):
    """ Convert given number to ordinal number

    :param number: Number that will be converted to ordinal number
    :type number: int

    :returns: Ordinal number of the given number
    :rtype: string

    """
    if int(number) < 0:
        raise ValueError('Ordinal cannot be a negative number')

    suffixes = {1: 'st', 2: 'nd', 3: 'rd'}
    number = int(number)
    if 10 <= number % 100 <= 20:
        suffix = 'th'
    else:
        suffix = suffixes.get(number % 10, 'th')
    return str(number) + suffix
