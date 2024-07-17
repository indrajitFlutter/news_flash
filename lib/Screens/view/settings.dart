import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_flash/Screens/controller/news_controller.dart';

import '../../commonWidgets/theme.dart';
import '../../constants/language_code.dart';
import '../../constants/strings.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  var newsController=Get.find<NewsController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(Strings.settings,style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold),),),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: (){
                  newsController.changeLanguage(
                    newsController.currentLocale == Rx(englishUs) ? indiaHindi : englishUs,
                  );
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.blue,borderRadius: BorderRadius.circular(25)
                  ),
                  child:  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Center(child: Text(Strings.languageChange,style: const TextStyle(fontSize:20,color: Colors.white,fontWeight:FontWeight.w500,),)),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: (){
                  Get.changeTheme(Get.isDarkMode ? ThemeClass.lightTheme : ThemeClass.darkTheme);

                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.blue,borderRadius: BorderRadius.circular(25)
                  ),
                  child:  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Center(child: Text(Strings.themeChange,style: const TextStyle(fontSize:20,color: Colors.white,fontWeight:FontWeight.w500,),)),
                  ),
                ),
              ),
            ),

          ]
        ),
      ),
    );
  }
}
