import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:naturally/common/shimmers/vertical_product_shimmer.dart';
import 'package:naturally/common/widgets/appBar/appBar.dart';
import 'package:naturally/common/widgets/icons/t_circular_icon.dart';
import 'package:naturally/common/widgets/layout/grid_layout.dart';
import 'package:naturally/common/widgets/loaders/animation_loader.dart';
import 'package:naturally/common/widgets/products/product_cards/favourites_controller.dart';
import 'package:naturally/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:naturally/features/shop/screens/home/home.dart';
import 'package:naturally/utils/constants/image_strings.dart';
import 'package:naturally/utils/constants/sizes.dart';
import 'package:naturally/utils/helpers/cloud_helper_functions.dart';
import 'package:naturally/utils/navigation_menu.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = FavouritesController.instance;
    return Scaffold(
      appBar: TAppBar(
        title: Text('Wishlist', style: Theme.of(context).textTheme.headlineMedium),
        actions: [
          TCircularIcon(icon: Iconsax.add, onPressed: () => Get.to(const HomeScreen())),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Obx(
            () => FutureBuilder(
              future: controller.favouriteProducts(),
              builder: (context, snapshot) {
                final emptyWidget = TAnimationLoaderWidget(
                  text: "Whoops! Wishlist is Empty....", 
                  animation: TImages.emptyAnimation,
                  showAction: true,
                  actionText: 'Lets add some..',
                  onActionPressed: () => Get.off( () => const NavigationMenu()),
                );
                const loader = TVerticalProductShimmer(itemCount: 6);
                final widget = TCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader, nothingFound: emptyWidget);
                if(widget != null) return widget;
                final products = snapshot.data!;
                
                return TGridLayout(
                  itemCount: products.length,
                  itemBuilder: (_, index) => TProductCardVertical(product: products[index]));
              }
            ),
          )
          )
        ),
      );
  }
}