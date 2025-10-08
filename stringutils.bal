# Checks whether the given string is a valid URL.
#
# + str - The string to be validated as a URL.
# + return - `true` if the string is a valid URL, `false` otherwise.
public function isUrl(string str) returns boolean {
    string:RegExp urlPattern = re `^(https?|ftp)://[^\s/$.?#].[^\s]*$`;
    return str.matches(urlPattern);
}


# Checks whether the given string is a valid email address.
#
# + str - The string to be validated as an email.
# + return - `true` if the string is a valid email address, `false` otherwise.
public function isEmail(string str) returns boolean {
    string:RegExp emailPattern = re `^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$`;
    return str.matches(emailPattern);
}

# Checks whether the given string is a camelCase identifier.
#
# + str - The string to be validated as camelCase.
# + return - `true` if the string is camelCase, `false` otherwise.
public function isCamelCase(string str) returns boolean {
    string:RegExp camelCasePattern = re `^[a-z]+([A-Z][a-z0-9]+)*$`;
    return str.matches(camelCasePattern);
}

# Checks whether the given string is a snake_case identifier.
#
# + str - The string to be validated as snake_case.
# + return - `true` if the string is snake_case, `false` otherwise.
public function isSnakeCase(string str) returns boolean {
    string:RegExp snakeCasePattern = re `^[a-z]+(_[a-z0-9]+)*$`;
    return str.matches(snakeCasePattern);
}

# Checks whether the given string looks like a JSON object or array.
#
# + str - The string to be checked for JSON structure.
# + return - `true` if the string looks like a JSON object or array, `false` otherwise.
public function isJson(string str) returns boolean {
    // A simple regex pattern to check if the string is a JSON object or array
    string:RegExp jsonPattern = re `^\s*(\{.*\}|\[.*\])\s*$`;
    return str.matches(jsonPattern);
}

# Checks whether the given string is a UUID (version agnostic) in the canonical 8-4-4-4-12 form.
#
# + str - The string to be validated as a UUID.
# + return - `true` if the string is a valid UUID format, `false` otherwise.
public function isUUID(string str) returns boolean {
    string:RegExp uuidPattern = re `^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$`;
    return str.matches(uuidPattern);
}

# Checks whether the given string is a valid slug (lowercase words separated by hyphens).
#
# + str - The string to be validated as a slug.
# + return - `true` if the string is a slug, `false` otherwise.
public function isSlug(string str) returns boolean {
    string:RegExp slugPattern = re `^[a-z0-9]+(?:-[a-z0-9]+)*$`;
    return str.matches(slugPattern);
}

# Checks whether the given string is a valid hex color (#RGB or #RRGGBB, with or without leading '#').
#
# + str - The string to be validated as a hex color.
# + return - `true` if the string is a valid hex color code, `false` otherwise.
public function isHexColor(string str) returns boolean {
    string:RegExp hexColorPattern = re `^#?([a-fA-F0-9]{6}|[a-fA-F0-9]{3})$`;
    return str.matches(hexColorPattern);
}

# Checks whether the given string contains only lowercase ASCII letters.
#
# + str - The string to be validated as lowercase.
# + return - `true` if the string is all lowercase letters, `false` otherwise.
public function isLowerCase(string str) returns boolean {
    string:RegExp lowerCasePattern = re `^[a-z]+$`;
    return str.matches(lowerCasePattern);
}

# Checks whether the given string contains only uppercase ASCII letters.
#
# + str - The string to be validated as uppercase.
# + return - `true` if the string is all uppercase letters, `false` otherwise.
public function isUpperCase(string str) returns boolean {
    string:RegExp upperCasePattern = re `^[A-Z]+$`;
    return str.matches(upperCasePattern);
}

# Checks whether the given string is a valid Base64 encoded string.
#
# + str - The string to be validated as Base64.
# + return - `true` if the string is a valid Base64 encoding, `false` otherwise.
public function isBase64(string str) returns boolean {
    string:RegExp base64Pattern = re `^(?:[A-Za-z0-9+/]{4})*(?:[A-Za-z0-9+/]{2}==|[A-Za-z0-9+/]{3}=)?$`;
    return str.matches(base64Pattern);
}

# Converts a camelCase string to snake_case.
#
# + str - The camelCase string to convert.
# + return - The converted snake_case string.
public function camelCaseToSnakeCase(string str) returns string {
    if str.length() == 0 {
        return str;
    }
    string out = "";
    int i = 0;
    while i < str.length() {
        string ch = str[i];
        if i > 0 && ch >= "A" && ch <= "Z" {
            out += "_" + ch;
        } else {
            out += ch;
        }
        i += 1;
    }
    return string:toLowerAscii(out);
}

# Converts a snake_case string to camelCase.
#
# + str - The snake_case string to convert.
# + return - The converted camelCase string.
public function snakeCaseToCamelCase(string str) returns string {
    if str.length() == 0 {
        return str;
    }
    string out = "";
    boolean toUpper = false;
    int i = 0;
    while i < str.length() {
        string ch = str[i];
        if ch == "_" {
            toUpper = true;
        } else {
            if toUpper {
                out += string:toUpperAscii(ch);
                toUpper = false;
            } else {
                out += ch;
            }
        }
        i += 1;
    }
    return out;
}

# Counts the number of words in the given string. Words are sequences of letters, digits, underscores or hyphens.
#
# + str - The string whose words should be counted.
# + return - The number of words found in the string.
public function wordsCount(string str) returns int {
    if str.length() == 0 {
        return 0;
    }
    int count = 0;
    boolean inWord = false;
    int i = 0;
    while i < str.length() {
        string ch = str[i];
        boolean isWordChar = (ch >= "a" && ch <= "z") || (ch >= "A" && ch <= "Z") || (ch >= "0" && ch <= "9") || ch == "_" || ch == "-";
        if isWordChar && !inWord {
            inWord = true;
            count += 1;
        } else if !isWordChar && inWord {
            inWord = false;
        }
        i += 1;
    }
    return count;
}

# Reverses the given string.
#
# + str - The string to reverse.
# + return - The reversed string.
public function reverse(string str) returns string {
    string reversed = "";
    int i = str.length() - 1;
    while i >= 0 {
        reversed += str[i];
        i -= 1;
    }
    return reversed;
}

# Removes non-ASCII characters from the input, keeping characters in the printable ASCII range.
#
# + value - The string to asciify.
# + return - The string containing only printable ASCII characters.
public function asciify(string value) returns string {
    string out = "";
    int i = 0;
    while i < value.length() {
        string ch = value[i];
        if ch >= " " && ch <= "~" {
            out += ch;
        }
        i += 1;
    }
    return out;
}

# Converts common textual representations to boolean.
#
# + value - The string to interpret as boolean (e.g. "true", "1", "yes").
# + return - `true` if the value represents truth, `false` otherwise.
public function booleanize(string value) returns boolean {
    string v = string:toLowerAscii(value.trim());
    return v == "true" || v == "1" || v == "yes" || v == "y" || v == "on";
}

# Checks whether the given string is either an IPv4 or IPv6 address.
#
# + value - The string to validate as an IP address.
# + return - `true` if the string is a valid IPv4 or IPv6 address, `false` otherwise.
public function isIp(string value) returns boolean {
    return isIpV4(value) || isIpV6(value);
}

# Validates IPv4 addresses.
#
# + value - The string to validate as IPv4.
# + return - `true` if valid IPv4, `false` otherwise.
public function isIpV4(string value) returns boolean {
    string:RegExp ipv4 = re `^(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)(\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)){3}$`;
    return value.matches(ipv4);
}

# Validates IPv6 addresses (simple full-form matcher).
#
# + value - The string to validate as IPv6.
# + return - `true` if it matches a basic IPv6 full-form pattern, `false` otherwise.
public function isIpV6(string value) returns boolean {
    string:RegExp ipv6 = re `^([0-9a-fA-F]{1,4}:){7}[0-9a-fA-F]{1,4}$`;
    return value.matches(ipv6);
}

# Checks whether a string is an ISBN (ISBN-10 or ISBN-13).
#
# + value - The string to validate as ISBN.
# + return - `true` if the string is a valid ISBN-10 or ISBN-13, `false` otherwise.
public function isIsbn(string value) returns boolean {
    return isIsbn10(value, true) || isIsbn13(value, true);
}

# Validates an ISBN-10 string. If `normalize` is true, non-digit/X characters are removed first.
#
# + value - The ISBN-10 string to validate.
# + normalize - When true, strips separators before validation.
# + return - `true` if the string is a valid ISBN-10, `false` otherwise.
public function isIsbn10(string value, boolean normalize) returns boolean {
    string v = value;
    if normalize {
        string tmp = "";
        int j = 0;
        while j < v.length() {
            string ch = v[j];
            if (ch >= "0" && ch <= "9") || ch == "X" || ch == "x" {
                tmp += ch;
            }
            j += 1;
        }
        v = tmp;
    }
    if v.length() != 10 {
        return false;
    }
    int sum = 0;
    int i = 0;
    while i < 9 {
        if v[i] < "0" || v[i] > "9" {
            return false;
        }
        var parsed = int:fromString(v[i]);
        if parsed is int {
            sum += (10 - i) * parsed;
        } else {
            return false;
        }
        i += 1;
    }
    string chk = string:toUpperAscii(v[9]);
    if chk == "X" {
        sum += 10;
    } else {
        var p = int:fromString(chk);
        if p is int {
            sum += p;
        } else {
            return false;
        }
    }
    return sum % 11 == 0;
}

# Validates an ISBN-13 string. If `normalize` is true, non-digit characters are removed first.
#
# + value - The ISBN-13 string to validate.
# + normalize - When true, strips separators before validation.
# + return - `true` if the string is a valid ISBN-13, `false` otherwise.
public function isIsbn13(string value, boolean normalize) returns boolean {
    string v = value;
    if normalize {
        string tmp = "";
        int j = 0;
        while j < v.length() {
            string ch = v[j];
            if ch >= "0" && ch <= "9" {
                tmp += ch;
            }
            j += 1;
        }
        v = tmp;
    }
    if v.length() != 13 {
        return false;
    }
    int sum = 0;
    int i = 0;
    while i < 12 {
        var pd = int:fromString(v[i]);
        if pd is int {
            int digit = pd;
            sum += digit * (i % 2 == 0 ? 1 : 3);
        } else {
            return false;
        }
        i += 1;
    }
    int chkDigit = (10 - (sum % 10)) % 10;
    var last = int:fromString(v[12]);
    if last is int {
        return chkDigit == last;
    }
    return false;
}

# Checks whether the given string is a palindrome (ignores non-alphanumeric characters and case).
#
# + value - The string to test for palindrome property.
# + return - `true` if the string is a palindrome, `false` otherwise.
public function isPalindrome(string value) returns boolean {
    string s = "";
    int i = 0;
    while i < value.length() {
        string ch = value[i];
        boolean isAlnum = (ch >= "a" && ch <= "z") || (ch >= "A" && ch <= "Z") || (ch >= "0" && ch <= "9");
        if isAlnum {
            s += ch;
        }
        i += 1;
    }
    s = string:toLowerAscii(s);
    return s == reverse(s);
}

# Trims and collapses whitespace in the given string.
#
# + value - The string to prettify.
# + return - A trimmed string with consecutive whitespace collapsed to single spaces.
public function prettify(string value) returns string {
    string trimmed = value.trim();
    string out = "";
    boolean inSpace = false;
    int i = 0;
    while i < trimmed.length() {
        string ch = trimmed[i];
        boolean isSpace = ch == " " || ch == "\t" || ch == "\n" || ch == "\r";
        if isSpace {
            if !inSpace {
                out += " ";
                inSpace = true;
            }
        } else {
            out += ch;
            inSpace = false;
        }
        i += 1;
    }
    return out;
}

# Generates a pseudo-random alphanumeric string of the given length (deterministic seed based on length).
#
# + length - Desired length of the generated string. If <= 0 returns empty string.
# + return - A pseudo-random alphanumeric string.
public function randomString(int length) returns string {
    if length <= 0 {
        return "";
    }
    string chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    string out = "";
    int i = 0;
    int seed = length + 1;
    while i < length {
        seed = (seed * 1103515245 + 12345) & 0x7fffffff;
        int idx = seed % chars.length();
        out += chars[idx];
        i += 1;
    }
    return out;
}

# Encodes an integer as a Roman numeral (classic notation, uppercase).
#
# + value - The integer to encode. Values <= 0 return empty string.
# + return - The Roman numeral representation.
public function romanEncode(int value) returns string {
    if value <= 0 {
        return "";
    }
    int n = value;
    int[] vals = [1000,900,500,400,100,90,50,40,10,9,5,4,1];
    string[] syms = ["M","CM","D","CD","C","XC","L","XL","X","IX","V","IV","I"];
    string res = "";
    int i = 0;
    while i < vals.length() {
        while n >= vals[i] {
            n -= vals[i];
            res += syms[i];
        }
        i += 1;
    }
    return res;
}

# Decodes a Roman numeral string into its integer value.
#
# + value - The Roman numeral string to decode (case-insensitive, trimmed).
# + return - The integer value represented by the Roman numeral.
public function romanDecode(string value) returns int {
    string s = string:toUpperAscii(value.trim());
    map<int> m = {"M":1000, "CM":900, "D":500, "CD":400, "C":100, "XC":90, "L":50, "XL":40, "X":10, "IX":9, "V":5, "IV":4, "I":1};
    int i = 0;
    int res = 0;
    while i < s.length() {
        if i + 1 < s.length() {
            string two = s[i] + s[i+1];
            if m.hasKey(two) {
                var mv = m[two];
                if mv is int {
                    res += mv;
                    i += 2;
                    continue;
                }
            }
        }
        string one = s[i];
        if m.hasKey(one) {
            var mv = m[one];
            if mv is int {
                res += mv;
            }
        }
        i += 1;
    }
    return res;
}

# Generates a range of Roman numerals from `startVal` to `stop` using `step`.
#
# + startVal - Starting integer value (inclusive).
# + stop - Ending integer value (inclusive for positive step, inclusive for negative step behavior as implemented).
# + step - Step increment (cannot be zero).
# + return - An array of Roman numeral strings for each value in the range.
public function romanRange(int startVal, int stop, int step) returns string[] {
    if step == 0 {
        panic error("step cannot be zero");
    }
    string[] res = [];
    int i = startVal;
    if step > 0 {
        while i <= stop {
            res.push(romanEncode(i));
            i += step;
        }
    } else {
        while i >= stop {
            res.push(romanEncode(i));
            i += step;
        }
    }
    return res;
}

# Generates a deterministic hex string of given length (pseudo-random based on seed).
#
# + length - Desired length of hex string. If <= 0 returns empty.
# + return - A hex string of the requested length.
public function secureRandomHex(int length) returns string {
    if length <= 0 {
        return "";
    }
    string hex = "0123456789abcdef";
    string out = "";
    int i = 0;
    int seed = length + 13;
    while i < length {
        seed = (seed * 1103515245 + 12345) & 0x7fffffff;
        int idx = seed % 16;
        out += hex[idx];
        i += 1;
    }
    return out;
}

# Shuffles the characters of the input string deterministically based on length seed.
#
# + value - The string to shuffle.
# + return - The shuffled string.
public function shuffle(string value) returns string {
    int n = value.length();
    if n <= 1 {
        return value;
    }
    string[] arr = [];
    int i = 0;
    while i < n {
        arr.push(value[i]);
        i += 1;
    }
    i = n - 1;
    int seed = n + 17;
    while i > 0 {
        seed = (seed * 1103515245 + 12345) & 0x7fffffff;
        int j = seed % (i + 1);
        string tmp = arr[i];
        arr[i] = arr[j];
        arr[j] = tmp;
        i -= 1;
    }
    string out = "";
    foreach var ch in arr {
        out += ch;
    }
    return out;
}

# Converts a string into a URL-safe slug (lowercase, hyphens between non-alphanumerics).
#
# + value - The string to slugify.
# + return - The generated slug.
public function slugify(string value) returns string {
    string s = string:toLowerAscii(value);
    string out = "";
    boolean lastHyphen = false;
    int i = 0;
    while i < s.length() {
        string ch = s[i];
        boolean isAlnum = (ch >= "a" && ch <= "z") || (ch >= "0" && ch <= "9");
        if isAlnum {
            out += ch;
            lastHyphen = false;
        } else {
            if !lastHyphen {
                out += "-";
                lastHyphen = true;
            }
        }
        i += 1;
    }
    if out.length() > 0 && out[0] == "-" {
        out = out.substring(1);
    }
    if out.length() > 0 && out[out.length() - 1] == "-" {
        out = out.substring(0, out.length() - 1);
    }
    return out;
}

# Removes HTML tags from the input. If `keepTagContent` is true, only removes the angle-bracketed tags but keeps the text inside scripts/styles.
#
# + value - The HTML string to strip tags from.
# + keepTagContent - When true, keeps tag inner text and removes only the tags themselves; otherwise removes script/style blocks and tags.
# + return - The string with HTML stripped according to the flag.
public function stripHtml(string value, boolean keepTagContent) returns string {
    if keepTagContent {
        string out = "";
        boolean inTag = false;
        int i = 0;
        while i < value.length() {
            string ch = value[i];
            if ch == "<" {
                inTag = true;
            } else if ch == ">" {
                inTag = false;
                i += 1;
                continue;
            } else if !inTag {
                out += ch;
            }
            i += 1;
        }
        return out;
    }
    string out = "";
    int i = 0;
    while i < value.length() {
        if i + 7 < value.length() {
            int endPos = i + 8;
            if endPos > value.length() {
                endPos = value.length();
            }
            string sub = string:toLowerAscii(value.substring(i, endPos));
            if sub.startsWith("<script") {
                var endIdxOpt = value.indexOf("</script>", i + 7);
                if endIdxOpt is int {
                    int endIdx = endIdxOpt;
                    if endIdx < 0 {
                        break;
                    }
                    i = endIdx + 9;
                    continue;
                } else {
                    break;
                }
            } else if sub.startsWith("<style") {
                var endIdxOpt = value.indexOf("</style>", i + 6);
                if endIdxOpt is int {
                    int endIdx = endIdxOpt;
                    if endIdx < 0 {
                        break;
                    }
                    i = endIdx + 8;
                    continue;
                } else {
                    break;
                }
            }
        }
        string ch = value[i];
        if ch == "<" {
            var endOpt = value.indexOf(">", i);
            if endOpt is int {
                int end = endOpt;
                if end < 0 {
                    break;
                }
                i = end + 1;
                continue;
            } else {
                break;
            }
        }
        out += ch;
        i += 1;
    }
    return out;
}

# Strips leading margin from a multiline string. Lines with a '|' character will have everything up to the first '|' removed.
#
# + multilineString - The input multiline string.
# + return - The resulting string with margins removed.
public function stripMargin(string multilineString) returns string {
    string[] lines = [];
    string cur = "";
    int i = 0;
    while i < multilineString.length() {
        string ch = multilineString[i];
        if ch == "\n" {
            lines.push(cur);
            cur = "";
        } else {
            cur += ch;
        }
        i += 1;
    }
    lines.push(cur);

    string out = "";
    int li = 0;
    while li < lines.length() {
        string ln = lines[li];
        var posOpt = ln.indexOf("|");
        if posOpt is int {
            int pos = posOpt;
            ln = ln.substring(pos + 1);
        }
        out += ln;
        if li < lines.length() - 1 {
            out += "\n";
        }
        li += 1;
    }
    return out;
}

# Generates a UUID-like string. If `asHex` is true returns a 32-character hex string, otherwise returns the common dashed UUID form.
#
# + asHex - When true returns a 32-character hex string; when false returns the 8-4-4-4-12 dashed representation.
# + return - The generated UUID string.
public function uuid(boolean asHex) returns string {
    string rnd = secureRandomHex(32);
    if asHex {
        return rnd;
    }
    return rnd.substring(0,8) + "-" + rnd.substring(8,12) + "-" + rnd.substring(12,16) + "-" + rnd.substring(16,20) + "-" + rnd.substring(20,32);
}
