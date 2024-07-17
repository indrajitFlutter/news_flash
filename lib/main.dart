import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_flash/Screens/view/first_page.dart';
import 'Screens/controller/news_controller.dart';
import 'Screens/view/home_screen.dart';
import 'commonWidgets/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(supportedLocales: const [Locale('en','US'), Locale('hi','IN')], path: 'assets/translations', fallbackLocale: Locale('en','US'), child: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  // This widget is the root of your application.
  @override
  void initState() {
    // TODO: implement initState
    Get.put(NewsController());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'News Flash',
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      locale: context.locale,
      darkTheme: ThemeClass.darkTheme,
      theme: ThemeClass.lightTheme,

      debugShowCheckedModeBanner: false,
      home: const FirstPage(),
    );
  }
}


