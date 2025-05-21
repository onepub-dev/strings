# 4.0.0

## BREAKING CHANGES

- ⚠️ **Minimum Dart SDK is now `>=3.7.0`.** This version drops support for Dart 3.0–3.6 in order to upgrade to the latest version of the `unicode` package.
- ⚠️ If you are on an older Dart version, you can continue using version `^3.1.2`.

## INTERNAL CHANGES

- Updated internal usage of `unicode.generalCategories` constants to use lowercase fields (e.g. `unicode.control` instead of `unicode.CONTROL`), per the latest `unicode` API in `1.1.8`.
- No changes to the public API.

# 3.1.2
- added an option to the join function to excluded null or empty elements.

# 3.1.1
- add the method isDigits.

# 3.1.0
- add the within and upTo methods.
# 3.0.0
- migrated to dart 3.x
- added isWhitespace method.

# 2.0.3
- added method orElseOnBlank

# 2.0.2
- Improvements to the API documentation.
- Updated references to underscore to its new name toSnakeCase Fixed the StringEx class description.

# 2.0.1
- Documenation fixes.

# 2.0.0-beta.3
- added documentation link to pubspec
- added onepub logo

# 2.0.0-beta.2
- Fixed broken links on the readme page.

# 2.0.0-beta.1

## BREAKING
- the right method has been redefined to be in keeping with the conventional use of right()
  For existing code that uses the old version of right use string.substring(fromRight);
- All methods are now exposed as static methods of the 'Strings' class.



# 1.0.0

- Initial release
