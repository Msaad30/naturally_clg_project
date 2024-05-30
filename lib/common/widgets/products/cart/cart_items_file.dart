import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:naturally/common/widgets/products/cart/add_remove_button.dart';
import 'package:naturally/common/widgets/products/cart/cart_item.dart';
import 'package:naturally/common/widgets/texts/product_price_text.dart';
import 'package:naturally/features/shop/controllers/product/cart_controller.dart';
import 'package:naturally/utils/constants/sizes.dart';

class TCartItems extends StatelessWidget {
  const TCartItems({
    super.key,
    this.showAddRemoveButtons = true,
  });

  final bool showAddRemoveButtons;

  @override
  Widget build(BuildContext context) {
  final cartController = CartController.instance;
  return Obx(
    () => ListView.separated(
              shrinkWrap: true,
              itemCount: cartController.cartItems.length,
              separatorBuilder: (_, __) => const SizedBox(height: TSizes.spaceBtwSections),  
              itemBuilder: (_, index) => Obx(
                () {
                final item = cartController.cartItems[index];
                return Column(
                  children: [
                    // Cart Item
                    TcartItem(cartItem: item),
                    if(showAddRemoveButtons) const SizedBox(height: TSizes.spaceBtwItems),
                    if(showAddRemoveButtons)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [                
                        Row(
                          children: [
                            const SizedBox(width: 70),
                            // Add Remove Buttons
                            TProductQuantityWithAddRemoveButton(
                              quantity: item.quantity, 
                              add: () => cartController.addOneToCart(item),
                              remove: () => cartController.removeOneFromCart(item),
                            ),
                          ],
                        ),
                        // --Product total price
                        TProductPriceText(price: (item.price * item.quantity).toStringAsFixed(1)),
                      ],
                    ),
                  ],
                ); },
              ),
            ),
          );
        }
}