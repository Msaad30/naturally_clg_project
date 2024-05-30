import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:naturally/common/widgets/products/product_cards/favourites_controller.dart';
import 'package:naturally/utils/constants/colors.dart';
import '../../icons/t_circular_icon.dart';

class TFavouriteIcon extends StatelessWidget {
  const TFavouriteIcon({
    super.key, required this.productId,
});

final String productId;

@override
Widget build(BuildContext context) {
  final controller = Get.put(FavouritesController());
  return Obx(() => TCircularIcon(
    icon: controller.Isfavourite(productId) ? Iconsax.heart5 : Iconsax.heart,
    color: controller.Isfavourite(productId) ? TColors.error : null,
    onPressed: () => controller.toggleFavoriteProduct(productId),
    ),
  );
}

}