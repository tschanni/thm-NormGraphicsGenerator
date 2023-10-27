def count_decimal_places(number):
    # convert number to string to extract decimal places
    number_str = str(number)
    
    # check if decimal point is present
    if '.' in number_str:
        # divide the string into integer and decimal part
        integer_part, decimal_part = number_str.split('.')
        decimal_part = decimal_part.replace('0', '')
        # return the length of the decimal part
        return len(decimal_part)
    else:
        # if no decimal point is present, return 0
        return 0
    
def replace_decimal_places(number):
    # convert number to string to extract decimal places
    number_str = str(number)
    # check if decimal point is present
    if '.' in number_str:
        integer_part, decimal_part = number_str.split('.')
        decimal_part = decimal_part.replace('0', '')
        if decimal_part == '':
            return integer_part
        else:
            return integer_part + '.' + decimal_part
    else:
        return number_str
    