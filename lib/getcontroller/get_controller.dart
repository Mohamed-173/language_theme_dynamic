/// this controller is best at this time,any time you use language and theme

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../language/localization_service.dart';
import '../theme/themex.dart';

class Controller extends GetxController with StateMixin {
  var count = RxInt(0);

  /// counterKey for saving key in any localStorage in this example sharedPrefrences
  final String countKey = 'count';

  /// languageKey for saving key in any localStorage in this example sharedPrefrences
  final String _langKey = "lang";

  /// themeKey for saving key in any localStorage in this example sharedPrefrences
  final String _themeKey = "theme";

  /// initialTheme using for storing before GetMaterilaApp controller start
  ThemeMode initialTheme = ThemeMode.system;

  /// initialLocale using for storing before GetMaterilaApp controller start
  String initialLocale = "ku";

  /// prefs is a instance of sharedPrefrence for get and set Data
  final prefs = SharedPreferences.getInstance();

  @override
  void onInit() async {
    super.onInit();

    /// this methode for any data getting future
    getInitialData();
  }

  /// initialTheme methode for  getting data before app rendared.
  Future<ThemeMode> initialtheme() async {
    /// prefs is a instance of sharedPrefrence for get and set Data
    final SharedPreferences? _prefs = await prefs;

    bool? isDark = _prefs!.getBool(_themeKey);

    if (isDark == null || isDark == false) {
      Get.changeThemeMode(ThemeMode.light);
      Get.changeTheme(Themes.light);
      return ThemeMode.light;
    } else {
      Get.changeThemeMode(ThemeMode.dark);
      Get.changeTheme(Themes.dark);
      // return true;
      return ThemeMode.dark;
    }
  }

  /// this Language methode for  getting data before app rendared.
  Future<String> initialLang() async {
    // final SharedPreferences? prefs = await SharedPreferences.getInstance();
    final SharedPreferences? _prefs = await prefs;

    String? _lang = _prefs!.getString(_langKey);

    if (_lang == null || _lang == '') {
      _prefs.setString(_langKey, "ku");

      _lang = "ku";
      return _lang;
    } else {
      // _lang = "ku";
      return _lang;
    }
  }

  /// increamentCounter methode for incrementing counter by one
  void incrementCounter() async {
    count++;
    final _prefs = await prefs;
    _prefs.setInt(countKey, count.value);

    /// update methode like
    update();
  }

  /// increamentCounter methode for reseting counter to zero
  void resetCounter() async {
    count.value = 0;
    final _prefs = await prefs;
    _prefs.setInt(countKey, count.value);
  }

  void getInitialData() async {
    final _prefs = await prefs;
    count.value = _prefs.getInt(countKey) ?? 0;
  }

  Future<String> initialCheckSettingLanguage() async {
    final SharedPreferences? _prefs = await prefs;

    String? language = _prefs!.getString(_langKey) ?? "ku";

    if (language == "ku") {
      return "kurdish";
    } else if (language == "en") {
      return "english";
    } else {
      return "arabic";
    }
  }

  Future<bool> initialCheckSettingTheme() async {
    final SharedPreferences? _prefs = await prefs;

    bool? isDark = _prefs!.getBool(_themeKey) ?? false;

    if (isDark == false) {
      _prefs.setBool(_themeKey, false);
      Get.changeThemeMode(ThemeMode.light);
      Get.changeTheme(Themes.light);
      return false;
    } else {
      _prefs.setBool(_themeKey, true);

      Get.changeThemeMode(ThemeMode.dark);
      Get.changeTheme(Themes.dark);
      return true;
    }
  }

  void changeLanguage(String newValue) async {
    final SharedPreferences _prefs = await prefs;
    String? lang = (_prefs.getString(_langKey));
    if (lang == null || lang == '') {
      LocalizationService().changeLocale(newValue);
      _prefs.setString(_langKey, newValue);
    } else {
      LocalizationService().changeLocale(newValue);
      _prefs.setString(_langKey, newValue);
    }
  }

  Future<void> changeTheme(bool newValue) async {
    final SharedPreferences _prefs = await prefs;
    bool? isDark = _prefs.getBool(_themeKey);
    if (isDark == null || isDark == newValue) {
      isDark = !newValue;
      _prefs.setBool(_themeKey, isDark);
      Get.changeTheme(Themes.dark);
      Get.changeThemeMode(ThemeMode.dark);
    } else {
      isDark = newValue;
      _prefs.setBool(_themeKey, isDark);
      Get.changeThemeMode(ThemeMode.light);
      Get.changeTheme(Themes.light);
    }
  }
}
