import 'package:flutter/material.dart';

import '../Core/Localization/language_cache_helper.dart';
import '../Core/Theme/theme_cache_helper.dart';

class AppProvider extends ChangeNotifier {
  Locale locale = const Locale('en');
  int isDark = 0;
  Future<void> getSavedTheme() async {
    isDark = await ThemeCacheHelper().getCachedThemeIndex();

    notifyListeners();
  }

  Future<void> getSavedLanguage() async {
    locale = Locale(await LanguageCacheHelper().getCachedLanguageCode());

    notifyListeners();
  }

  Future<void> changeTheme(int x) async {
    isDark = x;
    await ThemeCacheHelper().cacheTheme(isDark);

    notifyListeners();
  }

  Future<void> changeLanguage(String languageCode) async {
    await LanguageCacheHelper().cacheLanguageCode(languageCode);
    locale = Locale(languageCode);
    notifyListeners();
  }
}
