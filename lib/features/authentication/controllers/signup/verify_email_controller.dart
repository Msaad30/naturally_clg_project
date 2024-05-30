import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:naturally/common/widgets/success_screen/success_screen.dart';
import 'package:naturally/data/repositories/authentication/authentication_repository.dart';
import 'package:naturally/utils/constants/image_strings.dart';
import 'package:naturally/utils/constants/text_strings.dart';
import 'package:naturally/utils/popups/loaders.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  // Send Email whenever verify screen appears & set Timer for auto redirect
  @override
  void onInit() {
    sendEmailVerification();
    setTimerForAutRedirect();
    super.onInit();
  }

  // Send email verification link
  sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      TLoaders.successSnackBar(title: 'Email sent', message: 'Please check your inbox and verify your email.');
    } catch(e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
  
  void setTimerForAutRedirect() {}

  // Timer to automatically redirect on email verification
   setTimerForAutoRedirect() {
    Timer.periodic(
      const Duration(seconds: 1),
      (timer) async { 
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if(user?.emailVerified ?? false){
        timer.cancel();
        Get.off(
          () => SuccessScreen(
         image: TImages.successfullyRegistrationAnimation,
         title: TTexts.yourAccountCreatedTitle, 
         subTitle: TTexts.yourAccountCreatedSubTitle,
         onPressed: () => Get.find().screenRedirect(),
         ),);
      }
    },
    );
   }
  // Manually check if email verified
  checkEmailVerificationStatus() async{
    final currentUser = FirebaseAuth.instance.currentUser;
    if(currentUser != null && currentUser.emailVerified){
     Get.off(
      () => SuccessScreen(
         image: TImages.successfullyRegistrationAnimation,
         title: TTexts.yourAccountCreatedTitle, 
         subTitle: TTexts.yourAccountCreatedSubTitle,
         onPressed: () => AuthenticationRepository.instance.screenRedirect(),
         ));
    }
  }
}
