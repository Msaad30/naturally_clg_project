import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:naturally/common/widgets/appBar/appBar.dart';
import 'package:naturally/common/widgets/loaders/animation_loader.dart';
import 'package:naturally/common/widgets/products/cart/cart_items_file.dart';
import 'package:naturally/features/shop/controllers/product/cart_controller.dart';
import 'package:naturally/features/shop/screens/checkout/checkout.dart';
import 'package:naturally/utils/constants/image_strings.dart';
import 'package:naturally/utils/constants/sizes.dart';
import 'package:naturally/utils/navigation_menu.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    return Scaffold(
      appBar: TAppBar(showBackArrow: true, title: Text('Cart', style: Theme.of(context).textTheme.headlineSmall)),
      body: Obx(
        () {
          ///Nothing found Widget
          final emptyWidget = TAnimationLoaderWidget(
            text: 'Whoops! cart is EMPTY.',
            animation: TImages.emptyAnimation,
            showAction: true,
            actionText: 'Lets\'s fill it',
            onActionPressed: () => Get.off(() => const NavigationMenu()),
          );
          
          if (controller.cartItems.isEmpty) {
            return emptyWidget;
          } else {
            return SingleChildScrollView(
              child: Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace), 
              child: TCartItems(),
              ),
            );
          }// TAnimationLoaderWidget
        },
      ),
      
      // Checkout Button
      bottomNavigationBar: controller.cartItems.isEmpty ? const SizedBox() : Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () => Get.to(() => const CheckoutScreen()), 
          child: Obx(() => Text('Checkout Rs. ${controller.totalCartPrice.value}')),
        ),
      ),
    );
  }
}



