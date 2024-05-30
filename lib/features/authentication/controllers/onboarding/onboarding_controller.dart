import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:naturally/features/authentication/screens/login/login.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

  //variables 
  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;

  // update current index when Page Scroll
  void updatePageIndiactor(index) => currentPageIndex.value = index;

  // Jump to te specific dot seleted page
  void dotNavigationClick(index) {
    currentPageIndex.value = index;
    pageController.jumpTo(index);
  }

  // update current index and jump to next page
  void nextPage() {
    if(currentPageIndex.value == 2) {
      final storage = GetStorage();

      if(kDebugMode) {
      print('========= GET STORAGE NEXT BUTTON ==========');
      print(storage.read('IsFirstTime'));
      }


      storage.write('IsFirstTime', false);

      if(kDebugMode) {
      print('========= GET STORAGE NEXT BUTTON ==========');
      print(storage.read('IsFirstTime'));
      }

      Get.offAll(const LoginScreen());
    } else {
      int page = currentPageIndex.value + 1;
      pageController.jumpToPage(page);
    }
  }

  // update index and jump to last page
  void skipPage() {
    currentPageIndex.value = 2;
    pageController.jumpToPage(2);
  }
  
}