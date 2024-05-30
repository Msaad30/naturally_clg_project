import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:naturally/bindings/general_bindings.dart';
import 'package:naturally/utils/constants/colors.dart';
import 'package:naturally/utils/routes/app_routes.dart';
import 'package:naturally/utils/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      initialBinding: GeneralBindings(),
      getPages: AppRoutes.pages,
      home: const Scaffold(backgroundColor: TColors.primary, body: Center(child: CircularProgressIndicator(color: Colors.white))),
    );
  }
}