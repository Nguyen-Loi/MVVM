enum LangugageType { ENGLISH, ARABIC }

const String ARABIC = 'ar';
const String ENGLISH = 'en';

extension LanguageTypeExtension on LangugageType {
  String getValue() {
    switch (this) {
      case LangugageType.ENGLISH:
        return ENGLISH;
      case LangugageType.ARABIC:
        return ARABIC;
    }
  }
}
