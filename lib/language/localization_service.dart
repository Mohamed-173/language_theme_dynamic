import 'dart:ui';
import 'package:get/get.dart';
import 'package:lang_pref/language/translate.dart';

class LocalizationService extends Translations {
  // Default locale
  // ignore: prefer_const_constructors
  static final locale = Locale('en', 'en');

  // fallbackLocale saves the day when the locale gets in trouble
  // ignore: prefer_const_constructors
  static final fallbackLocale = Locale('ar', 'ar');

  // Supported languages
  // Needs to be same order with locales
  static final langs = [
    'en',
    'ar',
    'ku',
  ];

  // Supported locales
  // Needs to be same order with langs
  static final locales = [
    const Locale('en', 'US'),
    const Locale('ar', 'AR'),
    const Locale('ku', 'KU'),
  ];

  // Keys and their translations
  // Translations are separated maps in `lang` file
  // @override
  // Map<String, Map<String, String>> get keys => {
  //       'en': en, // lang/en_us.dart
  //       'ar': ar, // lang/tr_tr.dart
  //       'ku': ku, // lang/ja_jp.dart
  //     };

  @override
  Map<String, Map<String, String>> get keys => translate;

  // Gets locale from language, and updates the locale
  void changeLocale(String lang) {
    final locale = _getLocaleFromLanguage(lang);
    Get.updateLocale(locale!);
  }

  // Finds language in `langs` list and returns it as Locale
  Locale? _getLocaleFromLanguage(String lang) {
    for (int i = 0; i < langs.length; i++) {
      if (lang == langs[i]) return locales[i];
    }
    return Get.locale;
  }
}
