import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lang_pref/language/localization_service.dart';
import 'package:lang_pref/getcontroller/get_controller.dart';
import 'package:lang_pref/screens/home_ui.dart';
import 'package:lang_pref/theme/themex.dart';

final controller = Get.put(Controller());
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  controller.initialTheme = await controller.initialtheme();
  controller.initialLocale = await controller.initialLang();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return GetMaterialApp(
        darkTheme: Themes.dark,
        themeMode: controller.initialTheme,
        title: 'Flutter Demo',
        theme: Themes.light,
        debugShowCheckedModeBanner: false,
        home: const HomePage(),
        locale: Locale(controller.initialLocale),
        fallbackLocale: LocalizationService.fallbackLocale,
        translations: LocalizationService(),
      );
    });
  }
}
