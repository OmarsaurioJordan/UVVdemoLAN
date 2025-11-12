// arg0: str entrante
// ret: solo letras, incluyendo ñ

var res = "";
var v;
for (var c = 1; c <= string_length(argument0); c++) {
    v = string_char_at(argument0, c);
    switch v {
        case "a": case "b": case "c": case "d":
        case "e": case "f": case "g": case "h":
        case "i": case "j": case "k": case "l":
        case "m": case "n": case "ñ": case "o":
        case "p": case "q": case "r": case "s":
        case "t": case "u": case "v": case "w":
        case "x": case "y": case "z":
        case "0": case "1": case "2": case "3": case "4":
        case "5": case "6": case "7": case "8": case "9":
            res += v;
            break;
        case "A": case "B": case "C": case "D":
        case "E": case "F": case "G": case "H":
        case "I": case "J": case "K": case "L":
        case "M": case "N": case "O":
        case "P": case "Q": case "R": case "S":
        case "T": case "U": case "V": case "W":
        case "X": case "Y": case "Z":
            res += string_lower(v);
            break;
        case "Ñ":
            res += "ñ";
            break;
    }
}
return res;

