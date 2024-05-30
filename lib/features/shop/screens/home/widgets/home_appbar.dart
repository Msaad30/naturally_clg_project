import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:naturally/common/shimmer_effect/shimmer.dart';
import 'package:naturally/common/widgets/appBar/appBar.dart';
import 'package:naturally/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:naturally/features/personalization/controllers/user_controller.dart';
import 'package:naturally/utils/constants/colors.dart';
import 'package:naturally/utils/constants/text_strings.dart';

class THomeAppBar extends StatelessWidget {
  const THomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return TAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(TTexts.homeAppbarTitle, style: Theme.of(context).textTheme.labelMedium!.apply(color: TColors.grey)),
        Obx(() { 
          if(controller.profileLoading.value) {
            return const TShimmerEffect(width: 80, height: 15);
          } else {
            return Text(controller.user.value.firstName, style: Theme.of(context).textTheme.headlineSmall!.apply(color: TColors.white));
          }  
        }),
      ],
    ),
    actions: const [
      TCartCounterIcon(iconColor: TColors.white, counterBgColor: TColors.black, counterTextColor: TColors.white)
    ],
    );
  }
}