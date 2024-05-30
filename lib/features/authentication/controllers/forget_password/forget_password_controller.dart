import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:naturally/data/repositories/authentication/authentication_repository.dart';
import 'package:naturally/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:naturally/utils/constants/image_strings.dart';
import 'package:naturally/utils/helpers/network_manager.dart';
import 'package:naturally/utils/popups/full_screen_loader.dart';
import 'package:naturally/utils/popups/loaders.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  sendPasswordResetEmail() async {
    try {
      // Start Loading
      TFullScreenLoader.openLoadingDialog('Processing your request.....', TImages.docerAnimation);

      // Check Internet Connectivity
    final isConnected = await NetworkManager.instance.isConnected();
    if (!isConnected) {TFullScreenLoader.stopLoading(); return;}

    // Form Validation
    if (!forgetPasswordFormKey.currentState!.validate()) {
      TFullScreenLoader.stopLoading();
      return;
    }

  // Send email to reset password
    await AuthenticationRepository.instance.sendPasswordResetEmail(email.text.trim());

    // Remove Loader
    TFullScreenLoader.stopLoading();

    // Show Success Screen
    TLoaders.successSnackBar(title: 'Email sent', message: 'Email Link sent to reset your password'.tr);

    // Redirect
    Get.to(() => ResetPasswordScreen(email: email.text.trim()));
    } catch (e) {
      // Remove Loader
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }

  // Resend reset password Email
  resendPasswordResetEmail(String email) async {
    try {
      // Start Loading
      TFullScreenLoader.openLoadingDialog('Processing your request.....', TImages.docerAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {TFullScreenLoader.stopLoading(); return;}

  // Send email to reset password
    await AuthenticationRepository.instance.sendPasswordResetEmail(email);

    // Remove Loader
      TFullScreenLoader.stopLoading();

      // Show Success Screen
      TLoaders.successSnackBar(title: 'Email sent', message: 'Email Link sent to reset your password'.tr);

    } catch (e) {
        // Remove Loader
        TFullScreenLoader.stopLoading();
        TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }
}