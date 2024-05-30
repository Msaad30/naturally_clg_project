import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:naturally/data/repositories/authentication/authentication_repository.dart';
import 'package:naturally/data/repositories/user/user_model.dart';
import 'package:naturally/data/repositories/user/user_repository.dart';
import 'package:naturally/features/authentication/screens/signup/widgets/verify_email.dart';
import 'package:naturally/utils/constants/image_strings.dart';
import 'package:naturally/utils/helpers/network_manager.dart';
import 'package:naturally/utils/popups/full_screen_loader.dart';
import 'package:naturally/utils/popups/loaders.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

 // Variables
  final hidePassword = true.obs;
  final privacyPolicy= true.obs;
  final email = TextEditingController(); // controller for email input
  final lastName = TextEditingController(); // controller for last name input
  final username = TextEditingController(); // controller for username input
  final password = TextEditingController(); // controller for password input
  final firstName = TextEditingController(); // controller for first name input
  final phoneNumber = TextEditingController(); // controller for phone number input
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>(); // Form key for validation

 // --SIGNUP
 void signup() async {
    try {
      // Start Loading
      TFullScreenLoader.openLoadingDialog('We are processing your information...', TImages.docerAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected) {
        TFullScreenLoader.stopLoading();
        return;    
      }        

      // Form Validation
      if(!signupFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return; 
      }

      // Privacy Policy
      if(!privacyPolicy.value) {
        TLoaders.warningSnackBar(
          title: 'Accept Privacy Policy',
          message: 'In order to create account, you must have to read and accept the privacy Policy & Terms of Use.'
        );
        return;
      }

      // Register user in the Firebase Authentication & Save user data in the firebase
      final userCredential = await AuthenticationRepository.instance.registerWithEmailAndPassword(email.text.trim(), password.text.trim());
      
      // Save Authentication user data in the Firebase Firestore
      final newUser = UserModel(
        id: userCredential.user!.uid, 
        firstName: firstName.text.trim(), 
        lastName: lastName.text.trim(), 
        username: username.text.trim(),
        email: email.text.trim(), 
        phoneNumber: phoneNumber.text.trim(), 
        profilePicture: '',
      );

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      TFullScreenLoader.stopLoading();

      // Show Success Message
      TLoaders.successSnackBar(title: 'Congratulations', message: 'Your account has been created! Verify email to continue');
      Get.to(() => VerifyEmailScreen(email: email.text.trim()));
    
    } catch (e) {
      TFullScreenLoader.stopLoading();

      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());

    }
  }
}
