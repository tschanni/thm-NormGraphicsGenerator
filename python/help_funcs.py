import matplotlib.pyplot as plt

def count_decimal_places(number):
    # Konvertiere die Zahl in einen String, um die Nachkommastellen zu extrahieren
    number_str = str(number)
    
    # Überprüfe, ob ein Dezimalpunkt vorhanden ist
    if '.' in number_str:
        # Teile den String anhand des Dezimalpunkts
        integer_part, decimal_part = number_str.split('.')
        decimal_part = decimal_part.replace('0', '')
        # Gib die Anzahl der Nachkommastellen zurück
        return len(decimal_part)
    else:
        # Wenn kein Dezimalpunkt vorhanden ist, gibt es keine Nachkommastellen
        return 0
    
def replace_decimal_places(number):
    # Konvertiere die Zahl in einen String, um die Nachkommastellen zu extrahieren
    number_str = str(number)
    integer_part, decimal_part = number_str.split('.')
    decimal_part = decimal_part.replace('0', '')
    if decimal_part == '':
        return integer_part
    else:
        return integer_part + '.' + decimal_part
    