import 'dart:convert';
import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_flash/Screens/model/articale_model.dart';
import 'package:news_flash/Screens/model/category_model.dart';
import 'package:news_flash/Screens/model/show_category_model.dart';
import 'package:news_flash/constants/language_code.dart';
import '../../commonWidgets/error_messanger.dart';
import '../../constants/strings.dart';
import '../../services/basic_urls.dart';
import '../model/slider_news_model.dart';
import 'package:http/http.dart' as http;

class NewsController extends GetxController {
  ///language Locale var declare with default
  late Rx<Locale> currentLocale = Rx(englishUs); // Set initial locale
  ///loading
  bool isLoading = true;
  ///for indicator
  int activeIndex = 0;

  ///for change language function
  void changeLanguage(Locale newLocale) {
    Get.updateLocale(newLocale); // Updates Get.locale and triggers rebuilds
    EasyLocalization.of(Get.context!)!.setLocale(newLocale);
    currentLocale = Rx(newLocale);
    // (Optional) Add other tasks, like data reloading based on language
  }


  ///get slider list form api

  ///List
  List<ShowCategoryModel> showCategoryModelList = [];
  List<ArticleModel> articleModelList = [];
  List<CategoryDetailsModel> categoryDetailsModelList = [];
  List<SliderModel> sliderList = [];

  ///get news categories
  getCategories() {
    categoryDetailsModelList.clear();
    CategoryDetailsModel categoryDetailsModel = CategoryDetailsModel();
    categoryDetailsModel.categoryName = "Business";
    categoryDetailsModel.image = "assets/images/business2.svg";
    categoryDetailsModelList.add(categoryDetailsModel);

    categoryDetailsModel = new CategoryDetailsModel();
    categoryDetailsModel.categoryName = "General";
    categoryDetailsModel.image = "assets/images/general.svg";
    categoryDetailsModelList.add(categoryDetailsModel);

    categoryDetailsModel = new CategoryDetailsModel();
    categoryDetailsModel.categoryName = "Health";
    categoryDetailsModel.image = "assets/images/health.svg";
    categoryDetailsModelList.add(categoryDetailsModel);

    categoryDetailsModel = new CategoryDetailsModel();
    categoryDetailsModel.categoryName = "Sports";
    categoryDetailsModel.image = "assets/images/sports.svg";
    categoryDetailsModelList.add(categoryDetailsModel);
  }

  /// get breaking news Data from server
  getSliderNewsData(context) async {
    sliderList.clear();
    String url= Url.getSliderArticle;
    try {
      bool isDeviceConnected = await isConnected();
      if (!isDeviceConnected) {
        isLoading=false;
        return internetError(context, Strings.internetError);
      }
      var response = await http.get(
        Uri.parse(url), headers: {'Content-type': 'application/json', 'Accept': 'application/json'},
        // body: bodyJson,
      );
      dynamic responseJson = utf8.decode(response.bodyBytes);
      debugPrint(responseJson.toString());
      if (response.statusCode == 200) {
        dynamic responseJson = jsonDecode(response.body);
        if (responseJson['status'] == 'ok') {
          responseJson['articles'].forEach((element) {
            if (element['urlToImage'] != null && element['description'] != null) {
              SliderModel sliderModel = SliderModel();
              sliderModel = SliderModel.fromJson(element);
              sliderList.add(sliderModel);
              debugPrint("Slider length ${sliderList.length}");
            }
          });
        } else {
          return handleAPIError(context, responseJson['status']);
        }
      } else {
        return handleAPIError(context, response.statusCode.toString());
      }
    } catch (e) {
      handleUnExpectedError(context, Strings.exceptionError);
    }
    isLoading=false;
    update();
  }

  ///get news Category data from server
  getNewsCategoryData(context, String category) async {
    showCategoryModelList.clear();
    try {
      bool isDeviceConnected = await isConnected();
      if (!isDeviceConnected) {
        isLoading=false;
        return internetError(context, Strings.internetError);

      }
      String url = "https://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=${Url.apikey}";
      var response = await http.get(
        Uri.parse(url), headers: {'Content-type': 'application/json', 'Accept': 'application/json'},
        // body: bodyJson,
      );
      dynamic responseJson = utf8.decode(response.bodyBytes);
      debugPrint(responseJson.toString());
      if (response.statusCode == 200) {
        dynamic responseJson = jsonDecode(response.body);
        if (responseJson['status'] == 'ok') {
          responseJson['articles'].forEach((element) {
            if (element['urlToImage'] != null && element['description'] != null) {
              ShowCategoryModel showCategoryModel = ShowCategoryModel();
              showCategoryModel = ShowCategoryModel.fromJson(element);
              showCategoryModelList.add(showCategoryModel);
              debugPrint("length ${showCategoryModelList.length}");
            }
          });
        } else {
          handleAPIError(context, responseJson['status']);
        }
      } else {
        handleAPIError(context, response.statusCode.toString());
      }
    } catch (e) {
      handleUnExpectedError(context, Strings.exceptionError);
    }
    isLoading=false;
    update();
  }

  ///get trending news from server
  getNewsArticlesData(context) async {
    articleModelList.clear();
    String url= Url.getNewsArticle;
    try {
      bool isDeviceConnected = await isConnected();
      if (!isDeviceConnected) {
        isLoading=false;
        return internetError(context, Strings.internetError);

      }
      var response = await http.get(
        Uri.parse(url), headers: {'Content-type': 'application/json', 'Accept': 'application/json'},
        // body: bodyJson,
      );
      dynamic responseJson = utf8.decode(response.bodyBytes);
      debugPrint(responseJson.toString());
      if (response.statusCode == 200) {
        dynamic responseJson = jsonDecode(response.body);
        if (responseJson['status'] == 'ok') {
          responseJson['articles'].forEach((element) {
            if (element['urlToImage'] != null && element['description'] != null) {
              ArticleModel articleModel = ArticleModel();
              articleModel = ArticleModel.fromJson(element);
              articleModelList.add(articleModel);
              debugPrint("articleModelList length ${articleModelList.length}");
            }
          });
        } else {
          handleAPIError(context, responseJson['status']);
        }
      } else {
        handleAPIError(context, response.statusCode.toString());
      }
    } catch (e) {
      handleUnExpectedError(context, Strings.exceptionError);
    }
    isLoading=false;
    update();
  }

  ///Change slider
  changeSliderPage(int index) {
    activeIndex = index;
    update();
  }
  ///Check interNetConnectivity

      isConnected() async {
      bool activeConnection = false;
      try {
        final result = await InternetAddress.lookup('google.com');
        if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
            activeConnection = true;
            return activeConnection;
        }
      } on SocketException catch (_) {
          activeConnection = false;
          return activeConnection;
      }
    }

//clear List
  clearController() {
    sliderList.clear();
    articleModelList.clear();
    categoryDetailsModelList.clear();
    showCategoryModelList.clear();
    activeIndex = 0;
  }
}
