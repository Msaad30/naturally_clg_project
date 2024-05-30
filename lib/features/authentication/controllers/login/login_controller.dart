import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:naturally/data/repositories/authentication/authentication_repository.dart';
import 'package:naturally/features/personalization/controllers/user_controller.dart';
import 'package:naturally/utils/constants/image_strings.dart';
import 'package:naturally/utils/helpers/network_manager.dart';
import 'package:naturally/utils/popups/full_screen_loader.dart';
import 'package:naturally/utils/popups/loaders.dart';

class LoginController extends GetxController {
  /// Variables
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final userController = Get.put(UserController());

  @override
  void onInit(){
    email.text = localStorage.read('REMEMBER_ME_EMAIL');
    password.text = localStorage.read('REMEMBER_ME_PASSWORD');
    super.onInit();
  }

  ///--Email and Password SignIn
  Future<void> emailAndPasswordSignIn() async{
    try {
      // Start Loading
      TFullScreenLoader.openLoadingDialog('Logging you in...', TImages.docerAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected){
        TFullScreenLoader.stopLoading();
        return;
      }

      // form validation
      if (!loginFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // save data if remember me is selected
      if (rememberMe.value){
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }

      //login user using email and password authentication
      final userCredentials = await AuthenticationRepository.instance.loginWithEmailandPassword(email.text.trim(),password.text.trim());

      //remove loader
      TFullScreenLoader.stopLoading();

      //Redirect
      AuthenticationRepository.instance.screenRedirect();

    }catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title:'oh snap', message: e.toString());
    }
  }

  ///--Google SignIn Authentication
  Future<void> googleSignIn() async{
    try{
      //   Start Loading
      TFullScreenLoader.openLoadingDialog('Logging you in...', TImages.docerAnimation);

      //   Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected){
        TFullScreenLoader.stopLoading();
        return;
      }

    // Google Authentication
      final userCredentials = await AuthenticationRepository.instance.signInWithGoogle();

    // save user record
      await userController.saveUserRecord(userCredentials);

    //   Remove loader
      TFullScreenLoader.stopLoading();

    // Redirect
      AuthenticationRepository.instance.screenRedirect();

    }catch(e){
    // Remove loader
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'on Snap', message: e.toString());
    }
  }
}
