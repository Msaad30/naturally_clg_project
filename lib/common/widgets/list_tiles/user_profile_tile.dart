import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:naturally/common/widgets/images/t_circular_image.dart';
import 'package:naturally/features/personalization/controllers/user_controller.dart';
import 'package:naturally/utils/constants/colors.dart';
import 'package:naturally/utils/constants/image_strings.dart';

class TUserProfileTitle extends StatelessWidget {
  TUserProfileTitle({
    super.key, required this.onPressed,
  });

  final VoidCallback onPressed;
  final controller = UserController.instance;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const TCircularImage(image: TImages.user, width: 50, height: 50, padding: 0),
      title: Text(controller.user.value.firstName, style: Theme.of(context).textTheme.headlineSmall!.apply(color: TColors.white)),
      subtitle: Text(controller.user.value.email, style: Theme.of(context).textTheme.bodyMedium!.apply(color: TColors.white)),
      trailing: IconButton(onPressed: onPressed, icon: const Icon(Iconsax.edit, color: TColors.white)),
    );
  }
}