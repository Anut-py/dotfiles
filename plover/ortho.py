import re

left_strokes = {
    "PW": "b",
    "K": "c",
    "TK": "d",
    "TP": "f",
    "TKPW": "g",
    "H": "h",
    "SKWR": "j",
    "KPW": "k",
    "HR": "l",
    "PH": "m",
    "TPH": "n",
    "P": "p",
    "KW": "qu",
    "KWR": "q",
    "R": "r",
    "S": "s",
    "T": "t",
    "SR": "v",
    "W": "w",
    "KP": "x",
    "KWH": "y",
    "STKPW": "z",

    "SH": "sh",
    "SKH": "sch",
    "TH": "th",
    "KH": "ch",
    "TPW": "ph",
    "WH": "wh",

    "PHR": "pl",
    "PR": "pr",
    "TR": "tr",
    "TW": "tw",
    "KHR": "cl",
    "KPWHR": "kl",
    "KR": "cr",
    "KPWR": "kr",
    "PWHR": "bl",
    "PWR": "br",
    "TKR": "dr",
    "TKW": "dw",
    "TKPWHR": "gl",
    "TKPWR": "gr",
    "TPHR": "fl",
    "TPWHR": "phl",
    "TPR": "fr",
    "TPWR": "phr",
    "THR": "thr",
    "SWHR": "shr",

    "ST": "st",
    "SP": "sp",
    "SHR": "sl",
    "SK": "sc",
    "SKPW": "sk",
    "SPH": "sm",
    "STPH": "sn",
    "STP": "sf",
    "STPW": "sph",

    "SPHR": "spl",
    "SPR": "spr",
    "STR": "str",
    "SKR": "scr",
    "SKPWR": "skr",
    "SKW": "squ",

    "": "",
}

# (none), #, -F, #-F
vowel_strokes = {
    "A": ("_a_", "a_a_", "_a_a", "_a_e"),
    "O": ("_o_", "o_o_", "_o_o", "_o_e"),
    "*": ("_i_", "i_i_", "_i_i", "_i_e"),
    "E": ("_e_", "e_e_", "_e_e", "e_a_"),
    "U": ("_u_", "u_u_", "_u_u", "_u_e"),

    "AEU": ("_a_y", "_a_ey", "_e_y", "_e_ey"),
    "OEU": ("_o_y", "_o_ey", "_u_y", "_u_ey"),
    "*EU": ("_i_y", "_i_ey", "_iew_", "_ie_e"),

    "AO": ("_oa_", "_o_a", "_ao_", "_a_o"),
    "OE": ("_oe_", "o_e_", "_eo_", "_e_o"),
    "AE": ("_ae_", "a_e_", "_ea_", "_e_a"),
    "EU": ("_y_", "_oo_", "_ee_", "__"),
    "OU": ("_ou_", "_ow_", "_uo_", "_wo_"),

    "": ("__", "__", "__", "__"),
}

right_strokes = {
    "B": "b",
    "SZ": "c",
    "D": "d",
    "BLS": "f",
    "LGTS": "g",
    "PBLG": "j",
    "GTS": "k",
    "GTD": "ck",
    "L": "l",
    "PL": "m",
    "PB": "n",
    "G": "ing",
    "PBG": "ning",
    "PBLGTS": "ng",
    "P": "p",
    "R": "r",
    "S": "s",
    "T": "t",
    "PGT": "v",
    "GSZ": "x",
    "Z": "z",

    "TD": "th",
    "RTD": "rth",

    "": "",
}

special = {
    ("S", "", "P"): "{^ ^}",
    ("TPH", "", "D"): "=undo",
    ("", "O*E", "RT"): "{plover:end_solo_dict}",  # "ortho"
}

LONGEST_KEY = 1

def lookup(key: tuple[str]):
    assert len(key) <= LONGEST_KEY

    pattern = r"(#?)(S?T?K?P?W?H?R?)(-|A?O?\*?E?U?)(F?)(R?P?B?L?G?T?S?D?Z?)"
    match = re.search(pattern, key[0])

    if not match:
        raise KeyError

    left = match.group(2)
    vowel = match.group(3).replace("-", "")
    hs = match.group(1) == "#"
    f = match.group(4) == "F"
    right = match.group(5)

    keyt = (left, vowel, right)
    if keyt in special:
        return special[keyt]

    if (left not in left_strokes) or \
            (right not in right_strokes) or \
            (vowel not in vowel_strokes):
        raise KeyError

    idx = (3 if hs else 2) if f else (1 if hs else 0)
    return "{^}" + vowel_strokes[vowel][idx].replace("_", left_strokes[left], 1).replace("_", right_strokes[right])
