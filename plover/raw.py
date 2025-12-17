LONGEST_KEY = 1

active = 0

def lookup(chord):
    global active
    chord = chord[0]
    if chord == 'RA*U':
        active = 0
        return '{plover:end_solo_dict}'
    if chord == '#RA*U':
        if active:
            active -= 1
            return '=undo'
        return '{#}'
    if chord == 'S*PS':
        active = 0
        return ' '
    s = "{^/" + chord + "}" if active else chord
    active += 1
    return s

