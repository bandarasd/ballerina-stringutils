import ballerina/test;

// Email validation tests
@test:Config {}
function testIsEmail() {
    test:assertTrue(isEmail("test@example.com"), "Valid email should return true");
    test:assertTrue(isEmail("user.name+tag@example.co.uk"), "Email with special chars should be valid");
    test:assertFalse(isEmail("invalid-email"), "String without @ should be invalid");
    test:assertFalse(isEmail("@example.com"), "Email without local part should be invalid");
    test:assertFalse(isEmail("test@"), "Email without domain should be invalid");
    test:assertFalse(isEmail("test@.com"), "Email with empty domain part should be invalid");
    test:assertFalse(isEmail(""), "Empty string should be invalid");
}

// URL validation tests
@test:Config {}
function testIsUrl() {
    test:assertTrue(isUrl("http://example.com"), "Basic HTTP URL should be valid");
    test:assertTrue(isUrl("https://sub.example.com/path?query=1"), "Complex HTTPS URL should be valid");
    test:assertTrue(isUrl("ftp://example.com:21/path"), "FTP URL with port should be valid");
    test:assertFalse(isUrl("invalid-url"), "Invalid URL format should return false");
    test:assertFalse(isUrl("http://"), "Incomplete URL should be invalid");
    test:assertFalse(isUrl(""), "Empty string should be invalid");
}

// CamelCase validation tests
@test:Config {}
function testIsCamelCase() {
    test:assertTrue(isCamelCase("camelCaseExample"), "Valid camelCase should return true");
    test:assertTrue(isCamelCase("abc"), "Single word lowercase should be valid");
    test:assertFalse(isCamelCase("NotCamelCase"), "PascalCase should be invalid");
    test:assertFalse(isCamelCase("invalid_case"), "Snake case should be invalid");
    test:assertFalse(isCamelCase(""), "Empty string should be invalid");
}

// SnakeCase validation tests
@test:Config {}
function testIsSnakeCase() {
    test:assertTrue(isSnakeCase("snake_case_example"), "Valid snake_case should return true");
    test:assertTrue(isSnakeCase("abc"), "Single word should be valid");
    test:assertFalse(isSnakeCase("notSnakeCase"), "CamelCase should be invalid");
    test:assertFalse(isSnakeCase("Invalid_Case"), "Capital letters should be invalid");
    test:assertFalse(isSnakeCase(""), "Empty string should be invalid");
}

// JSON validation tests
@test:Config {}
function testIsJson() {
    test:assertTrue(isJson("{}"), "Empty object should be valid");
    test:assertTrue(isJson("[]"), "Empty array should be valid");
    test:assertTrue(isJson("  {\"key\": \"value\"}  "), "Object with whitespace should be valid");
    test:assertFalse(isJson("not json"), "Plain text should be invalid");
    test:assertFalse(isJson("{"), "Incomplete JSON should be invalid");
    test:assertFalse(isJson(""), "Empty string should be invalid");
}

// UUID validation tests
@test:Config {}
function testIsUUID() {
    test:assertTrue(isUUID("550e8400-e29b-41d4-a716-446655440000"), "Valid UUID should return true");
    test:assertFalse(isUUID("not-a-uuid"), "Invalid format should return false");
    test:assertFalse(isUUID("550e8400"), "Incomplete UUID should be invalid");
    test:assertFalse(isUUID(""), "Empty string should be invalid");
}

// Slug validation tests
@test:Config {}
function testIsSlug() {
    test:assertTrue(isSlug("this-is-a-slug"), "Valid slug should return true");
    test:assertTrue(isSlug("123-456"), "Numbers should be valid");
    test:assertFalse(isSlug("Not-A-Slug"), "Capital letters should be invalid");
    test:assertFalse(isSlug("invalid__slug"), "Double separators should be invalid");
    test:assertFalse(isSlug(""), "Empty string should be invalid");
}

// Hex color validation tests
@test:Config {}
function testIsHexColor() {
    test:assertTrue(isHexColor("#fff"), "3-digit hex should be valid");
    test:assertTrue(isHexColor("#000000"), "6-digit hex should be valid");
    test:assertTrue(isHexColor("fff"), "3-digit hex without # should be valid");
    test:assertFalse(isHexColor("#xyz"), "Invalid characters should be invalid");
    test:assertFalse(isHexColor(""), "Empty string should be invalid");
}

// Case validation tests
@test:Config {}
function testIsLowerCase() {
    test:assertTrue(isLowerCase("abc"), "Lowercase letters should be valid");
    test:assertFalse(isLowerCase("Abc"), "Capital letters should be invalid");
    test:assertFalse(isLowerCase(""), "Empty string should be invalid");
}

@test:Config {}
function testIsUpperCase() {
    test:assertTrue(isUpperCase("ABC"), "Uppercase letters should be valid");
    test:assertFalse(isUpperCase("aBC"), "Lowercase letters should be invalid");
    test:assertFalse(isUpperCase(""), "Empty string should be invalid");
}

// Base64 validation tests
@test:Config {}
function testIsBase64() {
    test:assertTrue(isBase64("SGVsbG8="), "Valid Base64 should return true");
    test:assertTrue(isBase64("SGVsbG8gd29ybGQ="), "Longer Base64 should be valid");
    test:assertFalse(isBase64("Invalid!"), "Invalid chars should return false");
    test:assertTrue(isBase64(""), "Empty string should be valid in Base64");
}

// Case conversion tests
@test:Config {}
function testCamelCaseToSnakeCase() {
    test:assertEquals(camelCaseToSnakeCase("camelCaseExample"), "camel_case_example");
    test:assertEquals(camelCaseToSnakeCase("anotherExampleTest"), "another_example_test");
    test:assertEquals(camelCaseToSnakeCase(""), "", "Empty string should return empty");
    test:assertEquals(camelCaseToSnakeCase("alreadylowercase"), "alreadylowercase");
}

@test:Config {}
function testSnakeCaseToCamelCase() {
    test:assertEquals(snakeCaseToCamelCase("snake_case_example"), "snakeCaseExample");
    test:assertEquals(snakeCaseToCamelCase("another_test"), "anotherTest");
    test:assertEquals(snakeCaseToCamelCase(""), "", "Empty string should return empty");
    test:assertEquals(snakeCaseToCamelCase("alreadylowercase"), "alreadylowercase");
}

// Word counting tests
@test:Config {}
function testWordsCount() {
    test:assertEquals(wordsCount("Hello world! This is a test."), 6);
    test:assertEquals(wordsCount("One-word"), 1);
    test:assertEquals(wordsCount(""), 0, "Empty string should return 0");
    test:assertEquals(wordsCount("   "), 0, "Whitespace only should return 0");
    test:assertEquals(wordsCount("word1 word2_word3"), 2); // word2_word3 is one word due to underscore
}

// String reversal test
@test:Config {}
function testReverse() {
    test:assertEquals(reverse("hello"), "olleh");
    test:assertEquals(reverse(""), "", "Empty string should return empty");
    test:assertEquals(reverse("a"), "a", "Single char should return same");
}

// ASCII filtering tests
@test:Config {}
function testAsciify() {
    test:assertEquals(asciify("Hello©World"), "HelloWorld");
    test:assertEquals(asciify(""), "", "Empty string should return empty");
    test:assertEquals(asciify("Plain ASCII"), "Plain ASCII", "ASCII should be unchanged");
}

// Boolean conversion tests
@test:Config {}
function testBooleanize() {
    test:assertTrue(booleanize("true"));
    test:assertTrue(booleanize("1"));
    test:assertTrue(booleanize("yes"));
    test:assertTrue(booleanize("Y"));
    test:assertFalse(booleanize("false"));
    test:assertFalse(booleanize(""));
    test:assertFalse(booleanize("anything else"));
}

// IP address validation tests
@test:Config {}
function testIsIp() {
    test:assertTrue(isIp("192.168.1.1"), "Valid IPv4 should return true");
    test:assertTrue(isIp("2001:0db8:85a3:0000:0000:8a2e:0370:7334"), "Valid IPv6 should return true");
    test:assertFalse(isIp("256.1.2.3"), "Invalid IPv4 should return false");
    test:assertFalse(isIp(""), "Empty string should be invalid");
}

@test:Config {}
function testIsIpV4() {
    test:assertTrue(isIpV4("192.168.1.1"), "Valid IPv4 should return true");
    test:assertTrue(isIpV4("0.0.0.0"), "Zero IPv4 should be valid");
    test:assertFalse(isIpV4("256.1.2.3"), "Invalid octet should return false");
    test:assertFalse(isIpV4("1.2.3"), "Incomplete IP should be invalid");
}

@test:Config {}
function testIsIpV6() {
    test:assertTrue(isIpV6("2001:0db8:85a3:0000:0000:8a2e:0370:7334"), "Valid IPv6 should return true");
    test:assertFalse(isIpV6("2001:0db8"), "Incomplete IPv6 should be invalid");
    test:assertFalse(isIpV6(""), "Empty string should be invalid");
}

// ISBN validation tests
@test:Config {}
function testIsIsbn() {
    test:assertTrue(isIsbn("0-7475-3269-9"), "Valid ISBN-10 should return true");
    test:assertTrue(isIsbn("978-0-7475-3269-9"), "Valid ISBN-13 should return true");
    test:assertFalse(isIsbn("0-7475-3269-X"), "Invalid check digit should return false");
    test:assertFalse(isIsbn(""), "Empty string should be invalid");
}

@test:Config {}
function testIsIsbn10() {
    test:assertTrue(isIsbn10("0-7475-3269-9", true), "Valid ISBN-10 with separators should be valid");
    test:assertTrue(isIsbn10("0747532699", false), "Valid ISBN-10 without separators should be valid");
    test:assertFalse(isIsbn10("0-7475-3269", true), "Incomplete ISBN should be invalid");
}

@test:Config {}
function testIsIsbn13() {
    test:assertTrue(isIsbn13("978-0-7475-3269-9", true), "Valid ISBN-13 with separators should be valid");
    test:assertTrue(isIsbn13("9780747532699", false), "Valid ISBN-13 without separators should be valid");
    test:assertFalse(isIsbn13("978-0-7475-3269", true), "Incomplete ISBN should be invalid");
}

// Palindrome testing
@test:Config {}
function testIsPalindrome() {
    test:assertTrue(isPalindrome("A man a plan a canal Panama"), "Valid palindrome should return true");
    test:assertFalse(isPalindrome("race a car"), "Invalid palindrome should return false");
    test:assertTrue(isPalindrome(""), "Empty string should be palindrome");
    test:assertTrue(isPalindrome("a"), "Single char should be palindrome");
}


// String prettification tests
@test:Config {}
function testPrettify() {
    test:assertEquals(prettify("  hello   world  "), "hello world");
    test:assertEquals(prettify("\thello\nworld\r"), "hello world");
    test:assertEquals(prettify(""), "", "Empty string should return empty");
}

// Roman numeral tests
@test:Config {}
function testRomanEncode() {
    test:assertEquals(romanEncode(1), "I");
    test:assertEquals(romanEncode(4), "IV");
    test:assertEquals(romanEncode(9), "IX");
    test:assertEquals(romanEncode(1994), "MCMXCIV");
    test:assertEquals(romanEncode(0), "", "Zero should return empty string");
}

@test:Config {}
function testRomanDecode() {
    test:assertEquals(romanDecode("I"), 1);
    test:assertEquals(romanDecode("IV"), 4);
    test:assertEquals(romanDecode("IX"), 9);
    test:assertEquals(romanDecode("MCMXCIV"), 1994);
    test:assertEquals(romanDecode(""), 0, "Empty string should return 0");
}

@test:Config {}
function testRomanRange() {
    test:assertEquals(romanRange(1, 3, 1), ["I", "II", "III"]);
    test:assertEquals(romanRange(3, 1, -1), ["III", "II", "I"]);
    test:assertEquals(romanRange(1, 1, 1), ["I"]);
}

// String generation tests
@test:Config {}
function testRandomString() {
    string s1 = randomString(10);
    string s2 = randomString(10);
    test:assertEquals(s1.length(), 10, "Length should match requested");
    test:assertEquals(s2.length(), 10, "Length should match requested");
    test:assertEquals(randomString(0), "", "Zero length should return empty");
}

@test:Config {}
function testSecureRandomHex() {
    string h1 = secureRandomHex(10);
    string h2 = secureRandomHex(10);
    test:assertEquals(h1.length(), 10, "Length should match requested");
    test:assertEquals(h2.length(), 10, "Length should match requested");
    test:assertEquals(secureRandomHex(0), "", "Zero length should return empty");
}

// String manipulation tests
@test:Config {}
function testShuffle() {
    test:assertEquals(shuffle("").length(), 0, "Empty string should return empty");
    test:assertEquals(shuffle("a"), "a", "Single char should return same");
    string s = "hello";
    string shuffled = shuffle(s);
    test:assertEquals(shuffled.length(), s.length(), "Length should be preserved");
}

@test:Config {}
function testSlugify() {
    test:assertEquals(slugify("Hello World!"), "hello-world");
    test:assertEquals(slugify("This is a test"), "this-is-a-test");
    test:assertEquals(slugify(""), "", "Empty string should return empty");
}

// HTML stripping tests
@test:Config {}
function testStripHtml() {
    test:assertEquals(stripHtml("<p>Hello</p>", true), "Hello");
    test:assertEquals(stripHtml("<script>alert('hi');</script>Hello", false), "Hello");
    test:assertEquals(stripHtml("", true), "", "Empty string should return empty");
}

@test:Config {}
function testStripMargin() {
    test:assertEquals(stripMargin("|Hello\n|World"), "Hello\nWorld");
    test:assertEquals(stripMargin("Hello\nWorld"), "Hello\nWorld");
    test:assertEquals(stripMargin(""), "", "Empty string should return empty");
}

// UUID generation tests
@test:Config {}
function testUuid() {
    string uuid1 = uuid(false);
    test:assertEquals(uuid1.length(), 36, "UUID should be 36 chars with dashes");
    string uuid2 = uuid(true);
    test:assertEquals(uuid2.length(), 32, "Hex UUID should be 32 chars");
}